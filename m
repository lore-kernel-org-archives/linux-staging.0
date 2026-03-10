Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7013E8C69
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127783; cv=none; b=X4vbs2nYjSHaY6uciGlmQ5Y1datNgQjzfziCYrwFxAY+WCwfu9PjTKlxIJX4A4V6TO8mvsa31m7BF/rRIUA0EpIV7k2pBMHRA3HydhuYsuAleMAVcJR46TNy5HBKxPUG/Izc2qLWX7V65POssK4IrZSFMP2A5cOmpt5zlxDlocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127783; c=relaxed/simple;
	bh=DxvYGJ4qc1BsKX/LeqVEVdiuVGQfcE+EHoxieX2TL98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf2dcsdG8fATB1lHb2meJp4pT/io0gpP/gjhDwblmD1uEcBQEQ7EhZ3NeK8ahJ7p8rAtQNYADIhumRB5WW+2kg0eN8mu7sV7622lcOc1dSAqAoOkEjfcRvP/gpXnvxSH4qAV0s/J/X23dvCvmJ30SLdD5elHxTVaXsOkNNy+D+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i3RK7KPn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i3RK7KPn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534e9076fso15338125e9.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773127780; x=1773732580; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RgzvsiPes0hJebJCP99LBCg02VSP7GhFHZ6dNaUYkZQ=;
        b=i3RK7KPn6N5Mc07sQUslWMD45lf4OWADbaOKR43+vcFHkN2jV6FOKlNroFPpqmAKIp
         qQcSKkbt79ux3JxRvKJa+4p3R0YstAGutxDhA0/TrAhDTLnyi9seGkmDTkBwFgOuLbLB
         R10zCbdC22j5SowLbDY6Na+IDkQsrBZhDnrIA/8pSdpYDPfJmmNBoL2Z+isGj6ahEtsa
         6XU0f97re5y6XYYugM3JeiPc9QtBQjyPvIyPIbuxm5/29k6x56uK7SGwHmzUno1N1IxO
         fCDp4PlOU1vwLgzTXm+FxlGQyWILZofByH4Hs4bZe9nfAleuBqNbe1DN4h/HxEbuH6+A
         je1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127780; x=1773732580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgzvsiPes0hJebJCP99LBCg02VSP7GhFHZ6dNaUYkZQ=;
        b=ESyLAKqv+LWFtsn5evJiGL1Oi5heqYZ9IPWxiFTXTDq6CmW4ZZCepPqmopOgN6lhwF
         kwlmn61sUTWkMHLvAE3Nk5RNh/qBlllDXUTL+zA1LdN0el15jvOz7IqIi3bz1iY3JBkz
         zCxVQbF8onllYpJSH1vCWWN3LToziXR4kVwUvDjkUwib6rPHlGTX5dDetX9nnU4fjgao
         6+cJDtkO7KGLxv7OX1qyHtFISh3D0EBe+AKoU9yJa65iRDSwobErmj5NAUM7tNmJco20
         7B6uQ0NW/lFV+ymaTf8sC5PXbJalktuUHEEHHoH7O5yMI5Lc07YSMyYtVNnSSfBY+g6N
         oQlw==
X-Forwarded-Encrypted: i=1; AJvYcCUSG/edT+VO3360Mr4/qj8AezAz8jtsiBZovCBZCItcggV6zYqNWpY53g+tqFh35rPN2oKMZpJfxetiWoSx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1zjfFxltGicLU9LejO0+vkn2lvE4DNOXW+DUkYLe8E3IUP/wV
	1xvQN29tV9Rcl9jsgzgH1IRusruoH4IvQln4ZdmyMJqKw0A5ldstvUe1H7R/394yxNizYXW7ytU
	teIkv
X-Gm-Gg: ATEYQzyeac5rHd1o4ffeLLlaGz4oVU+cUGQ+gJPyf33SmpqrO7LyzqsuR43xQGZjdns
	mg/rUYNQYDSjflmOo3Ajzfiz5dxWJV/oiIu07mMxWQhojHq+EAeIm+RhOc59d3yx+m1A5eH/x4F
	W010imPBw0DA3SdtBc78IRtsLGSi3QW/KN/mMjBZUOUyO9fdIrmn7u39x2ce/g/+Kif2wFvAJnF
	9mZ0FuZY12fCMpqRjywdclRFkgJ64bGZyamEC/7jjOvoOoGWXbyJxV+JtIRFhPEHDNAAH0Q59cP
	c7cBZH/O+/uFHt1CjwpmjXzcA+snolgXUe7yWHnWvKsFXYGFEIYyQe4srgq8bZ68Nu1/uNuwwjA
	LFMDpTyrYumtAsS4/568sjqgML7KfHFsOtmKQjpwsgMDxtxw/z8pY/iKqxXqBDZ7GiEVBApi5+P
	SkQJOn/eQ22RDzgFuT5r2ZGuuZrfmd
X-Received: by 2002:a05:600c:4445:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-48526922533mr249082875e9.9.1773127780238;
        Tue, 10 Mar 2026 00:29:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852470c697sm106244345e9.31.2026.03.10.00.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:39 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:29:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dipesh Chaudhary <me@dipeshchaudhary.in>
Cc: gregkh@linuxfoundation.org, b9788213@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: add missing blank line after
 declarations
Message-ID: <aa_IYAWSSdrd-WuR@stanley.mountain>
References: <8fe61fed-a97a-440a-9cf1-f20dead4e265@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fe61fed-a97a-440a-9cf1-f20dead4e265@smtp-relay.sendinblue.com>

On Tue, Mar 10, 2026 at 02:41:49AM +0000, Dipesh Chaudhary wrote:
> Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> to satisfy checkpatch warnings and improve code readability.
> 
> Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
> Reviewed-by: Bera Yüzlü <b9788213@gmail.com>
> ---
> v3:
> - Included Reviewed-by tag from Bera Yüzlü.
> - Corrected the changelog location to be below the --- line.
> v2:
> - Capitalized name in Signed-off-by.
> - Wrapped commit description to 72 characters.
> - Fixed duplicate submission issues.
> 
> drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 666e241704d9..bd295bdd73f6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -991,6 +991,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
> inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
> {
> struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
> +
> pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);

This one got corrupted.

regards,
dan carpenter


