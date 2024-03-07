Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F112AACD
	for <linux-staging@lists.linux.dev>; Thu,  7 Mar 2024 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709815399; cv=none; b=n5VbR4jIWatlA/ump9tCOAwweqFAuY5aqlPtPaeIYAotio6DtuBr9cakaC83RBvFoQEkHmZ8KKWrEGUfvjdJa9fruWAgFsv3cmKtMDcIRHVJBXBK/CUohy3vpW9oWDUgqyxrHWTRtNUmCjYGK76/y9xjY0Z/1/LNuPtX8z2mef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709815399; c=relaxed/simple;
	bh=Nq6rlJscRwbYuzIEs80JzhPk09GirALumlZ4qyE2YDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFoAYOiz69BbFYyoNlOyG661ydtf+/giVcwPJ0TzdF1RaeBjc1zgS9R+lJ0tkycd5edl1Zn5deAcW95FDXhckwb0x2IVNgdbnDA+CSmkWNRBPek9uhmTLdxDz7ywQFCzHEPNKQUvwpoXqfE3Mmr5w29+OgKILXykorsc5QAnPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2fVh5K+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2fVh5K+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412ed3f1e3fso7024785e9.0
        for <linux-staging@lists.linux.dev>; Thu, 07 Mar 2024 04:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709815395; x=1710420195; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pH+Ba2rXoORhIsjYnlbSIHHqmfMovlwsGb3WvWj3jeo=;
        b=J2fVh5K+dJvqi+Dr+te/SNS6oIZd7zzoh5n5vZuCdAUvHWoJCeM821pDNwirIpC2N3
         Nc39dIm/SVHtwjZUzxzMTiSlzFVlTuzpq5Zwr0rvyrX6u+CMxRxdPKS4kb11bCYmK5qi
         h3pnTZN65GZPodrzVrPWMgx/VsD9LKPu+6B+bTjserzD6eN70okRPP5Revt8p8QMpjc1
         6JFJNkOl9RlRHdbuHOWTRqqyGkWdOLOzpJ+19mKvhssoYxclJffS46y5kdFZmUBwiUBn
         IqDa7lXZcuutRGomYXqglX7ZbJVeG2bYdUHXZCVgIbH8/tY+ID0JmCtLwj4NorifrYUp
         abAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709815395; x=1710420195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH+Ba2rXoORhIsjYnlbSIHHqmfMovlwsGb3WvWj3jeo=;
        b=AB79y4/j7rEL20Rp/KbafKNUpmc7Zifz3vig/xHpz8t7Vzmy45TsoEhT9gHflOmlZo
         hBpuDz8BIdOiOMEoCl0h44F6n6v8e3s+ceKsTHcywbSRwmWIlg88KJVNPMZY0gzfxmDy
         3DAg9kqw57cEE5li2+Wnz/TKj4tHx/z5feFT28RrViEXyaVFQRklgULK4Qjd7QlMQK+i
         o8TrchpqnkP1g5BHX34lts+whus3yQ2sdqh/7fsfXKJnIm5KHJc9gdQNoIWmNO8J28YE
         DPnyFqsdr0oX5jxroCYD8CuzgBDGt4fHgvCJLWoV6tmhSUE1iJ00ZpZNgl+/ge3CjvQh
         vwdw==
X-Forwarded-Encrypted: i=1; AJvYcCWW9mQIpZ8jWiFz8k4rQFbEXLIW/d4jcH8NT+pe3JjbIy/PDX5rwx21eACSUysJenxJjZEzn0ynoEaS9LMLaj3y7F14TZJ7w+4aPw9Bew==
X-Gm-Message-State: AOJu0Ywxkg9DH0TXS/Bb81MYsTczeHJOeMwtZtI1j2SW1izoxxcjg8d/
	28/rAfbKKZWEdi6+4flO/PNiYjtt9m7NvrBGkUobKyUWdmFge+HYav0P3PxXLng=
X-Google-Smtp-Source: AGHT+IEvE1c09KMlv3mWznPqH33pVQe6svgZkJSVxc+SAg3bd8zDWupckqNBitfjrnKPGyFdMzVUAw==
X-Received: by 2002:adf:fec2:0:b0:33e:6366:5f34 with SMTP id q2-20020adffec2000000b0033e63665f34mr1417057wrs.4.1709815395314;
        Thu, 07 Mar 2024 04:43:15 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b0033e45e4f22bsm8551254wrb.73.2024.03.07.04.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:43:14 -0800 (PST)
Date: Thu, 7 Mar 2024 15:43:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2 1/8] Staging: sm750fb: Rename variable
 sii164GetDeviceID
Message-ID: <82eda60e-5188-4a3e-8939-13a24d661579@moroto.mountain>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
 <20240306043611.98074-2-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306043611.98074-2-dorine.a.tipo@gmail.com>

On Wed, Mar 06, 2024 at 04:36:04AM +0000, Dorine Tipo wrote:
> Rename variable sii164GetDeviceID to sii164_get_device_id to silence
> checkpatch warning Avoid CamelCase
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> V2: Added the patch to a series.
>     Fixed erroers within the patch.
>     Compiled the kernel
> 
>  drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> index 8b81e8642f9e..3fb14eff2de1 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.c
> +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> @@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
>  	{
>  		.init = sii164_init_chip,
>  		.get_vendor_id = sii164_get_vendor_id,
> -		.get_device_id = sii164GetDeviceID,
> +		.get_device_id = sii164_get_device_id,

You have to compile the kernel after every patch.  Like apply *just*
this patch, then rebuild.  It breaks.

regards,
dan carpenter

