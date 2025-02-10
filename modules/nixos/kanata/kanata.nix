{ lib, config, services, ... }:

{
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
(defsrc
  esc a s d f j k l ;
)

(defvar
  tap-time 150
  hold-time 200
)

(defalias
  caps (one-shot 1 esc)
  a (multi f24 (tap-hold $tap-time $hold-time a lalt))
  s (multi f24 (tap-hold $tap-time $hold-time s lmet))
  d (multi f24 (tap-hold $tap-time $hold-time d lsft))
  f (multi f24 (tap-hold $tap-time $hold-time f lctl))
  j (multi f24 (tap-hold $tap-time $hold-time j rctl))
  k (multi f24 (tap-hold $tap-time $hold-time k rsft))
  l (multi f24 (tap-hold $tap-time $hold-time l rmet))
  ; (multi f24 (tap-hold $tap-time $hold-time ; ralt))
)

(deflayer base
  @caps @a @s @d @f @j @k @l @;
)
        '';
      };
    };
  };
}
