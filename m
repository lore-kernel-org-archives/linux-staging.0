Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D812DDAB
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638037; cv=none; b=sCFypsl5R5bDn7AZLP6r7IpZBUz8Q+cCoUdzQI/L8swj2RVkTur6GKOE1YpMveoAJJf91S7Dq3DBSHGAtvHUfF8ALyr3YXeSyzriGPGwc18DjdD0u1Q9LMv9hJII+JJXHnfk8OqucMJsS+McbXbrKdqDZmih9GPJjezi+89EVOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638037; c=relaxed/simple;
	bh=cy9u3VtVrRuyTCsjJgnGYGt2u+Rm+jFJiYwOK88je84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDKB+5xtez5xmV+IK0nbl3kjGUgHNxjlxhWFnhdh4bvVrwHjSB2mILy7DFG+0APsjLiIFYnlwL6Of+sRsxyxFkn8gx0xLgOpiRfa4ArWK61gScEoULSjLjHlk9xzmnVKm7C59BH4Ed5jVAB73EHIpzI/AgLFFKT/mF1LqWTSsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mX4AT6cL; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mX4AT6cL"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso11909171fa.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638034; x=1712242834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1wJgbtA/vjDhwvz63u9VWEaiKAUmcJOl/pw5kAYmOlA=;
        b=mX4AT6cLpY0yqKHxnVXtn165qOpHEHgvc1Pbq+kHwbarX0WMgtd//ureprqaiYIfaO
         xR7V/TfDMQdmEC0ObLqJ9S4/q6A1ljw8jMjkgZcs15vvPLe+vrkp+GsRsutChvimhhI6
         0IYiodp8B+7laVsYKX7TQBW4B0Cf0sE2V/GeGW7bxhSdxvyWLbPbD+QPzET/+jAxc7st
         7z/ulquV5YmttTsRRtfcklTNf+1CAj/J6/vTI+qOOVvtktvdeGaVMcv71rG1IwrJi1B9
         3c1zi46oxvFFbHz4uCQ8I0bw/1V1xjjHcx5a1z9NPXCS3SAnenWFqEViwoHL5CVkeWOa
         6VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638034; x=1712242834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wJgbtA/vjDhwvz63u9VWEaiKAUmcJOl/pw5kAYmOlA=;
        b=IBwwo9SNcifWHCm8pszMR3WX/5rdH8KUzEjmKISFvMkv3rB1VGVcos5O3AcPfPSiYT
         Dezm3ouk6wETFeVbkc8365SByZ0QqTsZoqOS/n4jomH6Nedtg5Zn+i5B4GpnZ1IuyUZ3
         NPPdb8qizIwRqbxUxvlMkbEmIN1cIR0bkBUdda60FNnc98Y7q7zPXPfUisd+LXXr7qA6
         0I+KJdGZdGsN9dyrHEqDGOCmfssuMbabvveiKvL8gcOlakqkCkVZ/KFb7Fq0X3ClzeZV
         0/xnoD/oPWNQXqNfR/csRaUH/dsktriGIXuUJXrsK+hDiHCiCj9bXvmajqiYFo7K6MSC
         +SgA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ki2nk0arxYac6sh16dTjE/6h20UMbCYm/868ahePQKc926p+abhTg6r+9hZLkh0pzCH+T1pisZgOy6cOH9EjSOoXDtNMEheIZFZ/pA==
X-Gm-Message-State: AOJu0YxVw5SUk+Bcu++HD+aGGiYisd8QBSNQ30AyE6Tw45CYWMQcck/0
	eAcgNlasP+i5VPjOD1LOEQdQQC3ubVE8dJRuntHV0rZjMaTjLvJ5/HzP+V/ovwA=
X-Google-Smtp-Source: AGHT+IGQ5CWKUqLKQ/deCqDvSGjzq/7ohPtTESkm+XyAfECW03YuhSnOZLJc5W2tTuXIQeRPB5tQuw==
X-Received: by 2002:a2e:9591:0:b0:2d4:2b05:a671 with SMTP id w17-20020a2e9591000000b002d42b05a671mr2299444ljh.32.1711638033575;
        Thu, 28 Mar 2024 08:00:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402400f00b0056c5395e581sm703497eda.70.2024.03.28.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:00:33 -0700 (PDT)
Date: Thu, 28 Mar 2024 18:00:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
Message-ID: <76214105-94ae-4540-8511-e9e2ff6d257e@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-11-arnd@kernel.org>

On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is from randconfig testing with random gcc versions, a .config to
> reproduce is at https://pastebin.com/r13yezkU
> ---
>  drivers/staging/greybus/fw-management.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 3054f084d777..35bfdd5f32d2 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_update_request request;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);

This needs to be strscpy_pad() or it risks an information leak.

>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
                                      ^^^^^^^^^^^^^^^^
These comments are out of date.

>  	 * fail.
>  	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> +	if (ret == -E2BIG) {
>  		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
More out of date prints.

regards,
dan carpenter

