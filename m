Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D361947A
	for <linux-staging@lists.linux.dev>; Wed,  3 Jan 2024 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2DO7xFp"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2335d81693so80675466b.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Jan 2024 05:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704287989; x=1704892789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtywbxVuxT2TUpm6U6r8okBkpt1BBOM7f3JX2DpH98w=;
        b=W2DO7xFpShPiuHm1KO3wKqgPgnaVDZQlyOp7hyz/rFYQ55MR2ez5cIFZQEyeVnPFZv
         3Z9HW4Z/OrXojiS4zpgM2ry9fiKBn7aEzWe+7tKn9li2eRM76ThuRiPTwIDmgm6395fg
         cJCleoHExI2CJfZiokajRj8hf8emIRUgupwz24Z4p5HfjpmTA0nSIO4hE2dkmhmgoiSd
         YbRzTt6bO273KMHvqDuE4f5/Xf3MEpm08JZN+vTDPCwaq/K6iChxJYykLtyGHDRQmgji
         nE318AxHXCvii5uNiqAnuguaLiP/wLKo6TNUBc/uDoqEOLmIdtX02m9xsCNSv9pG2qGC
         7Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704287989; x=1704892789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtywbxVuxT2TUpm6U6r8okBkpt1BBOM7f3JX2DpH98w=;
        b=jjFcBymj4gHVq0NyjmOpAElD2C1rPhzK32hGBx+nDnNJUm7qVqtlbaFlUvqJkumU+C
         il9vbnaGRY56i6bGKI/B+gbcVeVNjFyoIw8A2FOz+FjxCsGXfPlAuYu91Y7Zz02YewvW
         VVhl1BCFVP/U1yUSM497fAJPt54hb2+0QLcH4wDPSNbplO9fKaGLxs6l2aVBmsWvfVwC
         qWuxmd9MMJ4oPJw22cvVOQLWdXPz+gKRBilL5o19tbn1Rijq4UKhwltp1DxEBBPDxmUu
         4DlIOHL2c/3ghsLQ5j82aWN2BEECXegOVSlVtDkMKrCy9QKVS8mpsf9JPgPcvSyGTfC6
         4hpA==
X-Gm-Message-State: AOJu0Yxct3Tv/Cp/ECZw8/h07ebU5pKJ+HPffhNZG0nvU8MTvgDDGB4T
	7iUZotRVgyPXUCxH++6FnvJ9hY+dG8RQzQ==
X-Google-Smtp-Source: AGHT+IHNoYN35Vs/ZpZGj1g1p1q3OOIkM466Dld/eRoFvZmBhON9ESinwvH56JaeY8c+WpY5YAWAUQ==
X-Received: by 2002:a17:906:d9cc:b0:a28:86fb:68fb with SMTP id qk12-20020a170906d9cc00b00a2886fb68fbmr932790ejb.71.1704287989415;
        Wed, 03 Jan 2024 05:19:49 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id fw22-20020a170907501600b00a26b44ac54dsm11532222ejc.68.2024.01.03.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:19:48 -0800 (PST)
Date: Wed, 3 Jan 2024 16:19:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Ryan England <rcengland@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8712: fix open parentheses alignment
Message-ID: <f9b34a72-42e1-43f6-b03c-5a3d05773862@moroto.mountain>
References: <ZYSemFbzTlgLROMc@kernel.ryanengland.xyz>
 <20231222094735.5554b67a@namcao>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222094735.5554b67a@namcao>

On Fri, Dec 22, 2023 at 09:47:35AM +0100, Nam Cao wrote:
> On Thu, 21 Dec 2023 20:22:48 +0000 Ryan England <rcengland@gmail.com> wrote:
> 
> > Adhere to Linux kernel coding style.
> > 
> > Reported by checkpatch:
> > 
> > CHECK: Alignment should match open parenthesis
> > 
> > Signed-off-by: Ryan England <rcengland@gmail.com>
> > ---
> > Made corrections give the 100 line limit. Resending v2 as no change was
> > made other than including this comment below ---. Thank you for the
> > correction. Here's to learning with every submission.
> > 
> >  drivers/staging/rtl8712/os_intfs.c            |   3 +-
> >  drivers/staging/rtl8712/rtl8712_efuse.c       |   9 +-
> >  drivers/staging/rtl8712/rtl8712_recv.c        |   3 +-
> >  drivers/staging/rtl8712/rtl8712_xmit.c        |  60 +++---
> >  drivers/staging/rtl8712/rtl871x_cmd.c         | 159 +++++---------
> >  drivers/staging/rtl8712/rtl871x_cmd.h         |  37 ++--
> >  drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 203 +++++++-----------
> >  7 files changed, 173 insertions(+), 301 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
> > index b18e6d9c832b..7554613fe7e1 100644
> > --- a/drivers/staging/rtl8712/os_intfs.c
> > +++ b/drivers/staging/rtl8712/os_intfs.c
> > @@ -221,8 +221,7 @@ struct net_device *r8712_init_netdev(void)
> >  
> >  static u32 start_drv_threads(struct _adapter *padapter)
> >  {
> > -	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s",
> > -					  padapter->pnetdev->name);
> > +	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s", padapter->pnetdev->name);
> 
> Your description claims to fix "CHECK: Alignment should match open
> parenthesis", but this one is already aligned, isn't it?

No.  It was not aligned.  There was a space character missing.

regards,
dan carpenter

