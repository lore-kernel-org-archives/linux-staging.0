Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1463C2B
	for <linux-staging@lists.linux.dev>; Wed,  4 Jan 2023 13:34:00 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id h26so5206216ila.11
        for <linux-staging@lists.linux.dev>; Wed, 04 Jan 2023 05:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6lnHIrLeffNqYuMzqqIZDsBK+pCEcWE0LlZrei9DjY=;
        b=BWA4m8t4wHPfxNwvMoBi6UA3kZuyt9r0R37MxFbbpgIJe5FLYUXuH0TtWrjXFhThig
         CxT8nB0yVHjnoEMQ+a3Sqe5wf1E5wnsClLCq3k1pmcXSnxGgWHLBsVWuKfk3C71BESxv
         NZeFGC+KvmMQVpjeSiWgCO2VYG0o7ymoqkB3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6lnHIrLeffNqYuMzqqIZDsBK+pCEcWE0LlZrei9DjY=;
        b=b5m6dMI3yF/CKJfHMoLlFCooeYXS28sYMjlyIG04qyZa6Em+1+K+qC3W4rqDJrO26q
         ObzIjlfWNs/U4zpc+HrA7mjUgZC3X6+L5eYJA7VNUSINfvCzWMC865U0GwVZPnTERply
         AY0B2f0OJxNKqFepMzFrHv4R3RNk++6Pz9Lz6DMxmR7IZ/1Dwog4uurvZWdhQL8xbQIO
         ukJ2x2a004kCTHCzJdX4Zn64AX0PKK5EgDn47wTulOfL+Usz//4C0QmUqBVw7XYtMBHA
         CjCsHqi24DUSLpD6BmxT2umYWi44cgnpkekQcZVBdufA2FeYp/pkT9PAvu59Quy60ump
         l7KA==
X-Gm-Message-State: AFqh2kqG/NWD5b5mob59IXnoGw8ZboZIQBCdRjyDyrkYOHaOX+WAujXY
	Ki45ZWiWXG4AaPK4eSmW/AYbQA==
X-Google-Smtp-Source: AMrXdXuwjWYJ8N4s26XlYKVs8+TthVoGFb5zQvfgcG+226lExm6A3+9S6riTirOXFmyvfnVowlESjQ==
X-Received: by 2002:a92:d10f:0:b0:304:d0b7:e362 with SMTP id a15-20020a92d10f000000b00304d0b7e362mr30117562ilb.5.1672839239344;
        Wed, 04 Jan 2023 05:33:59 -0800 (PST)
Received: from [10.211.55.3] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id q24-20020a02a998000000b0038a360671adsm11168718jam.27.2023.01.04.05.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 05:33:58 -0800 (PST)
Message-ID: <f943d3ca-7cf7-cb4d-5dc7-1e45015ba213@ieee.org>
Date: Wed, 4 Jan 2023 07:33:57 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: greybus: Replace zero-length array by
 DECLARE_FLEX_ARRAY() helper
To: Deepak R Varma <drv@mailo.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>
References: <Y7T5MYfANf2xVsEx@qemulion>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <Y7T5MYfANf2xVsEx@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/23 9:57 PM, Deepak R Varma wrote:
> The code currently uses C90 standard extension based zero length array
> struct which is now deprecated and the new C99 standard extension of
> flexible array declarations are to be used instead. Also, the macro
> DECLARE_FLEX_ARRAY() allows to use single flexible array member in a
> structure. Refer to these links [1], [2] for details.

Thank you for citing some references in your commit, it's
a good and helpful practice.  This might have been another
helpful one:
 
https://lore.kernel.org/lkml/20210827163015.3141722-2-keescook@chromium.org/

> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work

FYI, Linux mailing lists hosted by kernel.org are normally
cited using "lore.kernel.org" now, e.g.:
   https://lore.kernel.org/lkml/YxKY6O2hmdwNh8r8@work
Your patch is fine, this is just so you can consider this
in the future.

> Issue identified using Coccinelle flexible_array.cocci semantic patch.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> index 8e9d9d59a357..b7badf87a3f0 100644
> --- a/drivers/staging/greybus/usb.c
> +++ b/drivers/staging/greybus/usb.c
> @@ -27,7 +27,7 @@ struct gb_usb_hub_control_request {
>   };
> 
>   struct gb_usb_hub_control_response {
> -	u8 buf[0];
> +	DECLARE_FLEX_ARRAY(u8, buf);
>   };
> 
>   struct gb_usb_device {
> --
> 2.34.1
> 
> 
> 

