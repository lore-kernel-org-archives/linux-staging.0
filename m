Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6373F3859ED
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769798839; cv=pass; b=rWHD64ltAkO3rDsqsJgUQy6ZwRzr7OqqVKyCcsbKGIyJfnkf/WAdkwFdQnwo4BqViCFY4M/zSVMs4RlRVD6V2alVR7EYvlKeldtrNtnWKSm/hKkAh9iENf9Njno9sf+bLwriFtaJhwGP0yVIEqObqYaNXX0JYxbNEp7Or9tYkbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769798839; c=relaxed/simple;
	bh=ndazyHbRn68f82AzqYQVJyuPAXwu72BfvVbj66vY/JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUuoDRwPgY41zxbORQZHQafeU2c+y3zK7dLiJMzofS3Q9+S0rg6/O/TkvxMc/TTtFo1uUJDb0qa5Wdl0CJ9dvkFRdeSepAm0fnjK3wTvqE70/vTPOJlGn90+JIp/mdxZlCJkxRV1iPvMEVvrAWj0KXXhVjljZFVACXrF2CdVR2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mllZocRO; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mllZocRO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so1983536a91.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769798838; cv=none;
        d=google.com; s=arc-20240605;
        b=BlN/cYYo0ZCEZjyt97j/87tP7P146z2W3EW1ygCgnAZx/BA5AR+5y/8x2p+ENErpql
         XwdoMD7CxBNEGt7IpNlAfRiLdEf+/uRsK4vkoY5V1ALWAX2uEc+2XoJNiMFmCkv6NDkh
         rTRw0E9jAfbBDcQn7QdshKZOu93vG+DvjCHehfdCrvNj+CxfGJDy8Naw1O7txm4JBkwW
         QbCBw9RXe2atV4ROjNc1fjPFNtRBDaJBBD4RbBzyklINch9S+TjlLqPVDizqbyZuhbgQ
         IJGHFCcAm1mw24I6sjr4nGOugtJAXHp4Ek7B4jFDYAbd0goJB9c5YPo03pt/Kk0MrKSc
         iSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zrbk/ntRYGhHIZoPLERhq4mDwQVHnoMm6W1/F7WGnZ8=;
        fh=ZeIp40ZVH3FBg9245DK8zW51BkK++MhoewTgM8b9Knc=;
        b=hVqb+KcMOSs5xkb4XwdZ0Im2ijnSehi2GI26+Vwi8rV9YeT9dkMXKnzwoiNkrti7Vz
         0EkOAGQhvm5ZoXCzdQUOOcvB10xp5AXNamdAhLJXi4mfmmn5VzQNvcsYpOAObqoJATQK
         CEUcNJBi9tT6fRqb63kOdhn8VZ7Q3WyWJZfYE4Nu3foxv+AP8kLg1PpO4VUZ81MvnyjB
         PZZKZh5rusjZ1X6pID8GQIPr1WEPlyge5ZrScWpnlLlH3Pxl46XbfePrQ9ARVm7+csuK
         WN33gmAz0MNbGnkTJSCNxWhYZ8t1B6Ok+MRrrXq37ixylkIGe6XN/YgN/jQWF2ZrNr2z
         3kvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769798838; x=1770403638; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrbk/ntRYGhHIZoPLERhq4mDwQVHnoMm6W1/F7WGnZ8=;
        b=mllZocROgNX65+yzW7ye7GcSp7q+t4Jup+0phqU8gGjkzsFZ6yRi8FeGSi+hwq1gme
         efJptcH3GHAdFomeKErvxt1xlJVKBFIoLomGhZPtLBA0mm9FF0zncJREXNvt2atJ+Ahr
         +1D/BfylrPNM5txwaX3YlZESIxpUPFRJRthPNiqon8BvEiBSimCfBW1RZsZSuIPFsSFp
         /nvcyk7uzi+zYhNCfdOn/TYD1QDq7Rnbs3O3HeHZjJHRRl5A/lPzpGxxvN1MS4fF2iPz
         Xj1GFLGmREMd0i7j3gdHIznAmYSgxdfmNrapaSxdtvwWTEwZ9DA9UZebMBuEQpn34Etl
         sfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769798838; x=1770403638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zrbk/ntRYGhHIZoPLERhq4mDwQVHnoMm6W1/F7WGnZ8=;
        b=kBhnBSAvuIb9J9GRpITotu6RQlUfWc0OYujNFgOmuzkxG85gSdFB/F3TyOfC//jrJe
         hrxfpMoTCzk7mAFFsdFuINu00Iab1kT6pDIoAPjMQhbEi07L47fIyVA0NgJi84MurbLp
         c2BjHw3Be7mPM9Za+Pj0GXDiIXiXal5Z3MRIi5CXEYcr0CKJ54cWgCBt/SmIJNudM/vP
         aiSg6OqzSzvrMSz/RvtNswp2+JVuISNHWxYMuRdCXwo9lRh9OFAMNcy4DhFYIKwGpzjX
         fl+KsTGerKrVOtVs6sCu0Y4E50GD4BUCM9a2ulCrRtkIUE7kzpYs7p8Ogfowz6f05CYH
         EZiA==
X-Forwarded-Encrypted: i=1; AJvYcCW9wHTh/0eIShAD6EpZxo4R4+qhkerWI4deyeINkM8MLLifz6rKNfIQHoygrI95Z/lESD0FDfmcpg6PagRF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1JZ+OgCu3qUpONqW/mFboVLIp3RabiaL3NbE21b5mVlqanpN
	ppn88IXZ4DZ/QkgQpCesaTEWk2Qx20XzkVM0w/6A+LTDdGeZwVL/EtF2FfBqqiHvyui1G2XRC3W
	8PX9qnOcmYzGDpiD/jeFt+fh6E0Felg==
X-Gm-Gg: AZuq6aLFXsnI2cAyBb5blEEErXDs+t/J910aYOavARoJet/2kgf07s7Pj9r6LtFpeDu
	PQVzqVwZhM3xf5E63ej6Jv7j/46SoNJQUrjsoMaxz8sjGIpNrjoXS4JLLFF13aTQZuyz0Zd7lHH
	Yt0t8fCsoZIg4KueiI6CwMEMgiw4g3aYccJKSWSIlGqMGlK4alrDPbQzVmYZlxMU6O8Fom91y+9
	S76rGWCrUd2OYCfxNgcrCGRYOegExreDAJYVPU6bZqGsVfWuRsM1MaAbJpw6/2+b/YWfHK2/ce/
	Ct7baIPU9ZvPoDYbV+4FHNiGyIA13LipIliMlvyTxxXEiMEdThbGDV0=
X-Received: by 2002:a17:90b:2b43:b0:340:ad5e:ca with SMTP id
 98e67ed59e1d1-3543b30535fmr4051073a91.12.1769798837626; Fri, 30 Jan 2026
 10:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130181620.199152-1-lukagejak5@gmail.com>
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Fri, 30 Jan 2026 19:47:06 +0100
X-Gm-Features: AZwV_QhaCAVmF7xyWDelYm2Fss1rX7lbKUb8c3MSsYaHYw6WR7ixDlKRD1GI14U
Message-ID: <CADRnA90MmTpVE_iKX1T0uZqQu1njVn_RfQt9cH7igEeTY-WugQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] staging: rtl8723bs: fix OOB read and perform
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg and Dan,

Please ignore this v5 series. I realized after sending, that my local
git configuration truncated the subject lines in the patches.
I will send a corrected v6 shortly with the full subject lines.
Apologies for the noise.

Best regards, Luka


On Fri, Jan 30, 2026 at 7:16=E2=80=AFPM Luka Gejak <lukagejak5@gmail.com> w=
rote:
>
> Changes in v5:
> - Corrected commit message line wrapping to 72 characters.
> - Removed blank lines between tags in the Signed-off-by block.
> - Removed "Security:" prefix from subject lines.
> Changes in v4:
> - IMPORTANT: Fixed a build regression in rtw_mlme.c found after
> submitting v3. v3 will not compile; please use this version instead.
> - Fixed build regression in rtw_mlme.c found in v3.
> - Removed unused variable 'i' from previous iteration.
> Changes in v3:
> - Reordered the series so the bugfix is Patch 1/5.
> - Patch 1: Dropped memcmp change, kept original byte comparison style
> for clarity (requested by Greg KH).
> - Patch 1: Added Cc: stable tag.
> - Patch 1: Updated commit message to explain the OOB read logic.
> Changes in v2:
> - Split u1bTmp rename and spacing fixes into two separate patches.
> - Split hex modernization and the WMM bugfix into two separate patches.
> - Added a Fixes: tag to the WMM bugfix.
> - Removed an unused variable and dead debugging code.
>
>
> Luka Gejak (5):
>   staging: rtl8723bs: fix potential out-of-bounds read in
>     rtw_restruct_wmm_ie
>   staging: rtl8723bs: rename u1bTmp to val
>   staging: rtl8723bs: fix spacing around operators
>   staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
>   staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
>
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 ------
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++++----------
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
>  4 files changed, 38 insertions(+), 45 deletions(-)
>
> --
> 2.52.0
>
