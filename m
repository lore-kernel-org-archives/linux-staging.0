Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFD256D
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744851434; cv=none; b=GIshtcUFLopJF1ozmNv0EdAom6+njenuKYsFzlmXiu+E7rmfF4GzEXPsBVvdw9CXSBc4FPCrezH0ITCHuRKTe6PabtS2NcbEbozS5yrEAraKQZUKC3eZo/57yk0cX7mL/1AnGb5/y0DJMCYBeee6auWXeagku1XEN3VkFovwpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744851434; c=relaxed/simple;
	bh=bvnrkExgcIJ3mH71DX3lJFkQNmbMFSdk6PKkTeJMU/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+MMBk2CS7izjLsqn4noL20LxcP7naCeGBBBDdX16YKIw8be6Bd1DnaiV/D43JXJZUmUnwHG9L0gzo4JLzootnzihfQy14CJ9En0kud2i2l65iLIWTrjlFjiBcJ37F1WAV/M2Stq4XVuLO/r73VPa+VebgRJvJbCLZIxdbhY9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=TqQFL/lg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="TqQFL/lg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223fb0f619dso3082175ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744851432; x=1745456232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqMi74owdbjJ4GxEtEoAoxlT+JzRCaJ0xkE6rbcBBmo=;
        b=TqQFL/lgNxjKxnH4FCYHsb9ALPg9dwUaWSKA6TR/bbQQr1zSqKM+S5S48eHkk2n/Dm
         33GQfgY87oZiwPffNvOzfM2wLhMPsHDgVeuEGMSdh0NH2jjuBnby9Ii6hzL/tcGSciBF
         THR3pdBRW1jAx6pWMXKEFhSg6aZ0KpY5kq5F8cCSIm7bOlgDt6id1qbMozRfi31xi8fn
         IWzYxUY37TBGoZyY5zVVDBXzJQ72cQSW+akdxF/Ha/BVR2muMa6LhltAzpcJrfstJd8o
         TyxB9w+AcDPbtfl9EUooE0LLmXpqZKn0XGUfBGL5YH5I/uCrm+MZ7uABgSku+pQxhBar
         VyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744851432; x=1745456232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqMi74owdbjJ4GxEtEoAoxlT+JzRCaJ0xkE6rbcBBmo=;
        b=TTAwPzNsT1sRVCQoAwsu5ORXNc46dk30OZXslV4R1MY0V+zs0kdZ4AeFYC7RCytI2K
         OfLoOKiXnnTjrcIovJhGfbKID7Stx+ZwXXSMdOI+7Eep0mEiCJhKfu/Y7M5Ji7/AOp1p
         eU8F6BVKag2SgkP5qW3fKddRbr4tpQUN/zrjsy3hWiaiJNArniB1tH6evsZMlao7nwih
         XuIa+FYLW06eG0x4c4c+DIxDvqZJdQGFev7+KiCCnPUeNU9GSilPCUubl9dF1zfv1tE1
         GJINVknZ2TRoODEsh6BnWDctG+wxJUuKCKl0pcN8da9n3N2Zt7ZSOZ1msN8HmFDTVcu0
         Rlbg==
X-Forwarded-Encrypted: i=1; AJvYcCXrl7BS9TawJB3WR6P35oc+f2wxkKmpL2AwWTKju5rGL+DDRW4pVhsuxbP0V1CuyKewm8c4FyK1bLhOxZUQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3EdicqajRjtjaOhomQfFRDshdxGAsn1nonpik0bkVZ5M5s0Ua
	XtBW08lUYxSKhIP39R8WfwNX+Elvi8kT0g9zEF8vh9iZaCSRZZ7T7wAYf5jsYQ==
X-Gm-Gg: ASbGncumi1FzryybfMKlH9UJQsHIbiZcAbs7wGbWLnQ9ymiwDOsR+E9/X7UZIfd+Idf
	ScT+1UpTJUp5quUefbUTbKufy+a4y9yl9yPRefWjkpcMsvzBudgAau7dD5fxrVfFFO4LoJenqvb
	8zkyLbalclOCSpqXU7eoMe2As8Xjrm3Jq+FVubrxoubeFFrEy0suAYbYqESACvEzCPUT/T1froh
	mR36JpGLzRT3/GJTSbOEHqxICa6VTHKLJ19YlpqBghenVbIK8TerFoc3CnZasDNCKTJwJjKy8ax
	VcA2M8+RRZZog08GQmDpOR02mpWJ5Yu4rtln19rpTPxgAVSvuPrd1s1cTPeICnSMAIbu6ysuIWB
	eCpvjDA==
X-Google-Smtp-Source: AGHT+IHAineX5/E3p8aip+x16qwlR/Pv+CEyZMgvoH/E9C7b0jUlNJ17aQboLMM60Vu5iSE2N3U/DA==
X-Received: by 2002:a17:902:f642:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22c359a248emr63796785ad.48.1744851431911;
        Wed, 16 Apr 2025 17:57:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3e0e19d2sm9328595ad.91.2025.04.16.17.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:57:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 00:57:09 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: gpib: Removing unused function CFGn
Message-ID: <aABR5Ykv5lawt_BE@tiamat>
References: <20250409181809.401724-1-matchstick@neverthere.org>
 <2025041522-startling-parlor-aa65@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041522-startling-parlor-aa65@gregkh>

On Tue, Apr 15, 2025 at 04:47:34PM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 06:18:09PM +0000, Michael Rubin wrote:
> Already in my tree?  I'm confused, this didn't apply at all.

Sorry for the hassle here. I will be keeping my tree much closer to yours
going forward.

I just did a comparison of your tree and mine with the following commands:

$ git fetch origin
$ git rebase origin/staging-testing
Current branch work-next is up to date.
$ git log --oneline origin/staging-testing..HEAD
01bb7ebee650 (HEAD -> work-next) staging: gpib: tnt4882: u8 over uint8_t
b362526c049a staging: gpib: lpvo_usb_gpib: u8 over uint8_t
c0086ac9f8c6 staging: gpib: gpib_ioctl: u64 over uint64_t
dfde322a6458 staging: gpib: pc2: u8 over uint8_t
0d68978f157c staging: gpib: ni_usb: u8 over uint8_t
6c1d83dae00e staging: gpib: hp_82341: u8 over uint8_t
6e47dd2b355e staging: gpib: hp_82335: u8 over uint8_t
066df8151ebc staging: gpib: gpib_bitbang: u8 over uint8_t
e2f98401b6cc staging: gpib: gpib_os: u8 over uint8_t
d39283e31564 staging: gpib: cec: u8 over uint8_t
76ca6178f5ac staging: gpib: agilent_82357a: u8 over uint8_t
83a4047b9a77 staging: gpib: agilent_82350b: u8 over uint8_t
e3e09b3c0b18 staging: gpib: gpib_user: u8 over uint8_t
7de94cbc8071 staging: gpib: gpib_ioctl: u8 over uint8_t
98b2ae8ac973 staging: gpib: Removing typedef gpib_interface_t
9d1d6dfa3871 staging: gpib: tnt4882: struct gpib_interface
914975f8fc96 staging: gpib: pc2: struct gpib_interface
64c745a7adb7 staging: gpib: ni_usb: struct gpib_interface
c303323266fe staging: gpib: lpvo_usb: struct gpib_interface
576eb9e6c1fa staging: gpib: ines: struct gpib_interface
5f2fb6ca422e staging: gpib: gpibP: struct gpib_interface
0033454014c8 staging: gpib: hp2341: struct gpib_interface
b1ab383f5d09 staging: gpib: hp_82335: struct gpib_interface
41ebb7c070bf staging: gpib: gpio: struct gpib_interface
ef391db774c0 staging: gpib: fmh: struct gpib_interface
701c5a45b91a staging: gpib: fluke: struct gpib_interface
88d5e0847f06 staging: gpib: common: struct gpib_interface
77b611bf3468 staging: gpib: cec: struct gpib_interface
803d5bfacf86 staging: gpib: cb7210: struct gpib_interface
294e66a9b7bc staging: gpib: agilent_82357a: gpib_interface
6eafa79e636a staging: gpib: agilent_82350b: gpib_interface
7a309862d53f staging: gpib: struct typing for gpib_interface
b248b9d75062 staging: gpib: uapi: Fix CamelCase and IBA Dup
$

I sent over the following series:

1) v2: u8 and u64 remaining patches

2) v3: the gpib_interface_t series (I broke the tree with v2).

3) The IBA Camel Case patch.

See if you can apply the CFGn patch after all the clean up. Not sure why that
does not apply cleanly. It does in my tree right now after the sync and rebase.

Michael Rubin

When th
