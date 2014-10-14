package org.motrice.tdocbox

class TdbDrill implements Comparable {
  // Name of this drill
  String name

  // HTTP verb
  TdbHttpVerb verb

  // Invocation mode
  TdbMode mode

  // The method to invoke
  TdbMethod method

  SortedSet parameters
  static belongsTo = [suite: TdbSuite]
  static hasMany = [parameters: TdbParameter]
  static constraints = {
    name nullable: false, maxSize: 40, unique: true
    verb nullable: false
    mode nullable: false
    method nullable: false
    parameters nullable: true
  }

  TdbCase createCase() {
    TdbCase.createCase(this)
  }

  TdbCase createCase(TdbCase cs) {
    cs ?: TdbCase.createCase(this)
  }

  /**
   * Get the body parameter, if present, otherwise null.
   */
  static final PARAM_Q = 'from TdbParameter as p where p.drill.id=? and p.name=?'
  String getBody() {
    def bodyParam = TdbParameter.find(PARAM_Q, [this.id, 'BODY'])
    return bodyParam?.value
  }

  /**
   * Get all parameters as a map.
   */
  Map getMap() {
    def map = [:]
    parameters.each {param ->
      map[param.name] = param.value
    }
    return map
  }

  String getDebug() {
    "[Drill ${name}: ${map}]"
  }

  String toString() {
    name
  }

  //-------------------- Comparable --------------------

  int hashCode() {
    name.hashCode()
  }

  boolean equals(Object obj) {
    def result = false
    if (obj instanceof TdbDrill) {
      def other = (TdbDrill)obj
      result = name.equals(other.name)
    }

    return result
  }

  int compareTo(Object obj) {
    def other = (TdbDrill)obj
    name.compareTo(other.name)
  }

}
