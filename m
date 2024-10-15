Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C81B0F0D
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 22:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033008; cv=none; b=CGWSlSMTfYgLeTWaKzCbqSgtTDRiUa0+ZpIo1n7z2MyYXYHWOekEHbgWjMS7XT+125u8WlaGiY8beYFHQSJK5Av1gpYxJrqhNCQsfqNiS4WpgApxletC4JmnHVuxy5ymemXzzj+/7pBX9EMqMX53iTytJShgjLtx86EwYL2fbPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033008; c=relaxed/simple;
	bh=jMeRwO20l5JpD+DQduUGcATCU9gZoGqu9rHPJtVdwOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTqeIv6SNGfpRr2v6E0aWfu6dbLrgYm1jTJg2r5z1KWYjPMU0pN+Z2os2FWdCMdoYLH+YSkIXbTOXo0yaF3ApPwL0u0yIUBH8ZCAkNWqXPqIYDlKmlt65sAVfRAdxZbyM9lRK7ymCq7eadcl3hEiFOqrL9Vauynqu3jiHWH5y20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BcvNgxuo; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BcvNgxuo"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a39f73a2c7so22637455ab.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 15:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729033006; x=1729637806; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjlkyL55BEA/LHXfBh8aUrjY1xF4pwwamxqyKY1rGNQ=;
        b=BcvNgxuoekLRmZ+vtbWydpvGz0uAYf1HwhN8MStawAsW+nPrHlOJjlzXFrPjL5YXRH
         ZGLeOa/sAH15WKV8BSHh6hB8B5rYUkP7LlW5sVODXHtkKiEenVso6zbvpTdTDjCiloUq
         g+wUE3dLR9DeiQuSkwRmszyFQ4GmTLeDfZ//U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033006; x=1729637806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjlkyL55BEA/LHXfBh8aUrjY1xF4pwwamxqyKY1rGNQ=;
        b=WwM+ZzTdzGowK5A2BSdoL6WAYtSn1tkpzHLdl7OacMqqkOtdsX+UiL+o2YwNSws6LY
         8hln6rryncgY+dVKqP9bssiHpcamQdRSV4hSQru9k7piQRvqRYtSlCWpdFqZuCXLXtRF
         /LWwBxVJ82mGw4uGacWQM48FmaupKHeYnmh72zqitxsueC611OrJ7oyz5+aHjslQJ3w3
         HeS5XKWQ3iKyWIXKubCmwbmNPYNopgSiYG3y22OsUY11BSv3mOJfd8uPJeZZhJBtzu9V
         EYi12oz29hkuxQSLc/Mfmml35Qvvad6Btzhjei9YLSbnXfGfzaELb37NPu7qd/hgm/yV
         i40Q==
X-Gm-Message-State: AOJu0Yxx7Gx2Jl+WtE3uO4/dudUfMmtR7uHk95j3HhrvmMwPDDE6Ol4C
	+lTwAbWWM8OfSY2lPDHD4kz5xY4enIjTv5XBVwdb8uLX6/PKA7k2HSdZ/SOWL0g=
X-Google-Smtp-Source: AGHT+IH98mTXWtwBQGO9LPwwOZt8H5IzAX/9kllbYRhcvWaX308QtFiL4ugqrfFKYOJSCqaBTaRgoQ==
X-Received: by 2002:a05:6e02:168e:b0:3a0:451b:ade3 with SMTP id e9e14a558f8ab-3a3b5f6b26bmr148652045ab.10.1729033005914;
        Tue, 15 Oct 2024 15:56:45 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3d70747edsm5306855ab.7.2024.10.15.15.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:56:45 -0700 (PDT)
Message-ID: <ca5aef7c-4569-43ec-a1e0-a4b9e1c63daf@linuxfoundation.org>
Date: Tue, 15 Oct 2024 16:56:44 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Remove unused value
To: "Everest K.C." <everestkc@everestkc.com.np>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241015210300.17941-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241015210300.17941-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 15:02, Everest K.C. wrote:
> The variable `complement_count` is assigned a value which is again
> overwritten in the next statement.
> Fix this by removing the first value assigning statement
> 
> This issue was reported by Coverity Scan.
> Report:
> CID 1600790: (#1 of 1): Unused value (UNUSED_VALUE)
> assigned_value: Assigning value from length to complement_count here,
> but that stored value is overwritten before it can be used.
> 
> Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 1da263676f2a..e19e18892468 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -759,7 +759,6 @@ static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
>   	if (!out_data)
>   		return -ENOMEM;
>   	out_data[i++] = 0x0d;
> -	complement_count = length;
>   	complement_count = length - 1;
>   	complement_count = ~complement_count;
>   	out_data[i++] = complement_count & 0xff;

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
