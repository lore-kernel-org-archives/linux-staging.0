Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BE7D413
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708201059; cv=none; b=HBi81M5Ta9WLTHg7yVd7c+KaCqjo92wNYE/e8ZJ/d6lypd/8i6q90D3lPg0YHyHs2x3R5P+cs1wFqXra4KF7MtuBLslAt3AvCJqkhEYBCcaiVIKnv69bz6k+jGkx1NvYuKidLS2wAWhNbZyxmP9EkrM8Rh+Ir45u6Y1n78iEy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708201059; c=relaxed/simple;
	bh=EOEvsEN9bVCvAqHhBUU+QcuYaKf3cHOUb9Tn8G3jbSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/r+ndtRd7JwSyidUdIpwn5AznX+DUbPjJqpoO/Zz28+X+KfYGGH9uy8jsUB2P4L2E3F7lRVcwX5hMp5H8jmvcITJf00ixx/IInAr3wmVqyCy++sCJoQpnmMe7UZf8Zc5V0BK9DEsf1sUaZ9UjpURW4CjKJYduHmInx9VVdl0Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=XgkonWKe; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="XgkonWKe"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-365169e0938so2669755ab.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 12:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708201055; x=1708805855; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YocJjiLlcTnPD4KHyNJ53S928O+S0non3cybEequvw=;
        b=XgkonWKemqywiwdrzgx8osKJf3mdDkRgl+i9gyVxcdf1dmIYx2MohhEn0jzLPJev/j
         FhRQPpEPH7Qnpp55vnCMxs0lGJM9lDvkBXDMhK8slWu6Y0E8hibA2tvfiOKdUITTLbfF
         HScrfyRjVuxsbh3USZLAdNP/WhQYkuXLPVMk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708201055; x=1708805855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YocJjiLlcTnPD4KHyNJ53S928O+S0non3cybEequvw=;
        b=wObPfNOq+ZpB5tawwiW3lvNQA20kPT+jK6ci0xhi9QxgYt2Esk3PYUZrSFs3tDDXMw
         xgbgxo2KOsTzbQuyHGq9SWCdift/VvGK6KDYKxVDb4RQM8o+raannEsBNdRNf0Y8M/y5
         M0P+CAqcR2vOAmLmGwQuufAL9kSFJqnZNQsK2tx3YUgDQt0IPyirwrebyX7kbiNa42j/
         V3Qgr3wzjtkhUH2xvGr798Vv1+MB2Rm1VmZuKrLLDYfmB09tYSnRomnRXufwomBCzdVo
         AVw1JUwpLRy04dNO8+TE8S/AgmoqCU7rjTK1uWmr4eOJJA51+XqXARz7u8tzjurcJkqd
         NZcw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ti8bFhcb19qdZ/StIReGb5YOYsC7FnbgWPcWDgwU27IqAAMxO8D/R3TdXwX1Ao5IWzVubcaf0z1wXGABj3/yaotSNg0qZpIo06UDCA==
X-Gm-Message-State: AOJu0YwZMeT93zRZif0k/BrO3uVAzdvOQhbtrJrfajgj2KyRAJo6gmxI
	5XbaRCc3fDEZOgJX/sJnt/bHAgwVWDvL53WWqw1NKTREG7cslDfgihmQbVqa1g==
X-Google-Smtp-Source: AGHT+IEQvaRlI8ULfV7rRXZvMVc/SkRNZ0HRAO0gF8Y1QDFYML4rbz/7c/Q6f0FKlx9gx4vd0r2JlA==
X-Received: by 2002:a92:cdad:0:b0:363:86dd:b35 with SMTP id g13-20020a92cdad000000b0036386dd0b35mr9567711ild.10.1708201055081;
        Sat, 17 Feb 2024 12:17:35 -0800 (PST)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05663813ce00b004712c18c13asm169188jaj.125.2024.02.17.12.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 12:17:34 -0800 (PST)
Message-ID: <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
Date: Sat, 17 Feb 2024 14:17:33 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: Avoid fake flexible array for response data
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240216232824.work.862-kees@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240216232824.work.862-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/24 5:28 PM, Kees Cook wrote:
> FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
> code base has been converted to flexible arrays. In order to enforce
> the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
> destinations need to be handled. Instead of converting an empty struct
> into using a flexible array, just directly use a pointer without any
> additional indirection. Remove struct gb_bootrom_get_firmware_response
> and struct gb_fw_download_fetch_firmware_response.

The only down side I see is that it sort of disrupts a pattern
used on Greybus request handlers (and the response structure definitions).

I think a one-line comment in place of each of these two
definitions would be helpful, something like:
/* gb_fw_download_fetch_firmware_response contains no data */

And then add a similar comment above the calls to
gb_operation_response_alloc().

Otherwise this looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> ---
>   drivers/staging/greybus/bootrom.c         | 7 +++----
>   drivers/staging/greybus/fw-download.c     | 7 +++----
>   include/linux/greybus/greybus_protocols.h | 8 --------
>   3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 79581457c4af..76ad5f289072 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -243,10 +243,10 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>   	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
>   	const struct firmware *fw;
>   	struct gb_bootrom_get_firmware_request *firmware_request;
> -	struct gb_bootrom_get_firmware_response *firmware_response;
>   	struct device *dev = &op->connection->bundle->dev;
>   	unsigned int offset, size;
>   	enum next_request_type next_request;
> +	u8 *firmware_response;
>   	int ret = 0;
>   
>   	/* Disable timeouts */
> @@ -280,15 +280,14 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>   		goto unlock;
>   	}
>   
> -	if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
> -					 GFP_KERNEL)) {
> +	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
>   		dev_err(dev, "%s: error allocating response\n", __func__);
>   		ret = -ENOMEM;
>   		goto unlock;
>   	}
>   
>   	firmware_response = op->response->payload;
> -	memcpy(firmware_response->data, fw->data + offset, size);
> +	memcpy(firmware_response, fw->data + offset, size);
>   
>   	dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
>   		offset, size);
> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> index 543692c567f9..2d73bb729aa2 100644
> --- a/drivers/staging/greybus/fw-download.c
> +++ b/drivers/staging/greybus/fw-download.c
> @@ -271,11 +271,11 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   	struct gb_connection *connection = op->connection;
>   	struct fw_download *fw_download = gb_connection_get_data(connection);
>   	struct gb_fw_download_fetch_firmware_request *request;
> -	struct gb_fw_download_fetch_firmware_response *response;
>   	struct fw_request *fw_req;
>   	const struct firmware *fw;
>   	unsigned int offset, size;
>   	u8 firmware_id;
> +	u8 *response;
>   	int ret = 0;
>   
>   	if (op->request->payload_size != sizeof(*request)) {
> @@ -325,8 +325,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   		goto put_fw;
>   	}
>   
> -	if (!gb_operation_response_alloc(op, sizeof(*response) + size,
> -					 GFP_KERNEL)) {
> +	if (!gb_operation_response_alloc(op, size, GFP_KERNEL)) {
>   		dev_err(fw_download->parent,
>   			"error allocating fetch firmware response\n");
>   		ret = -ENOMEM;
> @@ -334,7 +333,7 @@ static int fw_download_fetch_firmware(struct gb_operation *op)
>   	}
>   
>   	response = op->response->payload;
> -	memcpy(response->data, fw->data + offset, size);
> +	memcpy(response, fw->data + offset, size);
>   
>   	dev_dbg(fw_download->parent,
>   		"responding with firmware (offs = %u, size = %u)\n", offset,
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index aeb8f9243545..603acdcc0c6b 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -232,10 +232,6 @@ struct gb_fw_download_fetch_firmware_request {
>   	__le32			size;
>   } __packed;
>   
> -struct gb_fw_download_fetch_firmware_response {
> -	__u8			data[0];
> -} __packed;
> -
>   /* firmware download release firmware request */
>   struct gb_fw_download_release_firmware_request {
>   	__u8			firmware_id;
> @@ -414,10 +410,6 @@ struct gb_bootrom_get_firmware_request {
>   	__le32			size;
>   } __packed;
>   
> -struct gb_bootrom_get_firmware_response {
> -	__u8			data[0];
> -} __packed;
> -
>   /* Bootrom protocol Ready to boot request */
>   struct gb_bootrom_ready_to_boot_request {
>   	__u8			status;

