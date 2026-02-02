Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A6F3502B3
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023042; cv=none; b=irYmxon5f4Jq6i3yiFMoK/TOyex71URK6yrgNsm617dgKBZIyLwrXHI2DC3lQM99w1h7ZzctS+m17mBagCSrGQXu92XSZvYoX3G3tnr1fcQ2PYhzPDItpc+g8qrgiMcSVqmDZMye6Uh518CHkig0Ha6SyY3PEJHfzkHdbyiWLOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023042; c=relaxed/simple;
	bh=jDKSJSF9/oechGiOGtaqDX1j6Tao8GqPkC6BaMo3iS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIRBY38OMM5vg3fW6VD6Hf1JuvG+c7yCFJQaZB9Ee/iuEEw5tBPI4q6OTZnqvune0UIY1NWUr/y3mLIHlqU8cSRwSCTdPRp9vvkOm7r/AsUHubCB/GZ7bLtSFRjzyM4qlVuF04SMfyTwY7AyKuRUy4pNrJkFrnZs23MaDm+BP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxJ1u4Tk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxJ1u4Tk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2198981f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 01:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770023039; x=1770627839; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RrIc2TAtNpNyr4ETSBvv89e2CI1YN9c4ahAZ1ROo12c=;
        b=nxJ1u4TkTJvMVDTjwowo4RTtBFJK3lfnD11FbSdjGpqRR8gDaqRJENTj6t6tDpoQoV
         uQ57N25ZhEIs7gtTbGbw/dAEwoInjcMMSMbugAYLc+HVyECuZj+V0G/gFXFEh2iPMQRf
         3SvWDL5Ci2Nvq5/trNfCEsNbnYVA3ODtl0LPkZMP6Ox47jajQJScsw7W7CvnYz4mOlOq
         LnvMBKSwrrLc0P76jSGj8xGIvwcxpHHvYg7cVCMHJadCveXw9eOxN4jx4OYPjRPM9rEu
         CO9RZ4oH4dOPvpZTFAM02+C0rW0kUeykhxiDsZSdurWlaW2Us6NTJyxzqXKqV03YtVBX
         OVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023039; x=1770627839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrIc2TAtNpNyr4ETSBvv89e2CI1YN9c4ahAZ1ROo12c=;
        b=ZG2GF06vZvzqFQrcof2u5FBpnuvtP70LzYgkJ1kLPsoUG+QpcAO7ITeGYIaO5Lit6E
         wYJfaV3D5leI2T+OUVJ8aMio7TMWFNFaWbj6TkhnQyYVCMmTaMjyrUY4fsj85wVqR0aW
         Q01nOvBOkUV9U+YAi4eE/FK72ZRy2y9Pf4a/A57qgUVHTLFWmHzk2t7av/DCvb19TRhO
         U4hbponSgW8FNKmSioZJRUd0bdTLHXKUrvoNWE2szNqNJIuVbxsx92a7g3QFTxodosJT
         DZ0Ai0rLSOdzJjcqLsDnfuqS8uzp/9FbKRByz5parJ4anoPJyEK/C25Q6gLt2x5Uq5e7
         +Flw==
X-Forwarded-Encrypted: i=1; AJvYcCWtgsfhsOgcM2GqN/J+DQDaO1CHMPzGuopbylK4/SAnFdgjmPagvg/yLdflC0+/OVQeg7TK2GQ3U3sgxi8V@lists.linux.dev
X-Gm-Message-State: AOJu0YzCHFcerTvPlh3nK5ie0jxoTSti6RkP45l5w+JphpPCfhnoDO0y
	41OQPcEPuffaAgQXkIuppUiOYn+wqVkGbaR14Jve6xgJYHbq1xgAkkpa/mCw1AH9JFbdYyfHB7g
	o3eOG
X-Gm-Gg: AZuq6aI3g6YIxpnJ8pL/xAayzAMdeqvFxLjm7MOVwtisFL2wtrlD1nSKzlGRwQHT/Xd
	exNHiVSAolq3cgbgtu3UPpcZw8wLa78XeR8vHV6gN1b13UjVsXobwc3TSpN7FmU0JgbhMhx0ea/
	w0i6XSqQEES2O4HP0PGa7uIBu8WUshEsh56QHLeRu8yYbdh+0fUYXR0CHlxdjtYN4ecmlaWK3Yv
	SW/c0EE3BDxC9KDZgvlsUmpk3dnFktujtDPhfTCahcIp3P+ofDu9PEPurv7GIE7fWQCI6z+YpLG
	yyETCqh9snYjLRA0gEJ/5HrcE/dOvNV7wvx1kxlZSa7b+sgU8Nt2rFTXH7SszQDTQy5naR0HzXe
	+hYeiEoTYqZ+rNSj7U4FKtk5bvZLP7+0mBcejBMdNSasWS1DCyaLF3xQ0PetOBUdicT30vpVXDn
	HiGmVxd21QJmEBeTFV
X-Received: by 2002:a05:6000:230e:b0:435:91b8:e01b with SMTP id ffacd0b85a97d-435f3aafcebmr14978171f8f.45.1770023039510;
        Mon, 02 Feb 2026 01:03:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322dc7sm43062271f8f.37.2026.02.02.01.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:03:59 -0800 (PST)
Date: Mon, 2 Feb 2026 12:03:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor ODM_SetIQCbyRFpath to
 reduce duplication
Message-ID: <aYBoe8HGZnp5YbQ5@stanley.mountain>
References: <aX9UxRK_iYwxhTAm@BERA.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aX9UxRK_iYwxhTAm@BERA.localdomain>

On Sun, Feb 01, 2026 at 04:27:33PM +0300, Bera Yüzlü wrote:
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 34692cca33f5..bd535f774852 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -1074,10 +1074,17 @@ static void _PHY_PathBFillIQKMatrix8723B(
>  /*  */
>  /*  MP Already declare in odm.c */
>  
> +/* Helper */
   ^^^^^^^^^^^^

Is this an AI patch?  I really am starting to despise AI.

> +static inline void set_iqc(struct dm_odm_t *Odm, u32 *table)
> +{
> +	PHY_SetBBReg(Odm->Adapter, table[KEY], bMaskDWord, table[VAL]);
> +}
> +
>  void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  {
>  
>  	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
> +	u8 path;
>  
>  	if (
>  		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
> @@ -1085,23 +1092,15 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  		(pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
>  		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
>  	) {
> -		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
> -			/* S0 TX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
> -			/* S0 RX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
> -		} else {
> -			/* S1 TX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
> -			/* S1 RX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
> -		}
> +		path = RFpath ? PATH_S0 : PATH_S1; /* S1: RFpath = 0, S0:RFpath = 1 */
                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This comment came from the original code but it's junk.  I guess the
comment is trying to explain that S0 is one and s1 is zero?  Ugh...
Why?  Anyway, just delete the comment because it's useless.

regards,
dan carpenter

> +
> +		/* TX IQC */
> +		set_iqc(pDM_Odm, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94]);
> +		set_iqc(pDM_Odm, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80]);
> +		set_iqc(pDM_Odm, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C]);
> +		/* RX IQC */
> +		set_iqc(pDM_Odm, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14]);
> +		set_iqc(pDM_Odm, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0]);
>  	}
>  }
>  
> -- 
> 2.43.0
> 
