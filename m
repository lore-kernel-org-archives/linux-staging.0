Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3DE26FA6F
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021493; cv=none; b=s52FloPboMMKhDYxKLcR2a10uDgzymfTfo7lauUy2D2I4maJ3lfes0UshyotznwgpOdIUQllfN8pBGgVi4JYTg6KhUq/kUn4ZwGjNbdbmOUty5c+1QUVWhd0HsZIHEEr9d+MpOQIsDy8+aG1BdosnqeAZzgb/1AnYYqLm8M9h2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021493; c=relaxed/simple;
	bh=+fmzMPeUWacPPRF3LvbYKkeMsNR3Q87Kspg2bI3U8yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHhkKWHL6oIvmVprlgAf8l+TPV08SRRB+PPEyFLONUMOCUGZqSuBqKQ2XAYVCX/eaofDLOdM0p0oKZfJ+CfEiZXxieeliCU6J3Ib+uV6ESPci/lRB5B/qlaxCJZgfjrA5HorrRAE8h55MDK/4Zo+Rq4koSzSu2/9scRoB1sd+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEsnvuIt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEsnvuIt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480142406b3so29795965e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 00:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770021491; x=1770626291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1RUynbe4rR3Ig0UQ0DktCKbiavjUNRPlOk68dYYI2Y=;
        b=dEsnvuItVV8S7S/baugQNupQuPXgs6v0i7HklAx4a+IMDNR/w0Ry0JzkWMj6U1H5aM
         FzqGhoMtZMbRin55CKm85c0t4EAAnG8jBU84SBfLnxrwrq1A5s6odmkhwDtdUrMZGtg5
         aDgP4OXtp75eEZsI6wsJF9q1dGZLGx1SknVx5RjMND8Bphj4E6+sJFE12aOSama2NqC0
         x44W/BYTZc6/OKawgHPCsR+BjSDvLu1N1V1GBMT3lElsgUY8FqiHN+LISdVpzU8bLdtQ
         cRQTlShlvmqRN5jv4RfIORb3TaoZ6L0mrpRfnwH16+6LhozTgavVVaO2Nii3s+MbYi5d
         j8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021491; x=1770626291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1RUynbe4rR3Ig0UQ0DktCKbiavjUNRPlOk68dYYI2Y=;
        b=jEDnMn+p7P5p/ZfzqLvotkYiCDsOin03bi3VBjvOFK2AEzshWgEpYQwWnMvK37F6Os
         5hUAmarqHl5ZtEXYc7DxfQ+U/vjkkfws33EmzNr8Z3Vyobd3x8jRKyC2bpp4J550THio
         4tCzuBBAi+xJSVZR5AKcp1njFhqyDzuAevcWgZTb2jX0foAd3nOBKcjwTyC7epPbViSC
         /ph/seI3uG9rsGHNhhx+I5x9u09QVSpLlsfNXl42sMedBwaqhaSLozxMQUTiq6CpSTU7
         67H+e6O1eIUgorpHddBzDfzRBl3Go4yEyUdUMC8MMLurYVzROF9quTaw3vt6MtsbjKA7
         BEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAP9m7cstkQh4ORRD/oP2pE/zNLVkPKngJslajW+1n5XESqz562ai1gpvEqJCalVzCyYYk7ynp1GhrJmWm@lists.linux.dev
X-Gm-Message-State: AOJu0YzZtFEQG6+DTCl5bO8dRurM022HCaBYXmxy31fKAGp3pt5GjMFA
	ghrULrTFTlHv7EAmvPOEasXSGWvkEBBfY0OiS6zsxsWn9Z1GFWahoYUpRrQLlv59bJM=
X-Gm-Gg: AZuq6aJkD9IPtWNAASb2uJZRcLUjfJm6iKNMnEH0OopIlyU1gnU4j03yZypeDeRL4xH
	Mpdeo1Ydu4t6/YnGSW/s0NgmVVjIWodaFPnQR8wPCQZw1f8mwizgJHK78KItKyT8BEBCOXJH+Jz
	JihLAVQowp/mPymp+vYzSfCspTfVuf0wV7xxnHB1eQkbivpxDjpxgDIIJId4l8H7dH4xdmgGIlh
	3MyitmjRhegRVuiegsTH1tP45X6yGp8U3uhYISsNnWeGLhzW+iz45tv/nKD3K6RHzJstZqbdP5+
	mDFdXoKnMp83toRptcY/cNn+mQFJb+0CAw4JFMSmrZZgUd3J78aWWqXkw3SksM2PdUjQkDHACSG
	Y2mggHcNvHuDLgktUqCAgxYrbeLO4KQV8B3T2QHUbJ+UN+Qw/X00sFmmDq4H72IRJaCnnEQFgz8
	kaUGvXUArPNgmVS1lK
X-Received: by 2002:a05:600c:34c4:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-482db012dd7mr143262185e9.0.1770021490711;
        Mon, 02 Feb 2026 00:38:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267b699sm85202545e9.16.2026.02.02.00.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:38:10 -0800 (PST)
Date: Mon, 2 Feb 2026 11:38:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] staging: rtl8723bs: fix null dereference in
 find_network
Message-ID: <aYBib7CfThRZ28wm@stanley.mountain>
References: <20260202063808.664468-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202063808.664468-1-ethantidmore06@gmail.com>

On Mon, Feb 02, 2026 at 12:38:08AM -0600, Ethan Tidmore wrote:
> The pwlan variable has the possibility of returning NULL and is not
> checked for NULL and then later dereferenced.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index f81a29cd6a78..29dd0b56223a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -835,8 +835,11 @@ static void find_network(struct adapter *adapter)
>  	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
>  
>  	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
> -	if (pwlan)
> -		pwlan->fixed = false;
> +

Delete this blank line.

regards,
dan carpenter

> +	if (!pwlan)
> +		return;
> +
> +	pwlan->fixed = false;
>  
>  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) &&
>  	    (adapter->stapriv.asoc_sta_count == 1))
> -- 
> 2.52.0
> 
