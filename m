Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855492;
	b=Tq/dDsPIejazwMorCAChS5F3rtvf+jAfsMmkQ2B7+Nqom04xT7IMwRGHz6G69LScAXmk
	 8iOdk7bvCsWkUKzx9thrchQL1KCpsDI7BAtPGIFkAViHkl1Ls5cVLkDUfy1VRCkh6fAON
	 oMxeUOxE5n6psvbMHEomnEC/yGUESblfVwyi8MOiyE3yEHnK6g48/aXuqAuiKbTd0vtUc
	 FdN4MKSj+2+7V3lMkswaq5Hs8X35pWsSBkoWYtpWas5EUDD8v+CWXyLkTg5rJh1HByB3M
	 z/3qhyyBtk4Di3C4FjtbyTX44Ny+Q1wJFQQsXIMu+DbkSUVSdEJYbQrshM37BtD4XRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WH7hL3ikL27LTJMTaLrScaPWHm2vNQUEXqc1M9TWMAY=;
	b=e2rLXnuOajkgqtnz+KGkATfXKwZTvPcO5nDRvEH2IXIGyvZx4syu/6o0MFdn+XfGaBoO
	 n1Rd+yARemmBLHUd+mqXMBi/PbO/gd0Ac+6d3htDvK3l9FDTdnSwxR4elD6MZHxNA1Sx0
	 gnCMY4/7CiEkvv8jMpyrBYlOhRS5AZtOS2yinfktMGn3/zg0VrW2SuHkU3jnN3D21fSqE
	 UNEaOT6vQcN9MJBfffB1o9CreCBHTpOAyaUSD8AUzM/de7TtkhgDWbUDylCuuAURmqFRh
	 sik3f/UDJoKnzlU2I4A3kchN3guHhKnCr9xFnew7qv+H0e23wHsGO3j+uVviThYkwSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9i91ubx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86F606A31B
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 05:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F86F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9i91ubx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so16481935e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 21:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855490; x=1794460290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WH7hL3ikL27LTJMTaLrScaPWHm2vNQUEXqc1M9TWMAY=;
        b=v9i91ubxrRCN7LmmtFtubQRh0kU4MzHIorwZxR+Gm3hcZIMuEu2y7pkY2DxEyE9yJX
         k4qyQMlVSo7Kl8Y7yWHg3KYKpwCgd6rFE/2ip1x1/rsP3+8IPKF1VTTQ7oP8+V0Adpcs
         /izxfozMm7/hyxKAazYw7MNXDVo1AFlJ/5OVx8Hw1osCgxV8HJcY7rzKLuVMe3AhUqKF
         8Jz84Tbv/QdwiRTtDTva/e3JvQNFxPaDrn4CbUsKYnjBALTe5zc7SHXAPtKVUdZonbOh
         EbTzr1lfdyLCyYXp7+pShM/R6O8xOU69GPV594y1bU3qyrWu7gLPgPEe9hPYEKf7DQUN
         86Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855490; x=1794460290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7hL3ikL27LTJMTaLrScaPWHm2vNQUEXqc1M9TWMAY=;
        b=AsPjDKBwsbP5EAY3n4bgRxyZ4Z7p8ZK9OauqVLePHf1DX2OfInADwGH95kwKNu9tCB
         Y0ycnGUhCX5ouw00JAwLRFErfm6M5p75xIf/g0dzobuzrx1FAglwvTS4FSgQv0+5EKTn
         GWK5X5mLy9lnwwv5PCeCQO+I7utKPYITp7HcPn3cS+qv5W3b6ZnUIV2WFT06B9UPPTSZ
         bSNtD2pY25xzoQWQAYeaMm/4OIdDACXr92R7UmMW3OGGhrepfny+t7g8wOutbcdDeMd8
         iCgzQSw62JBOSJZTq+3yTXH0+L66ZCEnOhqKz+17BIRjZiiIt6iaZ5QHcFmbC/RrOG2u
         RhBQ==
X-Forwarded-Encrypted: i=1; AKwUvByC9fGeD8NP2mOVHzRlZg4ybaGHLjwAgmA+I9rUP3NPF31HZN8Edi6IekES5KwFe0KYoMY77bWc0DOfo3XZ@lists.linux.dev
X-Gm-Message-State: APuU4Z+W4wpmA/JS+XFVYrWn/fx+cGaOBBD31Urzp4sav27Uyj7JziEh
	f4DyANMn6GGDmqabN/O73tWVAj84XBm2cL/T1oW+SCW89OUQaAgduFez
X-Gm-Gg: AYBFou0aut9PlUM9Q4OZsuJiY3gPafCPuYJ2DvJmxxVg/nx/2NA9V2A6qU1ayahO78R
	N5Hwm85rEOOGpfcrdEKLDV5gHX5hyKHnPVn0F7jDd3uePedbvphu/gOoMX2bKxvFochSwFf+I8l
	o1SAZLqr0wwAtf4TLuBm8UfAcEpzMkX5AOEKfwu3K3djq/NCDL5vG5TvcPtZL1x9gw4vY8tEW1E
	74AsycTro6yndfOXWGXeePwF+qlhbaOZVxE7dAtZXyoLp2NMlF+Xq242Rx30bv2ZU45HYL/EsRp
	SMFkZOycFJaFLmC1H3nI+MAbbUYVap1gzejmuJ1Tr7LhPshvG34FXYsbUMgj7YABMwYdGbsikwU
	VkO6xLdegPH/IK4bs1dQ030M7OtMNNn6cgM27tE3f00wmYEux+JA60xU4XgwZVA4gmmthBM0Pxe
	DEQlydN4vXO3YnRw/0T+qa5p39CVeKoG574YZjrwozyI73r8/hSwYHPuNL9LcL4BAx/A+88TsWh
	+E2bXGIDXfEE3hJe+Iw+WNLKfY6NlqTYgXKtSaz00+R5jlxPi10HvHUhSsoDsC+x/ofu+oZRhZ6
	UACasHGvPxJ7qHflCtLyWoN7U1Vzp6Kv7k+swBA5oW6t5QAQ4vP3M4Lg0l9B+QCrMq5+pzO2Zou
	qqQ2o3xKJn94IZKmEDsRUWQHgJLUnXWNq19wsKFklXp7Pu845XSrNZg8851By42pPDQ==
X-Received: by 2002:a05:600c:1f96:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ac185bd363mr397491995e9.35.1793855489741;
        Wed, 04 Nov 2026 21:11:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm34508935e9.8.2026.11.04.21.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:11:29 -0800 (PST)
Date: Thu, 5 Nov 2026 08:11:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Albu Victor-Marian <albu.victor.m@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: add missing Return: documentation
Message-ID: <auwP_WprHG99Nv1z@stanley.mountain>
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104205108.1041666-1-albu.victor.m@gmail.com>

On Wed, Nov 04, 2026 at 10:51:08PM +0200, Albu Victor-Marian wrote:
> Add missing Return: descriptions to functions in dim2.c. 
> 
> Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 0e2512d166329..7ed38d5d93f05 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -156,6 +156,10 @@ void dimcb_on_error(u8 error_id, const char *error_message)
>   * @hdm_ch: channel specific data
>   *
>   * Transfer a buffer from pending_list if the channel is ready
> + *
> + * Return: 0 on success, -EINVAL if hdm_ch is not initialized, -EAGAIN if hdm_ch pending_list is
> + * empty, dim_channel is not ready or there is not enough DBR space, -EFAULT if first MBO bus
> + * address is 0 or dim_channel fails to start

These line lengths are too long.

Normally we would just say 0 on success and negative error codes on
failure.  Spelling them all out like this will be hard to keep in sync
 with the code.

regards,
dan carpenter

