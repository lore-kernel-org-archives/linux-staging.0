Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1328F3;
	Sat, 22 Oct 2022 08:29:35 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id i12so3399403qvs.2;
        Sat, 22 Oct 2022 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci1g2jTtvoSe7PJcNgNyYuF4Ea5CkP/pjC29djDMeMc=;
        b=bz/800+kZiSWRW5eELLh3EEWv0h632amG6g23xRhi2Oc5Gz85thclWR0q0CbQhntyp
         NCu6BLZ4iZ5tHLit/EImHgVbqPei33MckIWAUskDNBuvihbTOh0m+EPtqA5DTcUK2oKk
         CnLDJSP/wUeSIU4cr9e7x1lDyM6tFhYB1pjDg7e1iW8+BWUyz3j1JlGiTF34T2XJVmQ3
         daT/CslOFXrX52Rnuj7+WtwohTfT/UBco9ISa7SYadTXQQ3NnmqCRVCuQKxxUPf+IQO+
         ryIbTZvqms7LklLhWqmTH85FtONN2pxrYRx5Mm0JHnf3m/8L6AKQDqj/hxE/BEGvoNod
         Vlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci1g2jTtvoSe7PJcNgNyYuF4Ea5CkP/pjC29djDMeMc=;
        b=tGqfMBgAEtMwnSLrCgEro2GnXWa3xOc4H9d2Vx4RtRfyl6z+znxUG7KnddERIv0Nu4
         EF3iJWlGLqNfNUQDC2gz5hzGwe+h4lp6mYUXJiiaBDH43XmIqlO34hVZuMY5fIDR95Is
         3cTN2GSBxb0kksCc3PNIUVsvmGrO6JyP18qUzHvKGtj88P8+S+jWsY6MVqDO/gK4VJ26
         o3SpCyES7X7OlaWOL8Ndo/FR2V3rz8BNKQfwUjV0Ejr3G/ALgTrSieYgGA+DweyIAuA+
         YAR9jiDlt1IYZ3hvck8I+hEiqwXI7N+adSDiUNQxwLupQ8f15jjsWXD7S2prKc4H21AK
         k7FQ==
X-Gm-Message-State: ACrzQf2YqXdlmm03y9i9FMmnhdDOMxyc76YMKVToQfGAPlopIM7eQSvZ
	cfC1Es9brDwn6dByCIJ5grb2n0kOv1RB+3zHXCY=
X-Google-Smtp-Source: AMsMyM4tdATGGSHSsxFhhHhgOOD1SsALRWNHFzYXXV1YcvY4qi7IkUjWS3dkchSvyVdFQzIKaPbt5y7fddLIlRjhXY4=
X-Received: by 2002:ad4:5d6c:0:b0:4af:b5e0:63f1 with SMTP id
 fn12-20020ad45d6c000000b004afb5e063f1mr19534141qvb.35.1666427374275; Sat, 22
 Oct 2022 01:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-6-tanjubrunostar0@gmail.com> <Y1Omg6Tfv/lc7Fu4@kroah.com>
In-Reply-To: <Y1Omg6Tfv/lc7Fu4@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:29:22 +0100
Message-ID: <CAHJEyKWM0kRVkR_mHfUho6bdpb1eQ3eH6_W8ZAow4O=B9zWfbQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] staging: vt6655: refactor long lines of code in
 the rest of the file
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 9:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 22, 2022 at 07:06:11AM +0000, Tanjuate Brunostar wrote:
> > fix checkpatch errors by refactoring long lines of code in the rest of
> > the file
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >  drivers/staging/vt6655/rxtx.c | 105 ++++++++++++++++++++++------------
> >  1 file changed, 67 insertions(+), 38 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 951d4172e9f2..572be45cdbeb 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -1105,44 +1105,60 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
> >               if (byFBOption == AUTO_FB_NONE) {
> >                       if (bRTS) {/* RTS_need */
> >                               pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
> > -                             pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
> > -                             pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
> > +                             pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
> > +                                        sizeof(struct vnt_rrv_time_rts));
> > +                             pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
> > +                                              sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
>
> Casting to void * is very odd.  Try working on fixing up that mess
> first...
>
> thanks,
>
> greg k-h
OK
