Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C934EF0A
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771671741; cv=none; b=qLVwjZQaDtu/bybnz6/nE/hJr4FE3AZyIS3f6QYji+yoAnXRhZkM5bKIvy2I24caMCmfUhrloHoOq/ugacm9VrxF9Bqjzhp9/ntnE08k/R4MpUHyPDU4I414xrIVOPHNuDN4ADKDmA3Kr+y3X0fs+dKXs7KZssg8RZJfldlPxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771671741; c=relaxed/simple;
	bh=B6aN9eU/dvXakBo8ZSMsO/yeUz3RiFRzGGI6/K2jurg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Th6c/QU4kEW7JcZephJ/1qVVK8978tvio9GgE20l/FKjQ8zjueYzUiLniQdw5fcIJsyPPUzJ54lhO3SFgGHdCmaKYc8OJR9inP8WIfTymkAKhbLWynvf6QO80DccM2rivhGk6z+LIFyYCE2IpiSQ7J3OCmYXO6Y0TuqE97jNXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/rLdzIL; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/rLdzIL"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-797d857e3f4so28425367b3.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 03:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771671740; x=1772276540; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHLOJmrVyPVf3jvfi1JdhexuZdTURGCP5nyrfknBDgw=;
        b=D/rLdzILkHBvfMLSvu9A/w8ekdOhDx+On2m6D5AIHD1fK/zZPKz6Tc29mJkMJgY0ja
         Vh91esENe5BMTeAHVUZYxI1NDB0v+bFGK5tftczRNhe4wwjiaJhOAPNPu7nEOnkm4Gaa
         PWH0JzNH/arXns9TJOdRkV9BYmf4415DYe9GBwriiUjYHNe2gWWrmW/bMrhRkJnBMh3J
         PbjraOnwSOsyLNmYIzx+yIEG3LWePIqfTQz4ZVVFfbth9lYDAcY4PJ+XxxkA1yK5IdYF
         O6/urfl+IFT6PEWgehSa+kZNoHiqx23CCLgmkn3iXbqTkTs3bB9Cm2B0bu+14l3AmInZ
         OSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771671740; x=1772276540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHLOJmrVyPVf3jvfi1JdhexuZdTURGCP5nyrfknBDgw=;
        b=Mh5WEnrNTKgvZ3Oj4uPKAzTLANloduLRO/aJ3aA5XBopnYbQuJcTE7PJo6Hc+b8pb6
         BwkPUDM8HdmLidMTk5AxHRDNBdSqQa1DkjvLt7/YXJFO8QgGNmI8FHLVM7fi2KcoGvTE
         2ydPBonKbMzy9fL/BTSrSJLj28xb2KeWk3uFe1It8v8+aL6kPR2CCYkoGmdPPwHF4kGN
         bEt98kM61/YR1v/6RMG22GCvliCMqDBmFwq6no7e937Nt2ykSwruYyefY9sAdju6A14Q
         taFR646uGOeqxc7n//w4PJvFkTgvRflgbXF2V40al6yUJ9SqQC8SUuSLL5ojCdw9/rLq
         fZyg==
X-Forwarded-Encrypted: i=1; AJvYcCUTXgPkDIGQXJqzy000OpB/F4KEaTXcq+ZaBliH5QN83PFvu7A+n3I1CoOzOmYyIm+34zBJNN30HAldQ0Fv@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu2qvRLWh+bvJ1AsOLx4OaVUvCjaN/4KZJJd0Of3SRVJCirPf+
	dD2ApmCV4yMl0vnMFrSIFc1yrpbLAz52MnNe0NjzmgWTwcs73qXuNKax
X-Gm-Gg: AZuq6aJ6YLOIhIOuh5tFTmDcxILIk44IlW48lNmVTBYld3DV6Hymf323lmOrDuoAykp
	GJGTc80k3w6cNX5ZCZQSscQzWRzrZz15jgf2T9txivXLz5Aps2UWc7uYjccg5dKe8UTkvPTzk5N
	qSB0Kcm8w1BgbLTtEaDJEemooDd1P9LRT22OplbjyqQz3DFT4U5670aLMNke1UOI5VMF6Hyg2nu
	4PRLODxSQzL2lOYclr3wj/WsX0ScDu9lNSSBi280G5zP/UV31MEEImj2klTMK7kGwdGChZSlbSv
	3If9PHnX2+XuZ38Mwc9VgJRg4R5dGPd/BzWv0pnVVtvU66xPL0Of3y/RqXoKpsfcpo2+PRghIpl
	HAR01L74ja7rXyvu0M7bgby0Ku8c0e7jrVOFp8hDFQo1so4pi4UvsTAp6u8JpnzK+D2+1r7rFZl
	HYzYoPtxXSgLtYZzhHzzUCLNMZtidxWmeZ
X-Received: by 2002:a05:690c:93:b0:797:afb7:b1f7 with SMTP id 00721157ae682-79828cf9225mr24258207b3.13.1771671739658;
        Sat, 21 Feb 2026 03:02:19 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982de1381esm8227037b3.53.2026.02.21.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 03:02:18 -0800 (PST)
Date: Sat, 21 Feb 2026 14:02:13 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix spaces around binary operators
Message-ID: <aZmQtT6FDIC0itId@archlinux>
References: <20260218113229.9171-1-nikolayof23@gmail.com>
 <DGIAYPXFFQ1Q.1J195CKVQVKWI@gmail.com>
 <aZbVOzEgj6ljtfqf@archlinux>
 <DGJZXS0ZURKI.13IEI2NXCMESQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJZXS0ZURKI.13IEI2NXCMESQ@gmail.com>

On Fri, Feb 20, 2026 at 12:21:50PM -0600, Ethan Tidmore wrote:
> On Thu Feb 19, 2026 at 3:17 AM CST, Nikolay Kulikov wrote:
> > On Wed, Feb 18, 2026 at 12:34:56PM -0600, Ethan Tidmore wrote:
> >> 
> >> Logical continuations should be on the previous line:
> >> 
> >> while (cnt < in_len) {
> >> 	if (eid == in_ie[cnt] &&
> >> 		(!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
> >> 
> > ...
> >> 
> >> Alignment should match open parenthesis:
> >> 
> >> if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) != (u8)(wpa_ie_len - 2)) ||
> >> 	(memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
> >
> > Hi, i saw these issues when i was fixing the spaces, but i intentionally
> > didn't fix the indentation to avoid merging different changes into one
> > patch. I'm ready to send a sepatate patch with indentation fixes.
> 
> I understand, but here since you're already editing the line, it's best to
> just fix both whitespace problems at the same time.

Okay, I understand, will send v3.
