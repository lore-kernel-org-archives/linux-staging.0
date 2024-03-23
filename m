Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870015B1EB
	for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711232386; cv=none; b=h1d0BDL2Zqz8xiN3NIxNXUIZrmIF3FBlnPvulW8ffQWqZmpe3K+gw3m/gyd3l+tGPnfqDCKVjHnUqMD0tm7B19yTza7cvzVOsGfNYVN6S85ykH8tSH6Ve56tmAI2yH26n80gMogYyr2frRUguAN560YuYrBhbikbC+gqm5zUbDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711232386; c=relaxed/simple;
	bh=ZcPsWjlj9lt0IC+KED5LgpuFONybE2L/MdQVVekZhBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XWwVY4MkHkRvpOW752YZvc6UvGUtk8rcz25GPenZ6SACuRR7iyWm6YQOvcf1v0hUhpwBHDbXhhyE8I5fZPXy1DDCPNtSHAIXfOAwikTCvcLGaQQdLK5HNUQ+eo7r0U976Gr83jEpaZBK6iBn1PnDGQnTdeI9Tpph1lbQj/4VjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAvRSGq7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAvRSGq7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a46f056c29eso106135766b.1
        for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 15:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711232383; x=1711837183; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6IQFi8uGp/8YXnM8wES9GmP5xUToFAwq6+EGNAWXMg=;
        b=hAvRSGq76fFyK0xJutzdaqXRzlEoaJMIe90nC23M7nO06s7/XbLPcxHC5eydUytO/X
         8UdRSZZsP4+m1dzBRi0pdxClybkEwD8xzHBTT+9n0sO0v8FTgSeJ9RVC1xO/CW4cPCP7
         ermiXoCfYuFEAdvvfTcOhxJWmeaPf4m95up2JrwkTZ/zihSVW10bZsaBhP4EVnVxg/Cq
         BskcEDnHoKXAmCiu6MLqBaw5UEqn59W1vjjD/C85i1lBwo9j0OtadeM05Nyh1C8cfdPb
         9B3xB2dIDrZ+26ka2Jb4u1H4xDd2sEvy61CLtImHVemO0Wwos4g8wwP+46Lq1JnKXTqA
         WSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711232383; x=1711837183;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6IQFi8uGp/8YXnM8wES9GmP5xUToFAwq6+EGNAWXMg=;
        b=VQYchN+sHr9hPOK3mUaJbW2+DFQLMck59QAtF6/bTJ3HIxFEEkIVZFoXIyjKByPyS0
         DnoTrSlgD+Cdnx75iZnenAAfGhm7TntVv+dP6GLW5aEw1oy2/lexM70FzhbwtREOgpsH
         TjjXZJ8r6d2yUlsZxJZAd+NYYWWjp0r9iHwUgEvgA7aVxM9K4ZqiiGxs8RQyJZnwdI9t
         SGQmaZR5DLMi9pZ5nVBXKYnRsVHNdsYJV0MnY2ifZhsqCgTyW6IAHTm9UzbNhRLt1bP1
         2JAaQMQh858qSDHDig6tbirdjLmV3C5sXtoWFrO9T302Wdj2vGnQ9+kLp9QDwpPlsnJt
         vqBA==
X-Forwarded-Encrypted: i=1; AJvYcCUPWz+Y+SNHOyp0GSOjZqqc3Tv6lJfhIx3qZPifyOkwfGjJVuLcF47LXgL7oC0zMVXqCNtzZxUDlE+0Bh+nVtUWp4QypnsXCr5cpN1vKg==
X-Gm-Message-State: AOJu0YzX6vapz6372og2BLZxVLUUNko9X++vDZUub/cC9xHMpEEkaTgC
	dp2xKeuOw68cunteAD8cAEXR0Wcj4W4ALDY/+NGmH4JIRvtO055LwMvBECoN
X-Google-Smtp-Source: AGHT+IFBL/IwWGm2h0tjoCYxU+8vfobSfgDoD55AqZ+ab1pEgtMHSeWx08IsCWQHA0DO8ErZZJZXmw==
X-Received: by 2002:a17:906:99d0:b0:a47:4293:944a with SMTP id s16-20020a17090699d000b00a474293944amr2039761ejn.3.1711232382531;
        Sat, 23 Mar 2024 15:19:42 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id jp10-20020a170906f74a00b00a461e206c00sm1331799ejb.20.2024.03.23.15.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Mar 2024 15:19:42 -0700 (PDT)
Message-ID: <c20f03dd-fa66-46ca-ab28-faaa97ae6b60@gmail.com>
Date: Sat, 23 Mar 2024 23:19:41 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: rtl8712: Removed unnecessary parentheses
Content-Language: en-US
To: Brandon Crain <bcrain1606@gmail.com>, larry.finger@lwfinger.net,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <Zf2fuHV2gmSOSEnx@dev>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Zf2fuHV2gmSOSEnx@dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/24 16:11, Brandon Crain wrote:
Please make your "Subject" line more unique. Consider that we may end up
with having dozen of commits like yours, all of them referring to
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.
> Removed uneccessary parentheses from source file

Please use a full sentences with final dot. Always consider that the why 
is most important to answer. In your case the answer would be "because 
it is unnecessary" My preferred proposal would be:

Remove unnecessary parentheses to increase readability.

> 
> Signed-off-by: Brandon Crain <bcrain1606@gmail.com>
> ---
>   drivers/staging/rtl8712/recv_linux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/recv_linux.c b/drivers/staging/rtl8712/recv_linux.c
> index 215fca4abb3a..2bf4661432a9 100644
> --- a/drivers/staging/rtl8712/recv_linux.c
> +++ b/drivers/staging/rtl8712/recv_linux.c
> @@ -105,7 +105,7 @@ void r8712_recv_indicatepkt(struct _adapter *adapter,
>   	skb->data = recvframe->u.hdr.rx_data;
>   	skb->len = recvframe->u.hdr.len;
>   	skb_set_tail_pointer(skb, skb->len);
> -	if ((attrib->tcpchk_valid == 1) && (attrib->tcp_chkrpt == 1))
> +	if (attrib->tcpchk_valid == 1 && attrib->tcp_chkrpt == 1)

I am not so happy with this proposal I need to know the exact rules that 
the == has priority over &&. So I like to read it with brackets.

>   		skb->ip_summed = CHECKSUM_UNNECESSARY;
>   	else
>   		skb->ip_summed = CHECKSUM_NONE;

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
