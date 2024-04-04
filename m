Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974582D90
	for <linux-staging@lists.linux.dev>; Thu,  4 Apr 2024 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712268314; cv=none; b=pjr+MTSasrkkVunfpLQ5n3hX8wgThNl68elHF+oK+fFC8OUtwGrPAZrMx5dJVn7awZRkCaQYkGfgAjpGR81cXxX67lmhPY2zxuObZQPbZ7rU6ACLx0UI1C85goNPRh9j2+LPgdjUyb+AN0ndvN8g97Y5sA7QsRny+TOIhN6B2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712268314; c=relaxed/simple;
	bh=RAKB7kyF0fNWR2j1HvVjKXB7jfD2l116apUdxmo3sY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aY2FGCnv7vnFx5ZIIdvn7IA67ugln7lD1f1312cmRIg6/ehg2Ew6nr5n+XkHngtocdYchIYyvFAJAN5NHGsYu7w0jkLul8WH6DAuLljkbfb+vL81zra1n6k+2sbhm/EQRGN1aa3WHx/Kcdy8Y7q2asj6nhH3QS133b75Dpv8B48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=M0A2St+M; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="M0A2St+M"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e709e0c123so1343778b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Apr 2024 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1712268311; x=1712873111; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sy7266lMQnSMjMFEHXw5ktQWimUH2FejCxx70Ap0ANM=;
        b=M0A2St+Mlimc+qI+K8Y8QnN/bEy0jfyQV/7YD4aD6JfWSMtpkyZP16uAi970gaX4AQ
         BtPi1AbEoUm2UCTa2OfLc5D5BOxGldosZ7LaF7MRvZIRZ1lpRO/YZCTYCNr43HtPcCaP
         5dwMM/i8+oZEz3BjpF3WBNJtH84L+M/bWh/OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712268311; x=1712873111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy7266lMQnSMjMFEHXw5ktQWimUH2FejCxx70Ap0ANM=;
        b=T4Kyx/+0WEz5Diuv+HdDu9+WCR9ag2O6dwO6BsvlNdC7vnrwwRPWmDIU+wp7WcXbRG
         MFvhUxNEcUhZ+9PM4MuRP/cuUyNgHjLzDBZSTp+2fdBF4dx9929bSyNVKaXFhWfbqxbI
         6skzqRzDRLMQrg7z5GvaFFGVcnIDBVATvFD+uT/OKw6izMfT11/Z8EooMhpIuMCUV38p
         j0G4nipa/K2cb1L00WFV0GAnlv6KQpubvW7Y7mkUJ87nHQXYshbNBOGY24of/3iW6n9r
         4sPV0YxvIj1YVAgIfbcLbWuWUA3FjJceb6Z8f0f+CTT1s1nAaNCk5GiMWRcrdrIhhSA1
         54mg==
X-Forwarded-Encrypted: i=1; AJvYcCW8iklp9Fja6y8S9dnCgKizDvHZJNK8Ll5IDKgblDmhb6xmICBhPuzrR3j9J7AlIrhtw1lK67DmwQhhwnkzDXKR4aP7XhjREFupu+H5jQ==
X-Gm-Message-State: AOJu0Yw0eo1yIxL1ciCzFkpVIyF6UYDd52eQItvKtDY6GvYpMfRMiSO2
	ioEC/2YNHYZRSw1FH+Wegoq0gU+S4xztUyWBysCkWV9z1lHQLuGfwM68MWkiQg==
X-Google-Smtp-Source: AGHT+IE5nA/OpbcSy/r9kgCd3Js80VOlnXWp2HYIjgdhUy7KW36EOroFso0nwx9xB8SpB9KKftjehA==
X-Received: by 2002:aa7:8894:0:b0:6ea:d004:33c9 with SMTP id z20-20020aa78894000000b006ead00433c9mr960813pfe.30.1712268310720;
        Thu, 04 Apr 2024 15:05:10 -0700 (PDT)
Received: from [10.211.55.3] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.googlemail.com with ESMTPSA id j17-20020a056a00131100b006e6b989514bsm139111pfu.60.2024.04.04.15.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 15:05:10 -0700 (PDT)
Message-ID: <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
Date: Thu, 4 Apr 2024 17:05:09 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Clear up precedence for gcam logging
 macros
To: Jackson Chui <jacksonchui.qwerty@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/24 7:16 PM, Jackson Chui wrote:
> Reported by checkpatch:
> 
> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> precedence issues

I agree with your argument about the way the macro should be
defined.  But perhaps these gcam_*() functions could just
be eliminated?

I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
to gcam_info().  It would be a different patch, but maybe
you could do that instead?

					-Alex


> 
> Disambiguates '&' (address-of) operator and '->' operator precedence,
> accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> 'struct device*', which is required by the dev_{dbg,info,err} driver
> model diagnostic macros. Issue found by checkpatch.
> 
> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index a8173aa3a995..d82a2d2abdca 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>   
>   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>   
> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
>   
>   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   					  int type, unsigned int flags,

