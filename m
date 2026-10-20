Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510915;
	b=hWVtFCMV3hjJHrVA3NX6wIYb9ICBJGKke/szdzusblSLUwuv+jFq08ZqXsKT6c4E0ozs
	 XdDZJIVcSr0cUqcwPIOaC1XWrvb8gZo1QiHDVeFSDPVyEG1tZf0O4LVALXVXEzMWnQJ+9
	 2Ds5M2HK7iSo4yaMl4WdN2DP7/x4eC7HnTBoHjfkykAEskAqFD+pLKhZOj9YAIgS29Kh0
	 rQ61TTc3aVQLRwtqkc0oy4bvYXcomKZ7TZW5KnNpw+ailb+YYJ99+6KFewECwKag7kdVq
	 zVi1PCwvdhCq10zRqax78IdRp8W/zurZtWCFiOFOiSucJlv1nl7rfOCMLi0xDwP5TcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OBYiHwgIBS5v/Omj8VoRqqRhhqFMxkEFOvedrOWQXyc=;
	b=0B9gcf70cIUj9PtvfYv6MpsHjlrW3+riNmk8xEbgp0g8wV0J2c9UcPtYVF/coL4ORBVP
	 Ksn2jjSjSutuODQMebWxyTIci0FLpVdLGrzja7CJb1BBxmDolJTDUdCJtjPlRRSPEPJPi
	 eXiMTnPr3wnoHOM8TLLdxqlahnwos2JC37T1zzudpIsB9LcQ41lnL8AUO5ZXhyZBMuA0g
	 jXP8Hs0GoYZD8za3kwI5LIZz34JMRGdg50NEdHXY476aQ/+46bLsoD29ZJ514Y15BKT9J
	 5mPdUyaLjQ47jGUCkVafPVECWQd6rhCzZzfXR5JERgfBokjmWeRcgXFEleGZMc80W7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ov7ayh0V;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12612606A324
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 15:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12612606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ov7ayh0V
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2020062f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510913; x=1793115713; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBYiHwgIBS5v/Omj8VoRqqRhhqFMxkEFOvedrOWQXyc=;
        b=Ov7ayh0VRfZAU2w8fReeQfe62ydERGGItGolAkI8IllMwG3+9m5Y2q3YE6rSC/3l/T
         OrXhoMEQ2GKVB4Q4WjqhvDd3Vt4ZCBVvmoZXFAvm6l1pZplzLPVQa4LyAD/GGGEZ7HpA
         Q3tFcrkOvZ0r75XGCdWHRbw2oCC+zjqzwXi99FIzvUJwV+BNdsV8SuvdVrSKkxp4lnbh
         lwACTTQjk5Tggi5Y7HIJCAbzxOUV3XkRRHcPahVsJasZz9SfRpO0TEF1V8lsGlBqfkCQ
         S1RDGxPA/+45CY5TbjvCg4YHornj4Yww+nhmXC5ixna1aEleCWWr5eY5z1iDKTn4y84D
         Kg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510913; x=1793115713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBYiHwgIBS5v/Omj8VoRqqRhhqFMxkEFOvedrOWQXyc=;
        b=oRTIEN+coYlMPlB6Y5XF46zpWIE5jisXvd+zKuEVl/QfqRnxm29eT/gK9bYLFVkJXC
         EkcLz4GK/DMrCe7XxaeJjpmAOFJB8BXfPWbWyk4tMancHmDUYC+NrvwjpK1kvgp22aWq
         7yhZtddYUkazvmlCAIBwvSJtwudeWompyV9+uHc0yNe1lmTYJzXCbuGp1KsYzFuaroAX
         I8vOyktnjTlQ0p/W31H3EmDYHbOP9Rze9gSU6FAkTfIZGvTwPUZZcYG9tTT8pEDnzipN
         XLPPEb6NR7nVSGt5jZeiX4agjGqLOHhww5DdopkphWPXumwuazvD/A5A9qDmsVFRqzIn
         +Yrw==
X-Forwarded-Encrypted: i=1; AKwUvBwP4mKFTBbtIHTp4gjVIrZm95XHHBDMRuALwycsK3E+VottnxoX/jj/oYAdTxPQU8eTY7Twpn0o/0D1cB8D@lists.linux.dev
X-Gm-Message-State: AFq9FYJEQNSl+UIpeI3T52vVVgR5jSnzfi2loLYdp1/+kCcWygsWkTDH
	XX5Ci0/kgoTkNuCEJ4+03h35T+oQdUzkwsyrY9YILz12+EAO6x0yVzRW
X-Gm-Gg: AYBFou3y7U1WMPR8qrAwkr1fyJ/YXLAgAb52YT9SIUCQCFfYPw45l2VgVhqL1sjBLHV
	iKFxfr5KPnQWCFnSCRBeC8OL3suTG8a8SybWsIdrNlS+OkqG4MFEmzigRm7XhTTFF7QgbhUDMiR
	xbXRRGcX3ujHZiPh4UAIxMY4vNT36E3ZQQu46pn9GvfNN14ZJMphdO3gzcIMyb0DtNPo9LXocpc
	mdQtIapbdlsOZQsoQsIQfcCV4LLpdvRCHnN7sst4yufrZ+DjP+WVSZWSzk4PSqcDYyi3KbSC+on
	SNWDy9wlPj9e5/wcFlUGUSoRJDaFpoFjNT6qHIfRblY7Mug1aqdgOJEB/IimGy4KD2C2w0SFeWl
	LJDdvR56LsnZQYohRK2o6LmTi9rDdaU8p2F1y3pX+G2WNdgqGjcTmRkCpJCweXJvTeBCm/Bipus
	5E7DvJxF5A3BEcpgVCaBF4RVWyuLEA52G3KAhVBeFG7sPB0gHUt1jS+aTJJ64J9tiCIRPsfPUIK
	doJQl7W666kwYY0sVUlv7m9AAENLWBjwXbtL3Q=
X-Received: by 2002:a05:6000:46dc:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e07f9d2damr16530082f8f.22.1792510913111;
        Tue, 20 Oct 2026 08:41:53 -0700 (PDT)
Received: from [10.5.0.2] ([187.14.227.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm7488238f8f.17.2026.10.20.08.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:41:52 -0700 (PDT)
Message-ID: <f8b282fc-34b5-4ffe-806a-fcf525012064@gmail.com>
Date: Tue, 20 Oct 2026 09:41:48 -0600
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] staging: greybus: remove unnecessary goto
To: Haasham Khan <haasham93@gmail.com>, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261020131913.5171-1-haasham93@gmail.com>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <20261020131913.5171-1-haasham93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 7:19 AM, Haasham Khan wrote:
> Signed-off-by: Haasham Khan<haasham93@gmail.com>
> ---
>   drivers/staging/greybus/loopback.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index efc69c10cffe..284935fded12 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
>   					     request, len + sizeof(*request),
>   					     len + response_len,
>   					     gb_loopback_async_transfer_complete);
> -	if (retval)
> -		goto gb_error;
> -
> -gb_error:
>   	kfree(request);
>   	return retval;
>   }
> -- 2.53.0

A few things here:

You don't have a commit message explaining anything. You need something 
there explaining what your changing and why.

Also, it looks like you're starting a series ("1/1"). That is not needed.

I'm not sure the why you have a series here, but the big thing missing 
here is your commit message.

Jeremy Dean Clifton
