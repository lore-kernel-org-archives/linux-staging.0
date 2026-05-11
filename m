Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC42D97B8
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480758; cv=none; b=d/LtUHIm7VFE2F8sUNKZp8GWbxdFSI/HrSBxQSI138AAMvJzG++l10PPbHF+nuElKl8EeK3p6Pl44odfkTPF6lKn3atbl00fzFOggDhvKyOqa5QaX1XGeK8YLWaNczMkgoNq/hiq4wnM6jmendHHPwfgF35GzLzward3VLsOdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480758; c=relaxed/simple;
	bh=K3PKz3PNnAlrvaVnyzIDAvi3nEtmGTO08GKMjjadSis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2GIHj/rYQLvaJF6NXIHcoq8RgskIl/pQBHL/eyj0AHHM+kAc6LMXZENHMyXbhrm35GFiPcrFHy0BnhYtzoARXWKNQj6LBypcO5lE9sCldBU4oZXhWb5/RTeTDcIFAYyk99UUXh0GbEAWJ0CTFgelgR3i98zMDSjZCIei9dKn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EP1w9zE1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EP1w9zE1"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4205783e87.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 23:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778480755; x=1779085555; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fffpl262R++oeuKMn20PIE/OHZwBhViyPAtPu+ftHVI=;
        b=EP1w9zE1LkwUVlDi9FDB/a8m9gwNEnZblsvkA8OgcXDVkKD4+gvxqosq/W2brtbOZr
         frTo3llBq7bfHb1adzwTtlRliGSkTmYcbir/K1ZtRZ9OkH94XgasBoLc9ybMx6F5vDBz
         ivofTgq41K6ai/DDXWIh2qsd9O/VF0t2nyg5n8Wz7Di85O/NNKW5q2ZbnIFr5w3oJiq2
         3jSKZb+2lNADC/OwePfofQM115qVp1usMaGm0lWi131KUZk2Q8DXLgvn1Up4tpEFbPO+
         pYHZ2FN4nsHEAyLRbNiTZV14Fb70qzcYP29F+jgZOX9MzB4FxZpQYBRraPQohAujnkwQ
         5eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480755; x=1779085555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fffpl262R++oeuKMn20PIE/OHZwBhViyPAtPu+ftHVI=;
        b=PDhBMnBjsvOdiuEHlIRF3XPkFF8eVfvUudZrt0AwT8KXDtP9L0nv4V3XJcaSKh+deC
         Ko6yoLbPZtlChvdonSL4QuqqJoHjIOPB9dL4ES+UukDxSuzMBAVzwsZD/wAEn34CUdaJ
         3WOKOKe/RTVCSyFChNFUNZx9ykgJDqdNUqrHpTN437nhtK4X0xphy4O9i665H5ShCgJ/
         Din9U47yvwn8HWQvgFyJJKDCQwrOBA0FTLefCWAN5goaCeL5pydKZT+/iSta+CIBLkWo
         SWfIIEeY2KgTQi64PFQ7f1HSyzg5De9ZHgf5m135ZNXFSs53ZXUGazVAatuxgngBfFzu
         ZPeQ==
X-Forwarded-Encrypted: i=1; AFNElJ828Od15l2dmZV7UzOJ3vt6ShnRUpZpucDWJEh6PS2dKoQAy7hobQEdK6EI8fwRFV7OFd4+hi1hWmO7KwMQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwabPmDBzl5EYBN8rSOm6IRkus4Y0Q6RCw0vwTUcXiOGMmUJRDk
	iXrv4HS4GwYEf2a/sVRUCqY8GzDQWpgKMlPzW5cmLYyp0JXiEDG2T/6e
X-Gm-Gg: Acq92OERFgP8eFGTAb7XBk1ZehdOV46Fm9aGiCdEMc6pR9GoginKXHkIBlbG+M28qIn
	xVRiluUvN9lbOFjC8nM947+RsB8IoyfkKqlEV2PTGRWQexCT/bu3kA4jGS0ctHEarYKVQgfqCXJ
	mWRttoVpm1vNm7EIN1qFzxuMu1YNeEUQm256YSmErY5h4dFYpggTC1n142L0D2d3oSwWSfLDeH1
	+EzDMbquTfrPPouaK45ehLVRzC2MYYyOislrv2Acqiabmm9Wakuq3yDm+FUg3+vrPEPU5PGa0BX
	y5QPx8+VbyqXtAJ+rY1+73jNroFyY+gBzHn1rcQ+qrvOWITK/3IKK8D3ZGirK2t91ALLNvCCfst
	s/QYSFFfKzG2zDoGZFNc2B/5Eu/Jdw21qvAf6SEBdnMO5aPnbL1FRc69tjJHdWP4j5YB28qDf4k
	JKpu83QlGaa2NTLVX5gy0Cn3l6
X-Received: by 2002:a05:6512:10c9:b0:5a8:9909:50b4 with SMTP id 2adb3069b0e04-5a8b708e8d3mr2295577e87.21.1778480754589;
        Sun, 10 May 2026 23:25:54 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e140sm2444883e87.48.2026.05.10.23.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:25:54 -0700 (PDT)
Date: Mon, 11 May 2026 09:25:50 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Michael =?utf-8?Q?Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix type issue in
 DYNAMIC_BB_DYNAMIC_TXPWR
Message-ID: <agF2bhgQxkoQRR78@archlinux>
References: <20260511044029.14839-1-m.steinmoetzger@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511044029.14839-1-m.steinmoetzger@gmail.com>

On Mon, May 11, 2026 at 06:40:29AM +0200, Michael Steinmötzger wrote:
> Add explicit cast to fix -Werror=overflow warning for BIT(2) usage
> in DYNAMIC_BB_DYNAMIC_TXPWR
> 
> Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>
> Signed-off-by: Michael Steinmötzger <m.steinmoetzger@gmail.com>

This does not apply to staging-next.


It's better to do this in a series of two patches, where in the first,
replace BIT2 with BIT(2) and add a type cast, like here:

> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index d837738b9f40..943e199ede82 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -1476,13 +1476,13 @@ void update_IOT_info(struct adapter *padapter)
>  		pmlmeinfo->turboMode_cts2self = 0;
>  		pmlmeinfo->turboMode_rtsen = 1;
>  		/* disable high power */
> -		Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
> +		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
>  		break;
>  	case HT_IOT_PEER_REALTEK:
>  		/* rtw_write16(padapter, 0x4cc, 0xffff); */
>  		/* rtw_write16(padapter, 0x546, 0x01c0); */
>  		/* disable high power */
> -		Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
> +		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
>  		break;
>  	default:
>  		pmlmeinfo->turboMode_cts2self = 0;
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> index a4770f5eb75c..f832d77d7156 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> @@ -28,7 +28,7 @@
>  /*  ====== ODM_ABILITY_E ======== */
>  /*  BB ODM section BIT 0-15 */
>  #define DYNAMIC_BB_DIG				BIT(0) /* ODM_BB_DIG */
> -#define DYNAMIC_BB_DYNAMIC_TXPWR	BIT2 /* ODM_BB_DYNAMIC_TXPWR */
> +#define DYNAMIC_BB_DYNAMIC_TXPWR	BIT(2) /* ODM_BB_DYNAMIC_TXPWR */
>  #define DYNAMIC_BB_ANT_DIV			BIT(6) /* ODM_BB_ANT_DIV */
>  
>  /*  RF ODM section BIT 24-31 */
> -- 
> 2.54.0
> 

And in the second, remove the BIT2 macro and all the othere, like in v1:
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index bd72edcb4259..2f5011a8210c 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -14,7 +14,6 @@
>  
>  #include <osdep_service_linux.h>
>  
> -#define BIT2	0x00000004
>  
>  extern int RTW_STATUS_CODE(int error_code);
>  


Thanks,
Nikolay
