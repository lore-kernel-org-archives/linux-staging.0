Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D139439AEB
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 02:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736391416; cv=none; b=Gf/+Uuyg7yHLwWgxgDE82n0dUxhZj23gVESuPn1qcFRnNE84v0jpc84z8sso0w1yDxPEaGK+Qz5NUvIZMa2b4E10nAMMqdy3OjCeMbpW4wJQ2ZmRoeppH+RMfI4p1Va8AYEvrO6lWJN2VRBK082ixi45bNYEgfPEMbillEwui2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736391416; c=relaxed/simple;
	bh=9B8YRNjUJJIAtie6xNtNUlo59KixKJFSb9y515QztWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aqZ3DJiDNSMWZj2xVasns1xYk2LHJpRUa3ebATG503j6pNElJ2nI9YnR/HzMHunHWQCKbHYSKmRhh94NyKLmeC1qnhWZLJlrUrKiGegvaJVT5t77wCCFQzTbIiVTvFmTXdiouxf4qP3zzoBMdzBBtLm5zj7wC/4fz2+32HTClKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=K7ylyqX1; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="K7ylyqX1"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a9cb8460f7so2694315ab.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 18:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1736391414; x=1736996214; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQoas5DH36I60K0+5Ey1X6fUKABteJPmp5UP7F+QaHc=;
        b=K7ylyqX1Z65mnZByV6sBrtuJHNU0oS86hMxa8H4LhZgTMArBIEm6urX7STHFgX6nB+
         m8U5vOPH+7s/YNFg1Sg8ZvHwpPTlWQrx9K+8Oc15JHc5hLLEiJyMEZBpBiK3Jc3s1QFv
         zvH9hpKOxoIDLO0+3btmGHrO8QqwnR9eUyQDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736391414; x=1736996214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQoas5DH36I60K0+5Ey1X6fUKABteJPmp5UP7F+QaHc=;
        b=Ranc3WpwwIzMYFmNMBlL7gbK1krIkZ6nldDM6bFZ+YjDrl/BuCWNeU0Gs7sollXVt3
         3HMmqlX0aLY+DYobWmex1jEXf0xPBNWD53n2FS+ImOu0tcKyKrd6+sERXsYaMJgQfBG4
         sdk9JPUUL3fpBx+t676jcMVMpbFYQNzCj1l7UcIxrYq7O9BaKz8FDk064nvzV3mYiOaH
         qFbXPhSjXOOpgqVfKYkUFt4IRej+HQO8qXUEMtUqsSPSsFTxt3WxNzCYdZT7zE3mvFy3
         tNk3GvhldaARHZrE0XQesoE0xVivT6DffQFTCm5iDbHI2aw3WWT6OooXn9j/iSj5itX+
         i4ng==
X-Forwarded-Encrypted: i=1; AJvYcCUGfFGuLkChySdJmULXn+/uM8FQS6GCyDxoGjulWG2Cmolw5XXIMLrGucPly+vx906l+cx/bDp2AeWy7tTy@lists.linux.dev
X-Gm-Message-State: AOJu0YzUzJzwHaAIDoQOGKtiIb8MfL8coaquBIO2DHdheY97bUQwDtub
	We7WJ46CjD7ldUhmvlyrsI+ix91D1f7VJIkX4jrpLy/TZ3GxzxT64AxsDii6yg==
X-Gm-Gg: ASbGncus4qz6Dpx3mBCMY2AWC5GfVMhPcsvq8tVBnAmCoBApWjy0f92lLY53eZP/95I
	mth5kBNO4L+HnCmgXYG5wFqbc/sbRCZRhjr3sqmbxt75Un5bl4xOu6RnkDozhWp/YKiO69WmP46
	hawVD566TiNRvJUmPhCL0q9A07Veips4p+Cy27o/OlGcZFfFx5oFYKPKeJxR3cFedrjsrFjwQjG
	9zsd94UaDRu4SMJU+fURU86PIrWMVmKoZJDowzJFTvQQ9SixiHMNBkRZ2EM7asoCzzpiq4yaKSq
	QlctRhELOOyQtFdvlXtX+za1
X-Google-Smtp-Source: AGHT+IEajqyZSFI6x8zRKHY2KDK0g90kONHNeVJTjiY08S3QtHt3Nsi+T1PC6jWHNCj/IPMZsGntjw==
X-Received: by 2002:a05:6e02:1f8a:b0:3a7:e528:6f1e with SMTP id e9e14a558f8ab-3ce3a8880c6mr40555375ab.11.1736391413895;
        Wed, 08 Jan 2025 18:56:53 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4ea1b7458f8sm86608173.137.2025.01.08.18.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 18:56:52 -0800 (PST)
Message-ID: <ed70a5d5-8e85-495b-9e56-eae472ba3046@ieee.org>
Date: Wed, 8 Jan 2025 20:56:50 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: remove unnecessary parentheses
To: Will Walsh <iron.will.walsh@gmail.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20250109003624.37323-1-iron.will.walsh@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250109003624.37323-1-iron.will.walsh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 6:36 PM, Will Walsh wrote:
> Unnecessary parentheses in boolean comparisons make it harder to read.
> 
> Removed the extra parentheses on line 305 for code readability.
> 
> Signed-off-by: Will Walsh <iron.will.walsh@gmail.com>

I'm not sure this makes a big difference in readability but I
personally avoid extra parentheses unless adding them makes a
compiler warning go away.

Reviewed-by: Alex Elder <elder@kernel.org>

> ---
>   drivers/staging/greybus/audio_codec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 2f05e761fb9a..dfb5322964de 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>   	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
>   		enable ? "Enable" : "Disable");
>   
> -	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
> +	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
>   		dev_dbg(codec->dev, "No action required for %s\n", w->name);
>   		return 0;
>   	}

