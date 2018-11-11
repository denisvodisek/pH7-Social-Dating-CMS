<div class="container">
    <div class="text-center">
    <a href="{{ $design->url('mail', 'main','inbox') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-inbox"></i> Inbox
        </button></a>
    <a href="{{ $design->url('mail', 'main','outbox') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-send"></i> Sent
        </button></a>
    <a href="{{ $design->url('mail', 'main','trash') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-trash"></i> Trash
        </button></a>
    <a href="{{ $design->url('mail', 'main','search') }}" class="marginbottom20"><button class="btn btn-outline-danger btn-md">
            <i class="fa fa-search"></i> Search for emails
        </button></a>
    </div>
<div class="col-md-8 col-md-offset-2">
    {{ MailForm::display() }}
</div>

</div>