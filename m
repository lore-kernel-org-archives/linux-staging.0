Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B32FAF
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 10:49:53 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so8017757pjq.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kcwbt0QYBilC1KUjADiZKweYPQYwCgMgAZVZ1Z7Fg5w=;
        b=cWubZFphcxdu24TVVWdwW2ngYth/s1Sj7sIcpFHLlOU7J1VGniqC5o1xSQG3vfeOUg
         wFiP13SbBxiPAhLzx7+GYgszVoqR0Rm0sICWdLdN5UiaYoE8VR6mCWhtepxRGe8uh4et
         plfmf6CK/vQ8uS8AIBAaJyd6ItUX9IFZCQ6N1lvW2XjOPi5d2wD5snrn+1CbcX3/0jse
         QsFq0OmPUJZzRLa9ngNmnIAVCxJ7pR5iBJj/SNfEvy4SHTLJ0thk5GnR3hJBCL5EfveW
         N8elgOjSDty9ZjvO5jKdtHqdOK7eIhtcdrZv5y0Rnl+2MT5f4Mcv1K2aJ6HcSXKTsz7u
         J06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcwbt0QYBilC1KUjADiZKweYPQYwCgMgAZVZ1Z7Fg5w=;
        b=NgVjsr/IuBhIpNUT297gpedGPtOq9eKZNEJBHc2xjBKH9VNTiiSTn37h6FQMCta6rr
         E5F3gscokaZbUA3rR0oaJ83DFjNOSt8gzTTKl7UP2nhfjZ4AZ70nl9TvkNwaWN/SFXsH
         r1+X7VGBWCrkXOv9QfXYGnRuCcf8pxpVg4+IewnACAysLNc4KJwjtBlEZgaH7TROdLXV
         wQ4n8BrwqpF6VG8HIFIKlXYJfL5F1V2mPtZtOxPFqDZBFl79Wzm3tQlp/9UNt1aPpPgu
         OHhfxRnH+1Z8ktJ6b15DIXT0G9JS7SEfetEL43Q3xavc4C/rR+SpZS/v6/5O1dD96XFe
         KSfg==
X-Gm-Message-State: AOAM5310bYVc0Pkoe0T7YJALi/ixPfXoAzHqA0AJQvMuUa2x053q+tU1
	bFxBCkQJ75SjV2S6Wf9sZkODM8261OOLCFEAMtq9CA==
X-Google-Smtp-Source: ABdhPJyg5OvleoQoU758Mdf0exKeOgwhKC9k987aeUPLHLoMATE2umjufiCp75Lvs+wDPYBBMQCH3EtyKxkmtzJvF5s=
X-Received: by 2002:a17:90a:1f49:: with SMTP id y9mr33134651pjy.225.1630234192921;
 Sun, 29 Aug 2021 03:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210828212453.898-1-phil@philpotter.co.uk> <20210828212453.898-3-phil@philpotter.co.uk>
 <21174665.bKA57LRvRV@localhost.localdomain>
In-Reply-To: <21174665.bKA57LRvRV@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sun, 29 Aug 2021 11:49:42 +0100
Message-ID: <CAA=Fs0meC_nVjb2gESnmz2pPgzNa4=QT_jnteAh4B8Cds6_0fQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: r8188eu: simplify c2h_evt_hdl function
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Aug 2021 at 09:52, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> >  static s32 c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
> >  {
> > -     s32 ret = _FAIL;
> >       u8 buf[16];
> >
> > -     if (!c2h_evt) {
> > -             /* No c2h event in cmd_obj, read c2h event before handling*/
> > -             if (c2h_evt_read(adapter, buf) == _SUCCESS) {
> > -                     c2h_evt = (struct c2h_evt_hdr *)buf;
>
> Dear Philip,
>
> Not related to your patch, but what kind of odd assignment is it? c2h_evt takes
> the address of a local variable and therefore it crashes the kernel whenever
> someone decides to dereference it after this function returns and unwinds
> the stack...

Dear Fabio,

Thank you for taking a look firstly, really appreciate it :-) As for the line:
c2h_evt = (struct c2h_evt_hdr *)buf;

in the original code before I removed it, bear in mind that this
pointer assignment is
happening into the parameter variable c2h_evt, which is a copy of the
passed in argument,
as C is pass-by-value. Therefore, after the c2h_evt_hdl function
returns, the value passed
in as the argument for this parameter would still have its original
pointer value (or NULL).

It would not therefore be possible to deference the pointer to this
stack-allocated memory
from outside the function, even in the original code. I agree though,
its purpose is dubious.
Originally, the wrapper function rtw_hal_c2h_handler would have passed
it through to the
function assigned to the c2h_handler function pointer, but there was
no such function in
this driver, so it was never executed.

>
> > +     if (!c2h_evt)
> > +             c2h_evt_read(adapter, buf);
>
> Having said that, I strongly doubt that this path is ever taken. I didn't check the call
> chain, but it may be that the function in never called or, if it is called, it always
> has a valid c2h_evt argument.
>
> Actually I don't mean to suggest something specific. It simply looks odd, so I'd check
> and if this happens to be the case, I'd remove the whole c2h_evt_hdl().
>
> Regards,
>
> Fabio

As alluded to, removing the whole of c2h_evt_hdl would lead to
c2h_evt_read no longer
being executed, which would mean the reads from the adapter register
don't happen, and
nor does the clearing by c2h_evt_clear(adapter); - in particular, the
comment there mentions
the FW not updating the next command message if this isn't executed when needed.

This may be perfectly fine, but I thought this approach is safer due
to the above.

Regards,
Phil
