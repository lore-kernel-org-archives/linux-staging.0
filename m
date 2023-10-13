Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57EC24200;
	Fri, 13 Oct 2023 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhKVceEu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c9de3f66e5so18532025ad.3;
        Fri, 13 Oct 2023 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231959; x=1697836759; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEpkSqStdpwPiK/rVH9XpS0uAjkRc6GI778X+nK4/Co=;
        b=RhKVceEu7cBSU6wG5IklijXpyc5uvpMvJ3uut86P6l6h1/e1S54i97s0vtiyqssmCI
         xlEYY+eXIHxix/T6HjWIL8CHNS9wYCLixmKGlTBams1WVOOny0pFf4a4iPrMVLlFZ48z
         KEHlIJ0zQQbf5KwDmdgpeKjdHvnymmz80V+J2YwwbRT33//9cZlICdQTRutGzsDPYjxo
         yAVQCYQM+A4ggsHXzQl0LUwum6RtYBeiXn0yxNMYPG/hcJLd3+RcI1rJ3dM3I7cUyivB
         XqloMBgbCrI9Wk04vpfmRfhWiYq4ccmUtkYS3E7cAn/thKqNTIHULtspwHsrrGyMgRZe
         khdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231959; x=1697836759;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEpkSqStdpwPiK/rVH9XpS0uAjkRc6GI778X+nK4/Co=;
        b=TZagGoGiVqGQU3eT1WHh2eE7UCFnX7VLtZ1XRNfdjG1zhBb+iFL+JSb6PXcEr8Xois
         Zei0XJ0E5RWHyFhH/0rOUIQz1Vvem06EDl3JEBPtKCeRcXD7YgQJVqrwiUTpmSD2L1BD
         p0toS0B+2mnh6M+EUGs3ei9psSxa5Qiu8UHMzymAWZZNSooQ3eMRTxwgx2SfR6tA7ryI
         FYh06rOv+rvDCFojQSGtIYKw4Pn37S2Sfu4P8NvXfNBSVvVW+Z5QxZQ8n1bbpW48ixqh
         VpcisMCxUAw+g4yMN/laDwHW6ulpho3IpQBysO31yWAUb9AJ/M2E2Pwy8KoA4YvcoO/o
         eIAw==
X-Gm-Message-State: AOJu0YxtYsXvvR0pg42+Deagou80Yg+SZRoF5W0MvPodC6lmGBrkpH/s
	Ltq+t6qZ7c2otvG/1EiEijY=
X-Google-Smtp-Source: AGHT+IGne9RAForm81Cux/ImQ6vwu8UtSeNW4OLKNkPG30bXI6R9jSzKXWlJzEYOoBTC2MoPirf6nw==
X-Received: by 2002:a17:902:a504:b0:1c6:17a4:afb3 with SMTP id s4-20020a170902a50400b001c617a4afb3mr22449486plq.16.1697231959067;
        Fri, 13 Oct 2023 14:19:19 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id d17-20020a170903231100b001bb99e188fcsm4301830plh.194.2023.10.13.14.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:19:18 -0700 (PDT)
Date: Fri, 13 Oct 2023 14:19:18 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: gdm724x: Fix coding style checkpatch warnings
Message-ID: <20231013211917.GC25352@Negi>
References: <20231013051502.9578-1-soumya.negi97@gmail.com>
 <663c85bb-90c3-4ae1-ab0b-5ab1a8abd2a7@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <663c85bb-90c3-4ae1-ab0b-5ab1a8abd2a7@kadam.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 13, 2023 at 11:53:36AM +0300, Dan Carpenter wrote:
> On Thu, Oct 12, 2023 at 10:14:58PM -0700, Soumya Negi wrote:
> > @@ -271,8 +272,8 @@ int register_lte_tty_driver(void)
> >  	int ret;
> >  
> >  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> > -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> > -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> > +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> > +					      TTY_DRIVER_DYNAMIC_DEV);
> 
> Don't do this.  The code was better before. The parameter
> "TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV" is one thing and
> splitting it up like that makes the code less readable.  And I bet they
> had to indent it like that to get under the 80 character limit.
> 
> This is an example of checkpatch giving bad advice.

Hi Dan,

Will keep this in mind for other similar checkpatch warnings.

Thanks,
Soumya

> regards,
> dan carpenter
> 
