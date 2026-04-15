Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B82C218845
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242312; cv=none; b=Hsfj7g+LeQBeumHp8B5cVl44zipwVuLfR5vN7sVFT/kvsUjmqBB4Mp8Su9jDW5lMWmIHIzjBV7otC2IbdZlsZ1LRonEdFsRBFI5H63Q9Z0lIeQ4ViKUoRAhiDs7362hP5A1ux2NrQbkpT9EsVenqkYz5TgbLpA+jAj3bpucE5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242312; c=relaxed/simple;
	bh=KseX38j6qGyfEm6dYHV42UbUam62ys6G2hqrUCCrpoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr4NdRuWjwMJxuCwfhTdSgCzniRU1XAGGMP+dmIU/xkPUyoTkuLDr33ffjDabkKOr9SpvWOa82xxKPYx/HOcaDaJ3/asIIE8+G+1acIqHJJP5ORuXhVKxkzHPuHPxCnuACCgeQtQXXHtQRt4+u9titIl6+ZizVqQKEDTjR7fwdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=op/nWRxa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="op/nWRxa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso66828475e9.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776242308; x=1776847108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPSUp+sO6VcHLm7/luI38Bv83ZTw3gEBrD3agBPIf1I=;
        b=op/nWRxatX+A8wpqcsqPOmFwho/1x24a87ValP+UrJCM9zdyEQhAPOIQzw5Ed7u8HM
         5lcfPSRJVs8YbNvVLiE+2RCB/ehx9TMH95tJEi3VPbcf6RAEzh+s+q1JtNwdx8a82ISo
         6eWr5jNC0/XUg/xTedOk5vMxpPjSu/btkBxS0sdixj7KR2sFT5DynDc/ujRJXUOBswU9
         fWlkw1yd4Ax8VJOe0bjg5My38sz6GDDA/eqmUy6rwZkCeoGzChTI5JXz6ywftjGJk4zD
         ZDAvyRApV4ue7b/EbC0RrudBDEVW2tbQkT7VelDaYPYpaz6I/7PU+oa+P1dzNLYeRUI8
         uLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776242308; x=1776847108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPSUp+sO6VcHLm7/luI38Bv83ZTw3gEBrD3agBPIf1I=;
        b=NKcJpcO6liGwNCY6wjLByiLlXOm7XL7e5xAMJcW+SqaJRXlGWdK9f3c829JtIC2q/2
         c7C9q7JkERJCJvL7I8TDJU+2x5MPkVeLqi+rhNmrDUhQJfwZrfrd2LoRvgDjxJXPM2Fv
         fBTpdEfgv4eP5cqYz6SYO13eeQsloXnhAIh9zitWWzHmmZz1B4HMAuG0UBY1TaMvFCz8
         BXK8Iso/VgSPOpcw0RU/fJF1tgabCjiGznlFUPJKFl5J4SauF2HcT3ewAUMRYz5Ar0YS
         ZZQjzHfTX7c214B+cDc1KMX6HFN/ys7RX86PbEDrBzj69hsBD2NkQmwNNDxABp5tYD13
         J1lA==
X-Forwarded-Encrypted: i=1; AFNElJ96lRN9FSUm2se1ReE/F8a/UdfAxo777R97rTb8mVySlEV6rWDetvS85Ao/sZITXv3hz0X3ywQ6JrT3ga7N@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ7WXu+WFYUHq99ZjDo9EN22QlCLznmnGjSCQ2yx5bAAAK5jMM
	YFUv5SeTXfrZJ8GTJKIT3j3/5a1vadCEHm6NZm03AtCoVWvFndGlbqHx
X-Gm-Gg: AeBDietZabJC1gocBowNazyRrW3ZFJZZ0kJD4Zil/0qgtfmvYmk2Zuv3wETmZZMO4Bb
	G7nD/dyiQWhAnwgfb4Xwg/so/g6T/QzrO5SxR2tLIa/UyzStmAbVhy8IWFxKywqjXPyIwkebO1S
	O9HdOFoEuhmA2XGovA2vaP/Mzo0LYJhzwe57srTsB5//nMaUxjrF9d+K2nnuokqxh1kfeRQVUJE
	pI/C45h3VPLssRiXD36l7VzxZ3DewYTZx0eWG25PtA5P1xGfg2XX5MStlR9efblEmzzg5ZN3CLO
	YjOeMeXOnnF5Qm/GBLfTcFIBwZ6NwSLurrtL7Sp8GLSiNnGn7KtYHjKgI4P9RITIRsDPg3FUpqo
	DP+o6M0olxYHfku9QvYpx2b0tThwifXQ7Z6AbW33bHi9F05YnK9NZSmychlHgDDttyLolFG6xsp
	Z34l/qEInyZIEN45i23jw=
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr265756195e9.1.1776242307812;
        Wed, 15 Apr 2026 01:38:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee042f3dsm99109025e9.12.2026.04.15.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:38:26 -0700 (PDT)
Date: Wed, 15 Apr 2026 11:38:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix null pointer deref in
 rtw_check_bcn_info
Message-ID: <ad9Of-loRWcTmN3_@stanley.mountain>
References: <20260414205520.157861-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414205520.157861-1-luka.gejak@linux.dev>

On Tue, Apr 14, 2026 at 10:55:20PM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> When parsing beacon or probe response frames, if the ap does not provide
> a valid ssid ie, rtw_get_ie() returns NULL. The code then blindly
> performs a memcpy() using the returned NULL pointer (p + 2), resulting
> in a kernel oops or kernel panic due to a NULL pointer dereference.
> 
> Fix this by moving the memcpy() inside the if (p) block so it is only
> executed when a valid ssid ie is actually found.
> 
> Fixes: 370730894bec ("Staging: rtl8723bs: rtw_wlan_util: Add size check of SSID IE")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 6a7c09db4cd9..2a8aec37d9b0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -1204,8 +1204,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
>  		ssid_len = *(p + 1);
>  		if (ssid_len > NDIS_802_11_LENGTH_SSID)
>  			ssid_len = 0;
> +		memcpy(bssid->ssid.ssid, (p + 2), ssid_len);
>  	}
> -	memcpy(bssid->ssid.ssid, (p + 2), ssid_len);

This isn't a bug.  Doing an memcpy() of zero bytes is a no-op.

I think there might be an issue in user space where some of these
functions functions are marked as not accepting NULL pointers.  It leads
to weirdness because the compiler starts making assumptions based on
that and, for example, strips away all the subsequent NULL checks.  But
in the kernel it's fine.

Still this change does make the code more readable.  Please, could you
send the patch again with a commit message that explains that it is
not a bugfix, only a cleanup and remove the Fixes tag.

regards,
dan carpenter

