Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C43016E5
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002632; cv=none; b=XR0rZBhNuWc21rQN/S06Ndg3NGgJEGmISYGlZAjrTm+XRwHE3Xu3oXvpGT70ijsqFS5pR//m02XCSDMbL3SjgNTadNEUIRvxbctrj+2fCW0ZhVrbhP3O7d2G5oeGprERpx5XhsD5KjxTNwKYlQNShA+HB+BYM4RiVQxrFcqRU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002632; c=relaxed/simple;
	bh=wHtx8dr7eJMKt1iFUOWMWmGCOWIph+PlhMwFkkxjvIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx0N28ckP0I0qXuBpTUG5pZWTrAfnBB52yCp6iumsbTicUKxLsiiB7qM5SVKQ7V48yhwlhUA4m2zX/Eum3xG793LyV9IQHJgMk7d5T6nqN+XUWY3CQXDAwfHUC2xQ2NPjmjfcuOwGm2uFvGIHg/ikCwjCUKZ4f7LQN3Whmo973w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWnBhrTM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWnBhrTM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48375f10628so40531955e9.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 22:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002629; x=1772607429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNVaLfglGOteoUVIsD34z2+yUS5Wq8z1t7Ac1ijBd7s=;
        b=yWnBhrTMhRUIsyCQIINGmSBSPf0t0FuQtSPksbkkRep2N5GCZyE9KxL38kuC/nT9Kl
         ExxfhcfpTwbT3dV0J0RWmun3zy37PBc29tdUjiITTa/geDVJZs9QgRXMkz4pzC5NbPrd
         GkuAO+rL8LO6mcDXMdY2LM3m8ZxY9ifKxQAvXHde7NAYUOu2LJLKmnYFPb7PWQX2JrO4
         XpZCNe4MZgNUEnB/hiwsp8AbRMv/cV7dNuktXDjo1+zrn2DUs1wYJLFy3B77I3In8vks
         vB1cfbUJl3FG/eE+mTZkMr1jNKYvXbQlPi3Th4RID5+L/BhV5Mxk6wJpNXBeqSmZnKni
         ulqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002629; x=1772607429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNVaLfglGOteoUVIsD34z2+yUS5Wq8z1t7Ac1ijBd7s=;
        b=a/gEAUfWR2g9fRDepsYkT+XBxOSJmW0PwPW8rttS5HNY66peu/NNXFcu9EW0Df6EP/
         GUo0K6UzyZnxIkbaNOg3ZYi4iLMckPYawLfhg4gPsBvamwtaWuY+rXBIgWf4qcVvwV7f
         fxXuMME1ezWtsrC1pcHT6ajBe5jRdTvMXHecjWZgzXwxGe2P9tC/TfK9bGjqJyiMM9sr
         3N6J9EvHJXEj8g/bpGBexdEWAaFFmAK1wDz8je8xTSAyd0G6c2mB6hq2lNir8M1Ozqej
         bHI0oXQOkPCuWMtW/Y17t6/xGXRDRx0eTO/xFHPEsU7v15ITFA3ot5bw836/lDWPB0P1
         /mOg==
X-Forwarded-Encrypted: i=1; AJvYcCVxdFvNqQnQRmwz7s6ELqigPfxodGrFAExYugNTKF6LQBHhvZjZQRprBqPlYO+GGvu257rR8E0oighnuK6K@lists.linux.dev
X-Gm-Message-State: AOJu0YyfG/4tI5B9MKsqdIZkvV0l/zBmhFkFbcLJMqBpoREclrBGh+bh
	SFOOllgOfVyX+NXpv24agRTSrwYDq4uXTsNh9tSSqTQvaKGXkhgiQsdtEGC0nj6Zzos=
X-Gm-Gg: ATEYQzxEVI7Gz2ZmZyYmju4qA7IxciUJl+08IktqJg6z5jQwTYJ6lwn23vhuN324Eo3
	R5qE6Q1ntZrN9bmulVaGv5ziL65SrcXhRFC7Lvgq4CFFRoxIaZmQXY7ZGjzxyfwsu5HEwNxIRiB
	uHC3+/myfLN9nhkfqzddqXx7TXU20DjhFmmeJHQF9JdV5+NjkHEu//q75FsIW453xLA8YinH8I6
	HBFJqhmg8OvesGaPHoVWFZS5/6qXjfiYnu/YWcvHCxgsXyTkcy1zXiVkVOzVFFn6RttDPBABzR3
	rWB7RwKDtWxh6D3CUUspqmzjKV0W9jkhrEd45KqMDLEgqriBULa+Zr6HwXnVtjmy2rBF2O+M1Sz
	vAkljJywpwOTEKyK/rMWEiy11+7MKb4SMePFO5OnMggp6vHIlBzBryBvEPFS0BcuB9AzpJG/Tf1
	VjEaGt/gPuxtdPUgmR4roUorTC/BbSYSlv6W7+f2I=
X-Received: by 2002:a05:600c:450c:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-483b80c9ea4mr105872775e9.31.1772002629251;
        Tue, 24 Feb 2026 22:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm8367515e9.2.2026.02.24.22.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:57:08 -0800 (PST)
Date: Wed, 25 Feb 2026 09:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/21] staging: rtl8723bs: hal: fix line lengths in
 HalPhyRf_8723B.c
Message-ID: <aZ6dQfI56LY2yCXf@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-10-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-10-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:36PM +0100, luka.gejak@linux.dev wrote:
> @@ -1060,12 +1074,15 @@ static void _PHY_PathBFillIQKMatrix8723B(
>  		reg = result[final_candidate][7] & 0x3F;
>  		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, 0xFC00, reg);
>  		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
> -		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
> +		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =
> +			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
>  
>  		reg = (result[final_candidate][7] >> 6) & 0xF;
>  /* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
>  		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
> -		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
> +		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28) |
> +			(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord) &
> +			 0x0fffffff);
>  	}

You can introduce a lot of line breaks in one patch.  Good.  Fine.


>  }
>  
> @@ -1078,7 +1095,6 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  {
>  
>  	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
> -	u8 path;
>  
>  	if (
>  		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
> @@ -1086,18 +1102,31 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  		(pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
>  		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
>  	) {
> -		if (RFpath)
> -			path = PATH_S0;
> -		else
> -			path = PATH_S1;
> -
> -		/* TX IQC */
> -		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94][VAL]);
> -		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80][VAL]);
> -		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C][VAL]);
> -		/* RX IQC */
> -		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14][VAL]);
> -		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0][VAL]);
> +		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
> +			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S0];
> +			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S0];
> +			struct adapter *a = pDM_Odm->Adapter;
> +
> +			/* S0 TX IQC */
> +			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
> +			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
> +			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
> +			/* S0 RX IQC */
> +			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
> +			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
> +		} else {
> +			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S1];
> +			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S1];
> +			struct adapter *a = pDM_Odm->Adapter;
> +
> +			/* S1 TX IQC */
> +			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
> +			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
> +			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
> +			/* S1 RX IQC */
> +			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
> +			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
> +		}

But when we start re-writing the code, then I want that separated into a
different patch.  It requires more thought to review this.

regards,
dan carpenter



