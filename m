Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463921E3A4
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 22:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729031732; cv=none; b=goOmyMbs59yORYElN5A9NZt6N3Cjes4Xqta6ilMDTbwtSxwlMV2CgzkXItQMlrsVmPFFMW5n3ML3hveNrNphZHkQ/vZ6QV8yzocD+lnHIb3EeLGBK5LzJgUx6E4stEXjOGu38/NS2QzQds5mY1TCxmEu0tt+NrcmHTl52z+1udw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729031732; c=relaxed/simple;
	bh=JPcxb0MBfSmyg0lqjDguos35ekSSnWJaFqu5QJwB4LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIwPDw94iMyP/AgUMt79LvCrNUt++ZSp2BmVPIcr+wt3iStVqy2M3iujPAwtQTs7PKjdmCB/BQMfdf8FGY7yNh4rtXECJ5Q1DnrjnprAaZco8ud27UeGQqAbW+LGSVLh0FUW2UiBOKqVjAFrFD7xSxEFGTSSzWWlM7oRqjTADUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B72141Fd; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B72141Fd"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a3a380fd55so22184965ab.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 15:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729031729; x=1729636529; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXRCnoqzM1JhBOspHgulbLEu/aXFFZE816rKdSVssj8=;
        b=B72141FdJHe42gPAAzsC6AN2OLPP4595ZdsMW9R2nUdMOyj4Glx6h6Fo4lmj/hn9Uu
         +JqUAEYFgC3IRS8S9JQFIFQqd+VkucWiGSx9215MCmAMUc6yq1GO8cXk1qVFbghXST32
         OZTgBkx/3H16JB23DqAnXvNPPSM1i0Qy6m77M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729031729; x=1729636529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXRCnoqzM1JhBOspHgulbLEu/aXFFZE816rKdSVssj8=;
        b=TMFYEy4+p174vUbAz76yjCYZvgJHOOlMBuRLB3qzDveExzRzEkSfl3U1TUMMA2tSea
         CfaluSMK+y+XK5ityqcc2Zu0T+8agQqK+y67dUBCHMB5zVQm5DLUthy8g3FborvcwIm9
         dCyBcwjEndLynXw/fZ3fGfkopQ9yDZHcoNwjQJnFTgHIpB2iMj3ifUAajKVynMUSPbAB
         UnM/Tvck6nhSUNJ/wuF4lzOnzj9cUBuYb7LlnM0bWQjwoTrF5M5FW34/4KJ/Qy04/68n
         EEUXDtFyGS5t+F8dbCyaJ0scauJRxjoZzte34gWEc3jCmI4dkYt7ovbx5r4u/spTqaFe
         2VGA==
X-Gm-Message-State: AOJu0YwCli6GsIvrGN4CtG3KdVOFY+XLGaS1H3fMqOVTQRJxzr0+P2l/
	0vHu6QMN7ogMT2omSUOKtr1VjeNwVA8EGBA775Dk2wEVuX5tPLVWSafC429JDGc=
X-Google-Smtp-Source: AGHT+IGQW6EL87nu0RI7VTlMHpQSpbGTwvfv/vh3kdihkb+1mjnSYKpir26C0GpR0Iqf3ZpZvi3VJw==
X-Received: by 2002:a05:6e02:2185:b0:399:4535:b66e with SMTP id e9e14a558f8ab-3a3bcdc0015mr112300545ab.9.1729031729103;
        Tue, 15 Oct 2024 15:35:29 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3d70aec30sm5226605ab.29.2024.10.15.15.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:35:28 -0700 (PDT)
Message-ID: <99056bd3-748f-42e8-a25a-131f7b194f55@linuxfoundation.org>
Date: Tue, 15 Oct 2024 16:35:27 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Move free after the variable use has been
 completed
To: "Everest K.C." <everestkc@everestkc.com.np>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241015215157.18571-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241015215157.18571-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 15:51, Everest K.C. wrote:
> The variable `in_data` is freed, but used later in the code.
> Fix it by moving the freeing the memory after it use has been
> completed.
> 
> This issue was reported by Coverity Scan.
> Report:
> CID 1600783: (#1 of 1): Use after free (USE_AFTER_FREE)
> 19. pass_freed_arg: Passing freed pointer in_data as an argument to
> ni_usb_dump_raw_block.
> 
> Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 1da263676f2a..75f39e1f3ed1 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
>   		kfree(in_data);
>   		return parse_retval;
>   	}
> -	kfree(in_data);
>   	if (actual_length != length - status.count) {
>   		pr_err("%s: actual_length=%i expected=%li\n",
>   		       __func__, actual_length, (long)(length - status.count));
>   		ni_usb_dump_raw_block(in_data, usb_bytes_read);
>   	}
> +	kfree(in_data);
>   	switch (status.error_code) {
>   	case NIUSB_NO_ERROR:
>   		retval = 0;

Looks good to me. Isn't this on next though. Don't forget to
indicate it is against next.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
