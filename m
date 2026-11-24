Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544422;
	b=Txg547w97XL1svza/C2g51348Atu4x5TihmLfIYDV5PqHuoCmW5nS5eiNouBoGsC83ie
	 CtOvknEwMd+fx2mm/OzsbYfm8ePmR5fJCpGQt8vIkinrxKZz/weUt5nV7MHcbYJjd4pQ6
	 0a564C5AbtSfxFj8BLSvHyWXsH3zo1YyvRVRAbraS9SG5FSIgCFNkMZfxX3Q2aNCFDIel
	 DBWOD6qhZRbPNnYtjnzNHnt8MJJHinWGtApPBLBblK8oPoDJ4qb8nHFL4lWzHS7lU32bV
	 p+a4ELyVXOPrxXJnNnymtIODoldTm4cRpJrTQ7WPKswTg5oUFZL+1MrrZ6qoMoxtT+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t6rdI7mURCpoui2vomlPR/PWdU7STA6LJoFefEg+LTQ=;
	b=cf20VQGgUtdDhkX7/X28WvhRa6pWW5J0hEAHB0d/fRIDWfgpfH7LQx7l1Gtczjcz5HTc
	 USEPOmO7xdBpfJAVjZAZGvM30Fh3yJqGEJy+7lSlmDBEpZq9Miz/EsqBlIF4ogAyV3iLY
	 iiSsAfH6AmhkGMsKo2x7qWpmfbL366MsJuJgZp0qAA2wkaTz6l1beoClzJs22mGAAAM+U
	 uVYjd4Yx93+xunI5Ql8YsXaoiFs96SE0HaS9NZaNa2ScnXwlpOGxz/zT8sPLba6F+CRpx
	 20OWeujjGBPksWSw0hbd6v2QUDDIvzeTOcnV8Q7oNTFoJ53gmMhU8wQ6CgydwinFFkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=uofugL0A;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2728606A6B8
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 18:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2728606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=uofugL0A
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso1485044fac.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795544419; x=1796149219; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6rdI7mURCpoui2vomlPR/PWdU7STA6LJoFefEg+LTQ=;
        b=uofugL0A6j5hZv0arqq/sbdQZ7K8K5AFyyxDU7tOL0y0XyUWNy2/SWYLdvAlDSiLMF
         tVqimsMrHfkfyewvJrV2ywEXfCzYPBBdRrddGwQB4TjijsaFk4BBW+MeTmk2EIRJKt4k
         Z9BNmqnRV1DSNl6IRUOcJ4CxU8SuhCCQxs04XFIpzP4BLUnxnJgPjMXfAJrZfc01/Kjh
         fKsM4lbLT4Pz1hdpAWZvMwX9bmFY+RvQa3rqMfi746hLILLyqy79cvagemIuSSGGP/ZG
         ac9B/Pv+HMaIhZ4cxvVuG0tMHIe5TiCU264SgATwIBVKcB4PvpEZz52R3kVxPpDGOxJx
         RuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544419; x=1796149219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6rdI7mURCpoui2vomlPR/PWdU7STA6LJoFefEg+LTQ=;
        b=Q5rkvtQEaEigJo2RnH4BzenD64cvMJHa1GJ6bUk2zG2G6uc54izubHkfyEuEM4ghIf
         RwmYFcwYigqWuNGfp3Xtcq6TKYsELZENZuJFII8tJIarEdGZpz9xls/6gSguV8u3NqgM
         rP/Ovt2CGMMC5df30k5wNYZRXP/angGRxc+nvxShGeZOv+DZAddgHe/PffHkTKarOokS
         cjoccrOUVpTq3Ti6+AsJmNdWkXaOuH8s+rKNYow/JcVJHOZ/t1eKQOeP9UOdVJyeErnS
         1LOJxm8tAzg3sI5u1ilBBl3ANw6qKX9rsD7Eq0EL7HSIkC4HrH8Bnbj5fb81tA7O4S9T
         RVyA==
X-Forwarded-Encrypted: i=1; AL+hErEnyDKHMQLl1HpoIMxBR5FzBjLqbSvwHYaSs1bOhXkfp01tBBR9Bj+AJm6ZGACwzp1J4V1CJsOGvFB3B733@lists.linux.dev
X-Gm-Message-State: APuU4Z/yZGb7PCsPpkFKJdRX3hJvHUA5RBGZEdtPIZ+FIXMS+ICW6de8
	XQjUBAxZSPLxrnzLte7g4IjL8If/dIInHPGx2YweqF/CWCCkBFhEFgicLVVwKrCMA2g=
X-Gm-Gg: AZFdTZdPHq3QXkXp+t3NRDJg5xWh+QJUClZmUlUKgKong48u2y3GbUBmugu6Wts0RS7
	jPYFH7L7htMbdBJTsHa+QRRMh9v2wBgJWjgYSufF3oZlCc4+HvDWdb6O3uuRkY5YFM0rhQtFxFq
	bUgS9AvLfshUgCqM1YnLUOXnu6k2ATAZUBasB2fGfC18sM+r0S22PeCThBth1qoAkKpyx6Irlj1
	7Bxd6+z5g3Bf4c4OKwPhwqqXZpVySrMiQq5MyMhu3SmzYUJyHepxzMtlVdIsFt3tLxLD38yz6VO
	pcU1GTSmQsGYvscLDXwF7D9ECuhBG4P71Aukp3bdEdtZfTvwfSwjEh6fAiV0EdnaCUIRhuqqQxP
	EQHC9/G50r0jswXlaitIQC9OfQ43Yb87IM347qg5DTIwped11IuVFWnQF2iT/Lf0cQKA//hJdYO
	EYcWoM+DtKesbH7I388OOisxPvCxXnVrhqAOmg+uoduSGb1B/gPEg3/wRTxkBJe5dLhCPhnGGk3
	40oqqzKSQnX92MgtnRgHoeIrmydD884CDKRhti1uOI03jg17bn8qdu0M3MUqHb5PCPn5HQC/alB
	/zQ7Go6/X1bVOfbNb49IQYN6Xfoirz82
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id 586e51a60fabf-4bc821920bcmr13877948fac.20.1795544418852;
        Tue, 24 Nov 2026 10:20:18 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm15654378fac.13.2026.11.24.10.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:20:18 -0800 (PST)
Message-ID: <3f7e5d79-c356-4082-9be2-bca3b8833f88@riscstar.com>
Date: Tue, 24 Nov 2026 12:20:17 -0600
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
Subject: Re: [PATCH] staging: greybus: bootrom: use firmware size for debug
 output
To: pavankumaryalagada@gmail.com, johan@kernel.org
Cc: gregkh@linuxfoundation.org, elder@kernel.org, vireshk@kernel.org,
 esennesh@leaflabs.com, skhan@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261124181046.44750-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261124181046.44750-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 12:10 PM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> The firmware size is converted to little-endian byte order before
> being stored in size_response->size. However, the debug message
> prints size_response->size directly without converting it back
> to CPU byte order.
> 
> Use bootrom->fw->size instead, which already contains the firmware
> size in CPU byte order.
> 
> Fixes: fc41c2da44c5 ("greybus: firmware/bootrom: debug output from bootrom protocol")
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Thanks for the patch, this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/bootrom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index fb1fbd3f7b99..4e225084851b 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -222,8 +222,8 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
>   	size_response = op->response->payload;
>   	size_response->size = cpu_to_le32(bootrom->fw->size);
>   
> -	dev_dbg(dev, "%s: firmware size %u bytes\n",
> -		__func__, size_response->size);
> +	dev_dbg(dev, "%s: firmware size %zu bytes\n",
> +		__func__, bootrom->fw->size);
>   
>   unlock:
>   	mutex_unlock(&bootrom->mutex);

