Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE70F2D130B
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042093; cv=none; b=ANsNpmZ3Rl6Uc0gm+zVJPZ9ct43tS0kLozqr0qdEFGQcoaUDEv1/4+w8qa3rUoGwFDMwZZ5puOwIV3VVORPI6Dc99wKrN4m8XYsPhXuGpB4Nme9A5Vk9Dzw0zpQgpMCA86Wm2ZX88O7yNdYE0LYS4YCeWmHehJJXjF/F+ZNk2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042093; c=relaxed/simple;
	bh=zeNhLloIHb7V/wRaam3m0I9gFl5CNMbitd46J1Bklq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6VqQ9+jEnSNeswKhBSH/COZSXkyFqfns3Uz3gNOYBKtkAuXGmvYAgkJtqQyx+5jC+7OFSjJ/x1GwBNlqlkWZI1ahYSsFLJMSUV2UXgY+bZ2j1w2qkvhU5UqyOxSHN7QVqAJ9hrO1glPwlWNUG/jnP8ohcSCiPNus8/viXnIZf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AErEF/cE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AErEF/cE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47755de027eso1853855e9.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 23:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042090; x=1766646890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+0+BcFYuJnIT5Gs4sLCThmt9C1DYxR9HC3E5rP7Q8/k=;
        b=AErEF/cE2DK8IFSxk0swK4epQ3kA/q9oXBQ8d164nb2IK0plg3thVZmOzdUtkokIsX
         gehydC/yG7lIp5Xy+vcyVJEvhMwa0EYuBzxeJjoLoOw4RmAZ4vwvf49Fvnr393LStbIE
         2g078paSDgQmk0WmTMSVDmWtRVuTq7ilLSv9xx/qzSF7Ohkz6dzLhlinuWn2gXMw2/Y4
         78gy+LhVeKBLO24ho5Xp784V1EpxrGZeKUGDpNTI6AMYX1RBffDW1hvB3Xpqylb+s9ke
         lvfJpr5Ow75f4cOsxZ/2dxpMlZ2LKrAdMrK2u4kHkjNKROaeQzTwkxNoQFxoqXACA2j/
         lmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042090; x=1766646890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0+BcFYuJnIT5Gs4sLCThmt9C1DYxR9HC3E5rP7Q8/k=;
        b=WNhFtTZ06agwmZRYz08qQ0C0L+DPftkNJb7xyc12FkRjKS+Cgn5wJMcE6d3lDOXbtd
         thp8B5kGLlW/7FsKop5JDufyU6HhBSpal6zXr51pVdJSR50zVGM8Qhpul/fD7YUxHEOE
         GKIqeXnxXQ4GgucXO+kmKhL9Pwgq4sGkm9ZyCY/kqJS6SB8FXGNjx7qLOIqccI56e0/f
         6zhpcntDq5OkLuTardPB5WVhKnc4kteBHdY+koiraoUu2f6Fz7KRdmEIqqCOxMgCPKPl
         x1pvgM20+uYKBpAoB8+xy4jmwHui/ceknIwKMEVcT+DLmRFwtFIm/fPebJFK9b40UuZM
         tyMg==
X-Forwarded-Encrypted: i=1; AJvYcCUaqmn0DvNAbSY5g+S10Gv/CqQYGTvB9VJloNpRPmEPNT6bqWjNP3NITidf7yR/tk9W+UzeRKw26hZ/yO/6@lists.linux.dev
X-Gm-Message-State: AOJu0YxIyTCiH6yNlqphuNasykw/26TaZhRzMN9muYQ9cbSNIx0OtWMw
	2xgITohVEgT4QQw5qGbFsnxjOXPD6Ivqw5xXO5jO00dN8tZnJcbdOQpWND07ThRjr7r2TJMsMlT
	HV8Zm
X-Gm-Gg: AY/fxX5AEAPjTXEHIULCok1dnSgsi/75rIIlEopWOWkgbWeqSuw3trZ5No7zAyeBY/c
	Y+FFTOMSKcu44+v32CNowIvdvEnjuonp5WIuEBdAN/Y5ay9ClguvitUueuHGemJyz4uoaECjmBh
	tpo6TigBGsUZSxxjzYmahEH/hqL2JfjNjJumC5jlMkK92Es8OQ233QdrG8m/44LUakLVrIomps5
	AwvCAzaE1D9NEiI6PXqkJNNn6ipEZSchPaIMluia/nZvqkp7m1eAf0JRWwR0eeQNkq/7bOOeCVR
	Vw4s9QrBaLWtO7P8v24DqKwo87xYZFkMlfMW76b9Rw7SjsOkbhIxw6X/5O6/CZuxqoprEdxBUx1
	8585Zk5YGBwqHcEdZwWCqiwTF7rvx5BzoyF2zUJ81UNPt0uaZwChlcnz/jGTwIldW0XSO6SFHio
	QB0oikNMSgDmp9uDaO
X-Google-Smtp-Source: AGHT+IEAWD/Hey5CzPkHXCwKI7+ThamQbiYueMminqdn5DAPJfrvb/dTOJDxn0MiX0EQTJMNdhcygA==
X-Received: by 2002:a05:6000:2909:b0:42b:3ad7:fdd3 with SMTP id ffacd0b85a97d-42fb44ba20cmr22198021f8f.18.1766042089937;
        Wed, 17 Dec 2025 23:14:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324498f8f1sm3222838f8f.21.2025.12.17.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:14:49 -0800 (PST)
Date: Thu, 18 Dec 2025 10:14:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: fix firmware memory leak on
 error path
Message-ID: <aUOp5rEWwjOp6-nU@stanley.mountain>
References: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
 <20251218011414.1781294-2-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218011414.1781294-2-samasth.norway.ananda@oracle.com>

On Wed, Dec 17, 2025 at 05:14:11PM -0800, Samasth Norway Ananda wrote:
> Fix memory leak where firmware is not released on error paths in
> rtl8723b_FirmwareDownload().
> 
> After successfully calling request_firmware(), if the firmware size
> check fails or if kmemdup() fails, the code jumps to the exit label
> without calling release_firmware(), causing a memory leak.
> 
> Add a release_fw label to properly free the firmware in these er:qror
> cases. Also add an error message when firmware size exceeds the limit to
> help with debugging.
> 
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 57c83f332e74..0eae624a36f0 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -345,14 +345,16 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
>  	}
>  
>  	if (fw->size > FW_8723B_SIZE) {
> +		pr_err("Firmware size exceed, max: %d, actual: %zu\n",
> +		       FW_8723B_SIZE, fw->size);
>  		rtStatus = _FAIL;
> -		goto exit;
> +		goto release_fw;
>  	}
>  
>  	pFirmware->fw_buffer_sz = kmemdup(fw->data, fw->size, GFP_KERNEL);
>  	if (!pFirmware->fw_buffer_sz) {
>  		rtStatus = _FAIL;
> -		goto exit;
> +		goto release_fw;
>  	}
>  
>  	pFirmware->fw_length = fw->size;
> @@ -415,6 +417,10 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
>  		goto fwdl_stat;
>  
>  fwdl_stat:
> +	goto exit;

What's the point of this nonsense label the just does another goto?

regards,
dan carpenter

> +
> +release_fw:
> +	release_firmware(fw);
>  
>  exit:
>  	kfree(pFirmware->fw_buffer_sz);
> -- 
> 2.50.1
> 
