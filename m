Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35752F80
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 12:20:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z4so6077455wrr.6
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qXyUw+WOrtg1/HVyiUZhztfPCLmF+rc/B9S0+PjHvOM=;
        b=MGDnNxtGPTbUOioghyBnvZfQtKheEArFE04VR1eyseFybLT3+owwgscYb4e2MK6Ghx
         GUxMpBJIGEnNGn7UIMsKbAF/n60AYy5ezy0zmgcRvqg6Mkg3UQRAfg8xMmPQkr5p1Epr
         7zBJYjc6uJDhh8mCf34Qf45847NfeoQ5mN0shw4huwJC/n4t0xVXzCbIBhJ2R203jFdM
         EaO5rWbI5/0T9N+lMmsH7VFXCpHDnb9wfcn/POKs6e9hSTcxlUqkamZOMZb0/loFg22J
         ThnmnS4XS7mf/QSNy9MsE4cHHn27dwkWzr3qcAOjbdamY6N9Zj0ASOcYkMUvlCVP+3ZJ
         xP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qXyUw+WOrtg1/HVyiUZhztfPCLmF+rc/B9S0+PjHvOM=;
        b=VxJMfQ1aIJQZJEXAg0Yn96/rp5PSwgC1Cos/kBzG5B0vN1aPoYeFMtjw9sFyyhejg2
         ak1mBRO12JjfviQtJuIp72F3sqBo18pdTVQu3UgL/zTlVYwSVToMcKJButjJSjzoueOB
         JLQDS1G7qvsZ2ChUWMkGCKRvtgOnTTJevJjP8Te8r9kEddfxBN+rpZcBag143xdo5nul
         38OQdCUxwE9Grx9YXHon2gyD42oDJ/6Vo8InnvZvEWW0wo/UIWOXZkON3mwukKmcsLke
         aBftgyoQrIeYkp9uxGAeP3IUQpdPlfjiJKQQ2RQekjtxKmImeUY3dKcfZ5jk2id2sc4P
         q2aQ==
X-Gm-Message-State: AOAM532j4oLmIE9hmTl8+VBzjdto32mDw9Wn2aptleBWHGU99c9QfZ0l
	dOPwM2W2k/w/yXDfQtrBOV8=
X-Google-Smtp-Source: ABdhPJzE4skZOJTJsDklZ0zu/iEVifRzIqMJvLxrPbjmLFqu8L0IqtVoEg7jWYMcE/1Z4dM+CePDEw==
X-Received: by 2002:adf:e509:: with SMTP id j9mr2008857wrm.320.1629634799455;
        Sun, 22 Aug 2021 05:19:59 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id i8sm11626722wrv.70.2021.08.22.05.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 05:19:59 -0700 (PDT)
Subject: Re: [PATCH 05/10] staging: r8188eu: remove an unused enum
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
 <20210821164859.4351-5-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <38b14452-fa19-a550-e4a9-387ceb8ea64b@gmail.com>
Date: Sun, 22 Aug 2021 14:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-5-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> The VENDOR_READ and VENDOR_WRITE defines are not used.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/include/usb_ops.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
> index b6a1cd536adf..c53cc54b6b87 100644
> --- a/drivers/staging/r8188eu/include/usb_ops.h
> +++ b/drivers/staging/r8188eu/include/usb_ops.h
> @@ -13,10 +13,6 @@
>   #define REALTEK_USB_VENQT_CMD_REQ	0x05
>   #define REALTEK_USB_VENQT_CMD_IDX	0x00
>   
> -enum {
> -	VENDOR_WRITE = 0x00,
> -	VENDOR_READ = 0x01,
> -};
>   #define ALIGNMENT_UNIT			16
>   #define MAX_VENDOR_REQ_CMD_SIZE	254	/* 8188cu SIE Support */
>   #define MAX_USB_IO_CTL_SIZE	(MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
