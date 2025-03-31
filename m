Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD97194137
	for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743463884; cv=none; b=XiSf8P1YEf0stNI7+DYptNZTp7vYWbJ6/gIc5T9qae46B7EEHaYykPFXZjteVme87Xl+j2eO0M7y9ZecbZFNOu/dgzmL9kZqOaWO1YYLTLPReX2q/hL/vccsCK4oaC6MI8xURAJtlhi7vWbpKFrdMvcH1wbgvieRSjLuNh9ZlsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743463884; c=relaxed/simple;
	bh=sUwfTHOCw9ZhqXto7fQMfJGGtRziqbuwKy80hrXngmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Asnl7npBUbEC6sz6Aze4H6fpNPtwaCSYE3nTLoWh8ZKirlgciptM/mzpuPaiMiqEaOuDMc96O6wHNVJCFKlb1FDODYNaT0SRcfM1ilTpIWcEa4iVTivT/oVXgE/tHg4EeAI4tSe1iQWkvlYu5e0j65aaeSZOZIWjCprqKf8O4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=XtBL/IVT; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="XtBL/IVT"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1189442a34.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1743463880; x=1744068680; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJ+toMwTx18/8SXmfnJl/GpEKdrIgAfy+X1oEZCBOJg=;
        b=XtBL/IVTJHSEA6cXgW6UTeaSQKJ4w8PYJdhy25Mx/yjaZiXdFqg2MRVjlgPNBh2JKj
         vztJFZIBlNbFPHUle3jd7vB+Qfsy+xasg5QfAUOU/dpOsrzjpjAMhuS3VcxD/lKPazNX
         u5n2eAcHRTSYA+7avxriGCFb6JBYLa+cOcBwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743463880; x=1744068680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ+toMwTx18/8SXmfnJl/GpEKdrIgAfy+X1oEZCBOJg=;
        b=o2cCrRTLw8W8RFO9vgHP3xUADxoEsxdKowQ+LyqVZ5otO7rd7oPxK1Jn1OoD9WqKX/
         0FkE57LwjGKEFJqm6VQRsplgz9g7Q/hx64e9ncyTFrrrKVhIu/2UIizgccuevjZMdV4K
         gY+FE91RjJQXxI3+funtLOd7u/vMjxvgV+HI5UUB1P2YtERgHlTSyYuozgbANdjrXOl6
         4yAVLJGzpbLr9mFv1rnVmZ0G633kVyPbSyPF60Z4YaAruP7vkndXIOAHwTiGOZqWtLP4
         gOKx+seOZaHxakeA6yFm/5IyUw0cVt4F/ZH9xwhy0FeR3EJwNSGx5xaRmZewoQYStf38
         pemA==
X-Forwarded-Encrypted: i=1; AJvYcCXlHXIkljw14WwlbUp68pWvo5gvFQ3TXfiwKWiJju4zZtKwpnBDnHlKpuJxKpiuB5EWOIjqjkr6rY1XtPiD@lists.linux.dev
X-Gm-Message-State: AOJu0YxqN9805pyieK4aO3eY3iLLzLDRxgbJCXuhCV6vqgqGzV5R31v7
	jY/mtw9vANejw2ii4QdNVmr8rZybuYHokK99vYVD9G3kNe7nRyePwMZDbcJAtw==
X-Gm-Gg: ASbGnctGh5hrCO7/smZ/liQLr9HH5iHSdyQi+uAYrnyJ+Al6Ks0KFqpnUjFZUlZBI91
	rJTDsGFixtVY9y7gI/Z9QxIK9clPs2XvJrnSR1K9k/wzQxtSQSZrQNNFnyNDUMYQ/1rArV07oiN
	15OSBU+UGEtUtIIIinG7gVWGCj2BxR90YwkxcP4lnQo0foWohI9OqzSfWSOEYMZQ1D+GCeWqVMF
	EI3xpkbzxsTQ6EMGeuLRwdh46uH4LhYmFIhL+jcl/AUoMqscxHM2tYLVXwIcC1qQQzSR3mizbzH
	sm33LyU9Z6xSQ+vmkVUnb3vDPDXYjT6/RfNRF2HFuqEf1sWL3aO6Nm9FO1GF69OWzZX6TR0i85e
	xyS4=
X-Google-Smtp-Source: AGHT+IEwmB2bcjMGzxlQpjRzg7wCA5OuVgfgfv5l11OQr+T9wVt6H6VgPvMbOoFq7GQ9enxJDZiAfA==
X-Received: by 2002:a05:6830:699b:b0:72c:320b:f76b with SMTP id 46e09a7af769-72c6376d027mr6148642a34.1.1743463880158;
        Mon, 31 Mar 2025 16:31:20 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-72c580cd6c5sm1662891a34.32.2025.03.31.16.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 16:31:18 -0700 (PDT)
Message-ID: <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
Date: Mon, 31 Mar 2025 18:31:15 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination
 checks
To: Thorsten Blum <thorsten.blum@linux.dev>, Viresh Kumar
 <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250331183935.1880097-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 1:39 PM, Thorsten Blum wrote:
> Commit 18f44de63f88 ("staging: greybus: change strncpy() to
> strscpy_pad()") didn't remove the now unnecessary NUL-termination
> checks. Unlike strncpy(), strscpy_pad() guarantees that the destination
> buffer is NUL-terminated, making the checks obsolete. Remove them.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

This looks good!  Although the NUL-termination check isn't
needed, it isn't safe to ignore the return value of strscpy_pad().
More below.

In all cases, it looks like strscpy_pad() (and not just strscpy())
is the correct thing to call, because the pad bytes are passed
either to user space, or supplied as part of a Greybus request
message.

> ---
>   drivers/staging/greybus/fw-management.c | 39 +------------------------
>   1 file changed, 1 insertion(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..852c0830261f 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>   
>   	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>   
> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
> -	 * don't fail.
> -	 */
> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent,
> -			"fw-version: firmware-tag is not NULL terminated\n");
> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
> -	}

Interesting this didn't return an error, while others below did.

The sizes of the arrays passed to strscpy_pad() are not necessarily
the same, so you should check for its return value.
fw_info->firmware_tag is GB_FIRMWARE_U_TAG_MAX_SIZE=10 bytes
response.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE=10 bytes also,
but these could theoretically change independently.

> -
>   	return 0;
>   }
>   
> @@ -154,15 +144,6 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
>   	request.load_method = load_method;
>   	strscpy_pad(request.firmware_tag, tag);
>   

Here the maximum length of the tag is GB_FIRMWARE_U_TAG_MAX_SIZE
bytes, and it may or may not be NUL-terminated.  The size of
request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE.  Again you
can't be sure they're the same, and even if they are, the source
could be truncated.

> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> -
>   	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
>   	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
>   	if (ret < 0) {
> @@ -250,15 +231,6 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
>   
>   	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
>   

The size of request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE bytes.
The size of fw_info->firmware_tag is GB_FIRMWARE_U_TAG_MAX_SIZE bytes.
Check the return value for -E2BIG.

> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> -
>   	ret = gb_operation_sync(connection,
>   				GB_FW_MGMT_TYPE_BACKEND_FW_VERSION, &request,
>   				sizeof(request), &response, sizeof(response));
> @@ -301,16 +273,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>   	struct gb_fw_mgmt_backend_fw_update_request request;
>   	int ret;
>   
> -	ret = strscpy_pad(request.firmware_tag, tag);
> -
> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (ret == -E2BIG) {
> -		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> +	strscpy_pad(request.firmware_tag, tag);

The size of request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE bytes.
The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE bytes, and it
may or may not be NUL-terminated.  So this case should stay as-is,
and check for -E2BIG.

					-Alex

>   	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
>   	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);

