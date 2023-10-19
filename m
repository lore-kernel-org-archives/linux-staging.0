Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD642909;
	Thu, 19 Oct 2023 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/oH8t3+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b6f4c118b7so232622b3a.0;
        Thu, 19 Oct 2023 15:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697753637; x=1698358437; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxO9CeupjJm1VNV2qD42mx1Z0tO6w55cG3DvFE0akJU=;
        b=Z/oH8t3+xeomvJLuan+CSh0SYVhBbg/6kWgL3bas12DmC8Xey68kG8Grat/ZLaBxhR
         lTRgsS6IOMQkTrvAqIb+sYJRlDYtgiPFEt0G9JBjHJxQrre5nc13PjDjYoeMJknIsbP8
         hOBqyxxIrAnPtIQ3VqGfYsTrzHP3L8/8Q53NgYSPnl12RZKoBe3pXK8Kb4NI4aypCoGE
         Zbto3JBlQp1aTH9CDik4vM7ADlibpMsUzojlcqboIP8aiu2DTRZ/CdWPyjXbkf598vi5
         wFGPQetR8E5fhYM16g2KiQuuYZyfsxucpwjK6EwwA5fIY/kT2f9gLgY0wYS081e2HWPy
         6zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697753637; x=1698358437;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxO9CeupjJm1VNV2qD42mx1Z0tO6w55cG3DvFE0akJU=;
        b=k/nzHTIMv4LhLml2MYNuJULN/EV3ipiN/vG1DXJJALYTzrOOGbp+15f57XRiVPxA4r
         9NnLUzqEarJNxd7F+EvclViTL7G+qzLdC9x6ZcUzJ4sAGdUM65dGED3Md3nc68/JUrA8
         CYRrwMtSPQQ6uLIniaTJLNedEB7C1ffeeytPornFwZeV86wUSYQvbxgEbPbf/6LZf/Sn
         mQhd5rrBeH1UK8CAvLVH5OAgT9l87lQxsPKXhYtl9WKOqJebsNpiCjo4VJgjHBMOLylw
         6A5qWZbeKjgpiQTSKlzFN55KOc9j/dIJt118spc/H1w0zZsq6hwzUGi4LPP0Nb4aaW28
         OEYA==
X-Gm-Message-State: AOJu0YxQCG5PlOEocBC4RU1I/io6BGkW/+l596llu5cEJKUedxQvDP3c
	2wpwP/DD9Uwl1XZwBJ+NlqYPO+yBuKzycw==
X-Google-Smtp-Source: AGHT+IFwQRmhtvP0fKkwRfeNWZwTshKFTJ7DO2jhksHpulTKIEY5JBnAse72r6NqTA1XdtG76bRWuw==
X-Received: by 2002:a05:6a00:138f:b0:68f:dd50:aef8 with SMTP id t15-20020a056a00138f00b0068fdd50aef8mr60518pfg.4.1697753636739;
        Thu, 19 Oct 2023 15:13:56 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id n11-20020aa7984b000000b00690d4464b95sm276425pfq.16.2023.10.19.15.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 15:13:56 -0700 (PDT)
Date: Thu, 19 Oct 2023 15:13:55 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: vme_user: Use __func__ instead of
 function name
Message-ID: <20231019221355.GC3017@Negi>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
 <996c9f92e7fd288f67c02dfb0ba524ab7c5fe421.1697696951.git.soumya.negi97@gmail.com>
 <ZTFOGIu5U+ZUodXW@ashyti-mobl2.lan>
 <20231019191428.GA32717@Negi>
 <ZTGgVNBoxOtWOuE8@ashyti-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTGgVNBoxOtWOuE8@ashyti-mobl2.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Oct 19, 2023 at 11:32:04PM +0200, Andi Shyti wrote:
> Hi Soumya,
> 
> > > On Thu, Oct 19, 2023 at 12:20:10AM -0700, Soumya Negi wrote:
> > > > Replace function names in message strings with __func__ to fix
> > > > all checkpatch warnings like:
> > > > 
> > > >     WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
> > > >              this function's name, in a string
> > > > 
> > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > 
> > > you forgot my ack here:
> > > 
> > > Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 
> > > 
> > > Andi
> > 
> > Sorry I forgot the tag Andi. I'll add the tags in v3(Greg has suggested
> > more changes). There will be some new patches, so I'll leave the tags out in 
> > those as you may want to review them first.
> 
> no problem.
> 
> I don't see reviews from Greg in this v2 series. If you are
> referring to the changelog, then you don't need to resend.
> 
> Andi

Hi Andi,

I had sent in v2 after suggestions from Julia and Greg. Got some more
feedback from Greg in the v1 email thread though. Will have to send a v3 due 
to that.

Regards,
Soumya
