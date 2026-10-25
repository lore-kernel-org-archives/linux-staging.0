Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936731;
	b=kqBp0uqYQCadaJb3jDpoxn2hSBrJyMvMon6IsA3LqTQG49Y6z0cggj3PzD6h+4NZJ8o5
	 boPXHFSD82zhEiumCkrepBMXGjXCxbx/pcqaH5hbKI5ZbQ9/+Vik1pZC/Vxe6fe810vff
	 jbRXKrrr9XQ/yHQIfBqb5fVzQQc6YeRjWNKSOlMGQOFbnHDZmjEaEGMXNa4LLNyZ6Rsk4
	 hsE7wh5zEKtddhqQoNrNEFNs/aV8ZrP9Kzz1h9oyCr/nG16DHMcbVSVB4wrHl5WD3w7uq
	 P6+CS5rbHY7e/XplGigBmMyJ7f0znkpRU/db1RhEQHjcw8/wiIkaDabYJAoUa2Wrd6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=so8lfUIk2kpbn92EQdY+sr4PHE6OnQZjUslmbfm4DwQ=;
	b=nL0HY6scs95d7gGVR9KcJ+2Snvk+EKCfH1vewqgNk7a803kK2UKXR0rSZgp3ikwX+WV9
	 B5hDkr68LVo7oXUkMNMkqVwbVXfRPT0nwRzmC3+SgOPR4l0UO7Vi+lFV6k7DTY5+2zN1t
	 7LO1JyxTonrYI6QqIegIiwE0a1A2TN/LUrhQpaJ4O0Swg5c14kH5btQcVORO622iiDq8d
	 jSY3gagr5CGV/iPUtoZ6Bl01rrCN7C5pU0bsNnDUMEGh2t4VKftiMX2zrOkN7lq/9jRfV
	 yODwysBhLCBwtcdi/Fxdyvq2+8Lfvldep8UX+oMjV4cQnNb0Zks44nVg2nMRKxl74qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hPBpVFKG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677C606A31F
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5677C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hPBpVFKG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so17622805e9.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936730; x=1793541530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=so8lfUIk2kpbn92EQdY+sr4PHE6OnQZjUslmbfm4DwQ=;
        b=hPBpVFKGCYYQzhDXoefyzDZ0LJ4vn8H7E7F6PdpKCuPlnk8Uk7vXC7t1u1Ocskt3F6
         0dSIzC35YxpCsIU1rTFPDLqeKWtEePknViHEXkfBwPHznrMfWIShPFiDZrCx8KG3u9Gk
         KfvfSlsEOEjVHgTrSoli9kJpBqhPzLO/8sO8/9/2EPgD5K5PaWUYnZ8BGH7a+pipeKP/
         HkM1i18OZuoUDdCRmWKbAA1MisuCLsJc+YlCyBy79saq/rS9stuCUZWx1W5RwrwN+66J
         NEmeoIUMRF0A0+MCltVr1526qu9VyrW4zueVGmzdOBaD7D0ICDjEuqcIiwguykJVWisC
         yrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936730; x=1793541530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=so8lfUIk2kpbn92EQdY+sr4PHE6OnQZjUslmbfm4DwQ=;
        b=OKTrKLasOpvWA2zFi4XIO1lXLxfeTQdDAKIX4IQMQUyIAj9F4fn1oMDDIzcVsxg9cE
         H4HaP6xPowctDKmqwgEIjw6zaLd+5zrXVGk3vIvVqtJ+YyeUKGI3EJl6u1GjpwiynXpg
         smQuyQLWhHcXXofBIUX8sIwKgb0i1OAjDnsKZa6sB9DaGEZ91UFnanx4VkMr2N32p6LK
         6rWIEQYckJb+wUzbtE1Bxmc2/c5n6Dmdw1UOCkNcFcQPWwr/c3YEZPZ+NfMez57dSD1p
         T2rp9F46cLX7FHRLP8txSzQsj/mT2Y5l0YnbD7s75YlAYJ/RRJXcm4CWnkyK2k+PF/s3
         /1og==
X-Forwarded-Encrypted: i=1; AKwUvBwPPXIc6W5PXNtF9TtQovk5OIF/OwFinAhP1I2djxmDse2OpLfzkHirsfo00G5d3bKzS1Wh86SvUnqr3YN6@lists.linux.dev
X-Gm-Message-State: AFq9FYIsMmVxrqkcGXnYAZf8jp8TXCmj0zIxWeOON9gguWvQ6qpGdv8d
	LvkRDjx9QS0H1/KlOEahRTAwDv2wNyFUvxIAqsqPd+32eZhJtzWmA84M
X-Gm-Gg: AYBFou0DW8pfLd4fe8T5EQ/KDIjnjvZXxrDAzIcQj/v/RV3TPEcWkl25ae+ijTQwz3+
	OXRrdc96Q4V3C0bd5V5adwexcp9T/4PEKH77tsolZsV0WCbAEP7qVpKvtnZIfp0mvZrMvNJZWCB
	u1qaBpirdq38po+4BT/++MQEe48wWqZqYLXJv6mGIuHMSwJHPGsRGmqlwQlxZA5gn0wDEY0xtSB
	6B7cN0RJAnMsFJnoh4DUTohSofxg21c0vnn2+gyGo9T2sH4uYFSS21e5IiDJ4FwAgW1Ft9YSo30
	dfQ7LzxaB29SE49QYQE6/B2AVJdKLqlPiXerBsKG43TEVrkCh0tWbdNIorms6lqsfPT0ARqxWt/
	iu3wTHISG/5Thwx6wpsgGTyHRNTSSLUiW/pjmxn5RdGcDESiyGvZUzZK8edkrc9ofnnTJa0aqI0
	L+igc8PWkF4x4yGLlI9IsRrhOB/BVFb1YiDEW+XPwLW3lpJfDSj/4eYjxvo4P4VTPtAlgkWXWnl
	OQNLx0Bql/0PY+NI+5U2v67YRAhzNrSbwHrMLlOpp2cTvrq60lqPSMha5vh00GLh5eAUuZiEQ==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr75846955e9.24.1792936729550;
        Sun, 25 Oct 2026 06:58:49 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm123575575e9.0.2026.10.25.06.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:48 -0700 (PDT)
Date: Sun, 25 Oct 2026 16:58:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Haasham Khan <haasham93@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unnecessary goto
Message-ID: <at4LFOUt-XGzBAgS@stanley.mountain>
References: <20261025130258.10747-1-haasham93@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025130258.10747-1-haasham93@gmail.com>

On Sun, Oct 25, 2026 at 01:02:58PM +0000, Haasham Khan wrote:
> The error path in hw_sm750_crtc_set_mode() jumps to a label that
> immediately returns ret. Return directly and remove the unnecessary
> label.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_hw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index c4358d3e5091..22f93277e91b 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -272,7 +272,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
>  	ret = ddk750_set_mode_timing(&modparm, clock);
>  	if (ret) {
>  		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
> -		goto exit;
> +		return ret;
>  	}
>  
>  	if (crtc->channel != sm750_secondary) {
> @@ -332,7 +332,6 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
>  		poke32(CRT_DISPLAY_CTRL, reg);
>  	}
>  
> -exit:
>  	return ret;

Change this to "return 0;"

regards,
dan carpenter

