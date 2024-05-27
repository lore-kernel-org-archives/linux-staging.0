Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C409381C2
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716796260; cv=none; b=o80dfp9c7QgCbeKctSU/TyERgOsaVWVF3EwvAPUqlbfBuQsvb3onw1aRUTKlFRzBZNlhW1lpRQNYgsMDV3hJCgtZ1RiOL3qMKb/UFqznwunxjEfT7gzCgOZ25F4ud9PFoQQw5T0CjwWKofyz7lT2PzkKCNxSJum8zPSsZn8Fq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716796260; c=relaxed/simple;
	bh=/krQonlYmbw1sOAOMQ2N1SXExQJOfJ1+7eOEm+fnXnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sw8J6qpzO5o5e3/dmtA6emj0cvSjgUSV98YnmWbLN/C1cVwuV0dJvLI9eZJ1fwuKN4DjuAvZxF6kO/t1j9Dq2qJ9q8VEcVAlATZut4xHXvvudz9rNIDZTJT2Spd3HGtgmGrU08Jba+uhTPm4VRY7w03oj80PEfQ6hIBLVTVqkzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZNXA2UP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZNXA2UP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35507f63293so330121f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716796257; x=1717401057; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pBJCfU1EMiwbwjvYVHX4+y6MSOaDGyPtDJJSN/EFcc=;
        b=EZNXA2UPKjQHP4V3A/U+osA1FKGKKQwIMeG3pYOtyPzroyfWve7USoxRKalEPJbjHQ
         X1tDiOIkUGy+r5oCRvAHAuRb12G3Z4VcL3J6jfZpi3/L3VQlF3j/PLIznoVauAvfTcf9
         ItLwJb1E851LKq2RRzVqXqOoXVZ+R3oQj2h3+YvPOs7GG6k/491SNl2trMUw4oKNktC0
         R0zsK/YdObldVqaKcCR6GMrCRWOBA9dCKEAXzeGwpKSg5WGN9RlQetumyIeK8Fp0E+TG
         JCp+F+OFc2565XArDBTkWAQ/ImAAiTO2c7YuKru4l7ETH7hQ2xNM+MGQnHWjusD32+le
         6PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716796257; x=1717401057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pBJCfU1EMiwbwjvYVHX4+y6MSOaDGyPtDJJSN/EFcc=;
        b=db/ZCg6voADfyGMimID6U9PfcLjX1xn1rhfI0WAzkwuVYPHbR9GpelHnqugvaQxlKD
         EQ6DuMV41GSbHnMJPUEJrO9UgsYn5wPbKwodsq0achZSHDIHkb3XId3qvR46JViUVS16
         uFSnTOPMyn66mlaWkXWAD3GsXaWs4oLAF6/dKbyAPLkhgcRvRDXTintGBYOc0qvKBCRp
         g8MryJowUxHRkW6zouKt/3Wr1G15DwcCQ1nyD/fokObzAGBr+Z6RD1eQ+cBMXzLgWSkI
         zE3TX7iWFOo5MgVvsJhUUI4rHbm1thEKu/3Rw4pXSHsJXGZg+q4ghrMQO2/jnL72KTPg
         aFjQ==
X-Gm-Message-State: AOJu0YzpA2gy+EoCGYXYmPUhXfJP/uUTrZC++Xb4nKEmpZQhFvda8Yuk
	3K5cVZbYJKkxfh3ZkMEu/MPUcdvTwMDtMrMxNH7gq0PzfDcoiDsZ
X-Google-Smtp-Source: AGHT+IFFITWv20yApzO6c8RENiggymT4uirN2a/LQ4AiUTVW4jfuNKTjDnDnY1lxFcDigAzxvKlddQ==
X-Received: by 2002:a05:6000:a8f:b0:351:d33b:51e8 with SMTP id ffacd0b85a97d-35526c29719mr6479298f8f.4.1716796257095;
        Mon, 27 May 2024 00:50:57 -0700 (PDT)
Received: from [192.168.44.127] ([185.238.219.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35671d03330sm6762544f8f.64.2024.05.27.00.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 00:50:56 -0700 (PDT)
Message-ID: <7345af0c-945f-417d-bf18-33a4cdb66df0@gmail.com>
Date: Mon, 27 May 2024 09:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Fix spelling mistake in rtl871x_mlme.c
To: Roshan Khatri <topofeverest8848@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 ayushtiw0110@gmail.com, namcaov@gmail.com, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240524154001.63946-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240524154001.63946-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.05.24 17:40, Roshan Khatri wrote:
> This patch corrects misspelled word to increase code readability and
> searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_mlme.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
> index fccfa0915a02..70c295e97068 100644
> --- a/drivers/staging/rtl8712/rtl871x_mlme.c
> +++ b/drivers/staging/rtl8712/rtl871x_mlme.c
> @@ -944,7 +944,7 @@ void r8712_cpwm_event_callback(struct _adapter *adapter, u8 *pbuf)
>   
>   /*	When the Netgear 3500 AP is with WPA2PSK-AES mode, it will send
>    *	 the ADDBA req frame with start seq control = 0 to wifi client after
> - *	 the WPA handshake and the seqence number of following data packet
> + *	 the WPA handshake and the sequence number of following data packet
>    *	will be 0. In this case, the Rx reorder sequence is not longer than 0
>    *	 and the WiFi client will drop the data with seq number 0.
>    *	So, the 8712 firmware has to inform driver with receiving the

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
