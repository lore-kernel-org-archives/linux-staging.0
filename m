Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF6D18C29
	for <linux-staging@lists.linux.dev>; Mon, 22 Jan 2024 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705909085; cv=none; b=P8NrPFLbAwFWJLvwMs0H8+COnj+qHZ1LbtF5H1LO8EIXlK0LZvF6RTaY2Y8i26B6r8Hmf3F1mE13yJsEehiO6MWB2ccvajy8NZFtEtVtcvAcBp/3beFOeyeebLAr8uns3pnHdZ4mH5V37Akutp3PtOSMJdIDiqIOtfkkdgb6gJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705909085; c=relaxed/simple;
	bh=hCuz70FfdtuZnlCGYK4y7wSWkRTar5SysUT5b/7ao+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUkH/bEEzV56wcdXCWGEDUW3VEaaJeCz3ilpcTOG5HJ0yOs59Rhiad+M7sWbx5Q0cjfRUwUpSvJdbg4Kq/1piliy3tRAC87vf1EskQcrIa5QkKkVx41bPvr6IhQSJfGkULMQOYwn/aF6zvCYbwNTAauptAS7toM4Jr17zthjU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvVYaFKR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvVYaFKR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-337d5480a6aso2747554f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 21 Jan 2024 23:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705909082; x=1706513882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iBHmiFCDuhhHhtLh28ouvjQZwCkrfYLQjVhhRH17R0Q=;
        b=cvVYaFKRLkWJBSFVzhMxN+HBDIuc9IMfc5eY4nShwR31rxwQHqvV3khn6tWgPecDz5
         GLO0kq4+TLJfHMZcN5u1THO1UHOwuVAU353L2ygvh+Kke/4sQb8UT7pnCrSKaPZuG+F4
         iCdZLNhFMHBhb085exBYeV10YpM3/SeaCwgtj7sYlvxrYFKfGY9Zi0fbmNBnrrXFQ+DS
         p/GEnfmgzYfH0TR42VcA94U4AAwGMCAL+cKtKPtmaUtO0FNK1RHbBVyGr9AtJ7NWtiU7
         GFSgosQrK/ESPC0UJAWIkCLh896mnbwDQFnyPFInEdx8c1yE8NZDvR0/tEOvQnXPLFwd
         WcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705909082; x=1706513882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBHmiFCDuhhHhtLh28ouvjQZwCkrfYLQjVhhRH17R0Q=;
        b=XjlbbRRPHTaM5OJS444h8yuo0QM97ALyb/xPUc/f09zYWN8YgR7bgS1mwElcwfACDu
         sKI+0JJjUiktMKxpwlPIIo8qkCzonryq/yuwbykYzlREd08Q0PeaqIpeoAUJJqz79577
         fptDYvqP0/revZmHVhjlWu0CaLjlKAuDvKE/jF/Ddo53DvQ7N/sNOJSssOxHLQq6Yaw5
         z+Rwmp8p7iZrBd83UutuVxgsJsCFzW1a4f4YyLF/t32DY7/ma/NfMVy+Ye1v3R38NXdl
         NTOnozTOEu4rq9RKzjknQo4SXvtKn/Lwj/4CJsxvLYaSRB5lshkbTiXhkWTt7AwtiZsQ
         RNrw==
X-Gm-Message-State: AOJu0Yy4bdUTh/bLUXHcPFEANbb2M/l422ShJJctenRqOE1AOmjtt3h+
	POpneEZ6AcrD+EsHquqVsjas7STOJ/xFFiJeYsVN/Y6Q3lHmpYJAxhlYsFIrXBQ=
X-Google-Smtp-Source: AGHT+IEa//FRNBYwDx24LzawyqOfvJpeHfudBdcuXr31gQGQGdHPir/G//42u906D1V0rsSKGxyWFQ==
X-Received: by 2002:adf:ffcd:0:b0:336:f22a:c16b with SMTP id x13-20020adfffcd000000b00336f22ac16bmr2191154wrs.45.1705909082518;
        Sun, 21 Jan 2024 23:38:02 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b003392af92996sm5202076wrt.101.2024.01.21.23.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 23:38:01 -0800 (PST)
Date: Mon, 22 Jan 2024 10:37:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hoorad Farrokh <hourrad.f@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in while
 loop
Message-ID: <39fbf9df-d6da-4275-be3b-191108f94ec2@moroto.mountain>
References: <4ii7ptqhz7ion46dczabnevuj7tjfv4iofvzedms6tvfgsfu2e@6rvcsdyodny2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ii7ptqhz7ion46dczabnevuj7tjfv4iofvzedms6tvfgsfu2e@6rvcsdyodny2>

On Mon, Jan 22, 2024 at 09:01:27AM +1300, Hoorad Farrokh wrote:
> Fixed a linux coding style.
> 
> Reported by checkpath:
> 
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Hoorad Farrokh <hourrad.f@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index 1593980d2c6a..0145c4da5ac0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -127,9 +127,8 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
>  	phead = get_list_head(&pstapriv->free_sta_queue);
>  	plist = get_next(phead);
>  
> -	while (phead != plist) {
> +	while (phead != plist)
>  		plist = get_next(plist);
> -	}

This function doesn't do anything...  The name says "free_all" but it
doesn't free anything.  I would prefer to fix this warning by adding
a comment:

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 1593980d2c6a..4f856d126517 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -129,6 +129,7 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
 
        while (phead != plist) {
                plist = get_next(plist);
+               /* FIXME: free something? */
        }
 
        spin_unlock_bh(&pstapriv->sta_hash_lock);

We can also try adding that to the KTODO list.

KTODO: why does kfree_all_stainfo() not free anything.

Perhaps there is code in the other rtl drivers which shows how this
should be done?

regards,
dan carpenter

