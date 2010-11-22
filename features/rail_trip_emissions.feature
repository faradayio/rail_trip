Feature: Rail Trip Emissions Calculations
  The rail trip model should generate correct emission calculations

  Scenario: Calculations for rail trip with nothing
    Given a rail trip has nothing
    When emissions are calculated
    Then the emission value should be within "0.01" kgs of "3.17"

  Scenario Outline: Calculations for rail trip from date and timeframe
    Given a rail trip has "date" of "<date>"
    And it has "timeframe" of "<timeframe>"
    When emissions are calculated
    Then the emission value should be within "0.01" kgs of "<emission>"
    Examples:
      | date       | timeframe             | emission |
      | 2010-07-12 | 2010-07-01/2010-07-10 | 0.0      |
      | 2010-07-12 | 2010-07-01/2010-07-30 | 3.17     |
      | 2010-07-12 | 2010-07-15/2010-07-30 | 0.0      |

  Scenario: Calculations for rail trip from distance
    Given a rail trip has "distance" of "100"
    When emissions are calculated
    Then the emission value should be within "0.01" kgs of "22.98"

  Scenario: Calculations for rail trip from duration
    Given a rail trip has "duration" of "2"
    When emissions are calculated
    Then the emission value should be within "0.01" kgs of "18.53"

  Scenario: Calculations for rail trip from rail class
    Given a rail trip has "rail_class.name" of "commuter rail"
    When emissions are calculated
    Then the emission value should be within "0.01" kgs of "5.40"