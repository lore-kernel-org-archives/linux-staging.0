Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9D1096F
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764112235; cv=none; b=XKaSmbja2mSaTuHyDwVfcMSeT1tbStILJXtqZjxhRDnXQyt5AnjWbgYnxEgT8e/fgjx8VgnleNOXeo8N4jodOTU1ZgJ5z8ZlNPhS0SqpraXHDBqOekmbQvGYKiYR1Ba1/KM5BvXvgaP16KFErHCXYt5oITKwe7ydfPGbA7zCq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764112235; c=relaxed/simple;
	bh=GAz6rudnJWHgJCE0zmPQ2wsWUjjzvI7RiRLLe3eT6eM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPaOfIUzlT0st7FTskTYzwQtQWZcgkMogjUf2tLlzHdYlVjmX0F8eZJ3S4+RFkxvrCVmqqrL7kkB4s3FANx+L93K2qN3N7FRP/uqcTTG+k/dGOtmNG9lprIxjFlKwrfVqNrQ3gBG9hHPZisNGeF4n1yt7gwdlmdIntRvuu4ZTO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tq/Zq/GE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq/Zq/GE"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so7201251b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 15:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764112233; x=1764717033; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CD0pBJhgUaQDsAOwHw/MNo/7uVvn8RgkGC14hlL7Z0s=;
        b=Tq/Zq/GE8STgtllPnJUMEhMRIoRr3yCZM6SVZ1ZBu6jMy8389KoKDpG3HClivCisXC
         ywRdQ2qNG4b2ghRX9xaBEFlSntBc4KAfrRWFcS7d624CGJwt04PMyclo6g4mZk4JKJLD
         bHt1J8bH8oBJDP6irXAkRir9O8JEKGjGYFl69nFkpDpaqqLhp2SeRaeTDQDq9eBVkRZz
         Gc5bbsk2dnZKtd8AcVpR+1XkFCgF9gpeR8TA7jWDTM/6ChlyO2UzEIHwgoyWSCIDu9x4
         n8M8yh0C8MAN1Zy6sOWrBU5tZ5K2zlQCn/I5x5OAfVukZgL4otlq06z0h76Vw7Mqm+R1
         /e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764112233; x=1764717033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CD0pBJhgUaQDsAOwHw/MNo/7uVvn8RgkGC14hlL7Z0s=;
        b=DX0IXTZH+rLEMqBhR7IJS06c48YhVLWN4h+ubOlzX4MU77xOWU4zaUPo32D8HGO3/f
         ZC1KRZX1PGCq+/51FR+GnTN4rZgy/MzMq5NvAJQLR9QlcF0XbqFZr0ducAtXgjga2NWe
         nKkI4SGv3VTC8WOUE+j9ovgIA033MvRN4Z6Vwct4n8QPrIpx16v3fF04kcfizVJdGi0C
         u9SpE6qVtgLtszZ0SkzUjk+JZrVAOKsu4cbgF3PyMqujP/0JIK4/GpspVjHuffMHQeqI
         ymoDjn1BpcmQv+ujBZJaNF9CUZZbYJ4nHlkNnACbVhO+OBewoKOsLlOw46Ps0hHomLqP
         YAuw==
X-Gm-Message-State: AOJu0Yydl+l8Qu26eJGn1G3/aLlb6KiyeruWi8DD1ejNvDJhnaxjRbtD
	gaD3sJizUr8IO8W2Kh2kHO33L6zUfoG8qktYSOdSQRwKNvHx4w0Ohhm2
X-Gm-Gg: ASbGnctCw7A25cjkAQu7BubB1DEncu+XnN0fmAZTdMs8G0TcI2NJ7tE5HDG4G7oMVPj
	ZWvZ94GjvIcTgX159VAJuHCycXqqIoBn24v8ZxZztVGXsILh0uDdQkNv6fr6Xw6CMUYVVKmaSOU
	SYhOxUqSp3K9sqHLMo38tz+PFgzASDD/J2csg3cyYs8SibID6SpNqsfWeLEePzCsONklzwoLbta
	bI7mTpueSwwRNX6fW46dDc9QpgCwlm4jgRC7kRZdSx5/TliVNHW8pC5pfGDfYT9voQeOANNlBaZ
	EIuxF32iUMSLESwfuVe2qCgTPAuwoY4SdWNFaQ+28K7R2B4iGB2GkW1tj8vUpeAADm1q9T5I6md
	PhZHJtCMtpSmC9JdRPvAX4DEzdnUwPLW6IKKrOUqToxsusmLTERnVMsj3GwKTQW4m0YXfzM5PMt
	F1vh1h7v9tffc54tgX2FTSc6Ajhc6BIJ8TdU7y0Vgg8OiZXCY3ZhPXCm5MnavXKP9KIaGWFXdqP
	0+M3dkaOlMleRbQdxnFG0Ci
X-Google-Smtp-Source: AGHT+IF0hPWGJrlr/8b3tyVxhh4SrsjpYfS65KKz/d9hiwjUX+arN0GA7ZsEIoK1iVQfXntgWBjRtw==
X-Received: by 2002:a05:6a00:2d11:b0:7ab:e844:1e52 with SMTP id d2e1a72fcca58-7c58e213682mr15710907b3a.23.1764112233061;
        Tue, 25 Nov 2025 15:10:33 -0800 (PST)
Received: from [192.168.2.119] ([103.92.100.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed379558sm19035658b3a.25.2025.11.25.15.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 15:10:32 -0800 (PST)
Message-ID: <de935747-acb4-4f08-a84e-e017b7d0f90c@gmail.com>
Date: Wed, 26 Nov 2025 04:40:27 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] most: core: fix resource leak in
 most_register_interface error paths
To: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
 gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251125225606.70719-1-knavaneeth786@gmail.com>
 <20251125225606.70719-2-knavaneeth786@gmail.com>
Content-Language: en-US
From: Navaneeth K <knavaneeth786@gmail.com>
In-Reply-To: <20251125225606.70719-2-knavaneeth786@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies, I missed adding the credit for the original finding.
If a v3 is needed for other reasons, I will include it. Otherwise, if 
this is merged, please add:
Reported-by: Abdun Nihaal <abdun.nihaal@gmail.com>


On 26-11-2025 04:26, Navaneeth K wrote:
> The function most_register_interface() did not correctly release resources
> if it failed early (before device_register). In these cases, it returned
> an error code immediately, leaking the memory allocated for the interface.
>
> Fix this by initializing the device early via device_initialize() and
> calling put_device() on all error paths. This ensures the release
> callback is triggered to free memory.
>
> Switch to using device_add() instead of device_register() to handle
> the split initialization.
>
> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> ---
>   drivers/most/core.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/most/core.c b/drivers/most/core.c
> index da319d108ea1d..8635fd08035e9 100644
> --- a/drivers/most/core.c
> +++ b/drivers/most/core.c
> @@ -1283,18 +1283,23 @@ int most_register_interface(struct most_interface *iface)
>   	struct most_channel *c;
>   
>   	if (!iface || !iface->enqueue || !iface->configure ||
> -	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS))
> +	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS) ||
> +	    !iface->dev)
>   		return -EINVAL;
>   
> +	device_initialize(iface->dev);
> +
>   	id = ida_alloc(&mdev_id, GFP_KERNEL);
>   	if (id < 0) {
>   		dev_err(iface->dev, "Failed to allocate device ID\n");
> +		put_device(iface->dev);
>   		return id;
>   	}
>   
>   	iface->p = kzalloc(sizeof(*iface->p), GFP_KERNEL);
>   	if (!iface->p) {
>   		ida_free(&mdev_id, id);
> +		put_device(iface->dev);
>   		return -ENOMEM;
>   	}
>   
> @@ -1304,7 +1309,7 @@ int most_register_interface(struct most_interface *iface)
>   	iface->dev->bus = &mostbus;
>   	iface->dev->groups = interface_attr_groups;
>   	dev_set_drvdata(iface->dev, iface);
> -	if (device_register(iface->dev)) {
> +	if (device_add(iface->dev)) {
>   		dev_err(iface->dev, "Failed to register interface device\n");
>   		kfree(iface->p);
>   		put_device(iface->dev);
