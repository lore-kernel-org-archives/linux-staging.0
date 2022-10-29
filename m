Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623415A9;
	Sat, 29 Oct 2022 16:52:02 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id g4so358337vkk.6;
        Sat, 29 Oct 2022 09:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TwYDS/mmucztJvZk+txCcsQ4F8nYeAWY6Om3fRYLydM=;
        b=f7TmAfvDTszzxq9/s7++Odt1tI3NJPLc6cv2uaPhinMxKKDimLhZ0Y7Ef1AsDLlUqK
         83xV20RqDznHPphKGn+8UjbbxEY0TvLEmrP884PDFeQ/UD+HwAxVi+DLZrviU9LNaiCq
         ymSz29Uv6rdm7hymM6w4OIURY8nB3MrHPAKdvclOr5L86u4ED6WkJtQeWs8imXRngNYD
         2TB+X2nkl/OWlOavppNBnCBAsFzb3Tly6Dk4MEYXd/Mqoi2yBPYUy+bvp1eQYW34GBQK
         u2jxTLa6dtKLewQAPwBcS/iO140iFbpRDvII37eY2e+avH2MeJxQPn/YHvuRvEQKqGce
         5XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwYDS/mmucztJvZk+txCcsQ4F8nYeAWY6Om3fRYLydM=;
        b=Z2ZzxKi/X8zpMCfSTPio/n6WP8jEo9aSGAsNwqwJoF7Iy4fFgE+q/WHYXvsZlAf7yW
         /9C1Ls1GK/zqmUfJwVVPXL93eWsMaZfrBzdgF9ra0/B+p7ikKfcXRnf6UkYQd4GuHsJV
         zoTI+/p3cPLnRMk0tEZEFlnPFDrnM56VjKJbcpRXJA4JG2JR7V4xB38cfwgK+Fh1P7Mn
         wH5t+U4zKKDbfHFReplbjQxG69cF/KfREYJbgOqQIeOe18xFzonN9vd5caqbJFEhU3KO
         SYubjfjnaQPT++Rpi3wvbWjC1njkNSpStLaa0O1sWeZZF8TaVJZYasq0FXd1p6skXPwR
         lyXg==
X-Gm-Message-State: ACrzQf2W4PfMuKMtpw9ePTtYPXEF+YH0eEBIDJOifj0Wx/izkElt+/xw
	euILiqTg1iSEjTQkDEPQtPCWCNrCwiB1ffpd0bY=
X-Google-Smtp-Source: AMsMyM6Thke+1QuByyV8+re7bh2Evi2XZOlsWq0OhchzcovWijDvkFdCFpeOVChhPguwUmdAitZw6torQ6CRo3eIeaQ=
X-Received: by 2002:a1f:3246:0:b0:3ae:bedf:455f with SMTP id
 y67-20020a1f3246000000b003aebedf455fmr1965024vky.28.1667062321638; Sat, 29
 Oct 2022 09:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221028051420.GA30073@rdm> <Y1wg4y6k1fe/TF0d@aschofie-mobl2>
In-Reply-To: <Y1wg4y6k1fe/TF0d@aschofie-mobl2>
From: jovial umwari <umwarijovial@gmail.com>
Date: Sat, 29 Oct 2022 19:51:50 +0300
Message-ID: <CAMk1CBOgUPjeMw9NmCthsQsDJXY8U4WCBTmNi-3h_BroGnh_QQ@mail.gmail.com>
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
To: Alison Schofield <alison.schofield@intel.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Noted. Thank you sir

On Fri, 28 Oct 2022 at 21:35, Alison Schofield
<alison.schofield@intel.com> wrote:
>
> On Fri, Oct 28, 2022 at 08:14:20AM +0300, UMWARI JOVIAL wrote:
> > i used checkpatch.pl script to identify the above
> > Repetition of the same word in one sentence same line
> >
> > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
>
> This is my (not yet automated) response:
>
> You are sending patches to the Outreachy list, in a way
> that makes me suspect you have overlooked the Outreachy
> Project Contribution Information.
>
> Please review:
> https://www.outreachy.org/outreachy-december-2022-internship-round/communities/linux-kernel/  (only accepted applicants can see this link)
>
> https://lore.kernel.org/outreachy/Y0D+dzbjRtuc0KT4@aschofie-mobl2/
>
> Alison
>
> > ---
> >  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> > index 090345bad223..30a0276b8b58 100644
> > --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> > +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> > @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
> >   * If we turn on USE_RXTHREAD, then, no need for critical section.
> >   * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
> >   *
> > - * Must be very very cautious...
> > + * Must be very cautious...
> >   *
> >   */
> >  struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)
> > --
> > 2.25.1
> >
> >
