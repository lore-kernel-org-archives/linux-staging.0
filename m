Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8530EF7C
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002711; cv=none; b=D6pmtQYPNPndb62RCGTkQrrfSk1w9gT3axscODs+/D0bGLSspuWzZ3LeaI8lWzCAQodb7OwDoFMjAKIwR4Si6i4MHRwZi+hEOvwf7QLlI0fLGjcDxEHJH1WktV+aR3gIu9X2lwRQGM4koDT8YJwqPsRLbh5wMjd+lTlcGffxTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002711; c=relaxed/simple;
	bh=uvZsRSj7mCjP5umTIAlh8QVei37SuoxZndYxK/47sB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/R6uuWrOweFOKvUzkxgtlmL52t9jmv4EZZxtoNmEd6UvF1a7O9j4aNCHUM4LVQmScWpReiuFmFj5C+qHzV/UmWEw8x3cqrlFcIfQz/g0eo2scKYRRxoPuxRhBjHQLhknD1LcbfGsmCW1UQSbn/uMonFubrApiSAFefI/EbXSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4fSPgDh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4fSPgDh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso3010025e9.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 22:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002707; x=1772607507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyHU5sMgTd3FgAYbrP7QK+9rU24euug+BHUoAhLeps8=;
        b=I4fSPgDhNQ4A2RfrPiyARXAcb1aoffBmeR6izjBekAW8ueY5V9Is2kmjyGPBGRGS3U
         dEXUXCPPHv3rBsT4S4JnPwVSc3XeXZeTVMFO+KKmACLB+PYmFE8saDuSbjUigC8HSC5U
         Q9t/REizDoR1FBbttkSq+JlBBBEg5M8366rsquLFe3SneSmi8p31NEVqftc1DZpHkkry
         DTz5ZwnN3MfUiiEsy2bnRrZlFh3pi9rwWeYBe0ApD13RhqV8MQa9cixlnsdjVNyKd1q3
         PRfbwAiboUVNultO2J9/7pC7LFmAK5qNG/FgDRBrWjP8Vp8Z70YhQ+4wYXaWd8Qz07GM
         ni3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002707; x=1772607507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyHU5sMgTd3FgAYbrP7QK+9rU24euug+BHUoAhLeps8=;
        b=KZMGB+tXysMjSmBGgiRRyGGyS6nPr/Skh2nceN5Yukh+ywtPo6vCRezR7Z5XbEru/p
         /HGQIsJoDQKLArmPbbAgct/n2Gg8mpLr6hSOhK/ayaY/gmpUVdMksDJGJUbPQDCqW/uF
         yLuCnZ3/I2fs8VhtNztbyDKS9HpVkuizIuyfLqJ90AeEFaAqHitXNGFxzoIScbbmOO/z
         VaMXVBE6W8V0A8K+y6XJ3x/bm3YW6sMsGcWCQNn29bxhCQS6FimbE0GkQJjUafr8jaD6
         RpvGp9h0fPszZxnuVVWhXAEFk5HiV/mvyIm5ztVm12Jwg9ChfeORhwh4QwRGS0zeLWiK
         6v/g==
X-Forwarded-Encrypted: i=1; AJvYcCUDPxxiKg3YHLadM4tEby5RZHZye/B2EiKKBrw+DE3YnRrdd4lX3kPZ4/t9Kr4XrJUzEnZfTmWsP1In1eV8@lists.linux.dev
X-Gm-Message-State: AOJu0YzBpao+glH883+LS90MHU7874TT64Ye9Ok51Ykoqz4fk4eGXS9H
	Hym1PAlI7WKrPnyQUJl8jDK6Hpt2p94uXtIdg6nOut7/o1yfkTR39XCBCK/kIgWX8l8=
X-Gm-Gg: ATEYQzwbIGb37F5g5xpvOzIlWtTK49FjMhHdpXkYp6uqgDeKH7j9ZZZAHqocWhEEYh2
	ncHyHnfNvEs/ARyrMSvbrwxk3KNGCcDW5R8+ILfp0dfTI1ELsTGuXsemy5zynJgFWeSGkZO0Ix4
	rK9ncn2sVwGGjXZT8FzcSj3ttwm2+eeCpstrl03XQBRjEQdHF5fPt+qxmC2dtOx/0Lz4l4kJ/gB
	X6bv6IFi4bp6zBUcnB0VDX1ay79FTbCix/MQLYltmO6uTrXeUnoeArk07zC7U/wSoLiOvG5iyRf
	jhZ+zPKVGsIjBo0eG2tO7uIURe1oz/vBTQ+tGWAuBAuJud+Z6t1UwbfdK6ZEokCGbEJiS89nO01
	hM4n5Z5gTeuGX4BRc4CPv70kQ7ijPohG4mlmkrV+EuWsEnKSbH6i0MNqQXdK8Csro/JnFRCe457
	m6SghHvV1owsciF2V6x2frGLOR4AOG
X-Received: by 2002:a05:600c:1551:b0:483:a2b0:d210 with SMTP id 5b1f17b1804b1-483bd726f78mr42505745e9.7.1772002707511;
        Tue, 24 Feb 2026 22:58:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f19f5sm118917625e9.1.2026.02.24.22.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:58:27 -0800 (PST)
Date: Wed, 25 Feb 2026 09:58:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/21] staging: rtl8723bs: hal: fix line lengths in
 rtl8723b_cmd.c
Message-ID: <aZ6dj7S6yTifBaqq@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-12-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-12-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:38PM +0100, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> Break long lines exceeding 100 characters to comply with kernel coding
> style.
> 
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 103 +++++++++++++++----
>  1 file changed, 83 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index af6cdda8238d..92951ba4561e 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -154,14 +154,28 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
>  	/* below for ad-hoc mode */
>  
>  	/*  SSID */
> -	pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pktlen);
> +	{
> +		uint ssid_len = cur_network->ssid.ssid_length;
> +
> +		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len,
> +				    cur_network->ssid.ssid, &pktlen);
> +	}

No.

regards,
dan carpenter

