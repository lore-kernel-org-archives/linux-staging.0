Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744B51D67A4
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724785004; cv=none; b=Cte7mErcO5sgWLv+uditftNh5/ygAzk2ce0mczLKCLsUoOmZ4Y6JMC2fJNNym5Al4DekRZSQTq08lAu4yh0yyJ7l9vSyMgarcYfxiuRPA/IqGxdE4SqhVdYwYKf0VGXEH/zQKZmci/8CG29B6/+S/Y2Ra7gYjkXeM01jUUI8J5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724785004; c=relaxed/simple;
	bh=8W8DJtG5QwzrHLO0o5WOxAdUoditAnTyTjRHnSdGC6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tuuyuTtjTfxciiTCJqlCDjnYobGOXIxbeG906NJqW6rsk3dxhRlqGsTvWKij9BpeMC+WJ8Gsq2VODhPv8yTJtkHcankxR0PEdYlae82jDzOyQxbjz5//AkXyYLUatK1AjGhHqxNGW1nqrFZL7frdN3shrxICl/bDa+74BvOdOk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr9upK/n; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr9upK/n"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so747625266b.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 11:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724785001; x=1725389801; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DHMNkKWtG7xVVsPKFmS7u1mfT0PBjzV9td88vcbmAaE=;
        b=Zr9upK/nq3kleshDAsncPfrz5rrO3CoVPcKt+MEXyEV84ttkqVesdz7o677vFFZjVZ
         Cae6xzXIanOW3sTo/Uo2m+M2rb9THkMkHVpDb3yKEU5P88BL/7UZFGRrn9woxWygqLjU
         jGQYK9owHyVW4khJ5qE7lcMdnzXPJQXvDQa5myIe4SV3b7vh8YgcRo46B1tXTr21R3O8
         jSbE9wUmPErsm0kvOClFrGylwpEr3iS1fdegcJyAdpLtjB4nd/TAanWAQo51yeiIrGru
         gMd2cF/OCwQr4kwiMv/fq+tITWWMBAqYkfUJavDNzH+xaR/JfEIjlvQqqu/g1+FadTwy
         5EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724785001; x=1725389801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHMNkKWtG7xVVsPKFmS7u1mfT0PBjzV9td88vcbmAaE=;
        b=GjpuiFpV5w/RSkdw0k61oZ5kL5IqRYZ930nd8S/v5NA6zI+6MfVNUwvmbAo5BUKhdc
         fy6gRUew353ubeKg+EXfJSAeFndKM8WSecPLfoFjD/v9gBBo2FSIAoUtM7Sjumkb01h1
         QQS2IaAlR1M38Rr0j7eDph0H+aC+5/qAluWg/Wnp+h14Cs14+x1YnfDQ8Wmejn+cG4ii
         rEymOwjdCHwfZokBZOMqzY64jHPun9qgkIBquEVk6KhQfpZJBvkYFLCUWL+STg41J/vf
         KBmmMOvs3iRIumpftETff2B2J4JleY6sQdEkvXm7nP1v5qi50nUjmAGE0Hrhq+7oGr9U
         RmNw==
X-Forwarded-Encrypted: i=1; AJvYcCWycXV8rNOWoey7W0ACdGEuwsKtm8g96213yxhSbWmumNca9cFX/TLKGG6Qmv1s90FtMPiLfsGRVeFWv/1Q@lists.linux.dev
X-Gm-Message-State: AOJu0YynSzr3AVgoEIEzzezUZk8j/gGj6SnJ+Q0c1Z1ds8mcl4rA4k/I
	iRzx+URb4VMCM9n54+X7hIbAbX9fQLBbfyR+nUprex05ysQyp21u
X-Google-Smtp-Source: AGHT+IExs9LhDfQlxwMpO9mGAhnUUj5Fw8KLiH6bxOVbhU71h8AnU3vXmI+pZuiVbj6GVT0XMtV6yQ==
X-Received: by 2002:a17:907:da4:b0:a77:b516:3023 with SMTP id a640c23a62f3a-a86a518b2b2mr1141809666b.4.1724785000369;
        Tue, 27 Aug 2024 11:56:40 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8589:9a84:3869:ee20:88fd? (p200300c78f2a85899a843869ee2088fd.dip0.t-ipconnect.de. [2003:c7:8f2a:8589:9a84:3869:ee20:88fd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549ca7bsm143038666b.52.2024.08.27.11.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 11:56:39 -0700 (PDT)
Message-ID: <3871ba3a-4742-4106-89a7-8fa8deb6598e@gmail.com>
Date: Tue, 27 Aug 2024 20:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl87212: Match parenthesis alignment
To: Dorine Tipo <dorine.a.tipo@gmail.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240827081845.GA15504@ubuntu-focal>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240827081845.GA15504@ubuntu-focal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/24 10:18, Dorine Tipo wrote:
> Fix the parenthesis alignment in r8712_read_port() function to match
> the opening parenthesis
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>   drivers/staging/rtl8712/usb_ops_linux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
> index 0a3451cdc8a1..4a34824830e3 100644
> --- a/drivers/staging/rtl8712/usb_ops_linux.c
> +++ b/drivers/staging/rtl8712/usb_ops_linux.c
> @@ -221,7 +221,7 @@ static void r8712_usb_read_port_complete(struct urb *purb)
>   			fallthrough;
>   		case -EPROTO:
>   			r8712_read_port(padapter, precvpriv->ff_hwaddr, 0,
> -				  (unsigned char *)precvbuf);
> +					(unsigned char *)precvbuf);
>   			break;
>   		case -EINPROGRESS:
>   			netdev_err(padapter->pnetdev, "ERROR: URB IS IN PROGRESS!\n");
> --
> 2.25.1
> 
> 


Hi Dorine,

please correct the typo in the subject. ("rtl8712")

Please make your "Subject" line more unique. Consider that we may end up 
with having dozen of commits like yours, all of them referring to 
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.

Please use a dot to end the sentences in the description.
You described a why but may be you can improve the description with the 
why for the reader. For example by adding ... to improve readability.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
