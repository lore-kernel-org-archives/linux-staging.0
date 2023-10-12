Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966A24A09;
	Thu, 12 Oct 2023 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg5nJc1x"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c60778a3bfso8110275ad.1;
        Thu, 12 Oct 2023 05:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697114961; x=1697719761; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9R2WJP31ISTqDLxCcJ16Ck5qYaEM4fVytKo7WW22eI=;
        b=dg5nJc1xtINgGfbCD3RKn2DWr+YGb5kn8au1KPrzyQrsdz+TC5KSJgKIw+lHy6YdV3
         V9qSVJHU3WVYyj7JYq5RQkUkuwIDuAFgXDUuZYYDagevwyZS6u1yZVGZY7n3A2IYmKSq
         8lkEOKe4ALAftAI/4awj1Qh47usiRo3BfDwXk5czAlesRy352u52Z0RKMzzutALf7C5F
         JL4Na1zu7jldxSPRenoLOX7d1q8bXmVnwcd2auU74sNuTRNt2lbBBKv9Hj/zhy6Is9Bk
         3tZ9mzCoMAkEuGWDRXod8VhpgEeqpRwpI57/vhQB4EurMifM1DpnFNveCG2j0HefyrBr
         rnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114961; x=1697719761;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9R2WJP31ISTqDLxCcJ16Ck5qYaEM4fVytKo7WW22eI=;
        b=eH++uPpiNSdJmadbg9fbeRZp2I+fDYK5lLcBkyzOrwUPQFa2X7lpOLfvboa3u2L4F7
         gAbVeEcYbyR1DoPXrCfhB9VdALb+fHPG2e1FIEPTbqvH6ChWLka7UK5ySkYvXhRLDUQQ
         m81ATYPn5dMkRa4czjrxwDrnz/GiQKKc67IerawTPn96XEVf0phSPbYUsHmUr1w5wAFB
         vZflE+2ZDNILE4NM1onhO/XzULdrhXO2JpGAIiwGx4YWSXzeGrLTkYs07GMH/Y2/N2Qm
         9NFvPh3GdfBmmmbA2O7p5fUF3bEQAxbM7mKTT1KXynzEx7UBuWU26IwKYKUaqrgeZvlZ
         m6YQ==
X-Gm-Message-State: AOJu0YytC99JiNvMtflcSpEuKQMJnKP+2o0MDNkTaMje7IOtguApcEf4
	EIz3JLgx/HY5A+h8e3jx9tY=
X-Google-Smtp-Source: AGHT+IFEm+hMKsOAOa2EjnTE6qHjENie8LhryEdIP9/VCzj9DNg0KR02ncxD8PJ2t1rHXSL3IuurVA==
X-Received: by 2002:a17:902:e54a:b0:1c6:2dbb:e5fa with SMTP id n10-20020a170902e54a00b001c62dbbe5famr30705556plf.44.1697114961599;
        Thu, 12 Oct 2023 05:49:21 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id ij6-20020a170902ab4600b001c0c79b386esm1925771plb.95.2023.10.12.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:49:21 -0700 (PDT)
Date: Thu, 12 Oct 2023 05:49:20 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Parenthesize macro arguments
Message-ID: <20231012124920.GA7107@Negi>
References: <20231012050240.20378-1-soumya.negi97@gmail.com>
 <81d6e283-fd87-4fd6-964f-22cbf420cdaa@kadam.mountain>
 <20231012074837.GE16374@Negi>
 <a1556f74-83ef-d32-103d-6b0b0233473@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1556f74-83ef-d32-103d-6b0b0233473@inria.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi Julia,

On Thu, Oct 12, 2023 at 09:51:27AM +0200, Julia Lawall wrote:
> 
> 
> On Thu, 12 Oct 2023, Soumya Negi wrote:
> 
> > Hi Dan,
> > > For these ones, the name is too generic.  probably the right thing is
> > > to just get rid of them completely and call spin_lock/unlock_irq()
> > > directly.
> >
> > I understand that there should be 2 different patches, one for the
> > macro-to-function rewrites & one for replacing the scsi lock/unlock macros with
> > direct spinlock calls. But, should these be in a patchset(they are vaguely
> > related since the patches together would get rid of the checkpatch warnings)?
> > I'm not sure.
> 
> Patch set, since they affect the same file.  Otherwise, Greg doesn't know
> in what order to apply them.

Thank you for explaining each point. I'm sending over the patch set for
review in a new email thread.

- Soumya

> julia
