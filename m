Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202C4EB45
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724607348; cv=none; b=XXBweHZW1o2m5uX0S8iv0My6jdPyHQjzOxxH746YgFaf5WxbX8ffkEKCiDtivZDQwK5MH7wRQoWXds9wwLtFVv4nO2iFidWh03NPCwjxn+WrwRYXxna9nxdA4dq/Nr/l4k+OkOuwxNhOQ+DyuN1rgRSl15wsClinmhfFYDpZTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724607348; c=relaxed/simple;
	bh=XhM7xFZ+HD+CLl/hPjKrMMP5PPL2J3uytRBUBMI1dQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mRiOm2s9peA1miw4ByWjj67acVMBX4Vv9FTcExHUE1SdDgCkb+JqfcMPE7ib6rWVl0VrYd2893nBWfsYbCzHi86Gs0VUiK2FyVCuRpuf166JeVnovHXq1emjyb+JGQsE9fRExYWW896I/nVlMlglrdc31oe6jRdCttwRzv5nt1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmwAGVwp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmwAGVwp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso1866118f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724607345; x=1725212145; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=he266uKSoBPrnIX/bWlKMDUsonIDnd3kNbR3Ld/RGFs=;
        b=VmwAGVwp38Xpp4JLj6z1ZyQfX+NiNvYmaCNqkbhmIuKAeLsENxT5GP8fQQ8FaAVd/+
         dkuKMOLjZnhEftGS6XWJS+n5WJoGd4jrc+naPM7amsft132MQdOpI7GQqomyn4Xk17Aq
         RruvIf3I3CTE4MzMrRn01sL3wEAtWUgfCZhu6+k3X0j7pM6UgpBK7nJekTNa1nQezKSC
         1Zsox3DLfwfDhPwzEM5wYY7piZ9m8XQoHgr0EpZ8Wxs4mBqoaUIwXGGnmutOAgEDD/Bk
         djt81zNk+0Sjl8jXw9sTMT1fxoeU4oJCSVymo2iZ8mXMwMoQ+x+J3S1cEwOgrZn3G/pJ
         PhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724607345; x=1725212145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=he266uKSoBPrnIX/bWlKMDUsonIDnd3kNbR3Ld/RGFs=;
        b=wHX3ctRQ1Ky+iWjRczcTg0mV68DjKw7RlZHLgPUlcqIINzUG3fCzc4Q+IZaVqBiR6Y
         +RN1y+ChiJNhgYtazrpe1CMCNNmcObE2SrPwc5oXH/X26GILI0ibGygac0lMpbNs1XxQ
         w5YD4Mi3zz0Qv1NagFN+XIqfUgUbNyvbmnBh7uLSOLHIZAEW77isPaVMI3EPXgd1vSTi
         NPqpGghhzyAXVecHREYLvlg17eTAtAZRX6CS7L7UW+InEOHZuRa97uu3ApVZvH2cwlpa
         ZOrVItHZ+f1N6bMirdamPjNTZwIrab3HhwWXrzO2SfRDQyOQy/oE+gLgIw3K6/t/gmmn
         Yczg==
X-Forwarded-Encrypted: i=1; AJvYcCUoMQ5PSbAaDGSmz3QLNa5O3biugSyXSa8mc5JvNQL3o/rxn6qQDUEYU2mrjU1ikRjq7g4YLDZQHgoU97Uo@lists.linux.dev
X-Gm-Message-State: AOJu0YxO6QxABplrwu9kyN7SEzCJXDkRSoMUuueqrd9JFHeNK3EgqS78
	Nt66r3ssZAYZ/JtA0dFnAy/0pGpwAZsWFB0NCgwUm33DTxKGleEv0F64eSvc
X-Google-Smtp-Source: AGHT+IGpc9bnz+HeiZS/6uM9ho+rDI+SqxG4iviCjK0mfY940mefKA1OhPp52DXQiXZPB4v7fP6Arg==
X-Received: by 2002:a5d:48cf:0:b0:368:3789:1a2 with SMTP id ffacd0b85a97d-3731189af72mr5079832f8f.21.1724607344586;
        Sun, 25 Aug 2024 10:35:44 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8562:53f2:85f6:2f59:f97d? (p200300c78f2a856253f285f62f59f97d.dip0.t-ipconnect.de. [2003:c7:8f2a:8562:53f2:85f6:2f59:f97d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f4a67sm552304966b.214.2024.08.25.10.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 10:35:44 -0700 (PDT)
Message-ID: <01f4337d-baff-4df6-9367-3e9cf2fe32d1@gmail.com>
Date: Sun, 25 Aug 2024 19:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c:529
To: Alien Wesley <alienwesley51@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240825154557.17912-1-alienwesley51@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240825154557.17912-1-alienwesley51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/24 17:45, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: multiple assignments should be avoided.
> 
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index fc8e7f73b2a4..47f1adf30ab4 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -526,7 +526,8 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
>   	mutex_unlock(&priv->wx_mutex);
>   
>   	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
> -		ieee->pairwise_key_type = ieee->group_key_type = KEY_TYPE_NA;
> +		ieee->pairwise_key_type  = KEY_TYPE_NA;

This line contains two spaces in front of "=".

> +		ieee->group_key_type = KEY_TYPE_NA;
>   		rtl92e_cam_reset(dev);
>   		memset(priv->rtllib->swcamtable, 0,
>   		       sizeof(struct sw_cam_table) * 32);

