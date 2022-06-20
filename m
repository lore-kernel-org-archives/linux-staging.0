Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7D7F6
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655717842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VQ+wxgfxoQfff153/vfAo2kcjYPMXeSYBFIlenJ41tM=;
	b=HMQyYN+Cg/n04ftlgHF72xElan9Ki39vONrlxFrkeMIii3PEflsV+Wg5/VBs0WUbupaPBK
	MHb/aUBHBA/elr1hFne4K0Gx0b+AObGY/qF/tDI77TN6EiptlnmTqdXJajIPPU+z9t1fwR
	TPPnhKZGRf1+moQxMs40tBowYgi9vDE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-JtljijZPMLe72TFlu5kzMA-1; Mon, 20 Jun 2022 05:37:21 -0400
X-MC-Unique: JtljijZPMLe72TFlu5kzMA-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-3178a95ec78so59594017b3.4
        for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 02:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQ+wxgfxoQfff153/vfAo2kcjYPMXeSYBFIlenJ41tM=;
        b=L9901vWpmFocUgq56GVrhpt5eywkYR+7eQK9am5kukpn7elyS1oMb+qfifmoAiKnhX
         eH3EIrdBb7ODtOZPwstZJPoujIoXptzMxWmdcaKehfv+NLEbpQBaxdBgOqyq6NYCg0e4
         jbL5/rEAxzmY3M5c+5cw6fagQttGfAX3/enDniETUUanDCR4pVS+XyujictCxjJx/MUv
         v5E/d3TadiT9LyisPaafmJjBg7J2lOEmKE2xO+jXycK3X1f4PWqnClBAwTPggg0p4Dnv
         yxwGXTWBBobdc2v6W2JcLaSQBJaX7Xo+RPniJdqpwWeF8yh394aV0QLRipfJTu4IbKQe
         2fPg==
X-Gm-Message-State: AJIora9bZUQl8Eb9yGm8/NfIroJlKmzvzPowAtnzjKtzDQCPh/WA+e5i
	+owFiQpbY6w6TQnJP7b0LkNH7IxsR46wYbUIr13GHlueKcHS+d/K0vpFhecEGGL5yMoNWSthZwm
	O+ATKA2Wsr+70UxSWU0VvKUEbPIcEfPzBmSu59izw6A==
X-Received: by 2002:a0d:db11:0:b0:317:bb2f:c0b5 with SMTP id d17-20020a0ddb11000000b00317bb2fc0b5mr6574730ywe.353.1655717840356;
        Mon, 20 Jun 2022 02:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vrPu6/K/TANEgGnpYuHrIsHuTgK8u6Yev4N3pR40RwsAtj2AcGxEnAUHpyOEoTPgV5V3+odIq4XFdTWxSjiCY=
X-Received: by 2002:a0d:db11:0:b0:317:bb2f:c0b5 with SMTP id
 d17-20020a0ddb11000000b00317bb2fc0b5mr6574712ywe.353.1655717840048; Mon, 20
 Jun 2022 02:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220620085413.948265-1-hpa@redhat.com> <a1decfb3-fd32-a8d1-e627-23430099565a@redhat.com>
In-Reply-To: <a1decfb3-fd32-a8d1-e627-23430099565a@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 20 Jun 2022 17:37:09 +0800
Message-ID: <CAEth8oGg3U27fHpnvtHXsT8GLsfxk3ZNshGLN5e4P_5Ksx7tsA@mail.gmail.com>
Subject: Re: [PATCH v1] staging: r8188eu: an incorrect return value made the
 function always return fail
To: Hans de Goede <hdegoede@redhat.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 5:02 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Kate,
>
> Good catch!
>
> On 6/20/22 10:54, Kate Hsuan wrote:
> > Since _SUCCESS (1) and _FAIL (0) are used to indicate the status of the
> > functions. The previous commit 8ae7bf782eacad803f752c83a183393b0a67127b
>
> This is the commit hash from one of the stable series backports, you
> should always use the commit hash from Linus' master branch which is
> f94b47c6bde6 and the format for referencing commits in a commit-message is:
>
> commit <12 char hash> ("commit subject")
>
> so in this case this should have been:
>
> commit f94b47c6bde6 ("staging: r8188eu: add check for kzalloc")
>
> Note that checkpatch.pl would have complained about the wrong format
> (but not the wrong hash)

Thanks for this. I'll improve my commit message.

>
> > fixed and prevented dereferencing a NULL pointer through checking the
> > return pointer. The NULL pointer check work properly but the return
> > values (-ENOMEM on fail and 0 on success). This work fixed the return
> > values to make sure the caller function will return the correct status.
> >
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2097526
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> This should have a fixes tag:
>
> Fixes: f94b47c6bde6 ("staging: r8188eu: add check for kzalloc")
>
> But while looking up the torvalds/master branch hash I noticed
> someone alreayd beat you to it. Linus' master already has
> a fix for this:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/staging/r8188eu?id=5b7419ae1d208cab1e2826d473d8dab045aa75c7
>
> So this patch can be dropped since it is a duplicate.

Ah~ I have to check before starting to fix it.

Thank you :)

>
> Regards,
>
> hans
>
>
>
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
> >
> >       hwxmits = pxmitpriv->hwxmits;
> >
> > @@ -1528,7 +1526,7 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
> >       } else {
> >       }
> >
> > -     return 0;
> > +     return _SUCCESS;
> >  }
> >
> >  void rtw_free_hwxmits(struct adapter *padapter)
>


-- 
BR,
Kate

