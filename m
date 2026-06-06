Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33751175A7E
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737831; cv=none; b=S6f/jt02KuOaToFYEO+l/3iCq/tXQUeqXzmU3COwdv9ET8P2f54H53M2zlAwAAZ5oKLsoF2Di4N4jUVwPGq9jYvQRIR5fcM08qmQBpvBC/bLiBsRfo0MQn8VXzz87FNxqG7Daj/9qy4CCkjf7XsfMbSpz2Tvp4AtZZ5f4qfOKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737831; c=relaxed/simple;
	bh=BwhE7xdI5+5inoubbMFMEgTrsdY/m7GE7gSoGyMgy0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWuM7c4weUTe9s04sypGkzpOjb9uxzxTxhJzhvfzuvBgev2DFsPcMLGGvm4ZCHyToHdjc5nyK9Z9sM6kL5y39vlxeF30ZxWa/CDtrexFa6yRp1hg3OVOFArvAYAfECMfyOqJhwYf5agzsIi9Pul21QOvup+/AIIO3spqiHSyAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImD7Syu8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImD7Syu8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so22547025e9.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780737828; x=1781342628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3AECBOGH+bhiXvCtacqMdiArKuJwpVAkabTm5OFjxQ=;
        b=ImD7Syu8175YeRrjRtXCScaG3zp1zjKkQVqFAB6wDTEGsJHpC+gT0GVLywwOlfNJHG
         khjpq0rrjq6Bx+FkFzcFCJ7LVnkony8R/xwDt1hJotqZJ1C07rbYVCWSBGxnqIP51sbU
         +rvo0bWPiS9c9C9j4d/dkjOPtn6OHFZMA3qSut+comSQIgi8r0BDBFEd5sBMuIsjJE5G
         FmZ/Ul56Qb5oaH56C73rYJfxcdWrHB/78VHpw2SYCgx46zKpH8i+JkrObishX5pdJKKz
         kbbZWC+QZNp6KNxY28bDDDgyXMjRhx3WWgFS51D3HmFW3lyhp0/K7EuIN7i1X/Ul0liv
         4HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737828; x=1781342628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3AECBOGH+bhiXvCtacqMdiArKuJwpVAkabTm5OFjxQ=;
        b=AixrSMypHckz+uNwM+8yvTJ/AagwyOTWtNoytIFi3/ow4OFt/h2JW4dB43UH3af8K4
         xwbTfWPWYWwzI9drHKdMMS0r3GaeRGIqbZu1LQ0A025YK9xo8s/bifEC2gGGJOpIfJs5
         epDaoooREul4DIOevIfVb8UZdQkwr1Lh2+sZPf/IySx/PlJ5DHC7eOIvgUUQfjXLU5xr
         vzk7FHwJsqkh9MQVIN3zejG3EHmeDJlJZSn61l7cHgcbZWTR2bNk2sCb2eNDtV/iDCtB
         HzKvV6YadvIMBjtSPCbujLn1usjKHN14YLtchU8vWFhTwCXTphUeSnMgNW5xIQK7aJiK
         EfaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Qm0EFXpkm4/HKaVOAldgFuH0hPu1OHOREPITuudMbzWJQM8Vle1qK612BWCB3yuzCPOxyThKzUo2fvr51@lists.linux.dev
X-Gm-Message-State: AOJu0YxRoGCD+BOaXmIbmVH77EBDklhk0KriRisRSR7spKYfAtbXtAAJ
	1IClXsnNenYpTI+spYnGh0METXxaPmTvQvReJHj+IX37BWcJG7PXRoCB
X-Gm-Gg: Acq92OEww8v+j6VyiYOS7AqGGzLvEX3WadDvJufGzc+CjghE8EFY5gXUiuO8oc9R6dl
	Jz85iFpuPMLb9B8rK+UkqO6ZpH0sXaswnk58UdaJRCtc7H7IUEJGEb4TRsihAzMiyMM92WEA7bk
	Ny1yP7MfbDMvxFXO0Q+YlWA9dErEayUAYBWUO/x3S6ISFBCMDlYOoC49Qs8y0TaJleZfwrmaAMQ
	LFDU4mhMzqMeItCpEVvQeUIjhSN5Efmsiz9prTdhas0kw2qLmphpMcYwnqNuc1JAd27RzFTrbxQ
	rG52O9r52hkPD8G6/Ho8ie6rLUEy0nYzySyJfM76V7UwEqLXvd1utS3fQdXRFplrmQBQxaZ87H7
	oXmGoxUksu9az3umCxltA7nyEHQlz/Q/WsGQUKz8u3j3MrGX4GxnaeOMT5/dgLCkck1zvxtJyiF
	GjehmONw74obDrweTXr11iDsIKAfH+TA==
X-Received: by 2002:a05:600c:468a:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490c2a2ea2fmr119883895e9.34.1780737828479;
        Sat, 06 Jun 2026 02:23:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm230650815e9.12.2026.06.06.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:23:47 -0700 (PDT)
Date: Sat, 6 Jun 2026 12:23:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove unused macros
Message-ID: <aiPnIDHmJlplnoRh@stanley.mountain>
References: <20260606091447.168262-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606091447.168262-1-rhys@tumelty.co.uk>

On Sat, Jun 06, 2026 at 10:14:47AM +0100, Rhys Tumelty wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
> index 8513e78856b2..d05832e7f337 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
> @@ -12,7 +12,6 @@
>  #include "debug_private.h"
>  #endif /* __INLINE_DEBUG__ */
>  
> -#define __INLINE_SP__
>  #include "sp.h"
>  

This is used.  It should eventually be cleaned up, but not by randomly
deleting stuff.

regards,
dan carpenter

