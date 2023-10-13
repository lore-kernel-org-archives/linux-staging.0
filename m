Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A6568D;
	Fri, 13 Oct 2023 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmzF1q1R"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c5bf7871dcso14063115ad.1;
        Thu, 12 Oct 2023 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697175307; x=1697780107; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJVW+9qlD6LlVYZG3xkLmkd4SS3hgrGhJE+KlBem0rs=;
        b=LmzF1q1Rhw3SfIEdGSGzw1BfrXnKkwGnje6wAT9IjHCmFepb2Hg2Dnuc8D0r5RZbd7
         NpZ7Kre6lAun3I5Rs+Q+QRN/oLIxtQMlhdO4Xw5nTxDmJooJWc5wHZS1rnNIc0pOFS/B
         coi3n6oYklW4LazMlgYRCY/6rTFILmgkfFsKo5osyf0bORpWlG1QyrRP8RFpU9jeq8Bb
         vrNeps7GmgXE59JlJ2yq0dnEri983vbF8fF2EwZf3Jn4RPrcAVtfmEZ3s+YEUtLmlZvL
         oj75YyB6oKYIYgbpwazhJOFlTHUklnL/zc3w+I3lGMe2kad6vAmqQDscWqpBCvpU/ztb
         umCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697175307; x=1697780107;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJVW+9qlD6LlVYZG3xkLmkd4SS3hgrGhJE+KlBem0rs=;
        b=AvzJl8FvUwFsO6SuRQn19eMAmqIq8INqosFzCPdJ4OeTw1vWco/8+j13TgoRx3PRa5
         ZTMsnSOmLNEAg6CdH320KsHhdDhP2B9y9SdVEaGpWy8BaPMEw0f9G5NGf7ok3TDIcGU3
         rPRBFHsOZ9Yz2yM36txowEriDeRNCzEFJCykZRxhHxeLg8GfeTbiQuf7kWHI8ldWBt1w
         FcY9vAw72gJ7VDZdQq3ljL28vuDYgdST0nhBJ9jK2LcC22mW7JaIM6s4G9ftiEdO94Nl
         zsbkBo5kHe8diGpYAUwH6j+p5eSS0h6VLbYD5y/Uynqgo4LMUC/K1fYB+EOWB0VRNMWH
         wqDQ==
X-Gm-Message-State: AOJu0YzewIuNhdsrsdrkIaqI+OihzcDY3upbCNf+2jGVeDtZ+bil8swM
	JzXr/EeovnYotFxbQVlsFT8=
X-Google-Smtp-Source: AGHT+IEhxvGGfl1wAAY20wYN9SKLkf29rpj0YSgFN0GKLO0zYrRn0u2nYMEj54+HRm2sVaSEdFXz6g==
X-Received: by 2002:a17:902:e54a:b0:1c6:2d13:5b74 with SMTP id n10-20020a170902e54a00b001c62d135b74mr27473901plf.55.1697175307345;
        Thu, 12 Oct 2023 22:35:07 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id f19-20020a170902e99300b001c0a414695dsm2937504plb.62.2023.10.12.22.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 22:35:06 -0700 (PDT)
Date: Thu, 12 Oct 2023 22:35:06 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: gdm724x: Fix coding style checkpatch warnings
Message-ID: <20231013053506.GA9482@Negi>
References: <20231013051502.9578-1-soumya.negi97@gmail.com>
 <alpine.DEB.2.22.394.2310130719530.3269@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310130719530.3269@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 13, 2023 at 07:20:08AM +0200, Julia Lawall wrote:
> 
> 
> On Thu, 12 Oct 2023, Soumya Negi wrote:
> 
> > Add blank line after declaration & match alignment with open parenthesis.
> > Issue found by checkpatch.pl
> 
> This seems like two completely unrelated issues.
> 
> julia

Hi Julia,

I got it. Will send two separate patches for each type of code cleanup.

- Soumya

> >
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  drivers/staging/gdm724x/gdm_tty.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> > index 32b2e817ff04..0c61eaff6122 100644
> > --- a/drivers/staging/gdm724x/gdm_tty.c
> > +++ b/drivers/staging/gdm724x/gdm_tty.c
> > @@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
> >
> >  	while (remain) {
> >  		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
> > +
> >  		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
> >  					(void *)(buf + sent_len),
> >  					sending_len,
> > @@ -271,8 +272,8 @@ int register_lte_tty_driver(void)
> >  	int ret;
> >
> >  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> > -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> > -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> > +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> > +					      TTY_DRIVER_DYNAMIC_DEV);
> >  		if (IS_ERR(tty_driver))
> >  			return PTR_ERR(tty_driver);
> >
> > --
> > 2.42.0
> >
> >
> >
