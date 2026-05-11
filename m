Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD3364EB8
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523831; cv=none; b=MqAONV9I+dRa1zOw9/RLFqezj1dCAAY5vv8C2JZn8XIua4nh7/54bzFVP6Rt+5Pftphj96ESCzmL/X9twPi49pNaIfzIn1sTllgvq4XDtB+zUHi69FdTFFu9ZnnHnWbdcUbD65cgmpZuOeS/F21spTv2dtXb22+FunZD5sxRIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523831; c=relaxed/simple;
	bh=F8zrzlkx45OHJ29lp45H4tCMkhAj7460hK/3RU9O0gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPIBrKkOXjXzLQJdKzGAOM43xuD62wEJKl4KQxSCi20vdNgrIVMJV3jB40BIRvz8jmxbPCh07jxldk+Ogju2UnX5hY8+GweyUJlyI4vK9euoaXRxDB9JrOCXyqD9yysq8VO+6pqRscOOclei0rHzI7aGRjzQNbokIP//yLGt7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYF52pes; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYF52pes"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so79189095e9.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523827; x=1779128627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QxNeZINcMY52Teiud5sjeLxhrrD/tQVmXIMDkkQmOJQ=;
        b=TYF52pesLi20l18+DAQRVv77Un6tYbznORbU2IrtVU1g+3fheP5bnkNx8eSjAdbbWF
         pJAJNPvJ4gm0MrGbfyuzhpohd92a8NeoMi8jzQKosgZZsvfXpFAyHjg+G0nmCjrqmXeM
         6sQ09AudtERMdAf4zxBI2C9eK1suakLd7z8ksVvDR2566eJWtuxXu16zuoc8jX7Swxxz
         MujVUF71nRKJoOdzz6ALKe1SQgJiyFu90fnJaYE+V/mb8AFgjIOx8ePOmfSLD900Lmwk
         CpQhA+vCQagGmzTymqVdt2Xnawmiq8H4vs/iExj77cUjwILOLaNyCHyheGvTQei6bz6H
         4U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523827; x=1779128627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxNeZINcMY52Teiud5sjeLxhrrD/tQVmXIMDkkQmOJQ=;
        b=j/SgFmD0j+uNNRyFjg5TW0uKdKN89ExoIjIV5n+/CjBVicOVi6EYegS1/1AXM2dPH9
         wv4PtJb0uqqg2WnmZieXF3lpbVRvz6mJG2Ua/suVkdR+ot4aRf4nfdkGQfeJzykgVDLJ
         riM9+3moHe3P2NTXF7OarDWswAk4CN7kqd+g2ycE9tfRYJE6X+muNnsQ/Y52lPqbL5x2
         44vI5Ix/RPn1EGpAuVoUfmpS7lMfErKlrMetTNVI/4V6amNJGPv2mrhoa6x05K6NIsmC
         ELpw2mcOg2/8/JziTbLv5egI2DymQsDCkilVxOsi4GaMPHY0dpFzkxHjqg1Zm9KmfQL5
         9rgA==
X-Forwarded-Encrypted: i=1; AFNElJ+QqHjuL3S/RXSCgY9Gi1uQF/6eaSrDy6Z0F/2KS98fYTW062XPrtY04EVOcdY2+68alaAFYgEHpN3ysVnL@lists.linux.dev
X-Gm-Message-State: AOJu0YxXULCl7RVNP1QDaoagD6cJz+Xn43aOAYUjuxumYGbasOJ+Hug1
	eN9pyLGjYeXx2o5GiDqMddEtItXw5urocjVD5MZBSKQCeo2TvefVvXo3
X-Gm-Gg: Acq92OFUriKLW9mnqYI1x+C66qK+vssxO9qou5tK5N1Rb8t5V1HIIAc4si0X+E6+CIn
	2Z/yhvdVvuCXt4FUwrt/86I3nA5jQcGhQBg6+w16Qr+pYjJBArHFXR3i740dfSVDbZrUFXvZ5ij
	5YZWarSEjYBduX6noXkTkJbTvfAwTea+K0u9VIm7G3Cvu04nItknueOtATQETi+IPIA70VEx9VH
	gNq+8NO+kYnsqbfyikwqiNbqU4c25Y+hhOQbO/q9GP9g/IYZ0RyJnAhjJ3ZHQOBCI0zCUQgLFaQ
	j8wJ0nj913USCJIzO3ghU33QarH0r4dECjozZSpsp9qct/DhZimhY41FgqDwRhrx5ScEg7jujjD
	oLqpTJjDHR9MSYixRE/jEHjTKWy3wG3dKiBrCRgjSr61fCR6c+c0SaHzBbJEwlADaGP2HEhujsg
	ge6lut2CAke5CUwYkh3Fa68fJmnxd5bg==
X-Received: by 2002:a05:600c:8115:b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-48e51e196f9mr409040995e9.8.1778523827458;
        Mon, 11 May 2026 11:23:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e61f7b8sm1806155e9.7.2026.05.11.11.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:23:46 -0700 (PDT)
Date: Mon, 11 May 2026 21:23:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove stale "Generated
 code" comments
Message-ID: <agIergH1dy_pKwQz@stanley.mountain>
References: <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f.ref@yahoo.pl>
 <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f@yahoo.pl>

On Mon, May 11, 2026 at 06:55:31PM +0200, Tomasz Unger wrote:
> Remove the "Generated code: do not edit or commmit." comments from
> five files. As suggested by Andy Shevchenko, this code is coupled
> with legacy firmware and will never be re-generated, so the comment
> is misleading and should be dropped entirely rather than having its
> typo fixed.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/atomisp/pci/ia_css_isp_configs.c | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_params.c  | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_params.h  | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_states.c  | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_states.h  | 1 -
>  5 files changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> index 38c9c62366d6..96a8e58cfcee 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> @@ -4,7 +4,6 @@
>   * Copyright (c) 2015, Intel Corporation.
>   */
>  
> -/* Generated code: do not edit or commmit. */
>  
>  #define IA_CSS_INCLUDE_CONFIGURATIONS

Now there are two blank lines in a row.

>  #include "ia_css_pipeline.h"
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
> index 1cd3322b0da0..96af15f62060 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
> @@ -48,7 +48,6 @@
>  #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
>  #include "isp/kernels/bnlm/ia_css_bnlm.host.h"
>  #include "isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h"
> -/* Generated code: do not edit or commmit. */
>  
>  #include "ia_css_pipeline.h"
>  #include "ia_css_isp_params.h"
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
> index a542f8979905..8c9468c5849f 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
> @@ -4,7 +4,6 @@
>   * Copyright (c) 2015, Intel Corporation.
>   */
>  
> -/* Generated code: do not edit or commmit. */
>  
>  #ifndef _IA_CSS_ISP_PARAM_H

Same.

regards,
dan carpenter

