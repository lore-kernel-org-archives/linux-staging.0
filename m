Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D041A28F1
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 19:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724615077; cv=none; b=HCJ2LIfRPqb/BJ8qrub9byavqKLv0mZJqyTFtNC5C835bsKKoLp/Q8TtbYluv4lqz7NYPhhXqAiS2k6V9kMXU3hqpuostlsS4BxkrZxGE4IyJ7eK+IpwP9WGoivLs4xfR+i47n/gGSM5xTU2VYFYQuJ+jdY/dh5ck1DTxKY9olk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724615077; c=relaxed/simple;
	bh=3aSgmy2z4pausqZBDFYJruBHjeDB2tWoXHMVkZB36YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t+bPnbN0ILjohwPZKcHVSbHHP1aU1b/Dbk8s5jVNESCx3FvNTIwZS/a9IxcJ/sLem1hftvA2//NyIoOVptMrVuHlx3hhJMV/K0axwpuSeWY3YpCbEZkmCMnaSUfPExIAtraTxDPOJ+6qGUXY02Z8zh3qRitErQRXO94AwvsqTD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL6re+Hl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL6re+Hl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bf009cf4c0so3768188a12.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 12:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724615074; x=1725219874; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRw0/BmZA1JaNPxfbsuBNaktJ+Y30bFXZTx3rW6j/Es=;
        b=VL6re+Hl/L/JlDJ+/R9T9f7OzZAGBt5GxOfMDrv4sNL9s74hYtyzT8qMREbLSUXXw7
         E1kGmFNn/vAxAmw7mCDN6G+I7f0RiPzKyvscAytXds3RyGZ6PfiMsJAWeqw73mJnEUvv
         hHKXO6PLh+gEaUl5m+zblbDptKmW5QOXxN8q7+Ex1mlLgM9qxIWlj9ALVRk1qUztE2Mi
         sMv1RmaloOvhQtnsOpJe9pCc5rbTeSFXYBogF91M+ENHQl/oTW5DmtFVHhadhYdvkWJ6
         QoL9y9N9A/Xo+vT+aqvgoD1HTrm+wJGMsyjNYtsoKOA1V+rmz+zJyQjJp63+bOvUknwR
         DN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724615074; x=1725219874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRw0/BmZA1JaNPxfbsuBNaktJ+Y30bFXZTx3rW6j/Es=;
        b=LM83vT1ZpIQPNmrE2ziXgTJBlP4pF07xnyHXN4AqZayXmfwNqDBvVkEhyMnUoQP8Kr
         Azhy+5ooH5OGQ8QpHyCBP3kBs5VYGC0B0eL/SYBzotoxcuT7TAQ5d16nHmPeEHIsWDY4
         gUgBtpFjEfAR1QQ+QZDaig+HkyPJEKPmvby7sDfbQKSV0JcKIFkMa68dv65lbdF2N2EM
         HoDiSQLOfZv5zgkLV9tFHlBpqi0hdB5M0I/4ryfkpf9/0KADubbSJUrTvFiJ4B+apRXC
         WK/rSgU0lvjOcvfAdVeCBu8KZSHjIs7xeimyN7HX+Ccd9TzmgTr9GVKICiPMj/PMzXmL
         TqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCViAau3NXle/2XWPofKKnGVZdE+2dwHqTJ4y7vO51EgkZUCYASY4qdXMit42eNbfQQpFJN5NkWZPqQuq8u3@lists.linux.dev
X-Gm-Message-State: AOJu0YxY4wPG2vT8lqJhmgItTNFTELsdmMl6BnS1DwfYSspoojhNtDUf
	xHco/IcMHht/4INQy9sIsrosdFx5WqL+uJ1Oiwlrveny/LKOMo6k
X-Google-Smtp-Source: AGHT+IHdZzIXvWAwVnqVi7nwuR8NFGLFih+D3hWUgh/Fk+yqokxyjBn8tVBsCU7Y1FDf8XecZ7SYZQ==
X-Received: by 2002:a05:6402:5187:b0:5a3:3cfd:26f7 with SMTP id 4fb4d7f45d1cf-5c0891abad5mr5926380a12.32.1724615073776;
        Sun, 25 Aug 2024 12:44:33 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddc0dbsm4720390a12.20.2024.08.25.12.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 12:44:33 -0700 (PDT)
Message-ID: <f514b1db-154e-4450-88e9-cbfb8c66a69e@gmail.com>
Date: Sun, 25 Aug 2024 21:44:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix Assignment operator '=' in
 rtl_wx.c:681
To: Alien Wesley <alienwesley51@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240825161335.21737-1-alienwesley51@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240825161335.21737-1-alienwesley51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/24 18:13, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: Assignment operator '=' should be on the previous line.
> 
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index 47f1adf30ab4..2d42e7a5bcdb 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -677,8 +677,8 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>   
>   		if ((encoding->flags & IW_ENCODE_DISABLED) ||
>   		    ext->alg == IW_ENCODE_ALG_NONE) {
> -			ieee->pairwise_key_type = ieee->group_key_type
> -						= KEY_TYPE_NA;
> +			ieee->pairwise_key_type = KEY_TYPE_NA;
> +			ieee->group_key_type = KEY_TYPE_NA;
>   			rtl92e_cam_reset(dev);
>   			memset(priv->rtllib->swcamtable, 0,
>   			       sizeof(struct sw_cam_table) * 32);


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
