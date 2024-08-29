Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BCF198E75
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724955684; cv=none; b=MvvEArE0cjjmDjA8OpQN1l40StIme+/p/wuV6Cqp3F7UAfPja/LBrYG+53HSFpwqpEcgR0PdHWscaO7eL+neMAkE39ienAi7FwsWAdJgMlniIVVZQeZTrFJ2FVYNyuSd4dWyKQ4bufGaZBkjgjjeeF7Rz0fRD1pw4I30pY35r4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724955684; c=relaxed/simple;
	bh=OamhxVc6llfV6oMA6EuDx1uDovmp76ZXtRUdar7KQsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EMFpZSjA7/7i1skfjKJ2Vrp4gRa38Hh70U93KRSAS6Csf/NH72FTKhOpSWoFWVIrmrnW7dkmoSoDmwzI9xB1MAAxGT9Oq5PKmWjJ79q6cHEtaxqUzddouRC/YvNKaCbm7hYX83iej8zGNrA49QGqbq3vwhVvGN1DNQ0l8UpkTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1SO976/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1SO976/"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5343617fdddso1784484e87.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724955680; x=1725560480; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uf/MfXJx2zZsO5b593EnlOHjvzjeAbo67ErqNZOPCMQ=;
        b=l1SO976/EZF/R3mvw92XSTtOUV0MOWY0Ww/pIQNvde+JpP95HvZYGHqpIurVtQsAz9
         qJNtD5o+LWFo3D1pnNyUzkoQDjvCpN+o6PKz3cAbM2Z7uJfPAaWvbUqnLGNGcnGES6Iw
         Ne2AEkADiqtns2AypwziIaMLjARa/i88v6ypBHzhPKS40liK3fSCp9Q8+Fx3KkbvSCjc
         QZXGn08h3Fgk4uasMLqUEnolnqwz7a1r2pw8iwD7ZxOKYb/NgXNQkFhWMB6ArXWSK9/f
         J9fI6whFy8l2BWf50WDKarbC2fyy8vOIozupsAcTluMafujjkfVAooLvl8WTpk03zco6
         aqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724955680; x=1725560480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uf/MfXJx2zZsO5b593EnlOHjvzjeAbo67ErqNZOPCMQ=;
        b=fhaKB0Mj/nThKdW+vCGk8AQ4ZKPK0aZQW6GnRW+7jtDVRQb2I/PF9zPwWIFwzKBznT
         QNxSJNanwDhLLNyctpNgewzCVLOeZLeRbwzk2bYVuYxAiQkpLeJog7UFNkgXzKUGhYyW
         Fze8RSv/FtBCH1ubeq24+oZW7YqWtoC2QFdRCfDs2EqKTAdU6rPUjp3rUBEP0nlzgR0c
         WYooCG4Sdcl/sAdh+inG3T0ztnZXn5pDG9WcaFj+q2xSes/OSl8RZOunqM7UBzUwR6bd
         cEY1i3smZi5aSntGtPCH6rlze3mZn3FMSFtmJb9cuA/Yd2VUQnC23udGAl0jedBcMcEz
         jbnA==
X-Forwarded-Encrypted: i=1; AJvYcCVRLdSULYgFcJMS/xq59Z6pqWInI0Fwb/+a18qZ39Pcrx1xCYAWUq4BkBXzu2gfR5m7byVrfnNVcXI48QpM@lists.linux.dev
X-Gm-Message-State: AOJu0YyeuGm+PI9LFdmh5F5Yae+Ktnb4Wm585DTBkbEeYPJqzuw/lvty
	jLzeqQzLjRcGDhtalxaQ+N8Xqoc/YO+5qKmQHConwhgE2JakpxLX
X-Google-Smtp-Source: AGHT+IGaEU616Nm/G0Jxky2+yZhaeLIq1aCxX4y211muvUdO+GFRfzM+J6bvM1uKLKx8mG2srbpu1g==
X-Received: by 2002:a05:6512:3b21:b0:52f:cd03:a84a with SMTP id 2adb3069b0e04-5353e5acd03mr3832732e87.39.1724955679920;
        Thu, 29 Aug 2024 11:21:19 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8508:ea23:888c:e220:647c? (p200300c78f2a8508ea23888ce220647c.dip0.t-ipconnect.de. [2003:c7:8f2a:8508:ea23:888c:e220:647c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892225dcsm105824966b.208.2024.08.29.11.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 11:21:19 -0700 (PDT)
Message-ID: <a15ff6c2-3f9c-4f1c-ac16-5cba30e22b0b@gmail.com>
Date: Thu, 29 Aug 2024 20:21:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c
To: Alien Wesley <alienwesley51@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240829113606.76645-1-alienwesley51@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240829113606.76645-1-alienwesley51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 13:36, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: multiple assignments should be avoided.
> 
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
> V5: Line number removed from subject
> v4: Squash v1 and v3
> v3: Fix typo in commit message.
> v2: Removed two spaces in front of "=".
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index fc8e7f73b2a4..67c4793e0fc1 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -526,7 +526,8 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
>   	mutex_unlock(&priv->wx_mutex);
>   
>   	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
> -		ieee->pairwise_key_type = ieee->group_key_type = KEY_TYPE_NA;
> +		ieee->pairwise_key_type = KEY_TYPE_NA;
> +		ieee->group_key_type = KEY_TYPE_NA;
>   		rtl92e_cam_reset(dev);
>   		memset(priv->rtllib->swcamtable, 0,
>   		       sizeof(struct sw_cam_table) * 32);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
