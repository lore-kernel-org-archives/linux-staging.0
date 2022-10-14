Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688CB3C13
	for <linux-staging@lists.linux.dev>; Fri, 14 Oct 2022 16:56:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id d26so11749190eje.10
        for <linux-staging@lists.linux.dev>; Fri, 14 Oct 2022 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ycRi29HNGzJsYqIV0PQZFjUg4SSWnYtQKjFXj41VIU=;
        b=q6OUZOBAYpZhF0HMURyGKoC2Dbf8GVUt4hr7xNspUKQlGUEEh5y4L+3ql8om/lrR3R
         JBlA5po0rKArSFNyKfeeuP1roO2Hog+2FibtdZDfUXNtwagGJnQ16t+J/8I0mX8ohAQd
         bsukgtvcc03VC6TVA2ASWsN543lOuWV1TcFNsEh7XRegpmcvlNHFqXk9Ee6jvze2HSMQ
         da5k1z1EenZr1re3UXyYOek2lKN0xIJYe21w4VFAmQ38xriuytucPD3zw6070Z3jZCeK
         q+NqSjaoFy9byj45fmekRO4cgbqBKvi7FXPad29GbX19SB2CwSCPtx4wdmQjHOeAJI7Y
         a09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ycRi29HNGzJsYqIV0PQZFjUg4SSWnYtQKjFXj41VIU=;
        b=KWhQlEo8iCzLLgRvaPY/Va+37fwskiz4/2hPhyxVT8kepNRbXJ0wvCAmsh4C4I8Y7m
         2n9ArNVEnctLWI2yLzkl93pv2DLen7O/h/p7aPYLh9dv6BNq72gxchJjfKxZtpLZlW8c
         03qZriTl9eMlLYXTAFIW5bShjEB11tnGlrK2WzDqbHI/8lA/OF8OcjLs7ZT4P+X/q9Bp
         nRuglKbWMOBA4KN3wXoHvibhemEVNl7ctXSUmsXZ+tMqqHkGXUYNbkLNohzogVZXDCke
         tbdh6pvqW10l26KB/M7vXuGHp3P6fIVt3Vk3uHe2puVPDm6fqxoZ8tciBZitW4ZA0c8F
         kZ+g==
X-Gm-Message-State: ACrzQf2kOqaCfR69kBw6Kjp/aGbe7eDuAc0p8yqFLd5BvPaqN0Zmn+WG
	cS0A9gX1GFCGzZ8O/T9BBUgSb6mSAZ0=
X-Google-Smtp-Source: AMsMyM6Gtop/ipLAmL+w9SYX5VT78bZu7hhlyg2cE/p7KwrM52FSicwlEtbya4Fc4go6g5AFQ/qjXg==
X-Received: by 2002:a17:907:1deb:b0:78d:4a0e:f654 with SMTP id og43-20020a1709071deb00b0078d4a0ef654mr4260694ejc.757.1665766569596;
        Fri, 14 Oct 2022 09:56:09 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906155600b007081282cbd8sm1784257ejd.76.2022.10.14.09.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 09:56:09 -0700 (PDT)
Message-ID: <08887454-0ea8-107d-196d-b21b46e357da@gmail.com>
Date: Fri, 14 Oct 2022 18:56:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Staging: rtl8192e: fix a brace style issue
Content-Language: en-US
To: Rigel Di Scala <zedr@zedr.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 rigeld@gmail.com
References: <20221012211612.75871-1-zedr@zedr.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221012211612.75871-1-zedr@zedr.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/22 23:16, Rigel Di Scala wrote:
> Fixed a coding style issue affecting a conditional if statement.
> 
> Signed-off-by: Rigel Di Scala <zedr@zedr.com>
> ---
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 19d13b3fc..e932ad1a9 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -180,11 +180,10 @@ static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
>   
>   	skb = rtllib_ADDBA(ieee, dst, pBA, 0, ACT_ADDBAREQ);
>   
> -	if (skb) {
> +	if (skb)
>   		softmac_mgmt_xmit(skb, ieee);
> -	} else {
> +	else
>   		netdev_dbg(ieee->dev, "Failed to generate ADDBAReq packet.\n");
> -	}
>   }
>   
>   static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

