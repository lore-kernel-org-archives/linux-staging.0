Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F01E481
	for <linux-staging@lists.linux.dev>; Sat,  1 Jun 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717246370; cv=none; b=IlY9af7JHSOAjkSYyEISrjSXCZb+4NpQBJc+JU3mhQ1Xzq0FQxTBEmWPQ2NhfIjUcr7aoqwk1Fl9k1A9TLjkiMnrFnMUFIc16vmZqV4CZvIoZFwZbLzAW9dI46Uxckw1+v/eGUMacmfTBQlenTJSSAcyAGpFlJC1LSYkeHYgvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717246370; c=relaxed/simple;
	bh=HlQjZvK++Uq10ytKof9oWRg2BtTuHyHSFvSH6jqFv4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hun8vA1qKAqD2lJYYR3rD+kd3pG7y6t2In9bMDDgV+uSLoDJLOHUrkhq7WzwOzqasqx3FtRxGZ/Zo74iBBady0CPh5uGF6Y7mGtRw3TR78uf8aV3RY4b8QaC7wSogR9Xud/uOxlK2iQciNk2TIKek03SkoTL629R/Vqq2JBo77s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vv0yIEAk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv0yIEAk"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ea7e9dfba1so3261811fa.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jun 2024 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717246367; x=1717851167; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykRfs6ZMhFhtxzL78/zKz45DGl0mEcTPzTBsoi8m+SU=;
        b=Vv0yIEAkN64ChfWDyUk4hZ3Bf0rU47hWIIl7XQoA1YSX6c7ib2bQsJxjc4U0FfuBxu
         nFhnXj+pMEEY+DjBtVR9aHCAzJQBdB6Ghl5hCU2ZKgt/0YPQ6Kv457PVOa/MWBwUeu2e
         ZxrK1l9MNEnFLAgmZT0YrPofC2FEekVnonKapi3BGXtnVgnKXwZer+3ao5NAw7QltmfP
         K0+LckL1/ztOLSMY9YKCTiU/PiOqfocQ6gz2G9WLjRo5j5Di50/87EJn4zAuVi35o7EF
         6+4GbJOe/ho/dnIJYD3MfutIEjYP8bsEaIWHxNI78D0xucVA+XT5SAErp0G9CujYnCGq
         QhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717246367; x=1717851167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykRfs6ZMhFhtxzL78/zKz45DGl0mEcTPzTBsoi8m+SU=;
        b=bURJogpfv7tag9JlTcFPN6TVTBkfRqWw/WTlIYsO06Y1h6r3bTalKpv6CMdA6ypA5n
         e3NTm2mOFHs9eV1kDENaxyZlPZwe5t00hP5d5RLu5eiC9/CNLDVWMNblLNiMRVjDxIH7
         bm6nmXRagNYKtP8Wt1Io5I8NAD4/CVd6fCqDkm5Fa9L0vapNgx/YdXFekE38epj8rhEz
         OAxJgpVPDmZjglNPFEPUu9NorJouaGrBJTnH8N7LDEARkQVQvaMm3j/Sc/Z5AMJ2bxl3
         jQpB1w2E7WGK7RX9+HAr8kKb5szBcH7xAAvNllOPDXVwVPpCNNPBUvP/Y4eFX7+RL2xu
         Bmog==
X-Gm-Message-State: AOJu0Yx97IpU7hlZllZ9nJj646j36EuHM3HfWXSro6pUAKWd4Kttp8Cv
	28dUQpeo7pBXIA3aEeHwWXjQsZP6kWGboJP7ANpTMKNnHLzBS9QX
X-Google-Smtp-Source: AGHT+IHd/pAWvjJsEfp1KcD+ulnGVj3E//0f3eame8CxZxw9yhFosP3aHErCVLoLj7T18c7zZOcbow==
X-Received: by 2002:a05:6512:3b25:b0:52b:8909:58b1 with SMTP id 2adb3069b0e04-52b89702d1emr4122902e87.3.1717246366233;
        Sat, 01 Jun 2024 05:52:46 -0700 (PDT)
Received: from [192.168.0.102] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67ea67b23bsm196793466b.121.2024.06.01.05.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 05:52:45 -0700 (PDT)
Message-ID: <971c164f-5ebf-44cb-8cff-3a09c63bb77e@gmail.com>
Date: Sat, 1 Jun 2024 14:52:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: r8712u: remove unused struct
 'zero_bulkout_context'
To: linux@treblig.org, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240529000814.233690-1-linux@treblig.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240529000814.233690-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/24 02:08, linux@treblig.org wrote:

please remove the following line:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
To me it is not important which commit introduced the struct. This is 
not a bug. So I would omit this lines and use instead just:
Remove struct zero_bulkout_context as it is unused.
> 'zero_bulkout_context' is unused since the original
> commit 2865d42c78a9 ("staging: r8712u: Add the new driver to the
> mainline kernel").
> 
please remove the following line:
> Remove it. >
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/staging/rtl8712/usb_ops_linux.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
> index b2181e1e2d38..0a3451cdc8a1 100644
> --- a/drivers/staging/rtl8712/usb_ops_linux.c
> +++ b/drivers/staging/rtl8712/usb_ops_linux.c
> @@ -26,13 +26,6 @@
>   #define	RTL871X_VENQT_READ	0xc0
>   #define	RTL871X_VENQT_WRITE	0x40
>   
> -struct zero_bulkout_context {
> -	void *pbuf;
> -	void *purb;
> -	void *pirp;
> -	void *padapter;
> -};
> -
>   uint r8712_usb_init_intf_priv(struct intf_priv *pintfpriv)
>   {
>   	pintfpriv->piorw_urb = usb_alloc_urb(0, GFP_ATOMIC);


Hi David,

I would prefer the following changes:
Subject: please change from r8712u which is the compiled driver name to 
folder name of the driver: rtl8712

Please also consider the above hints.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please contact me for any questions.

Thanks for your support.

Bye Philipp


