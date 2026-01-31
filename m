Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2033E355
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769870598; cv=none; b=EG8j7Dz1PScEWO4mNwOpp7ssvhHGL8NDQzQdQ5MDYUFQprK52Vc4RXoS+M1Q4Bt8QBOF0nS0mCetQ4N6MaZQ2NQaSobTo42O3m07YkT4csGvxpr/THd31MkKrjsEwTt37Q+V7ydtNEeVeZEqDtG9veBhMViW7AfPdN+LuRtOvXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769870598; c=relaxed/simple;
	bh=/Rt+IcFCyzVgoj9SvGQ+m0RBp8PTq7bKfH7SGJXfpNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLkOvkz6H0u7ZJ8/kd4Csago6dFe9CmuimX1QMQkqneHwyZj3l7ZL3I0xRQuSs+6eZeYFLdT3mQ6LuW6L12D1OYCq8P5+qco1YclUS25JX7AV+YNo9wiMWDnXQJdPT9Dfj9v/bXwEmG5I3doYyOIwDx8h8YO7QNM6X5EIRSNQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QbAC05zy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QbAC05zy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e17afd2d5so1924270e87.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 06:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769870595; x=1770475395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dS+0HsF6BDP2SThx6C8mdBdmnYz1fXAGcAYrU9p1+NU=;
        b=QbAC05zyCa+/CLQ0hXx2A1YMz3iYoc8qvMRSpcligN0h93LdVp0y3QDdSPtWlN418g
         nx432zi6IrTn13jrLs82LKleia7vaTTIP1BS/7MqcMzDNpliAwCW5ad0AFIHumOQX/G1
         WJ20NVNCF5Vl/aVpnCkXB4/SIemW6d5Ohldea/X5U6Vaw4K03OK/Y6STKZ1vQiBMccfW
         2sbof3FTyoOCgxVLSdJosRXzZ3oVTdQfE/vLYFZDTvHdQe8x56AWOBLIazi9YworCzga
         TWCJgdwNMeDZZnCPMVz2aTnZKEzMkvljQMfByT3/B16TFIF1C00+D9fgM+zGrgKJP+Yp
         foMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769870595; x=1770475395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dS+0HsF6BDP2SThx6C8mdBdmnYz1fXAGcAYrU9p1+NU=;
        b=lg5J78M3qrzFnJ1/h5PeT8RX/DSnGF0nCyDAU3mNqa9Uxk+mflJnydR9V+mFxxHih4
         nWpx09aFL5GlBQnawHp2dgWBOr2XYVcvWwBbiDOCtuy7k4TUjy18t8zxqkJuyL1kcINz
         pqpdtgq2glCZjmhzZlPMzdRRsHK0HV4WA52zAvggRXvZkBSe4eVaj08ZSAJHhKXZFgLt
         Iqs2xiXmVTTGId7pJeIPbh7YcLpuVzpirvO6jmtB70oIW7EUpMI25EBVHVNTcA5s4Nyf
         a8JbPQm1cVDOKW45ZJOhPC0/C3ivrGQXGtV+YNGA5BWAzO4eut9qMXf3rqPBxIEAIi/O
         FIsw==
X-Forwarded-Encrypted: i=1; AJvYcCWerY/Wba97q8lks930op5Nm4eZ2pmWYLCmvcJ2/waSgX4t744EfTxP+C4j40TDNeDgHuWGvJ38EQMdePu6@lists.linux.dev
X-Gm-Message-State: AOJu0YyM3EqbxAo3dgu05qZpEgsyob6yPJf/DcbhzEhSL6Vlmcp6EN/C
	DEpXVBw4H1CO8oasPlM24Cy4ht8/5BmSsBBf37ADd36myAIc5UlxmquqZNDS0jd6xC4=
X-Gm-Gg: AZuq6aLzyyNWvdpRzJJz9MZtSxCEHVpNy7hGDjxcX7bLTtw+rTpD3cnkCi0VWKYBOOA
	RNxGe+ROOpTK30/dNFENqivP+MNbleOeR5/bo+f7MlCbU1Xkev3GGA15l039sLm0BL8IXTbTpg7
	XPjvM8tE/VIOCspQ4ZVfkDezJjhd/LbSM+9sx5hLD3Gsw1xypsIG+b4ogfmzgKpUX6GKhIco1Eq
	FGDCsXP0+B6jDBK9+RO2X29hgwDosayF9dgWfbTcvgXTUB6bmf/JOYc5xQ3D40mn+c2zQFYK9C2
	7Egk7jorbg6sQkFQUYA6fV4ci11W8GTL2K1bBK9UyxEOMKCzR0QkqkqXt7ZraiA8rLQkTOzjPh3
	OdaFDbikGWGqgTqQND0uORjN1ixWth/6SC3RhfCEESw4ksgubPREaImHCM0pHPvrBplXo0OeKMJ
	ewSMlqP5FHMvAQ8nS12ZA/sgbcB2I=
X-Received: by 2002:a05:6512:114d:b0:59e:479:917c with SMTP id 2adb3069b0e04-59e1644527fmr2358419e87.39.1769870594830;
        Sat, 31 Jan 2026 06:43:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b70bdsm2358246e87.72.2026.01.31.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:43:14 -0800 (PST)
Date: Sat, 31 Jan 2026 17:43:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace ternary comparison with
 min_t()
Message-ID: <aX4U_vhLXX0B12DS@stanley.mountain>
References: <20260131133146.8174-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131133146.8174-1-william.hansen.baird@gmail.com>

On Sat, Jan 31, 2026 at 08:31:46AM -0500, William Hansen-Baird wrote:
> Replace ternary comparison for setting copy_len with the min_t() function
> from linux/minmax.h.
> Change is purely cosmetic, however makes the line
> easier to read without having to reason about logic.
> 
> ---
> v2:
> Drop unrelated style changes and fix style issues by running checkpatch.
> Keep min_t() to make the signedness of the comparison explicit.
> (copy_len is an integer, wpa_ie_len is an integer but sizeof yields
> size_t)
> 

This stuff is supposed to got after the --- cut off line.

> Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> ---
  ^^^

>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 8e41eb61448f..d36f6c3bc9b4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -4,6 +4,7 @@
>   * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
>   *
>   ******************************************************************************/
> +#include <linux/minmax.h>
>  #include <drv_types.h>
>  #include <rtw_wifi_regd.h>
>  #include <hal_btcoex.h>

These are supposed to go in alphabetical order, kind of.

> @@ -1024,7 +1025,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
>  			pstat->flags |= WLAN_STA_WPS;
>  			copy_len = 0;
>  		} else {
> -			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
> +			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len + 2);

Use umin().  "int" is wrong because we don't want negative values
stored in copy_len.

regards,
dan carpenter

