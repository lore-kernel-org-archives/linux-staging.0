Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7923ABBE
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771488937; cv=none; b=IhPqsq/IJPbWgEIMiVmgOxf7a70coKiRrUlQl0KRvFLA7GnZR0+Nlswgnpmot/xi0var2vOlP+tSlQ+ZiJ8JbD6SmM43Cbglx8Gxngg52MHISUn+rhPoDDj/ZzhEP+tIrtslySP47l1JWsRCfZpalwgnV+GQZolJvQHaE/gpXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771488937; c=relaxed/simple;
	bh=Wdx3xmxNiGCvEPi4cuSBe9oyhc3dUiJSTOqJxC/Ply4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI+EmczVm3+b0dz3zyD6mdWi9hZ7QZ7Q80XJs324LgQ/GCjYpfNYGgNvEtbhJV3Pz425yAx2Pc4q0osx2a68QkJ2dj2mjP7Zul6QoUDV6kXOit1d8BlwNMt91tV03SeTDMLl/7iCKCcoOFn9XFseLdEj/PkH6EqldHWWMDaNcFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r28VXMO8; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r28VXMO8"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4837584120eso4435965e9.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 00:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771488933; x=1772093733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jxz7fKRiqe7ydCP/cmXuqRgyR+949hjVQMB2zWdb5BQ=;
        b=r28VXMO8LWCgrrPDhFcdXjZZqZ7iHWP1yVSppBId3FwUqA5XAZV3pXOVXrFfRB+dCE
         p69NcyvzVkqc0J+9/UgHUj4DgJW/Y75Qi6z9I7KM951JDXiU3ieF6yHCpGokKsUb+plj
         UHleK237QeCGAE6lJXmJH8hcqmTJEq6JYUGkfakE8YKrZkJ+1F1W0iELts8AEBJ+8Gpc
         z42fCAf77nvSNiBctvuTDThatY2cv4AT58IXHe7xxvgFhuV5JOblDrkE9qhjXGiPS9fE
         zc1wNWAV8tV2XsbSu7bdjEYaIUVyRc8JDqA6jT7x8ZKv/iWUIO8H/WVQVaEET/ZmrkLx
         g3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771488933; x=1772093733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxz7fKRiqe7ydCP/cmXuqRgyR+949hjVQMB2zWdb5BQ=;
        b=YNM/NBZBouyqGv9gJv/85RO35LnsSR6ekXXNbKlw6ZZXKCk6JwoFXZjB/zBjkguo9m
         CrAmE6KHR7ISubL8R82fexYOL0vZo5oISkxZRRp4Wg5AKnbHP9zU1j/bVUr6AAbVZbNX
         36PMan0hWvIh4A9oP8YKD5+k9ptg4Ldj7ThPcIJuMJBpxE8fl8DJz4jAK6EL3jfyIuqL
         NBwFccGsI3OSpFKU1450jyxwQLZ/UnUvZp368AMApWt9lvH2Acgy5I8OufC0ZmGWzgv8
         nYDhBDo4mYagLFZLY3WO0MWkcaKfKM+RBEFdQtoUJ6m0hfE7KZu7BQ7YaLx2IDeVU2JE
         myHA==
X-Forwarded-Encrypted: i=1; AJvYcCWQkuve4b+dHvGCzRgRWD95stcpKxl3gy5xaaS7ltuFecN1xaBxSpAxCU9QotZE389LvM+Vlr+XcUi+deal@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4ENGx7YKusa1OoVtaEn/0OcIoHE5PpW803p+AinY0qVp0YtMJ
	U5sqSR0RTFwxr1C8tV+58VrBMJpi1hvQOayaQS6JhoqrFWsKR4vnszRb925Brr2BLYg=
X-Gm-Gg: AZuq6aJvd8AOp++IyU0DDDkqt/6smf7hlMQFeunekL/Nz85X4h/c6BC6esxa1hHCiFP
	l8aSKZGJ9rHNuIY+gKiFIWyAPbjEIs+qETa5AvX57KjUJH8/vdKkleKWRlwAmZBcQGWhAlp3uPT
	wL8/kyoDPzB4cKFGt23813EDiQo/EE7kFZY+M4I2LlDAfiCC4oiEL85zDhalutygq/XDDIsI1QY
	8izn5JyzIjXI+Gwf2nUW82UdVh76YfcX7HMmryWpyr4pF6gJkIfrTOVttjeTGjSzYObJU3ttRWH
	MTXR2ElvRMhrOIuzJj7nuns7BmN8IlmsPuhWTd4VoRXmM/WYjRHSjRZt1PfoVl65V9xqNNpki6y
	usHNbEwuv7muNRXHm4GZmK3mC1nCX2ohszvQDmF3PV0p0mW+AJg18sqNPsdkB5YsUghlTo3wlQc
	BX8yDGckAknOXzldI2spH2c90JTVqA
X-Received: by 2002:a05:600c:608c:b0:483:103c:b1ee with SMTP id 5b1f17b1804b1-48379b8c009mr265672865e9.8.1771488933255;
        Thu, 19 Feb 2026 00:15:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839e7f30b0sm27232955e9.0.2026.02.19.00.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:15:32 -0800 (PST)
Date: Thu, 19 Feb 2026 11:15:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc_obj() instead of
 kzalloc()
Message-ID: <aZbGoaG30SE6Cv3F@stanley.mountain>
References: <20260216161733.7704-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216161733.7704-1-mariyam.shahid135@gmail.com>

On Mon, Feb 16, 2026 at 09:17:33PM +0500, Mariyam Shahid wrote:
> Replace kzalloc() using sizeof(*ptr) with kzalloc_obj() to improve
> type safety. kzalloc_obj() ensures that the size allocated matches
> the type of the pointer automatically, which prevents potential
> mismatches if the pointer type is ever refactored.
> 
> This change cleans up a checkpatch.pl warning:
> "Prefer kzalloc_obj over kzalloc with sizeof"
> 
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 22dc36e8e38a..8cb9a760f763 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1954,7 +1954,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
>  	}
>  
>  	if (enqueue) {
> -		pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
> +		pcmd = kzalloc_obj(pcmd, GFP_KERNEL);

This introduces a bug.  It should be kzalloc_obj(*pcmd with an asterisk.
Also there are several other conversions which are possible in this
file...

regards,
dan carpenter

