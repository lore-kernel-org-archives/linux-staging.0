Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C27313558
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771705239; cv=none; b=gpqnW8q/jBLd8pBEOCxATLXG4I0osctUa1UIqzDQk6LEl585yrrFpEImTfIAhrtsS5dlzN12aEHLxVUk6Y4/J6ouU0iPJFjO7cSjIy13d2egflZBZN9OM2aWyFKCmNJvvpqGpZmL1fvXxHhRnePKTEvKuAJbJsqJzH9VrqmQRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771705239; c=relaxed/simple;
	bh=YutVV/Yp/b+yJFKeAUB7af/0rb1SmXkhm7HkOhPprpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCbt5GGG4vTX/TQVKoAT9+/M6pdASsIORIrHy63eKgEV+RLcJfLiJ5DCQ3vWOoa+DN1hTiroPidJgiCGl2HnfmUwRCD6trGR4d2Tvz6xT6rgFvtGulcoTCTFm5BI18obWwQS4PONpjYHPnrqhKNRmbLqh50+nPc2uOj50FniL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6nTgvUR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6nTgvUR"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb5138df1aso323048085a.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771705237; x=1772310037; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hl7pbSCAC6EgWEJVHJrMgxzQ04hk7/FUA/tscJI2bVc=;
        b=O6nTgvURmwHgHH1aTf1C2qb8rYxbrDLuUNAKpe0agOTIbs5aVaIN1ruE6zLdN+CJj2
         CgwmZ5l4CD5CHkS2qDLomObMAu0iIRc5+bAGMFogzE8UTMCVifxhQk96R88RVwU5634P
         b6xTxVIVuMz3lgQMVN997WbdIrmim2Z2RoE9pkW0RpXhyHavBGfNJwpOuQVHjob8zZzE
         hQQ3/C+1WS2Fw8ZCyGzuDvWjNC1q6P0De6BCVM/lGD71ppDvt2aSnJTl2pIVZ/EC4Meg
         y3GiLHxB9NBnBl0a9LW+lX+uzu+4YU74d9zKzC7XNDY3X9SRG3ANJFpddXBGJ3PdCy7O
         EjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771705237; x=1772310037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hl7pbSCAC6EgWEJVHJrMgxzQ04hk7/FUA/tscJI2bVc=;
        b=o05XCmRyzl9cXbqihXqX80sg1l1xfnNjPi+jiEFpIUVvBvhfBzrzSD/2/5IZPnoSYB
         bCpPrYGi8Xv+3VYBWrcCa0pAD5SZvaIN6gS8m7EFwsXTWKcjpZUju10lEsriCGm3UvcZ
         fqLUei8Cwa61lYFYPcn7aLu+CafyRnVJqbuYEJzqRWinmT4DwLNqVRxiSUatwmznyRHc
         vCfQaasyDYds8CprNtvc+VqqSehHqPgvbtJlHTkZKyav4/hb3V8AP5bvdfpVV7fYMMhn
         hcmVqKKFBrPGro6H2PUdiw6NkpuSvXKsKidg0tMFBxWI1lFpgq0r9TZW0FXNBdnfAU0r
         YKLg==
X-Forwarded-Encrypted: i=1; AJvYcCUlh3/7GiqI0goiQTSS35kezo/A9j2pddkstp/mbNuX3mGOffEg3aN9qYj8oiqrunNHGAn8mUxQaIStxul+@lists.linux.dev
X-Gm-Message-State: AOJu0YwA+rX4CdNE2CuS1PsXDJgnxha9YJEOAmWXmxGMJ/mEUa9itTmJ
	Kcleyq1E/66fh66jAF/RtO8w2SBFYRALG0ApctDq0osce/9Vk6Jq2wSz
X-Gm-Gg: AZuq6aJ0VakCyEHtkzi4jhbAXO1m6VatrYOa54dk3ZbqKyE0cpLmZerF0aki4fLyqt2
	mo2V2LEumxSomH7nudD+077kkNRHNrMaf5lF48+pnNKsbbiZ7DJ0E2AKMGQ2Y/jmk3RyAWyN2iu
	rPhy2OFPOQM2DCpDS9tWQ3BWUtEYoUeh0Awhwkd86DsuJF0OMj0tVISbtK8sGj9au+pJUdOMVuX
	jObEcjEqDGaY/EvdVyobm9/143zzwmNom+lvThKQ0+lRZYBamo5bxUBoyD9SZSziDwiO1okZaiG
	kzLykxJzAUOOUbx2TDK+My0IlTyZoPfrkcmPaGss1gmjoyuZ01j/bc0kKj2aOkTXP7MRrewqHUh
	pibOt7qIjzpvtnTyfukuHyBYiSgGXwtr3V1fC9F71b11NPbV5VgKf0DjjQVICaDhZYEBSn9BON6
	iu3ArAVLP/yzp4sXuEAHtmPRFpkIcBAMeNbXy5wuE8BuNcx/fzCA==
X-Received: by 2002:a05:620a:28d1:b0:8cb:1ddc:4300 with SMTP id af79cd13be357-8cb8c9f3cc5mr447493385a.20.1771705237304;
        Sat, 21 Feb 2026 12:20:37 -0800 (PST)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d120020sm268327485a.45.2026.02.21.12.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 12:20:36 -0800 (PST)
Message-ID: <694bcd12-7a1c-4be3-8921-20e5b0b88cc0@gmail.com>
Date: Sat, 21 Feb 2026 16:20:33 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] staging: rtl8723bs: Clean up wrapper functions
To: Priit Laes <plaes@plaes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minu Jin <s9430939@naver.com>, Archit Anant <architanant5@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Philip Thayer <thayerscirez@gmail.com>,
 Bryant Boatright <bryant.boatright@proton.me>,
 JJ Strnad <strnad.jj@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 William Hansen-Baird <william.hansen.baird@gmail.com>,
 Navaneeth K <knavaneeth786@gmail.com>, Julia Lawall <julia.lawall@inria.fr>,
 Tanjim Kamal <tanjimkamal1@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Artur Stupa <arthur.stupa@gmail.com>,
 Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 Michael Straube <straube.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Ethan Tidmore <ethantidmore06@gmail.com>,
 Zhuoheng Li <lizhuoheng@kylinos.cn>, Michael Huang <tehsiu.huang@gmail.com>,
 Nino Zhang <ninozhang001@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>,
 Diksha Kumari <dikshakdevgan@gmail.com>, yingche <zxcv2569763104@gmail.com>,
 Karthikey D Kadati <karthikey3608@gmail.com>,
 Khushal Chitturi <khushalchitturi@gmail.com>,
 SeungJu Cheon <suunj1331@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>,
 Erick Karanja <karanja99erick@gmail.com>, Sun Jian
 <sun.jian.kdev@gmail.com>, Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-11-plaes@plaes.org>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <20260221190628.50273-11-plaes@plaes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This change doesn’t really “remove wrapper functions” so much as it 
moves the wrapper bodies into the public APIs, and inlines 
|_rtw_dequeue_cmd()| into |rtw_dequeue_cmd()|.

Minor: the |if (pcmdpriv)| guard in |rtw_free_cmd_priv()| looks 
unnecessary if callers guarantee non-NULL. If you keep it, please point 
to call sites that can pass NULL (or drop the check).

Best, Vivek

On 2026-02-21 3:01 p.m., Priit Laes wrote:
> Remove wrapper functions in cmd queue handling.
>
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>   drivers/staging/rtl8723bs/core/rtw_cmd.c      | 88 ++++++++-----------
>   drivers/staging/rtl8723bs/include/cmd_osdep.h |  7 +-
>   2 files changed, 39 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index d0694a659259..60e2de7991d4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -210,32 +210,6 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
>   	return 0;
>   }
>   
> -void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
> -{
> -	cancel_work_sync(&pevtpriv->c2h_wk);
> -	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> -
> -	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
> -		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> -
> -		if (c2h && c2h != (void *)pevtpriv)
> -			kfree(c2h);
> -	}
> -	kfree(pevtpriv->c2h_queue);
> -}
> -
> -void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
> -{
> -	if (pcmdpriv) {
> -		kfree(pcmdpriv->cmd_allocated_buf);
> -
> -		kfree(pcmdpriv->rsp_allocated_buf);
> -
> -		mutex_destroy(&pcmdpriv->sctx_mutex);
> -	}
> -}
> -
>   /*
>    * Calling Context:
>    *
> @@ -246,7 +220,7 @@ void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>    *
>    */
>   
> -int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
> +static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
>   {
>   	unsigned long irqL;
>   
> @@ -265,38 +239,35 @@ int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
>   	return _SUCCESS;
>   }
>   
> -struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
> +void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>   {
> -	unsigned long irqL;
> -	struct cmd_obj *obj;
> -
> -	/* spin_lock_bh(&(queue->lock)); */
> -	spin_lock_irqsave(&queue->lock, irqL);
> -	if (list_empty(&queue->queue)) {
> -		obj = NULL;
> -	} else {
> -		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
> -		list_del_init(&obj->list);
> -	}
> +	cancel_work_sync(&pevtpriv->c2h_wk);
> +	while (pevtpriv->c2h_wk_alive)
> +		msleep(10);
>   
> -	/* spin_unlock_bh(&(queue->lock)); */
> -	spin_unlock_irqrestore(&queue->lock, irqL);
> +	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
> +		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
>   
> -	return obj;
> -}
> +		if (c2h && c2h != (void *)pevtpriv)
> +			kfree(c2h);
> +	}
> +	kfree(pevtpriv->c2h_queue);
>   
> -void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
> -{
> -	_rtw_free_evt_priv(pevtpriv);
>   }
>   
>   void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>   {
> -	_rtw_free_cmd_priv(pcmdpriv);
> +	if (pcmdpriv) {
> +		kfree(pcmdpriv->cmd_allocated_buf);
> +
> +		kfree(pcmdpriv->rsp_allocated_buf);
> +
> +		mutex_destroy(&pcmdpriv->sctx_mutex);
> +	}
> +
>   }
>   
> -int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
> -int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
> +static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>   {
>   	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
>   
> @@ -337,7 +308,24 @@ int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>   
>   struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
>   {
> -	return _rtw_dequeue_cmd(&pcmdpriv->cmd_queue);
> +	unsigned long irqL;
> +	struct cmd_obj *obj;
> +	struct __queue *queue = &pcmdpriv->cmd_queue;
> +
> +	/* spin_lock_bh(&(queue->lock)); */
> +	spin_lock_irqsave(&queue->lock, irqL);
> +	if (list_empty(&queue->queue)) {
> +		obj = NULL;
> +	} else {
> +		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
> +		list_del_init(&obj->list);
> +	}
> +
> +	/* spin_unlock_bh(&(queue->lock)); */
> +	spin_unlock_irqrestore(&queue->lock, irqL);
> +
> +	return obj;
> +
>   }
>   
>   void rtw_free_cmd_obj(struct cmd_obj *pcmd)
> diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
> index 5506f513dc01..b0ac41d2be24 100644
> --- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
> +++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
> @@ -7,12 +7,7 @@
>   #ifndef __CMD_OSDEP_H_
>   #define __CMD_OSDEP_H_
>   
> -
> -int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
> +int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
>   int rtw_init_evt_priv(struct evt_priv *pevtpriv);
> -extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
> -extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
> -int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
> -extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
>   
>   #endif
