Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099C2C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 11:49:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id e12so35671815wra.4
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ow70teY6fTw0fJe+B4KtbccJgYuVoYyLAg4miyEmaro=;
        b=oPjUfv0/MK2Q5O70EPlMl4e3qWmNHlqmXEzXVBJGLCHJn8RQVo8+fIpBOvQZbDmb9Y
         aYX/hpMFxQ36Tb+kW+c4pg87brW+Dg1kCRPeOBAOu/rEbPuVDb1THOSjcwyakapLB0dm
         lJ/tZVNwUXA/UguHv3k8eCehyrwYFw/3diiN7mwteYx+PeX4KKIYCIYhclGlfTrmQtRN
         BGRJuujCndQv4PKtC8uTvYggn11Z9XHE0m7zTPXyRP+RViISyzUBjMEKjNvjNL3/X9zS
         qLWd+L3GiTVaWun1ABvU36c4+KcrMVVKUc2Vzw9PiaTOixouK5zhwshyCZMyRYaS9Fz4
         II0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ow70teY6fTw0fJe+B4KtbccJgYuVoYyLAg4miyEmaro=;
        b=NyX83OfCfuprSPhX+3iNt1ZJGKzUNeazfeMWLWu4GbFdv6Xck88PRsFFTZw8w5QOSA
         O3gtbn5La9wwEhxkBaY7AFqq6E/W7zThwJTou3ZGe5NFNRY2zQEUYG3ODii0h4mkeNne
         eu+ig1/zY1Rp+CYGqdlYnkKVsCcJU9ytPd52h0El4F95SfeUSagPLzS4J6Zrqh2FJSGr
         30L5Zsd32JOFBETeDYDK63Ceg29f9Jug7uWVT/krxSXr3wXknuB77/JyQChT4TvPb1WK
         BiKBygmS7E0DE/N8pDLEKLpDGSyUYP5p/z8B7zTQ+iK0mopPVdyh7ZhgP0GObs0lH3oN
         1uLg==
X-Gm-Message-State: AOAM532WdiTu8uIyMLyS3vUnRv4W8EstPJs2qyqfw2iLRX3Lnynoi7HC
	ZxqYt+E2WSLivV+uqSNqbjgD5E7dX+A=
X-Google-Smtp-Source: ABdhPJx00mFrK6B5yRnFsgS+6NmPV0He29YMeFXERxNIY+s24b4ndJcEln6fQhxtmOKHs/Zh06beig==
X-Received: by 2002:a5d:47a7:: with SMTP id 7mr27684746wrb.75.1634471339094;
        Sun, 17 Oct 2021 04:48:59 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id z2sm9513903wrh.44.2021.10.17.04.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 04:48:58 -0700 (PDT)
Message-ID: <80da52cd-f20a-770b-613d-a3a65aeb7ceb@gmail.com>
Date: Sun, 17 Oct 2021 13:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/8] staging: r8188eu: remove two checks that are always
 false
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016113008.27549-1-martin@kaiser.cx>
 <20211016113008.27549-4-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016113008.27549-4-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 13:30, Martin Kaiser wrote:
> Commit aefb1fc5c185 ("staging: r8188eu: odm BoardType is never set")
> clarified that the odm board type is always 0.
> 
> The CheckCondition functions extract the board type from the hex
> parameter and stores it in _board. For _board == 0,
> (_board == cond) && cond != 0x00 is always false. Remove the checks.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c | 5 -----
>   drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c | 5 -----
>   2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
> index a623e0aaa0d0..f6e4243e0c7b 100644
> --- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
> +++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
> @@ -13,7 +13,6 @@
>   
>   static bool CheckCondition(const u32  condition, const u32  hex)
>   {
> -	u32 _board     = (hex & 0x000000FF);
>   	u32 _interface = (hex & 0x0000FF00) >> 8;
>   	u32 _platform  = (hex & 0x00FF0000) >> 16;
>   	u32 cond = condition;
> @@ -21,10 +20,6 @@ static bool CheckCondition(const u32  condition, const u32  hex)
>   	if (condition == 0xCDCDCDCD)
>   		return true;
>   
> -	cond = condition & 0x000000FF;
> -	if ((_board == cond) && cond != 0x00)
> -		return false;
> -
>   	cond = condition & 0x0000FF00;
>   	cond = cond >> 8;
>   	if ((_interface & cond) == 0 && cond != 0x07)
> diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
> index 3e2a09fc2619..5e0a96200078 100644
> --- a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
> +++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
> @@ -6,7 +6,6 @@
>   
>   static bool CheckCondition(const u32  Condition, const u32  Hex)
>   {
> -	u32 _board     = (Hex & 0x000000FF);
>   	u32 _interface = (Hex & 0x0000FF00) >> 8;
>   	u32 _platform  = (Hex & 0x00FF0000) >> 16;
>   	u32 cond = Condition;
> @@ -14,10 +13,6 @@ static bool CheckCondition(const u32  Condition, const u32  Hex)
>   	if (Condition == 0xCDCDCDCD)
>   		return true;
>   
> -	cond = Condition & 0x000000FF;
> -	if ((_board == cond) && cond != 0x00)
> -		return false;
> -
>   	cond = Condition & 0x0000FF00;
>   	cond = cond >> 8;
>   	if ((_interface & cond) == 0 && cond != 0x07)
> 


Acked-by: Michael Straube <straube.linux@gmail.com>
