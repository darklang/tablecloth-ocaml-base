module Comparator = TableclothComparator

let to_base_comparator (comparator : ('a, 'id) TableclothComparator.s) :
    ('a, 'id) Base.Comparator.Module.t =
  Obj.magic comparator
