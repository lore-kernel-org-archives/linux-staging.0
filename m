Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446A25A34C
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186249; cv=none; b=j/wGKcmQqBtQlo+0qexobp9yFsVRPVrIZmKqdTdUkQtAESjLOejRwgnCoYhVk58Jgdkk0ZDMl+4bPFVPPP0/JTsoc/vop3vgcPWoH7aLLL+uVzGn2nawvEn20x1B7Je5SXJIEnok5E5xO8QVU15Pc36b0wEMVhyfUZYlKg7Md8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186249; c=relaxed/simple;
	bh=m7HqZf0V8MNy+9l62oV2QlWxfw/dk4iRS0qblNkVAtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9xSc2a/kKSQdLqcDKd9BOdcKW+sF+TYjK3xt+g6ufqylwCOP775FEHcwgd66KAC7m4jkFUVaJ842S93aYfgzudbwnMVAiBpy+2iLz5jqKsVgoNUdsOGHL6VMTov71RluDGgof2upd3gtrHDCnDsURdMzQpFyqmsMkKxWFdt3i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkQl//zJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkQl//zJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso41707365e9.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744186246; x=1744791046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWVECAKTru8M/Jr/pSj4ciuYNFjvbasICcKkEjQxNc=;
        b=jkQl//zJc9VGDvFQFAJImP2+556+EOBMV8qmtZeCJjidQME1HIxZztFZtYO4VDNzYH
         DhuzK10T3QI48kVBwADYsXJ/CRr0o7PQI11zjxrtHl2CUfM7HVWGXhyH74/vGkIB01sz
         7pbdm0Imcfps0zWrk+6Zit5cHQCQ+Zu1sxjIZbHoEV3d1F6XN6ewjpMLsWVAO60TsLXB
         UMPAVHjtKdKP5GAPzArx9VI8dQiYXGcjgFIwq2G6q+rF5yzgbAVbn0AEw1IqxjKX0fcT
         Z1KT8R1iJMvC7qv/b5qjb6rCRSKPoR+oBnMSCSta93vg3LmMWL9rcV8SNbTunxgBlssi
         gcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744186246; x=1744791046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWVECAKTru8M/Jr/pSj4ciuYNFjvbasICcKkEjQxNc=;
        b=J6EX8JdbZ6H70IaCSXenp6nJzDVRoFRkRaUeb+YxGdAd/X1Rg7C0qKXq8DoNj0QIXt
         z+gVOFcnqo4k6P/Az0cryabaffoCL+AKw06chWEhBRC/dm792JsPhFwfwdxi4DnZqZTD
         nqT9AXh4r/ZGuXE5nETcA+BHZku4orpCA+UyofQrX5ItWFnSaTRKy4tZe21Mp60Ge06R
         8JpJh+eeC8pYwqnRfl3kTjCup8jxNxxg0MJ7ggOSOaZvGKDiO7HR7obY63isuySUv8+s
         Du9drMG+/LdnPJiqQcUsAWmquKo02r4CMlcaFC0VDC2HztS9p+4c3GcDknM5TOCR6by/
         5tmA==
X-Forwarded-Encrypted: i=1; AJvYcCXLZ0LgUqXLSCaAhwgq93jv8NhaDHN9hlbxwc8LcsPGT3juKHuKhhamhBPa8f5/RBx/80Yo5okbKAtAwUSo@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Cw8c+EsWjZWW8YjyC0b1SFpRiCY5wnHYYWVwGorTLw5bopF5
	4AIDP21irLJ1Nr6eguV77zlpDSU/fOXVr7jXsT6rKZexghht2TLaH5itwfzdkEU=
X-Gm-Gg: ASbGncu7YLkmcP3MEsIMnumogs+b0x+0LUgCtPhBF3IiR8Arg26rl4cbl5H4STHlgqq
	wILhv4uZNRKJNLGd8EWt6L6UH++IPAWNI7wKV7j792sI+/AWmLqVY2bR2JsV0S4lLm/bR/c7qEv
	oPlXYE2SwnNlUq9mnXxKJrA/E5Zh5j0BuRuOz2RvgNJvROsB1Vq+6qjhUAy+P3c2T3XJzVUjiSe
	MVSvmnnedv1SERr/zlpz6eOL5bVpm1lYXtQkKf0HwjdaDlofSmPAoku5PZGBQ5xUwf8pxax8zj1
	LCiwPyZpdfm2/yJFP3KuLtSZsHc21gwSmUkL0rpLYHWT0oqHVFF5YSmX
X-Google-Smtp-Source: AGHT+IGPIwyTg+gXnp6KZZLF9hZJx4uS6CBETehRq3QtuRedcuQkDkBgw1m6+Axba0F6/vbCO/UrRA==
X-Received: by 2002:a05:600c:5024:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43f1ecdacd3mr23817135e9.17.1744186245834;
        Wed, 09 Apr 2025 01:10:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f205ecb20sm11901015e9.3.2025.04.09.01.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:10:45 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:10:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Patch v1 01/21] staging: gpib: Using struct
 gpib_board_type_ioctl
Message-ID: <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>
References: <20250409055903.321438-1-matchstick@neverthere.org>
 <20250409055903.321438-2-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409055903.321438-2-matchstick@neverthere.org>

On Wed, Apr 09, 2025 at 05:58:43AM +0000, Michael Rubin wrote:
> diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
> index 6202865278ea..4ddcbc2a81b0 100644
> --- a/drivers/staging/gpib/uapi/gpib_ioctl.h
> +++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
> @@ -12,9 +12,9 @@
>  
>  #define GPIB_CODE 160
>  
> -typedef struct {
> +struct gpib_board_type_ioctl {
>  	char name[100];
> -} board_type_ioctl_t;
> +};

This breaks user API so now user space can't compile.  I don't think
any of these 21 patches can be applied.

regards,
dan carpenter

