Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6696B282F2B
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774107060; cv=none; b=Vbv0sTZhZgkH1hPdFsjDlecPxZazqWNiS5lTC4/Qv8mUzlOiu4Pe2TIKEbXK2FoqM8FOLoFlaJsOFgVnzV3jU1cDHb6cPMM0bb+CLuxMmgetHVZQa/rDQ8Kf1E8eZg7r+PCoZJnqI5TmKUM/zOHtSvWDM+fPh8VVKOA+MPJvLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774107060; c=relaxed/simple;
	bh=B2nZGqB6E53i5cgbBKeNPO4PjE1DsTST7gLCyG5zE7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQJ2w2DCUqmDJdt3biP2QoujK4vpLQDyFqw8C7mEYTuQ6MQfsBiHcBYCDxGLqBFj0Z0UTcf+6UbupUa/KCBj/AEGKVxyfDdpTlruS1HeOA+y+RcTm81ylNYRYez8vcVItB+7N0I4VvWfueehh4ojyTHeu+7uWbNExxWv8CwZNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVUU2BqE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVUU2BqE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so12618735e9.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774107058; x=1774711858; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TwS9QYfhY3hdyHYGCfHBE6avYl+4A9FV1oW4FB2a2A=;
        b=eVUU2BqEgAI7s4UoLsb0DBsYEAnQRmhf8fOYAkm1JB9bz2CGtMPc3aF3ICpbYVasIX
         mIFuJlrLn3PHkpbatsW20SOwNBrEj2R74u3HT/gM6st63Up/TbIjJTwW3GyFtaEsrlyd
         pfXyKn0tI/Z96or9o0JhG9WJiKDzgeJxDoWr9SeSB+xuk5vb+uHi46Udwg3QN4PkMAex
         MeebhRFeqRq08TGgNCZdjk3E/zOgoTSU9uK5nk4+nwZAxiGpe5zc1B/wxgab21nj2THv
         x/V+UW4z2NBX+Sf7OBlVMriuf57bm5lHKSQwNa0V/HDgZoRpEZQQymblqYG1yTk8mhiS
         VX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774107058; x=1774711858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TwS9QYfhY3hdyHYGCfHBE6avYl+4A9FV1oW4FB2a2A=;
        b=hiOTTxS8jKppJp+3DmgGszgRv1wT+cWdep7r0h081hzALOm6IZl8SYdm8YUUFUFTHt
         xPaMYVJKGFDWK3Z1WL4LpGWqEuCjFUalo9v2iCQ9DaZ09LLF+DBJ+xhkBp0+LhLg60YQ
         5ohYvOtOwIGay6mRpw8Y8pGaccK1ihsgZLgM4iko1ninDBwEZtdVX3gq/942fQxXSbKN
         1X/1GXWIkrheYj/5h4kfyNThgxuYe2wvD5Q/06iGXdmG948UM7rZTZcU1776NQDdyg4l
         to+zumg988KuHNNka9Ak8a4yysxMayZEBrXJxSTMdW/Aig9RU0lRBf0GsYWJ1PcBGgow
         GN5w==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ji7oeIsZJxTFX1KwpgT4+3cb+dZqxOe3NmDvd0B+tRspeaJquyTU7neHVLVAr/QcgvBr8MCWteECZKo7@lists.linux.dev
X-Gm-Message-State: AOJu0YynwbVs8xCJQ9gy77PbrOEAlxQdc+wgDTNngZkUe9PhtWu7euTJ
	Kd0vJmcNZUuJS32OMBi0TqrI8SaqQSFPtj9EMS0Yi9jzgDqif6CgaH5DpZ0lyWvXzFTU8x/YYfQ
	U8Efg
X-Gm-Gg: ATEYQzwJqkKJsWHBKqjdrDCYKD0QPXCTebjciX5zx/b+niLO7oB8pOZaHbgnSpTTZ0f
	W+szckIlebDDPh+YtpkOvPwVkwhYHC0SzuPx8mr6uxysa9caHJb1eDOvoiWHyIfVjY6b53K/ycg
	9BXZRwNwvoWNKCnje9gozuesQAKrMkVfwNXQYd7mMUUBUTwOTLZKuU/211/TakfKLgWAWqZbivn
	kDdqhORfx22fUlA/ZuVn3qTpfl6nUvBR+soYB1y/K31d+uUZTliIqmsGsePhY3VAogxAvGPga4o
	hryJh8YrUR1Jv48W8qezSnQdCX/qB+f8JHN2aWl88O25mWCHCKIbaa/LPnzH6v9MzrTzuep1Kl0
	FmlJc60MmlRwYjaCNbblXFEEmYyNGzCNv9nT8JZEwI3oSxGDpMss4tRTK49CkRzQzNT95n6vIVx
	IHMBxiGpHCTvflGaNV12GxkxaHGSk4
X-Received: by 2002:a05:600c:8b46:b0:485:3baa:af14 with SMTP id 5b1f17b1804b1-486fee0fc11mr94402605e9.18.1774107057872;
        Sat, 21 Mar 2026 08:30:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe85e4d3sm41338885e9.2.2026.03.21.08.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:30:57 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:30:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: rename rt_channel_info members
 to snake_case
Message-ID: <ab65rtwFqmzYSd4Z@stanley.mountain>
References: <20260321151342.19864-1-marcosandrade95963@gmail.com>
 <20260321151342.19864-3-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321151342.19864-3-marcosandrade95963@gmail.com>

On Sat, Mar 21, 2026 at 03:13:41PM +0000, Marcos Andrade wrote:
>  					i++;
>  					j++;
>  					k++;
> -				} else if (chplan_sta[i].ChannelNum < chplan_ap.Channel[j]) {
> -					chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
> -					chplan_new[k].ScanType = SCAN_PASSIVE;
> +				} else if (chplan_sta[i].channel_num < chplan_ap.Channel[j]) {
> +					chplan_new[k].channel_num = chplan_sta[i].scan_type;
                                                                                  ^^^^^^^^^
You changed this from .channel_num to .scan_type...  Please, be more
careful.

regards,
dan carpenter

> +					chplan_new[k].scan_type = SCAN_PASSIVE;
>  					i++;
>  					k++;
> -				} else if (chplan_sta[i].ChannelNum > chplan_ap.Channel[j]) {
> -					chplan_new[k].ChannelNum = chplan_ap.Channel[j];
> -					chplan_new[k].ScanType = SCAN_ACTIVE;
> +				} else if (chplan_sta[i].channel_num > chplan_ap.Channel[j]) {
> +					chplan_new[k].channel_num = chplan_ap.Channel[j];
> +					chplan_new[k].scan_type = SCAN_ACTIVE;
>  					j++;
>  					k++;
>  				}

