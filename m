Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E97E563
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212879; cv=none; b=IWIV/F9GhSQGhofMS6bL4tXICVEcEmnjkkvX1ldf10Zs7xbVw51tDlmOykCXBRDyqXgq2m/6+jMS7IgBZ6otpbXbHGUTurH8VGOtGsBQQAo5vB6b4jgyQmB+aqevxLgrS+4YgIAWJ9dAduvHH12DzNk1Wff8/YjO/AFZNKq+dqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212879; c=relaxed/simple;
	bh=G7/4ke5O1foODR/W5e+5EmR5toRY12nyoSLmRsgk074=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6NaI0Q11lDcUlbf2s2OPmccwTStkpgYEFJz7sEcCrmze4OmwQKnm97/d1iqfQjVi5g6llEx5yXRB4oPhhumAhNx2UkaLbV2w36lt1Dz6b6lCMOqS5Cu3N+rzLX2vwYWmGNSe5a3avw3XdK/BAdzuy+to0i4swu1E0Yt4knyL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=N3xWZ3fN; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="N3xWZ3fN"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c810b04bc0so23640739f.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 05:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709212875; x=1709817675; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtagWCDHvNpjUWPNIWwFp6OZCKzLwBZUxwMg6aAtqwY=;
        b=N3xWZ3fN6G86PVJWLzFgmCEDHhJZY655E2Sqik6GARpexorR74CNdWmTeGMzmYYSTW
         isQ3Fp5hFx8gU//ohJH2O8jV/RWGap+R0WalTlXyUewUFhG8x6yCtVnMzKX/LgjQrHJg
         qvFF55OUCGeIvj4RYtPIYCUkQmMutoRLaaQ7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212875; x=1709817675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtagWCDHvNpjUWPNIWwFp6OZCKzLwBZUxwMg6aAtqwY=;
        b=NWdRuMEwpnyxyyy/8EiDRjGpJxx8TYRQ22WM5Gu20R8lQqd9brL/2ijwdUzmsgDnjM
         yI/jKjnQgeRNq5CeLGVdG7CJFRHxqx8MeYhg9KvbdjAYBtlaO/t0k00ehuiVZMn/BRXn
         9tmvNuRHz80owJt8fuUJpYsI3QgNiofL8skBuhUEwE8us5P/tgkQxNToyJ4otaW8lxX5
         deWZVnKwQoOjAELOKMzaF1b/emTRuSfrYW472GghumU7oyJrcIJkdhjULDHD6lcgNw36
         fp5mBKEserp45tPr9UdYyeJBxxKtEjTil+kvizQ5qL5FwTyzR5XCXRSCPVzkKdh5OGO9
         tRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj1XC+Wc+e2yOTSCA56p/Ifwth5LPQu03TBiBzhETtaPrDZVBHGzdX9O0953ACRHvZgBppeVQ7wt3urd0m6Di8vXYQXh9WacFWnegzPw==
X-Gm-Message-State: AOJu0YxggflHY/zaKJ9mj9ydHk/QhVo262+IhCIEOrHzvUsxeoCtJ6NZ
	3ei12zdL7SmK8tWd1lFu4fwtvG++jNjnrVxYJwDg/EtwtCtWsB349lpcsdRlAA==
X-Google-Smtp-Source: AGHT+IEFbqax2urpItdGNEfcpavfE09uSNM65EilqLl0cVmvgwRkZ6IVp2f1hsY4s2Xe1Bdy5CiaqA==
X-Received: by 2002:a05:6602:2495:b0:7c7:fd21:78c0 with SMTP id g21-20020a056602249500b007c7fd2178c0mr2084343ioe.12.1709212875240;
        Thu, 29 Feb 2024 05:21:15 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id d6-20020a056602280600b007c7a55ea0b6sm289555ioe.48.2024.02.29.05.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 05:21:14 -0800 (PST)
Message-ID: <f7b36055-a710-4d57-b952-33431876e221@ieee.org>
Date: Thu, 29 Feb 2024 07:21:13 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] staging: greybus: Remove redundant variable 'mask'
To: Colin Ian King <colin.i.king@gmail.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240229120541.219429-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240229120541.219429-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/29/24 6:05 AM, Colin Ian King wrote:
> The variable mask is being assigned and bit-set but it is never
> being used apart from this. The variable is redundant and can
> be removed.
> 
> Cleans up clang scan build warning:
> drivers/staging/greybus/audio_topology.c:764:15: warning: variable 'mask'
> set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

This is a reasonable change, but I don't know this code that
well and would like to hear from Vaibhav (if possible) or
someone else whether they think the mask value *should* have
been used in this spot.  It doesn't look like it to me, but
I'd like you to get a second opinion...

					-Alex

> ---
>   drivers/staging/greybus/audio_topology.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 08e6a807c132..5dc4721105d4 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -761,7 +761,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
>   {
>   	int ret, wi, ctl_id;
>   	unsigned int val, mux, change;
> -	unsigned int mask;
>   	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
>   	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
>   	struct gb_audio_ctl_elem_value gbvalue;
> @@ -802,7 +801,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
>   
>   	mux = ucontrol->value.enumerated.item[0];
>   	val = mux << e->shift_l;
> -	mask = e->mask << e->shift_l;
>   
>   	if (le32_to_cpu(gbvalue.value.enumerated_item[0]) !=
>   	    ucontrol->value.enumerated.item[0]) {
> @@ -815,7 +813,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
>   		if (ucontrol->value.enumerated.item[1] > e->items - 1)
>   			return -EINVAL;
>   		val |= ucontrol->value.enumerated.item[1] << e->shift_r;
> -		mask |= e->mask << e->shift_r;
>   		if (le32_to_cpu(gbvalue.value.enumerated_item[1]) !=
>   		    ucontrol->value.enumerated.item[1]) {
>   			change = 1;

