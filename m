Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE323FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 11:57:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id e5so5083712wrp.8
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BujFUWKPfh9ULOTXul8Joza1GB05OuxtEo0gxSDLVLM=;
        b=FtmtZedpdgN6q+hPxMXJytaLi1u2Z2CDN4DQrBN3DPuCB9lC3X91gtitUk5ottQHLu
         RKJiQ2Kw4R1sYMLNqlRJCnBXBZTizpKyrd9jsOiSMjtlkbD18eEQJQ7EQOr7R5gTVcIa
         0OO2dMWV5HGiK9RI/k2vN/8zqygU0jTBEzwyY0dXsCoZYuZIaA2OTTSoTrFreMNhdiov
         w9i7Zhv7jWXdhMacZgHUS3FO2iKXv0QshrC4IV1JhVjkHgfFEvcnopcC4TlcPYPdlCgN
         7fzUOuRyA4ix5/LHiUsC6TFB828Nm5RJSMgOMRjeSQLfx5XCj4G5loVQtdLFSdAZ98B/
         2d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BujFUWKPfh9ULOTXul8Joza1GB05OuxtEo0gxSDLVLM=;
        b=dpSiktFyLjWhDFHe3kqbdJvHnYDitPZv/6CUhOCs2WZbdB5ec5XRS1EU2ZpB4/endw
         JD1vJ5JmAu9folwF7ZNHVKJ9xYSqNPpVtIGiOBYROQL+8jZcEonfUsJ1q13NFe0Q6Q8b
         Mcp3c+W+kANcWyPvihrCeXlj/ZYN04DgEug3wxzvX9SXqMMs94w/0GmYuBMT24SZST9X
         AEC5+qvAJZQxOEqN2WPA0BC3Z31xFxgg4qfkphQB+t2goYKdJqd9HmJdac++5N39F4oE
         hTmihPl+I8/v846LehWKZuh9RqujHybNY6K/VhBw+lqlvZAp8V6mbGPz6Udfq2Ey46kD
         IONw==
X-Gm-Message-State: AOAM532NBfSwjLAAOhAPhrn4jmDREBc634rqeMqZQzoi3ikUDOr3nARG
	bC6GCvTqJ68vlJiKVeh7DB4=
X-Google-Smtp-Source: ABdhPJw1g7BaYLAWa8PRyoegeomT+1Axe5l+n1SMivYHtqnFrriE5wU8D32+wGZDebVAk8Oy1S1S1Q==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr8131900wrr.129.1629633433431;
        Sun, 22 Aug 2021 04:57:13 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id j17sm11690572wrt.69.2021.08.22.04.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 04:57:13 -0700 (PDT)
Subject: Re: [PATCH 02/10] staging: r8188eu: remove unused define
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-2-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <f98161a4-2065-d915-1d1e-04fbcf202e2d@gmail.com>
Date: Sun, 22 Aug 2021 13:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-2-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> _HCI_OPS_OS_C_ is not used in the r8188eu driver. Remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 953fa05dc30c..a11a0597e515 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -1,8 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /* Copyright(c) 2007 - 2011 Realtek Corporation. */
>   
> -#define _HCI_OPS_OS_C_
> -
>   #include "../include/osdep_service.h"
>   #include "../include/drv_types.h"
>   #include "../include/osdep_intf.h"
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
