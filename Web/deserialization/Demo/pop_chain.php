123
class Cat
{
    public $magic;
    public $spell;

    function __construct($spell)
    {
        $this->magic = new Caster();
        $this->spell = $spell;
    }
    function __wakeup()
    {
        $this->magic->cast($this->spell);
    }
}

class Magic
{
    function cast($spell)
    {
        echo "MAGIC, $spell!";
    }
}

class Caster
{
    public $cast_func = 'intval';
    function cast($val)
    {
        return ($this->cast_func)($val);
    }
}