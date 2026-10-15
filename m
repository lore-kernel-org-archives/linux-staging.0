Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F85F51C048
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065468; cv=none; b=V2Qm8TtjqoQBcngYHyXSYw3SvXKqvsk3lYZoWDxE52CdwXatdwbQBPBTsfv1rpi3tdXp0UQMBz41EAuDE9HwHZKr3wewLzizzG0CNkbspO1HknKuyy6IYvXD2NSX7lKtLMWVIHPmW9ZXK+j7cMXCqZDtjAlxEPPy+XJvS5t2e+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065468; c=relaxed/simple;
	bh=VGToypjARbE0U7psVsR+le/XXqP1p7U8tiE+d5jRnpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC5Q53tfPgmkMsV09kr4QVf1cvba/yMKFFXtg3CsvbudhoqOrC/p4c4Ur2wtXZfB2t+WifHv15dhSjAA82+xq24rtQwKys9LyEtaIoPzUVikjej60f1TGvqFpmeniIwXkC9uT4RjRhehP/MGlEhz8uP7nK106WaBb8eZhbzO2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEm8kuuI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEm8kuuI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so42521395e9.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065465; x=1792670265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sdIV0UTb1SAAI8e5ZPa5eDGFk/H/3IVRF9TyC1rxg8=;
        b=bEm8kuuIJT+4KB6Fj3fjhH24dQqjTdsH7fZMY/Hmp4xtOoFWO4oNcCIL+WRsCrS5Fm
         SLFMFnB/fIQ8/SP46XBh+ErgKdFSGl0XAOQIFANO2QHsLgub1grCtlLLwv8RB3HS+LUQ
         mE30tKeVVTqDoAn6jeCvj/KSkboQlErz+KMn1FsxQW61cFENbJCaGuNxaP4tInbd3TI2
         UOHwmGBRjI4yRDZOD9sGD4ghkVKRMUckmPy+eWR6Ih6IY/rJLNw8WsVn7ru4LbrSp81Y
         D6H5SkwaLqgec431v03wfA7RNVZq/PvdbHe2RgD/14Uok2ioZzO5PQnDO7ltkP+b+1+3
         UoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065465; x=1792670265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sdIV0UTb1SAAI8e5ZPa5eDGFk/H/3IVRF9TyC1rxg8=;
        b=rC3pjQzigxNDGdYs0TUGhh2UdjAqcDoOfU1T1BKVmKBoeAZUybCjkMLG0cah8X7reC
         /TNkzVHe5xzHKEyrpZ1QChC8YhYAydHeJKo/M2tLCuqOwjYmzwAugWT50RmX42zToelO
         AZnT6C93WEq1tdu4GkoT7AiDTqqTJEFSRy10l/KdkypKEonv3AbFJvxCt3NYiERjMOZg
         z+HbzDeaTZ4pZmc/wlwwYk0REH9j5BCJbpzdJgzG5z0rZ3YexfeNi2tTNu/cUkXBZ8kc
         QrzfSmI8Cm+ZXOcWfaLOJWh2nosvaqGW5Ty7/ch/zPxEbIYvBBlUKuBy4z1ZKfag2D94
         SSig==
X-Forwarded-Encrypted: i=1; AKwUvBxY4kY0dEe0CvmPTI/fUSgRpn/tg1JM2BEdXmhjvl+3cimXoozdguudIIfc8iAKu1qjl3SB9I4cGzEgwOE0@lists.linux.dev
X-Gm-Message-State: AFq9FYJEUfET75aDH1vtOOQvPb/Lrp6bB6tKzsUINdCHQ4aM7broi+FN
	KTJhPeNMOpLGMuQ/MY6tvmzF38g++1bM24QYbD3NkVQ8z3zAoSU462FV
X-Gm-Gg: AYBFou0DmaFN5eJ+YmbM4BDONNgLbqnZKxAJSoGSd7Qs2J7SIKIZ+uMABuF2cTuP5fI
	LL2uRqZ3p0lRAztxskJAY6rJgtZGJPdkyyh2H6Rehno6kRnGgagtpqQchnLzoRwPFfiC88n+OP5
	7y18KMor2/RfP4ILf71DSpZTKJbQCfMvpet7ATzqBNvfTg191OLmqtEP8iL+SqunHCpkDIKLgAa
	QGfbjtYn6K6tmX07vk467odHquft4+0WVFpvwwR8pta5F55saeZ+mtLcvtzqI3YOHng95NAGPLu
	wxabH2zggyVN95R6GdaOKT1TWZI+QTkD3UhatwNBFzVF4qBAkv1mwdcvdh/hYNXRMZ+5n/bT2Xi
	Jyw2JbWbWWNpLniAL5S0t066mibppvYny6jvjYU9Jx9XrdyMKAbsTP7seoL1UX31bbQjUr2+2Gu
	IUfZVBDHCO7POFOefE51P+lXYhAJybGpF5KbPGuurYHBftz3VCGn3F4p5v9+w1zk9z69Q=
X-Received: by 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr379768385e9.0.1792065464664;
        Thu, 15 Oct 2026 04:57:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm14406930f8f.29.2026.10.15.04.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:57:43 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:57:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohammed Sohail <mohd.sohail.biz@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true/false in
 rtw_mlme_ext.c
Message-ID: <atC_s6Us6nk3hRaC@stanley.mountain>
References: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>

On Wed, Oct 07, 2026 at 09:51:14PM +0530, Mohammed Sohail wrote:
> @@ -3868,7 +3868,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
>  	bssid->configuration.atim_window = 0;
>  
>  	/* 20/40 BSS Coexistence check */
> -	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
> +	if ((pregistrypriv->wifi_spec == 1) && (!pmlmeinfo->bwmode_updated)) {

Get rid of the extra parentheses around (!pmlmeinfo->bwmode_updated).

regards,
dan carpenter

