Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E65172799
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968254; cv=none; b=NC3X/5aGWEhr5M9Zr0KuCDqW6le0/KU+1vM5C0NAynaQQtlqxi76wEcqztQ0pk82tacUxLCwowm6YirTHLxfX1LESQz1CL5DS6KuQozOYQx4m36IgzJpcEnyRvzTWzDhUdYAH/F6KMTZwC3nJvD/iijrkMSF1iaWsAWNy1/Sm/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968254; c=relaxed/simple;
	bh=UO4R0l4BQjo+8MN+BiCA8yApkbBY8gcfTFydC4RacbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEbec80N+1RlYY6iPjcuC501smi54pfpDLVrF8wzlgAhja68xnPY20Ulzw0i5tbig2KutMYmHs+ecGPZOAgGprRX9eqWqkaM3GCxGm0rKGhSJU3faI77L8xHs/bhldBaA8N51CO6j50tbp3cmJVxW8TD288alQSdiQhE4X+FjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EschMW6T; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EschMW6T"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso224316166b.2
        for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718968251; x=1719573051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w03f0OqLX2Nc1ojSG/0rSD+sT2qxP1k7/e2j+VW0z58=;
        b=EschMW6TYdZ9Isk1kTlNaxrejqeHAqJuuzRbzc0JpYaitiMSqn+jKLjDcHrq3qvEQj
         tX2MS31uE8litd40KzbbanaC9lR1rfjPp5NvyyMlHz6t3GD6OCgEeIHvQQP9NU9I3hU7
         HaCICePClpZCVvkzNrQZ3VE7Z190dXZ5mio8X7l1WX3knxDNc5iCP2yMhTnXB0AhZDKU
         0QGQB1Gu62y+M2691moQwODWUsvN9lxO8CC52mNpXl4KINllseyot8nmzFtTcY+XSiRe
         QT2OHWhE19lADguojeuvLGTd1kNr69qC3OJYqjZa5LXknYDE4EPDvCtnYLVOTBID8q2b
         KZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718968251; x=1719573051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w03f0OqLX2Nc1ojSG/0rSD+sT2qxP1k7/e2j+VW0z58=;
        b=PxZhH3Y2UDJ3kavkoxZ1mw3y+DoDtT60nCTETtcqRnBezM2saYssJPQM5f3vqYXg0G
         kZxuhhhef2h21UkMAYOAHb61Rp5DjpuTZBHwivlyhsJHRUZB05Afvg0Cty8HeYSPzvW2
         KPJ/6+gzhh+fLs4/6caHEepspAT8e4VJeZsvf2+1oHqrmLNGQjkOdhdue3K8zy9/IE/P
         Adj9vRDNMlfxBnVhZh37JGf+tOvIE4OjWprM/7MZkmq3QVTPmoO7mMpOX9rRmO/AUCsP
         tDOjJ+tobMCppV700uo4+P1RW9RjiI5aGzAkV+Bo/qxx7q7M9TNaVjPZSde7OQ8IGTOL
         c2/A==
X-Forwarded-Encrypted: i=1; AJvYcCWCbB3K/mg4zWs3Zi1QRe5uHZwANBbZx4bTqNaMcssK21hNukqsM9ErgWSTuybaRkNPM4CvuEJ5ulDAsZOVCCp8/Ml77KKjIFvnvOF6yA==
X-Gm-Message-State: AOJu0Yy73dFOfqeUgjO2isWmSVacJcfrgVtPmflsrEe2x+e5t6tgaAju
	2poZiC+ruB0a5Jmu46WHavbXFfceMnn2CoJCiyfiaZ+Cp7bqapCNqqYyCSPc3JM=
X-Google-Smtp-Source: AGHT+IHcLEkm7Cz+ShLlE5gYJpEpEwffjIEmwlmGa57Auxx53cOacxJYtkNzrRppjsAM5b9dOR9RnA==
X-Received: by 2002:a17:907:708:b0:a6f:2ee7:b21a with SMTP id a640c23a62f3a-a6fab7dc5b1mr646727666b.65.1718968250677;
        Fri, 21 Jun 2024 04:10:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf56ed53sm72234666b.217.2024.06.21.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:10:49 -0700 (PDT)
Date: Fri, 21 Jun 2024 13:10:22 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Martyn Welch <martyn.welch@gefanuc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] staging: vme_user: Validate geoid used for VME window
 address
Message-ID: <9ccf4b68-acd0-465b-a5dd-4aa4569da9ce@suswa.mountain>
References: <20240621104246.11292-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621104246.11292-1-amishin@t-argos.ru>

On Fri, Jun 21, 2024 at 01:42:46PM +0300, Aleksandr Mishin wrote:
> In tsi148_crcsr_init() value of vme_base used as 3rd parameter in
> tsi148_master_set() call is calculated as 'vstat * 0x80000'. vstat value
> can be set from module parameter "geoid" which can be any. In this case
> the value of an arithmetic expression 'vstat * 0x80000' is a subject to
> overflow because its operands are not cast to a larger data type before
> performing arithmetic.
> 
> Add geoid validation to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge driver")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 2ec9c2904404..b601d2b20bed 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -2119,7 +2119,7 @@ static int tsi148_slot_get(struct vme_bridge *tsi148_bridge)
>  		slot = ioread32be(bridge->base + TSI148_LCSR_VSTAT);
>  		slot = slot & TSI148_LCSR_VSTAT_GA_M;
>  	} else {
> -		slot = geoid;
> +		slot = geoid & TSI148_LCSR_VSTAT_GA_M;

geoid is a module parameter.  It would be better to add some validation
to the probe() function instead of working around invalid values here.

regards,
dan carpenter

