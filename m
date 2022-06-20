Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E627F6
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655717151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5pHq1YJn02jwqVwFglHH5bGljBBluABJ3Mmj5OSWs4=;
	b=SOtn2xFD0akTdIbbCVFw1KwRgFxrkSkbruPdQupVnssPy12BcAnhRi6ScRP3YlipEdAedq
	XU/sRd2AbIM3biot/A+gR9FPXoHzq2tOokWcQQXyDAKA6eIGCFbpmP2wXK8hzONWOj6euK
	VVAAz1g7NgTfRk1UWWUuqTdyZXjSNy0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-WjpbHY2qMXCUsaEHNQLQmg-1; Mon, 20 Jun 2022 05:25:49 -0400
X-MC-Unique: WjpbHY2qMXCUsaEHNQLQmg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-3178996424dso59503407b3.21
        for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 02:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5pHq1YJn02jwqVwFglHH5bGljBBluABJ3Mmj5OSWs4=;
        b=u3SMpI1mJqzmEk+xe+K0xkQlmI1PjRBUQ1K/btd3L45DuVVNgvNPDnvSyOnPBDBwfC
         Kgq06Rs1yLldb72l33kwUj3jcUWmc/9vmUXAnpdIAvxqrnBEQDdhoijOCCFgEkasDNsl
         W3j3p8Bu4vkcRWsc8zyXLzioxjCIqd5sXLkz62i5NYJrBPfKHdT0WyPiojM33MWdXprl
         pQ0vAXw08k8FKDUf/+FCMJbrhzr09GQB6DBVSi5RDDws9Pv1G12tm/djHmcfrZqhkvL2
         QFropPa+aXIifiXrJUhqIoNNlPp6snV6FjqU1L5InIgOMLfj9hUhwteHpl/T4dPRDli0
         zdCQ==
X-Gm-Message-State: AJIora/SVKuhVsRu+x4KKIRgp4qVJVboQ5ZpvJZCp0eGglx5Of3xBmh6
	CVBF5qq1sQlsU1+N5EQn1P0C3vsYTZJIfK7E7Y0XsaN3U/x4xZwiYSUgGPUCzAhU3kqMnizUp6Z
	B1eXupZ9gnC/Fl3WgagT79F+f8vBrdqyc0CgYc+Az8g==
X-Received: by 2002:a5b:149:0:b0:668:3bd8:bf64 with SMTP id c9-20020a5b0149000000b006683bd8bf64mr23329570ybp.61.1655717148580;
        Mon, 20 Jun 2022 02:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sh/8GidoHOVYA2YAWBUWhUwDGgU4rpBIC7unfczj/DlJLg0x1w1ZE/o4EabOurM35KV1Ce7PiU/EmuznecO00=
X-Received: by 2002:a5b:149:0:b0:668:3bd8:bf64 with SMTP id
 c9-20020a5b0149000000b006683bd8bf64mr23329553ybp.61.1655717148295; Mon, 20
 Jun 2022 02:25:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620085413.948265-1-hpa@redhat.com> <YrA3RffyR9VT0DjN@kroah.com>
In-Reply-To: <YrA3RffyR9VT0DjN@kroah.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 20 Jun 2022 17:25:37 +0800
Message-ID: <CAEth8oGSOXpEN883QMxU9b++GB27pG8tbCjvdg9GaZkUOzFwWw@mail.gmail.com>
Subject: Re: [PATCH v1] staging: r8188eu: an incorrect return value made the
 function always return fail
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, 
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 5:01 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 20, 2022 at 04:54:13PM +0800, Kate Hsuan wrote:
> > Since _SUCCESS (1) and _FAIL (0) are used to indicate the status of the
> > functions. The previous commit 8ae7bf782eacad803f752c83a183393b0a67127b
>
> In the future, please reference commit ids as the documentation asks, as
> it's a much nicer way to understand things.  Also this commit id is not
> in Linus's tree or any tree that I can see, where did it come from?

Sorry about this. I'll improve this in my v2 patch.

>
> > fixed and prevented dereferencing a NULL pointer through checking the
> > return pointer. The NULL pointer check work properly but the return
> > values (-ENOMEM on fail and 0 on success). This work fixed the return
> > values to make sure the caller function will return the correct status.
> >
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2097526
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_xmit.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> > index f4e9f6102539..2f8720db21d9 100644
> > --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> > +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> > @@ -180,10 +180,8 @@ s32      _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
> >       pxmitpriv->free_xmit_extbuf_cnt = num_xmit_extbuf;
> >
> >       res = rtw_alloc_hwxmits(padapter);
> > -     if (res) {
> > -             res = _FAIL;
> > +     if (res == _FAIL)
> >               goto exit;
> > -     }
> >
> >       rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
> >
> > @@ -1510,7 +1508,7 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
> >
> >       pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
> >       if (!pxmitpriv->hwxmits)
> > -             return -ENOMEM;
> > +             return _FAIL;
>
> No, please let's fix up the callers to properly detect normal kernel
> error values and get rid of all of the crazy _FAIL and _SUCCESS values
> in this driver.

Okay.

>
> >
> >       hwxmits = pxmitpriv->hwxmits;
> >
> > @@ -1528,7 +1526,7 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
> >       } else {
> >       }
> >
> > -     return 0;
> > +     return _SUCCESS;
>
> Same here, fix up the callers if they are checking this incorrectly.
>
> thanks,
>
> greg k-h
>

Thank you :)

-- 
BR,
Kate

