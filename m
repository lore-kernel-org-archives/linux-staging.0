Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5214AD0D
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497746; cv=none; b=LAjOZSLkpt1SE/N39vIteUYfxi3Md4e/RzZ3FICyEaFo+f1981/A2571HY6GP9/lFwsNOtvozImVRf9BTxiuY4S3Qxw+9tLjufFeVu8D5WGl2aVZE7z8vccO4OND0P9LC1saj5VAb1iiw8kvEcf6rYv3FxgllVD3sVIkNFFiVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497746; c=relaxed/simple;
	bh=MYHptY7qVMdCeYExxbFTjOvHEMfmgG75pzPebFLBE6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIr7/l7qz188to2qIeWjsL98fGXdbuh/b85JtI51s35tP15HArxc5tsz/0wtvMXhxS7ljrObzbTWoL2m/QDxPSPY8HK+AOEGLMmSAZfOHoXUVWQBRn1luQ/RDwuknTGL4lGpcu5CSmhk4UivIZdaW1p1dZ8iC5HSQ/r90jewtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXDZ6VlU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXDZ6VlU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so1774441f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755497743; x=1756102543; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PSsAQl2WRt5OEtha/zrB/DgNNONu4LNMZgefW2fQN0=;
        b=kXDZ6VlURclVz+l4gz/uIbIp8QN55CLoFsGHvbATYLeuX5v2G1Oo0kL1H0af4cBthc
         tg7nq4tgyLAgXf/UlXA7SdoMA3doiJJMPn1hfwY7gWuw65H6klpjddDzoMzIi0WCmrBt
         SoCDxrg+90yzBs5aMBmOHD812FF2VebJ712TnEnnjKD/PWO312IncAQ8I21M33u/dt1u
         d+TqMjw6BQgjgSmUdEwzbqYfbgneu7wT3QVZ0OTJnIg+LIoh6wm/NRqY8nTbsenvv8Jd
         NOTfO9OY3RTcgnLs0qjufeY6rEYLT4FgPLHhEYPgFgmoeoidoqGGejSLtR1WP91CvLEp
         /SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497743; x=1756102543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PSsAQl2WRt5OEtha/zrB/DgNNONu4LNMZgefW2fQN0=;
        b=h5nH1aPlo2fKXRcJjW9Y+T1533UzUSFZqrhzBtl5UAmgxVeAWkyKkI/pUtTZpi4xBb
         wfSn+/9ri1TC//xXIQuXusR5Lil0ivZ8JYw5aXr0SEPyEDeATmAgs3Nf7FWRF7SOtzoe
         jaHxDz0lGZE2m1Ndpsqp7gHb/JzuyBdAk3Mfn0nt07fr0kyKgcgGh7uKeURmLoFLmX1k
         qXmFGy6WQwhzRQmU+q8NkR+fyeVwTrYkRNx0meBwyRy0nlGMI7loRE66Ze1YeHvJbX1F
         3xLZbvci8Dznp8Pdh71E0I+jAsMlnTNmtG2aJOuxZamzogm9JIOxFTpRoeCnQaKC/yWS
         I+WA==
X-Forwarded-Encrypted: i=1; AJvYcCXIk2BSK3OEPRvXaWxXPDLVBAxL/K7HmLvy1cIKK+BBonnFFmcrP9I411cW4Jo3iXQ4GHEpcVadLoZKOvMY@lists.linux.dev
X-Gm-Message-State: AOJu0YyWIKk1M0J8WBq7ZxyVLuzjp8hfN4HAZwGDD5mUvs27hH+eEPkH
	4Veufck0TF1oDRlc50dfx5kUkUH9QzniKD0ghkFF711ze8+dg5JGhk0iJ1Ns0kAKzlY=
X-Gm-Gg: ASbGncsNwFwzpSTHjxv/KPqKjqJJAGKqphSZKx+jEatiPlpL7FBoECbReEApqym8VV5
	noLtPJSv9ZB9C/O/zIzvXzG8VeSmSZEvm2+UJctzQyA0XiyOPPLbYc9ZSOUN8Xb+AOEZIhJGSRf
	TFNHhajFTrcTIar+f8iiz0nk2AV9s3tnMax628S2WPDoX7J4FySyeSTkz+OWiJaNeDMjM4ZjX4y
	/aM5UEk5r7m5pCksePODhBGtdpaFF+T526WSgZcs0nR5RKfHVnbD1g/PwxlfzBZMSeffcH3hS0Z
	VNRXXIwOD2jnqwVLzcdnU7CibxpAxLQ4TUiHpWhcu9vjuCdiYyBdDL1ud208bIrCvvM0+P05clj
	L9FSydhEQE94xR+M1QU9dpDAeXaTplfIcsuVD9uAhSg8=
X-Google-Smtp-Source: AGHT+IG09uXnf83+BxfTTXuZFbE6IWpXIJALIrxVKeBEh/KVAHcmGhBFx2Xg2Z9xfz9OU41mjepSqQ==
X-Received: by 2002:a5d:5f54:0:b0:3b7:9af4:9c93 with SMTP id ffacd0b85a97d-3bc6a55e8cbmr5720130f8f.35.1755497742661;
        Sun, 17 Aug 2025 23:15:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1ce9758asm155462025e9.15.2025.08.17.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:15:42 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:15:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3] staging: media: atomisp: Add lock asserts for various
 functions
Message-ID: <aKLFCjIEEbEUqEXK@stanley.mountain>
References: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>

On Sat, Aug 16, 2025 at 08:06:03PM +0300, Abdelrahman Fekry wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index be5f37f4a6fd..03067479dd69 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -1447,9 +1447,11 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
>  				     enum atomisp_input_stream_id stream_id,
>  				     struct v4l2_mbus_framefmt *ffmt)
>  {
> +	struct atomisp_device *isp = asd->isp;
>  	struct ia_css_stream_config *s_config =
> -		    &asd->stream_env[stream_id].stream_config;
> +	&asd->stream_env[stream_id].stream_config;

Don't delete this whitespace.

regards,
dan carpenter

