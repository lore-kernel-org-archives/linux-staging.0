Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE11A254E
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350597; cv=none; b=qK2xo0TJMk1EDZSeEcq4N4gkxzG2TRiGPVQgfEx37Df7Y1kWEnMWUG0gufnf+1DHmVuZfxgOEcucpl6/M1v1tkfiHFpkx2p39/w5kpelMhrG1YV1RGxUzMz58m4DRSRfQotN/EsdSdl9pm/mX5Le8ptQ+QKUOPjUV25vja/NaGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350597; c=relaxed/simple;
	bh=Om4ERC7VqqlNP0k+2cruuobLicBrUelIiNGiFuwCyTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JE1NeUSSFZyQXwhE6NfUBAZCGGjzaB8OcCvWvMQ9aJ1BkLQntvcKWv4B4plTRLvNwxFGOgPKdOeBaYPrxD06Efh/yQtC9bamrsK4EGzZ4er5Be1W9DL+bySbiSf9WkSra4SrGhCnH6rPb+jJVYNnZ+8c8yqawdXo/sllbGbte4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIJXFop3; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIJXFop3"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db22c02a42so2508168b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722350595; x=1722955395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYaUiMVR737+a9vHy0nK52dupPoGOgPRjQey1WHJB1Q=;
        b=SIJXFop3Mcii6oWvTj35jlfdrMQtRklRbQqbk50g5HFMLeIOyASBLl6uqXDT2OiiuX
         QFXqvzAJreCeOoRj0foxa5oQ/m/oKnadPD3BieE1eZoBMUyTJZNdoBKyndBGA1rxPK9Q
         viplNCs2PyO3siz6Xrv4uH5/+IbDpOQvvw2jpVLCK7fRccu8y3hNw98F1dCXcchgSZYY
         NlV1ZEclVFslJ1TqmBgaE5yvaQU/tNzgN2WK+dwb9m0GjAVDus8jwAqnVbSqHFmr/YE4
         dzAqZYLpwrtFYg5BIsCQLzOAf7akiQpxmU0YXP4qq2q8FgX5dq0Lo/aH7O8TutbcJ4AR
         7NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722350595; x=1722955395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYaUiMVR737+a9vHy0nK52dupPoGOgPRjQey1WHJB1Q=;
        b=S2fR4L2wS4ztmQdP5abuXFHHjptTzaKTor5dVlRJJe5YP+zcon7zeH9uMYN5Qj0WpR
         pthQqPa8lBzDRRjuV3GY6lBXfvuDZ8gCk4xLpMbje/DhoRJzvvvoKjercF7vkwIGHYYx
         wih6NsmeqBBkYp77SplwOWo6iI8vQoLJqYcVhdcg4P1uTFFHBpQeybJnsfwWFqkzulMF
         ubxgKBuGKfrxQvXvz7dhSWlpeBPqvNU7ABtkez2h7vVJug1ZVgj65suqQ/vG+wY/pq6S
         ff0Go8jSMP/wpPC57/zFq40W9oal49YM4WNKdKGYNt1dQOQ9eE50coivaUNqS00jDP7z
         bfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA3W80hneWfLW4DodPk+hxwIPxWIL3SIT4y6TwfZ2/QqGcvgLtP74syCFxQ3wel8xPX+Nh5Znb2dDXIS7ZiXHv7V5PF7fYxpoksj0gCA==
X-Gm-Message-State: AOJu0YwuYdQNMOFA2ZvJ9E0kn6yU1mimRRu7+rcCf1p3ZgNGeHpYTIlh
	hAMG/Vp5MOtgwUcVEGGKmYzAlm/Wcx/Ivhg0mSEw/zVg4pfg0rjGRO9J+hMpGKA=
X-Google-Smtp-Source: AGHT+IGuXBra4zsWnYNWnRqLnedt26KvTmSvT/pDGfaLXeIuq/5uIHAg5xLd8VXHkdc4QWOhhHUs2Q==
X-Received: by 2002:a05:6808:1289:b0:3d5:4256:26d4 with SMTP id 5614622812f47-3db2389c6ffmr17162599b6e.7.1722350594816;
        Tue, 30 Jul 2024 07:43:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db417ed7e2sm303408b6e.8.2024.07.30.07.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 07:43:14 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:43:12 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <f702d0b7-e316-4190-876c-1398f0ddcd6a@suswa.mountain>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730062348.46205-2-spwhitton@spwhitton.name>

On Tue, Jul 30, 2024 at 03:23:45PM +0900, Sean Whitton wrote:
> Fix checkpatch error
> "ERROR: Macros with complex values should be enclosed in parentheses"
> at hive_isp_css_include/sp.h:41, hive_isp_css_include/sp.h:42.
> 
> Signed-off-by: Sean Whitton <spwhitton@spwhitton.name>
> ---
>  drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> This is my first Linux kernel patch, from Helen Koike's DebConf24 workshop.
> Thanks!
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> index a7d00c7bb8bc..128109afe842 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> @@ -38,8 +38,8 @@
>  #define STORAGE_CLASS_SP_C
>  #include "sp_public.h"
>  #else  /* __INLINE_SP__ */
> -#define STORAGE_CLASS_SP_H static inline
> -#define STORAGE_CLASS_SP_C static inline
> +#define STORAGE_CLASS_SP_H (static inline)
> +#define STORAGE_CLASS_SP_C (static inline)

This must be dead code, otherwise it would break the build.  I'm not
sure what's going on with this header file.  Anyway this patch isn't
correct.

regards,
dan carpenter

