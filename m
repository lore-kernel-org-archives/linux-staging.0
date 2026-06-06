Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508C37E307
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780740753; cv=none; b=d8+HH91plOg6APDcWHV3vgiTgy6/mw8bYFf6FzaZ0/5Xz0RqMrE9RPyW44NFrjByiXlb63zkP9JScoTzorptgG0xUarcqfyO3rNPBpX6y/o6PCQIZJUQ5YkWyxKPtgrCWqpKIZ7wgUM4HsxmEsb9nuJ47ABi+NTmL+8c9ECpLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780740753; c=relaxed/simple;
	bh=TE++nM4Wwd5ozZqtx2iL6VDzdT29u/7ZQlw+SdcdkJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttCF5bo3fF8LPxCO+8A5u3DlmSDbZ3xii1J3+Ogl4tFsMHNAfyAya45da0gdBYjBQiupa0huo+bK0TLRUgYD4lTH3CcfVZYr93eXLGhxFRSoh0oQ9Gm9wlc22zN+6Y+gaHwgwz5MVm3iTFvnOAYPCTlmqfTQFtR/4reUCugSFZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7A2siqX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7A2siqX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b12270b3so16444105e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780740750; x=1781345550; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wazHcUbE8DAQ9Lh67uXmhqDsxXBo5A1VJQ1lnl3eDOU=;
        b=F7A2siqXip4IUB1oj7d8guqWwZ5iZI6dhLTdShhh6pDlr+UgbYHtFb5AsYDVosXwMJ
         KvUJuae8plfCq7jnsK2Pn8NVfqSQf2DjF4b3qaGv5OMr7VasEVVsTdQxGD3jmBRMYJEn
         mSrkGROc3C5VNqK+3Dp4HdWaC/cePoQMSQE+Xv/6nyozKwoxToUJK8CwZn85yCJ6EtjB
         6xzZMtliN1nQt3nhGtB3iU0g6mxbJqHVdbWUMjQY9s9vePUxbOdBg0wTBsGNscQJ6GZF
         T4dM6PsQ67a3noHA9omK0Ie3TrLEH8vrkypOH5ld7Rg93N7QW9lLdJZaKkb28HCbko3h
         3pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780740750; x=1781345550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wazHcUbE8DAQ9Lh67uXmhqDsxXBo5A1VJQ1lnl3eDOU=;
        b=MxmqmyBakqsMkxetD76KLQlY7HYCdhwpxpzqz2Au39lm6BcvP9W/gcFofgEljr2NSW
         RWd9ATSMLM2gRPtduGlIDSigeoiIoFiiGaqoh0srOnu7m4J8nyUjANiqCp16qyse+1UQ
         +JF3/AYDpLASVo4yMudBF3Xg4vKTCGLCvCE6Lm9ytaryAuEV2ZuoLpBR4VUKdfQ1Ts9s
         lQNI0mgJWdEt9CTu9Sw3MPDxzbmPeENmDjthemirGbgOT/C2k9y8aNOmm1UwigHEPJ3Q
         9ZpJEX0zN0neOGiXYlkJzr00x6NhS5/OT6HakwndEgRN2Nw3ERdbZQKqbhq1zopIziUb
         LPEA==
X-Forwarded-Encrypted: i=1; AFNElJ+Eh8TA0KZGm1VhVM7hBqwjgVrpJ082w6eDzvUjSsCIsgary4aip6uku4lZr2HuVONbQ9qaQSsQbAR0crQ8@lists.linux.dev
X-Gm-Message-State: AOJu0YySit22LTkCu5Wk6qFqOrDIvWd4sucorSi52N375f9RWhMgLppn
	MxAAWrE4kKFO6V5z2Bn31aX3aEAlkdCuFr3Yoi5UJ3kr1dTuXB2LG9ILd/s0Pw==
X-Gm-Gg: Acq92OGdmIM0idQ4ZtAAX0r0eZOv+PphpvlsfiolCPdWrzxsJjxMopLCfG7XozFdq1y
	oKzUl8gDUeE+C1kSYyEwfS41LJRsPk0VhM8W3tWbTrCPnh4FgEPYl5gf6PxHpGyLqbYXAYyX9wH
	bFYbJ5d9/NG2H5glvnIi2G4rvBZqxOEPc6uo7NzjDookSXFSKxxMD7tioypavfzNu4ycAxeutYM
	QwT+EKImuhB4KlHApNIqek0IoqfYnz+1KId3LWtldT8V1Xlk4Z4XhiiCBgRMW/ACUnvyWu6+wka
	a6lFNGZLRN7k33oqfQcUnBFZgEGm/PO4Jyiv4mPwa9WEqF8gkwmEhItDJ1noOkgQzKIM2XGLU03
	9DE3AWYf65Woi29SRjDg6Yh8JqOutNtl9PomoyEMZU5YwTHW9yeHIfjXuOzX1d+3/d3Jkl5hlZF
	zkrZzK22UavvERSWlwjvd0ragdxNQbycQIPs95898N
X-Received: by 2002:a05:600c:4e55:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490c25bec84mr121569395e9.8.1780740750095;
        Sat, 06 Jun 2026 03:12:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm224957455e9.6.2026.06.06.03.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:12:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:12:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unused macros
Message-ID: <aiPyiUSPhy8JaLON@stanley.mountain>
References: <20260606092842.179826-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606092842.179826-1-rhys@tumelty.co.uk>

On Sat, Jun 06, 2026 at 10:28:42AM +0100, Rhys Tumelty wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 4026e98c5845..0eafd81c44cd 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -48,7 +48,6 @@ enum clock_rate {
>  /* TI SND9039 PMIC register set */
>  #define LDO9_REG	0x49
>  #define LDO10_REG	0x4a
> -#define LDO11_REG	0x4b

Don't delete this.  It's useful documentation.

There are some other issues with this patch but I commented on them
in my previous review.

regards,
dan carpenter

