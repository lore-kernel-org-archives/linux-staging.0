Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2634F498
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785024; cv=none; b=DJieZcyQ5vYygGAnHUdPB39O0UIeWh9sFdfGFF5jFOagm21GWzRC5MfK7Pk8+GMCglXHRv/oNwoiW5AlDFK2L2gbachFrYNSHEWrm/9o+Er1CeMuPUG7P83IaSZ2j3FsSp23bN6ihsnUSGAOk+tySumq9wLiSaidfMpoIBsBx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785024; c=relaxed/simple;
	bh=2llFuoSXMc+5N3m+Dp2VOx15PRZRc26NMu/GNqR+xQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dI1/x9ysohfzu2/c1mknTbTzL2vB2pkCiw+ZBthyPgg9/Q0IQ6cK9gvYqO4EG2+oftUPb84Q4xrpODlgqSWpHkvjJO5iW2eAummJhQqVYtMYQdt9pnbmvABp+ZDvvOFbCBij9+mLoSHvMVUYoYMpfN3dHjE0+YQwBKf/mEMW9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpSYxZ5C; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpSYxZ5C"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so289688e87.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784785021; x=1785389821; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVtvnDjA9INjIyx6/YBhe+VDRG08P0PWnal5Do81yec=;
        b=HpSYxZ5CCIcAhvrBmk/N0pDXTeCE+hI6CBEhhi27ssY9CArG+nRS//OrvTZrkIfW/k
         ApSvoMAWn4ePRposl58PRTFBceFADMalGK65cvuraieAzKPCy9JX80/3i1uGBrN5Lok0
         vq/qB7Ta7MTpW7DYdVCXYkZIUctyWN7B2V256u3BhFcKiw/n1W3pQClwfkgV4h/CAI3v
         kYFYECkqPN3mWskpC4Baf87Fot5h2b7xQ8um3eCXN9rEQscoaF3aNLNm+HiypODdeOwK
         Y55Xg6dmahcdLaOm4S5Y1tlM+KJ+6M2LZJW2wZUEXxUpQ0/GJe7NIehjzOBMgGV70bGf
         EEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784785021; x=1785389821;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVtvnDjA9INjIyx6/YBhe+VDRG08P0PWnal5Do81yec=;
        b=qKrgoxUVWKcnBIYDLw6LMV7YPG0W43CxGPFz+s1hEa07tI77IAfLlGdrIItRqYjLz1
         BhkHnj1tYuz2KrFnh0w48Pqy7LZ8BoIZXrjXwbqHzKnuzP1UL5330lERycxPk4y6W58/
         p2sV1HxDjktwYP1tWjlpBvSd3Cn+dfOKdvmcoIO38hzywLOwG2/7+GjnOlMoZqn+18XJ
         NCn7MJmvboAknCTI6QcRPSX9lVddReOlwggy5duCH5wks22fw2EagBfqRB/6DS8QsKM2
         xcbuRd3jaVwzsX9Pr99jM7EOFrEQCtuXHHeES4buI+3R4lEUlWHpPQjDXYhqlKimmRCv
         RpPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrfhu27ciNunHGXYVRGxl5iIzwv3a9fsDf6JSygnt2Z/NBLm8BtpC2EAnsw046N6B2XGQI7YJTIHuq0qPj8@lists.linux.dev
X-Gm-Message-State: AOJu0YwEziZZDlYpdS0LblOXUXlZDVuaM/z92f3FrmYCtrvDH1UKwBMN
	ylKt0vSuAT5kfQFivydda+dtXqZHQI6zXsrVwpYWYy7otsp60/KxLKTg
X-Gm-Gg: AR+sD1231mKIym0gaazR3vni9iuy8KOZs9ZG6pbT2zOcYQ5a9O5IpYw/1fzFtwy9Ymi
	YY0C+jqY0bzxkNUE0lDOciLUpn9mLoH7E+wNYZqu8U3JJgs5BcRQqAmWI8HLW9sPURUqe9zROvI
	ku52VEkOpC35BOjP0fq/8CKKOAl7au8OH3rc8e8HHedSDKv/reNYGEOdP56wYLaBJ2zY+Ccp51N
	V963dBar2eOUnN/TGt07HEZJyTomPDfjZmpiveUzK5kku3dfdJ3STJomkR9RwpXiu9NnevG6Vbo
	6aX76dRNXE7qQAoKsJY26ESRjAfnlhcxpxQf6cuvjokshUNIDiWCtAT/NM8I99IRyeGNmVG/5qh
	9zvUPwFDH2el5WBmGBIQBbKb4KXhc3ZND/7pOPn1nsHU+5Fh5tom7FKLJqql+tAxVlvtrv5tzSK
	g=
X-Received: by 2002:a05:6512:1249:b0:5ae:b135:64de with SMTP id 2adb3069b0e04-5b2b2f6c5admr293217e87.31.1784785020898;
        Wed, 22 Jul 2026 22:37:00 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d42fc1sm843939e87.58.2026.07.22.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:37:00 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:36:56 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: media: atomisp: remove unused functions
Message-ID: <amGoePnbFT5LmbiZ@archlinux>
References: <20260721214238.840406-1-nikolayof23@gmail.com>
 <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
 <CAHp75Vc-TaNLkQnck=OFonuWMWgdaxP+cVh7Oo+RjUeOWLfZEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc-TaNLkQnck=OFonuWMWgdaxP+cVh7Oo+RjUeOWLfZEA@mail.gmail.com>

On Wed, Jul 22, 2026 at 08:08:38AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 22, 2026 at 7:58 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jul 22, 2026 at 12:42 AM Nikolay Kulikov <nikolayof23@gmail.com> wrote:
> > >
> > > This series removes functions in pci/hmm/ that are declared and defined
> > > but never called.
> >
> > Don't do it per file, squash these changes as it seems not so many of
> > them (I assume you checked the entire driver, right?).

Yes, the entire driver. I usually use 'git grep' from its root.

> 
> Note, if you want to make a useful contribution, try to clean up the
> below header
> 
> include / hmm / hmm_common.h
> 
> It has some ugly macros, instead this code should go to the users and
> then be propagated to each level and refactored.

I'll add this to v2.


Thanks,
Nikolay

> 
> -- 
> With Best Regards,
> Andy Shevchenko
