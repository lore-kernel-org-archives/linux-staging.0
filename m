Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512AC154454
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088949; cv=none; b=tRYJTkHHST4Qn0grQ3evQ9+iUOUO8nZLdXABXBUSKcaCvLzkC4YY9yX+FEE5KgcL9lNtOF2TmoyeLV5cHCvR67JqJmvvM4nO4Ucd/5RVX/eVB5hRgDQOkV64z94Yb75HyOP1JbcOXRPEXRdHIPHEAco6DFLRfWwzcK6eOf6AUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088949; c=relaxed/simple;
	bh=icQWZ+I2XAhSTd8sxZmS/0yoEZD/GXaRmxo2oEVeXxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krfMfHdafx0pC8YJ8Y2od8zUbP+oBBrI4EZi6xwlJXjQZnjUQ2U1AYO3ZBdT054xOi+ityu1vU8mauUC9Fn7br0Qx/07vOj8YNNIUBL8ytrqLGXJoxrQsD02m7I7zdjHiwYrXyL4F5d1Ye730MqoqItHUijMkhjDDoKCBObfSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlLkv26x; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlLkv26x"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7aa086b077so853798066b.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729088946; x=1729693746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCk4CbUUTI1U062dJIIhHjMWMVQZWsBO/XvxmIwY7OQ=;
        b=NlLkv26xEqrFhIFRtt2+H8jPVW48Obs6KyWYH55ErDUCccXKHvJVPY1vtrx/dUDCP3
         QCTUj+8Z0HugffXOeAbxtQAJzINGSgEkJmIo+qSa3UTLeHeiRMy8b6m1fT9BHSmm8Ap9
         1AZC6ALARZa5Pmkym0Lnj0867GizJB4AX6bpaBvVF0YlTl9Lg61oecgr+CdvQFsFrNVT
         qsYMAsofwlRzwS6KyWU2uQQcokjvfIFYGMr5CayqPxKd5zy+W5uikw6HlNtBbkL9MCyO
         XLgW6+UIQJ6FlsA5xS3mf1yxOXLc8+b2k5GMesEXg6OG+gDgjCeqZZc3Ke8c9fdtBP+O
         w0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088946; x=1729693746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCk4CbUUTI1U062dJIIhHjMWMVQZWsBO/XvxmIwY7OQ=;
        b=Og/xtFRXfa8aaAC/crsBSlIqPbA5PKEu5OhqeddqoLrmnuo4BLyqac5U7xYBtgh+xW
         kPe+Y6zGuLrQxW3HFXHzvKZYCAfC7P1vzVrtVIKC81X+Osqrp+k8wdWaQLkSEHL54/9T
         zdtfP8BOK5Yf5em1mkfK/lrmMQYvUON58nAayGyPzph6N2dV9e3fjrGqive/YTeetaXz
         +uDX9p9qAuE+cb6T4yXXjrldRowgi2TSCkUeH78FftkSQqN3S4uG41Crg5/1luZrH0w0
         lOrarHjlvDrrcv0MzIhvpFXNfma35f0EaxlBgg0HrJZPeiEDLy06+IZQCXWSpA63xVep
         ZchA==
X-Forwarded-Encrypted: i=1; AJvYcCWzeslMohZz/tPn/54M3Xow2S00zUy3/X5ujkX7z+O/WJ1ThzDxWL06bkkXh618mq6FjnZFYub5SKiBV8t0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8r4IH8KGFYD/j5OPPLgz2yJjl+Ng+hgFCcNTdABIZwMdAeAKb
	yl1B/QxPDLrcQ4gg4L3TJmYK8LdHdaOWcp2nRrda19xjSm2H6gwABJDu/CHYU6A=
X-Google-Smtp-Source: AGHT+IGMf6c19WKe9wIPYUwPP1xo91yToHx+w8LgjoT6YUBh3pPjVmAdHztMU5/WsNq7Jyaj5S46Ig==
X-Received: by 2002:a17:906:f59b:b0:a9a:238a:381d with SMTP id a640c23a62f3a-a9a238a40demr579327966b.52.1729088945651;
        Wed, 16 Oct 2024 07:29:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2988c5a9sm188642166b.205.2024.10.16.07.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:29:05 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:29:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aymen Khalfa <a.khalfa.1012@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] drivers: staging: rtl8723bs: Fix braces coding style
 issue.
Message-ID: <405561d1-4370-4d1b-bdb7-77460225ddb9@stanley.mountain>
References: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
 <20241016125630.2479807-2-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016125630.2479807-2-a.khalfa.1012@gmail.com>

On Wed, Oct 16, 2024 at 02:56:27PM +0200, Aymen Khalfa wrote:
> - Remove unnecessary braces.
> 
> Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index dbfcbac3d855..1ced6f7ac552 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -56,9 +56,9 @@ int _ips_leave(struct adapter *padapter)
>  		pwrpriv->ips_leave_cnts++;
>  
>  		result = rtw_ips_pwr_up(padapter);
> -		if (result == _SUCCESS) {
> +		if (result == _SUCCESS)
>  			pwrpriv->rf_pwrstate = rf_on;
> -		}
> +
>  		pwrpriv->bips_processing = false;
>  
>  		pwrpriv->bkeepfwalive = false;
> @@ -556,9 +556,9 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
>  
>  		LPS_Leave_check(Adapter);
>  	} else {
> -		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) {
> +		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
>  			ips_leave(Adapter);
> -		}
> +
>  	}

It's against the style rules to have a blank line before a } close parenthesis.

regards,
dan carpenter

