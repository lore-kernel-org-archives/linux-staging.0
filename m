Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E929D277
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772894034; cv=none; b=Re2HaBYG0Rsd2G79Bzv8h2LdCOsttpiVoCzK5fO2vZuJ5MhbHvOPBsGv/0GONA9pVPJ4hKTIX8ewc+yaKLrD9izVYJNqn7FartZGrxTjf31zgLi3JD/bk6llxlchOq6ykn13rGjMvXVajIH38j1jP+POqjzbF989cgNrNFOMe9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772894034; c=relaxed/simple;
	bh=/o1vFLePDi8To0zOsyTge48Q4qREIhQpYdgmLsQ3AAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWVqFX1v0pjBw27+4FCOA0ddAcFPInFEt+C96tSW9CIZm4nIAi2UYwzrAonf+OTd5A3tpTZ3lc+G79JlpliamvDmHDyHFXrzPGJ2XZBi6UZcKsoRq9shCtooBFHKJbFv38fmHLsjjDcSgC4qth55Ot3ajNFO+KMffkF3yyYuViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IeosXInr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IeosXInr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so4952825e9.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772894031; x=1773498831; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxQncR5jaA4Hc3ZrlmxQ81hS1vNL2x9WxU/vJV2wJdY=;
        b=IeosXInrWD8OARgxYyDxj1XYvdBQO+ZhIGPfdz7sDfv8gVz4o4rOJEux/58+etcUBV
         YhD8FvWzVnuXJsOXlf0aDsQ9kpESnNsScIXshQ9PXMyGsmvH/wh2y/5VPwZsT8Ww3CQa
         b7fixQh4sCvUGznKBrX/YCuXkY6DQPHyG4PwC11nIDQgVh1tDAjjlInMFTC09dTlmYlM
         2Scbhbbanr8HPW1ZHD9Xat5N8rwMl+anIikNWkRIKBvRQGi4jTfbgVa6bbF/tj92Irqy
         JG8s7yXks+KF2sLZ8BZ25JrQnKgJPvz4xug9uMMEy/uMYJI8XHL1DVG1NBWSJZyybSHO
         EfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894031; x=1773498831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxQncR5jaA4Hc3ZrlmxQ81hS1vNL2x9WxU/vJV2wJdY=;
        b=Zfw3s6W9X6XwEIqdC6EFiqbU9AJ1h7j1DeA6bhfX53XulycAitvNRb2NZBxOUclQVO
         djmCzKRB6O7cSdqX8VigSSTsYwGZ0JtNK2Rlhe4+B4CU5R8FXyCZOJ6Qjdd59a9LRWA7
         bETpS7F8xBeRZ28xmoLwVlCdD1+jjSfc+rEd43PIBRr9lg2KBoBTvU3IDR/QbvjIN6jm
         4jLfM1BoQBDlJvaiIRqvUueW0zOZxIKEi104P5i6Dq9A7/LDTQTI+IfeDC9svlsGdMyT
         Hae5ZghUP9pgv/5E61vWQPzPoKMnRXp9EJeNEnksOenlaIdgI9lLlN+C3BEMCzUpg6zL
         /8nA==
X-Forwarded-Encrypted: i=1; AJvYcCXzw2+uwPUEq/CvdyxL2ypPu6CL8ilw6kBTQL5dLaH6DPAH1FQC52j7UTdF9asfm2yGcwPCzRKR02EWL1km@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5+87PWpGSgyECC8SZuGk2yYXzG4ugfU+GIVXUCtl8D+sGPpXq
	tl2J6PY9GAIyj4UC2gJ/9SZ0DamToGncxvP75pRhNra9JOYJrvQBbsGuvtbPFwoN/Ok=
X-Gm-Gg: ATEYQzxUUPqAGxTVDDmTfPlttNYCgNsUdw+nRzfVNs7pK9kim9FNiEmFaaIbT5M1OGo
	dykQmwLx3j5HJeJ/dvB5gpasO/9imwFKxzJJQjs/eLvloqWvLfvbdd2eU2Qf5zOssxQZ+x3WRSM
	SDgNxA/NOI8VsJqYV4OVzDFCeb1gjZUBMKCuitzVf4EKYNOY0lunsrvm+082ptUuBpI+O9UA/Zr
	HjZDvYrONuuvvCiuRaUB5ofS67FBWNSg2QhGA0CI1cfpP0+ftiK/gjyu5dep7MWFFSGyGF/fAbj
	juMCjKHh31d/3eEU6hTJFxfrA+9FnIC6Se5bOdOLWm8yAx/yVz9SCF4OUHWv5zqwxe2I3uLiRCD
	/xhioWsUTulcOuQMl2Hi5C3pfRw3xgQdmyh4aBDHHWMXW2+WXP1JcAoIc/RSiKvKaACkoyNiAhR
	zcs0bguMQwUpd49UWHSqAIdXflvYlJ
X-Received: by 2002:a05:600c:3b04:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-4852696d1c2mr98879985e9.17.1772894031416;
        Sat, 07 Mar 2026 06:33:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f019a4sm29294115e9.12.2026.03.07.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:33:50 -0800 (PST)
Date: Sat, 7 Mar 2026 17:33:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pipe_stagedesc: Fix leading
 space indentation
Message-ID: <aaw3S6WjumRCPJ2k@stanley.mountain>
References: <20260307120232.74846-3-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307120232.74846-3-giorgitchankvetadze1997@gmail.com>

On Sat, Mar 07, 2026 at 04:02:34PM +0400, Giorgi Tchankvetadze wrote:
> Fix lines starting with spaces instead of tabs to comply with the
> kernel coding style.
> 
> No functional change.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  .../pci/camera/pipe/src/pipe_stagedesc.c      | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
> index a9f736398f50..8e31981f31b4 100644
> --- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
> +++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
> @@ -9,11 +9,11 @@
>  #include "ia_css_debug.h"
>  
>  void ia_css_pipe_get_generic_stage_desc(
> -    struct ia_css_pipeline_stage_desc *stage_desc,
> -    struct ia_css_binary *binary,
> -    struct ia_css_frame *out_frame[],
> -    struct ia_css_frame *in_frame,
> -    struct ia_css_frame *vf_frame)
> +	struct ia_css_pipeline_stage_desc *stage_desc,
> +	struct ia_css_binary *binary,
> +	struct ia_css_frame *out_frame[],
> +	struct ia_css_frame *in_frame,
> +	struct ia_css_frame *vf_frame)

Same feedback.

regards,
dan carpenter

