Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F65692;
	Fri, 13 Oct 2023 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHfjYAoq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdf4752c3cso13221195ad.2;
        Fri, 13 Oct 2023 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697183298; x=1697788098; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl7fgJaWj5cTBuYX4JkcZ4GOPxj+pu0zJjF36kB0W04=;
        b=CHfjYAoq40CUz2qCTcf8fOhHPKGKErzCcRBhUY5QR72ZHOkNrYqkxdb7MrtVEmnTRS
         DqAszjZHKQkn/WvQNyo3N3pZ6Mg/xIEUdpcezKsnavyOZ4SnncUOPuqk7g3Phz2L4oj4
         lG80/SF8KUb6R6yUUFelHg3eBC03XxH3S9k9nH7ttv0+0qXDo/CEe4cPhFL77VlvaGDN
         Ar0z2g+dXlH/2gm/jKi/jJwPtZiypCES4E44dqt/VB3FdIRzMRlFf2pF7SoyfwhJKm7F
         XyWiI4FDGXbbdcm/wPwa0+q+DCBXdxQcI8z+f2lsNFZaI4ovOKYmESo0ZURphNoPPVC3
         95Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183298; x=1697788098;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fl7fgJaWj5cTBuYX4JkcZ4GOPxj+pu0zJjF36kB0W04=;
        b=i3YJiAi5cIWSz+h+anT9Zd3Ve/k44dyPOEuHSVUssI1BM7ldnMfSFL/yv2BM2+pXN5
         WdBV3B2a75I+x83xN0PnquZM37D40TzmbFomVwNa0ynqoRGIX3DHSGrWsF4CZGfdtJRU
         QPG85sHRUsz6rCwnEHw7phCT23nBlzNBHqTtIvUXStf6BYl2s9KHz/Wez6ZneOQwT6sa
         oZP5lI6iy/L/UFp6tlSvU5BbWaO4Px+7FoVQitkVECVWqyP4lioHgWqOubOwBpqJR557
         4E2imyzuXnhp44y5e/hNMr+fmbIy1folnqYUmCnviN2XVvlY5VmsIVGDyJ9GhwxTlUqS
         aSIQ==
X-Gm-Message-State: AOJu0YwOw9YESLn/zQTLD/g8ROPyFMScOcx8Ta0r4gmrexlp0o7nXbCy
	NCa+bOTaKepBYhCx3MgTEjk=
X-Google-Smtp-Source: AGHT+IGgrzD3/aqCAFAU3YdoAscnsRYQc/k0/7wXMAUFxVOP1TY9rj16GMYNHv75lxVgWqwyQXWCcA==
X-Received: by 2002:a17:902:ceca:b0:1c5:9c73:c91c with SMTP id d10-20020a170902ceca00b001c59c73c91cmr28520232plg.48.1697183298112;
        Fri, 13 Oct 2023 00:48:18 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id jh22-20020a170903329600b001c9d968563csm3229234plb.79.2023.10.13.00.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:48:17 -0700 (PDT)
Date: Fri, 13 Oct 2023 00:48:17 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: gdm724x: Match alignment with open parenthesis
Message-ID: <20231013074817.GC13814@Negi>
References: <20231013060123.13400-1-soumya.negi97@gmail.com>
 <51deee17-33a5-d46c-1211-ca9186a4fe4@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51deee17-33a5-d46c-1211-ca9186a4fe4@inria.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 13, 2023 at 08:42:42AM +0200, Julia Lawall wrote:
> This and the next patch need to be in a series because they touch the same
> file.
> 
> julia

Noted. Sending them as set.

> On Thu, 12 Oct 2023, Soumya Negi wrote:
> 
> > Fix CHECK: Alignment should match open parenthesis
> > Issue found by checkpatch.pl
> >
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> > index 32b2e817ff04..4e5cac76db58 100644
> > --- a/drivers/staging/gdm724x/gdm_tty.c
> > +++ b/drivers/staging/gdm724x/gdm_tty.c
> > @@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
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
