Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515928;
	b=eA7SWYwzXPmgcUugdTE+wrjdGp5Ua/nva/sw9p9iHjBNZPXMdWLTpheCItx90gudlcOx
	 RjC4HY+05U5ir9TKvHyrtdQSnLT1+rAptmfDUllpx6JPSIeWLL+X0mHxECXjpFz7yMY+Y
	 boNKnwSGP6TCeC2UPcCR/HnfuylqB86onQPuDhOwCVviECOXLg8VWGP7BFyxBEw9GJQnz
	 JL55V1YHl/sr9OQGJc8JZQG1B6wOe9xoTxZHYdcsaWxhVmPNkN3prH3srVBnI1G1jjdy1
	 sr79EiKZrL/nF8VDUzPrTHz+jkiwBIkyoz4F/SCYQYcXR7IL670PacY91ZZykVosBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pb5RaWd5jwLfIYb5FACQb0INcelOdE+bJc7PDSGp4uA=;
	b=WR+K5zXJI7erDWsjeYfPmcg8hMXdySKApdaS/xQJKkOWXbj/7k5SiE+LLu1EVtegUo8d
	 kWHsja/8X8tvtEX0F9zFE5kXhdHJaqN21PP713Jefeqv/R0wdybO/c2flm2RLCjxNiHKA
	 p+Qz0cd2wczAAWz+jYZPuQMR/tlJ2VQn7jVTVIZSTf3T4RLwYLZjiXDZM3iBdnm/XilV+
	 yyhPeZdWReH3RMF/zylmkcFsY4pbCoppopYaiVP2JktCppwOQ/ONpbZz48yYLLj+/Y48F
	 JvQGd8pQiWa8i0FyCOZ6xU3BDjx07U8WQuP6V54f1MQ/adoCUhKXfq303Exi8R8VHoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=CAHW8T+s;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571CF606A31A
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 17:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=CAHW8T+s
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d00d120b28so2582386eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792515926; x=1793120726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pb5RaWd5jwLfIYb5FACQb0INcelOdE+bJc7PDSGp4uA=;
        b=CAHW8T+sD+AVDOgTQ6RiVve2fJKQRZJZSP32LO2/KuAvWhbACjE/Oi7obJ6sikIAsg
         e3CO7/nsV9jy9ehDPtAvNUs+u55mgb7ERQnK+g8tHdP8xL0NpmhIE7ht77j3VPAzJ3eB
         G37sO9skSYCap/wjfe0CEMwzi5lSgFo4VG0D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515926; x=1793120726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb5RaWd5jwLfIYb5FACQb0INcelOdE+bJc7PDSGp4uA=;
        b=BGmAwpTa4ojSsa05GlWbpJBZ9E0e5l9flmA37fq9nHNQdCHpMIep7Om+TaBKE3Nid6
         +BgvXGCvR9I/kTVA6BdG0UI5pEOwiW+hmVlmmtLDAHdz0FO6nERPARoXb7MjUrwv5KV6
         wn/WkGSeql9x0BUXBG9+OEcrpxBrcYNTFJ41NrdVakPWJesyqnwtn5qR6wF4Z7272ghi
         e5VeCsoNXb1fVPTjcitb42WKXBlknmc9aJcdmPSTUu+LF5lS1359s+4ZeahtGCWtGd2z
         xI+GmCRIt7BlYqPKcbmAmWwqe8zPXkDVZPCRMcjHUE5cGxz1MnYe3WqVYHmQIPaKt8ch
         MGWw==
X-Forwarded-Encrypted: i=1; AKwUvBxAY0knUQr4h9e1agp7j+MFOwJJJLSIxycnpvhgkMF1LyX0maUNAh5nO1nvZhlJaHgCm134CAof3f8TrjVP@lists.linux.dev
X-Gm-Message-State: AFq9FYInWwZ3nQevJtXk/z8JEuGmW/TyRYjYqIfxpWncYd9n2qvpujjx
	coU8wSWa5WqSd1OavXHt49GSZKXyWEeLJuBuu2obYflbepbJLZ3Hg97HoZAdP6QV1A==
X-Gm-Gg: AYBFou05UczfGNczSSDfofWj/hFgH9h0oFsmff5MebrsDVL3DKmEGI6dW05D7cc0EIy
	2BSKHxUFMCG3KJ0pj2M1nbv4OjFi8se9zx2zWFvrWTzCxTHDicUzD0jB5Bs8mEi4ZwqO9I8qQSY
	919ZPVOGFrQ6ASeXcgYFaC8sMRxXOlB8vooc6K1q5OsTbw8eTELyl4kFMD1xQn0CyGMwh1ePo3d
	3hYYLpgG31Why10gtLb2hE8Zcg8z4gpB6hJ9SS0sat50NeWfX/6McUEz7/TXC2ZS7Q2lvGAfgO2
	9bLFC9t0cGRdFxSDq69Lmh15I6l2FakA3AfgYTYk/vTzq6DMcw1VjjWC6Ct7MUys+p1S3nH20FC
	f8XndaQRybz/f1GSIJlx3KL89l1ckXlUYWtBvWs2FH805wahHgvEIBQeR61n4bEM2Vix6hGBnQi
	qgV9+vwdYh1N9Nhtu3fbjGl48Sc8bMjQwkDJEdYHx652/plSuSpdVbZED9NIkPfV+kdVLKrns0T
	eRu
X-Received: by 2002:a05:6820:1c89:b0:6d9:3d73:6e7d with SMTP id 006d021491bc7-70355d88b04mr8635937eaf.26.1792515926257;
        Tue, 20 Oct 2026 10:05:26 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-709036ccad0sm90614eaf.7.2026.10.20.10.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:05:25 -0700 (PDT)
Message-ID: <833ee0ba-9fa3-4732-997b-c1a655217cb5@ieee.org>
Date: Tue, 20 Oct 2026 12:05:24 -0500
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
Subject: Re: [PATCH v2] staging: greybus: remove unnecessary goto
To: Haasham Khan <haasham93@gmail.com>, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261020163636.7629-1-haasham93@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261020163636.7629-1-haasham93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 11:36 AM, Haasham Khan wrote:
> Remove the conditional jump to gb_error, as both success and error
> paths proceed to free the request and return the result.
> 
> This simplifies the control flow without changing the function's
> behavior.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

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

