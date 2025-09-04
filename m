Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173FE2FC030
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986209; cv=none; b=snNZXX+DbSEvxEB4ZxBnKWjCK5WILi/hp4DpWyfKVjZAoJRG/waENxPKGfB9D5BDkGmLALMcFsQQ5CNqQifkI+my3ZB9yHyfaozp+qz4iAOX8cu87RO0wlFnzP1gYeUKLsRlazHveG9hhMOE/yF1OZ20LaL75AMpQai7cgtIw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986209; c=relaxed/simple;
	bh=muiz7naDGEkZ3ifHiHEdACkPE3MonaLd2fMm6LWbdcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=KCyiTB4bMH3ulHWwT/83aKNaVwoHCrqS0sLDH2RnEWFZviHQTljCNSdC1qMHrVN3OhzLN47Shjb9B2zOAFiEGj/BkzCXl5MXkBYV5rBxntu1Oo+wXzxE6oYIED1lLFDNUcRdhYcDEU01hZIp5zefn7kcT2r21VCji9Y6GzD1ST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWYVj+8b; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWYVj+8b"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24cdbeca71eso1622925ad.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Sep 2025 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756986207; x=1757591007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muiz7naDGEkZ3ifHiHEdACkPE3MonaLd2fMm6LWbdcg=;
        b=FWYVj+8bx2jlmgrcQU/OxtadAhlITGWGi35pJK693pS1Ve4lb+CY+Q/xi7OY1n4afS
         5z0TcSuzNdBgjCrusG/hFt8TgNJFox960ckxSH3mbOwZAKteYp6y4XNz54S4NvPDCezd
         uqk/HLmDDtgl/VWGPiV54Tppba/lxR+diyhED1BIXl/PDNX0B/D1VwGbZdEBWbVHUyf8
         shQHLpjLh/+/knsS6qyu+HM0w1OcKQll4a9Un5+8HWFNbOZLl+S6YpKaOGPg/ZlnbIWR
         AycY5TUetobBhmyVal4aPC8+e0E2m2cwRn9cV2rvPX5thslzZ4PJFPtKHYqmTGJBQrly
         5buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986207; x=1757591007;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muiz7naDGEkZ3ifHiHEdACkPE3MonaLd2fMm6LWbdcg=;
        b=kk442olp2hTk6lbViNjCgZufgP4kYCKa+m1iaLwUe5XOFvfK+JAedAakfCMD56VyVD
         xk5G7bPlrBqowMSa14SnuNYfixFKCT8AVFNHtILvRZy2ra7yZyZ3bJTLZ8I2Yhq1X1I0
         4H/PrjFBEhQoTlt7/21IY6+Nd4OqKaJaVZW26vulaQODe9FqzNkjOxSy1EC+Jtj/wdQV
         0OtiLUK+4lDJyeFxp2ITreDnFdJ7qtH6VjZX6bf330EUP4B6Ian4emKMBFk9DP58RlS6
         z7RjdwccdQAL0ktg5bLB2yhLBKGcwbVSrWQ/VbEGo4lEua4lGW/zRBUQUXcfIx6qG8z1
         LBiA==
X-Forwarded-Encrypted: i=1; AJvYcCWKG89BaixogvZu0Jp5B4CFKqnuokjPEz0FMpJ0kzbtiYpSii33CHVhzjt1JIop1l+QIe9UcJCXfXXsAaxa@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1UtP6q/0s97RgpvT+x+0vUWuczoFTrwH5EjxeG5IK3QLWlSft
	McVgIBr5HCCepbr0aU/RKZ6RpS4+tRg++0V+QH/IVynmRpSXdRn+aXgzPG27K40YVi9DHMvsDte
	9XjxMNcehzMV3n0MPFsAA3xsLLPh0kR4ocDjCGYzX
X-Gm-Gg: ASbGncucUNCLQoB8CCoz6U2cuaJCyqo/CfXK4NoiGfjbOvkeDxMdboIhN3PBN5KuVvJ
	fE6hMgDBclsVJauQ3c1puw2EDtW9JbAZTe/nnt9WniNR364SmzemGd+a797Mx8ZsZAOkbBU5ZTU
	s3wiXx9WUz03PhgP1VsvUX9WfQZQK4PFlmu78Ea18QAXN/N1oms/2lERvD80s2WuprX9SclzKtK
	2h9EIpBTMT0rqA7d8uq3WMgwe8nnzwAmlHAH/Zi6LHT3idiVFXZ
X-Received: by 2002:a17:903:2a8b:b0:248:fc2d:3a25 with SMTP id
 d9443c01a7336-24944b0da8fmt258366945ad.38.1756986207111; Thu, 04 Sep 2025
 04:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903092754.2751556-1-abarnas@google.com> <20250903092754.2751556-2-abarnas@google.com>
 <aLlEOYZqT07r6G_V@smile.fi.intel.com>
In-Reply-To: <aLlEOYZqT07r6G_V@smile.fi.intel.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Thu, 4 Sep 2025 13:43:15 +0200
X-Gm-Features: Ac12FXxEQX8Crqr8PV1pxbSjW9Mcxxq96iJ-CqMFMybLuuhBwuzyFNki_Fu1js8
Message-ID: <CAATBrPEMuoVQwCqycrZ14PsNH4u+Di+eycAofObb=8kS9dpvfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] staging: media: atomisp: Change name to better
 follow its behavior
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

Regardless commit message, is the change OK and can post it as a
patch, or similarly to second patch it is not worth the effort as it
will be refactored at some point?

> Change name to clearly states what function does.
Proposed description:

staging: media: atomisp: Rename `inv_subword()` to `clear_subword()`

Function `inv_subword()` does not inverse bits or subword and neither is
inverse operation for `subword()` function. It is used to clear target bits=
 of
move_subword operation (specified by start and end-1 indexes). Name
`clear_subword()` explains the function behavior better.

Best Regards
Adrian Barna=C5=9B

On Thu, Sep 4, 2025 at 9:48=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 09:27:53AM +0000, Adrian Barna=C5=9B wrote:
> > Change name to clearly states what function does.
>
> The Subject and the body of the commit message should be more specific.
>
> Missing blank line.
>
> > Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
