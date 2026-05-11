Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F622BD0B
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 04:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778472431; cv=none; b=rdRxfB9aaBDKhWYPysxr3hcFTpNnbLss3SeONDSbaAe0pZTpIK2EvaCmMguVKLJjT1lL5Q+6DqqBAQaLPjZkb5EhpEr3OVUkOc1xzPCjtG7XCvPCv0siPIBZ4fGfk4rWsLONBW1UQQhAhMOnPkoeqL4/t23DNxSbTzdhlFLuN64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778472431; c=relaxed/simple;
	bh=i1rP+FZZPwSEF5T7UVzbLbhh62blVVlOBii9fHYEGyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jInkrdKycYvIr7VnrD/2/bKWx7s+jHiTGYksmPzVVvmQAbSqFAkERw5S7XrSD0k1bgCuAKdyZz400Mw8JRg8Ie0JuWLehZWYQtyr54zuBLYcRZZz92Sj0QyWfIfKtcPM1pMYnwe+d5ZCOlayWKNynPl9jgwZ/f59k842+wDHqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzxBL208; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzxBL208"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3942e9977a5so179821fa.1
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 21:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778472428; x=1779077228; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kIbTjErlGtu4uS6ryfUis5WwEecmHE9wGTDbQxorKqk=;
        b=IzxBL208HRPkC6mcYsai4hbicIR5/ofaIUv+z+gXOqDwgbWHZx/UN8cHGUfE+jFLPy
         Xb6Ses37Qtqnj/VqTq7tGXz+R7mxpbZ+t+gyKKnjHMRZwPSsuJUowWvgw4qNwo8zFeYb
         Y1woeMP/2ZKM6V+HpeiHDm+vyvDsibUvlkUqOdiJV330GonFCn2FlZMFyIM2RQ9rpTsB
         ViYbVGwuJC6nu80fA+S47VHSpFfWSXz6pq9iugIAyEPLIzMw1pDFxS9ymKuWvDyYyaIO
         qKNeJ58sqtyP7RmzjtXgm8573KDCVIKHS+Glp56KG0rC9jmqfeV7ipAEdzh/RzFjePCd
         MQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778472428; x=1779077228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIbTjErlGtu4uS6ryfUis5WwEecmHE9wGTDbQxorKqk=;
        b=NbsajuLQz5n9jgurR7n5Fppvn9ZsaKmsC/X6JFRsrAjVvNg50DQ4xB7Yelc15mly+O
         ZJ+0tHGEa8ChPn8BUTjaqgdiamWKwfr99lnclt2l6aWlZldrkY5TSY5/l05BqKxnIlcH
         JUJ11Xi0IOu9ih0Y8gzWxLzabIQ4MbNoiDK5RbpDK8sDYCEmhm6W4iwhcXpBghWtkeef
         JgtDJC7THI/FMMNqKuXgyFwW8kyJkgOpUMEY5cG81VQghgVm25ogbMiXOn7MLdJKOfyD
         KqVLDpdwnL7ZrFXJ8gptTWixG1JoTY+6fho7RqFORs39Fweer8daMB16h67FwQ0IvAHb
         ATng==
X-Forwarded-Encrypted: i=1; AFNElJ88ee4UxXCgIPi5FN/JGFWeAiB+XIwSXoMGs/jl7Qa4+5rSFbS7BTqbKPYxTreyEgLsDiKFt+qdHTHnCSOw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr4vdw0gbkLEDRjXhqLVUokayMRLSfn+lJOTn/+NfkJphNIfdP
	UJ3B0/P+Uma+utu3/CGwI4PO217SsDkW7ojCRGNgMn72O6/BRcJx27Sq
X-Gm-Gg: Acq92OFrhmjRdwimI+vihtqeJvPQu1ZTnFTyRLhgPxeE0cCmEMSCYwiGgHJyoBghjp3
	zxdbYssQV2AoDv93LFF/tgTRDQpz5pAIRclG0b3W394yU7kQ8Fq05YwOkEvvWTKZum94VA8uQRG
	svP/ZsASrT5NYhBnE4LHsAv3EB55Nu8PpRjSknTcCB1c+MwiKDfTxiIFFzbRSdfnSgIgvBfmA1s
	wGIUa71TjnDNdYponvKoir8ezTmAMTSS2iT4fYpwALsGHebxkEmFCymxEgPoYGVvymtztJs0x8d
	VsgvfSqGEvecYncaKDg+lrSuBddSC3wmHbDtiWiQQaS8gxTckVcgzD0HyRa9v1jJISdSy+Zr40b
	GtC8w5vAjH0vogDv+TOrKBdX82I6k+dKA/opAU2nkgQ1uOPij49MITpaeliQvbnzW6cYTJISC/j
	pjEBkeEqkwdRzN34BC8+h23tziMzTApg3ev8k=
X-Received: by 2002:a05:6512:2246:b0:5a8:8818:819c with SMTP id 2adb3069b0e04-5a899bc6e0bmr5385367e87.16.1778472427927;
        Sun, 10 May 2026 21:07:07 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95661e0sm2298690e87.67.2026.05.10.21.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:07:07 -0700 (PDT)
Date: Mon, 11 May 2026 07:07:04 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 8/9] staging: rtl8723bs: remove commented out code in
 rtw_mlme_ext.c
Message-ID: <agFV6Bpe_HyxC4qG@archlinux>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
 <20260510134315.64295-9-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510134315.64295-9-khomenkov@mailbox.org>

On Sun, May 10, 2026 at 04:43:14PM +0300, Andrei Khomenkov wrote:
> Remove commented out code in the site_survey function as it is not used.
				   ^^^^^^^^^^^
It is better to indicate function names with brackets: site_survey().

> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index c966527c0ca5..7ac23ccb39f7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -3741,10 +3741,6 @@ void site_survey(struct adapter *padapter)
>  	}
>  
>  	if (survey_channel != 0) {
> -		/* PAUSE 4-AC Queue when site_survey */
> -		/* rtw_hal_get_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
> -		/* val8 |= 0x0f; */
> -		/* rtw_hal_set_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
>  		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
>  				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
>  		} else {
> -- 
> 2.47.3
> 
