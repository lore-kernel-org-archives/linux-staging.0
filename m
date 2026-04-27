Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5E2FFDE1
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283565; cv=none; b=e7tcYkrGv/3NZiWAlObixdg6ZuNPRP8sneoAE3mLqcwZ64uXFRveM/2FvZi4LRM8NrOd4KyponvAjKJZas2qxPg685qab5w+E+OxIr37MBcdSCQxWvQW7jJSobjCLhC4iY6E0q68AvE+lJpdu2Fo40KOvyqhboR6qR7hqE9VQZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283565; c=relaxed/simple;
	bh=CIKhi/2IEzLP8lSIzZL1YDfkyxKxCVMJ9EITL3U9Ih0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg2iHSaZUy4XyWWn9bPf0Syn91ZurysSGOSwIjQLhD3ix2IffIllScnuEw36cMIXaBjn+ZaZhDu9DwFo+dtjnFEszm2p4FxMyRsSGauW+U1FLOTk6g1zD0SF07X2QyZ3cqtbO/wBo/1Po0/bM+K8kBjWsptbkZXQ7lLz55Gbzvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnKmzvez; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnKmzvez"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488d2079582so118409735e9.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777283562; x=1777888362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nm0Ing+1GvCUvgF+bOXwVMzWAbFz826e9x4+VWhyQts=;
        b=BnKmzvezrsC/6886zhrQ5rYmmfuWWCrZWz46MJjLHKAGVdriOZ5WMvYBsstvzFbKiP
         SyK1Q2vq9gZGM8rvwiWI2fXK0NP53cSdFYyPvbPVdTtju2fmk6s0XOr8xlw6mMw4uAMd
         56CFQbU9lhvjvt191OWrXi3ixYdTRVJOPGE/7Ez4rY70v8GEP74Whv+NM7dQzH9ilVIb
         7Nk/nZndsLxRl94UOB7/lvkqQhjfN8viFe8PZb6IcZ4Xuy0Drqi3T9YQ1IyBW+fxV/GR
         SBh9wckmE80r8t9GRRjZOfLuXd6QTQUudNwOD+7jP7aq5VvV6FydFa4nU2BVw1aI2+nC
         m6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777283562; x=1777888362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nm0Ing+1GvCUvgF+bOXwVMzWAbFz826e9x4+VWhyQts=;
        b=P2DF2MqYRItUdsdkDtEkotGzkvj7dL+B9mGyCJu9XxS+c6yNl2AOGx38PChoYKwq+0
         VD0mWHlTf/cjzAHMofhW/kONdk5u05gRfjEbw1286cnAwi4dOIvEMaiT5VAMf6rhmXfe
         NBnOLg//x5co0Rsg8/tGZ5bAxB9lGEOYQYeg5LfMhvINsyfB87E2jUGWJ+XZss7yM1xL
         PnTZHyPEwEY5QDXs3jdF5aZhqOCgxK4ctpoRreO84mack508+wHAf6wNE1gC95PloYxk
         InG+JDO2FHohxJb88EYMLSDLN+CmBUwwOQI8eiUSxrPb+GhKdV2XTG1SB32hgMER7Sgc
         D6CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KWgLIhJQpmmiTC8PibnCkBYOtwWtyngiKS+Yeqjav6mi/17SvnAYO0dFAHtTxjMDU9BCp/6BKUq/hGrDY@lists.linux.dev
X-Gm-Message-State: AOJu0YymRRPL7nVIU1jECqmnaxzVvb8CMAbbx1W5+AFKwFZcCAlZ8cjs
	y2VaqvvTpwtht/mZyuoDZIX1Hlj5SDB0GJpgebCP9Lm6JpulhSAbA6RJ
X-Gm-Gg: AeBDiesMoxQCHW87cVWBJnnH+2DfovvXS6FvP39oPzB6emoUDgD7wCKkj5UHbzDviVZ
	gcm8QQW9bvJKSt+Wj6ZaqkTiWLLXvxuHA7Cu/aPOCurDc6zdNdCv89RtcPzlgcIsyO/FfJIZJDs
	tdsjrbQwQ4ZhMkWpIeiHINiXQEamLbS4z55R2wr+k5ZAetVisu7bNX+bA4gRxslgoc5FZ8GgxB5
	aFi8N27tO8Q9dhb5R0jqg71oEVJhnksP5/t+sJszT2DHq0TmWuGdS5WN1n6uadnrk8xTTs3Arhk
	VkzLl0sSmXGqsUwo71qONzuwceI7lXCLiDTK3mbAEugBIvo9mKDWyaX6kMtIEJzawpRiodNJLGD
	QVL3dC5zF4fVW9z2eMpewU0ou2lr7fgUZMruouYSdOPs6aFxiADcd33e4ghDBjSkj4vZ54PdzoI
	pOZat6WzbTIZPhuH4MKUg7ih1PcFoG/Vs6bCVEpSzg
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488fb73aa3bmr608769725e9.3.1777283562218;
        Mon, 27 Apr 2026 02:52:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a682588f8sm168674255e9.10.2026.04.27.02.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:52:41 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:52:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Seonbin Yoon <seonbin.yoon0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix CamelCase variable name
 pHT_info_ie
Message-ID: <ae8x5glEKN_3Pnfl@stanley.mountain>
References: <20260427091833.30839-1-seonbin.yoon0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427091833.30839-1-seonbin.yoon0@gmail.com>

On Mon, Apr 27, 2026 at 06:18:33PM +0900, Seonbin Yoon wrote:
> Rename variable pHT_info_ie to p_ht_info_ie to comply with
> kernel coding style (snake_case).
> 
> Fixes the following checkpatch warning:
> CHECK: Avoid CamelCase: <pHT_info_ie>
> 
> Signed-off-by: Seonbin Yoon <seonbin.yoon0@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 4b4012411011..2116649bab6d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -798,7 +798,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  	int ret = _SUCCESS;
>  	u8 *p;
>  	u8 *ht_caps_ie = NULL;
> -	u8 *pHT_info_ie = NULL;
> +	u8 *p_ht_info_ie = NULL;

p_ stands for pointer.  Get rid of that.  Just call it "ht_info_ie".

regards,
dan carpenter

