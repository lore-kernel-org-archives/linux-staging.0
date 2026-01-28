Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49089352927
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605907; cv=none; b=FfjNtp9EdH/75kx9Qg1oT48JTnLfpkdF9ZND2nCbFFQ8f0FWUU8cSlvEcKV+uXwPERIVgQ+7fOc6qjmbWWPLwq4SCBNjMIwySH7hcTTdxYViPC5QzfNQ3cPeiPDqgKt5pMnwuaOtU5sBozj5D2VsDIXwOUie6SCWJBhO7HpQyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605907; c=relaxed/simple;
	bh=/ZwfZB5pbjnZ7qsQn5jWNkYOOsJ6/4wx6bsQi6VowYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubC6tERjuO7hKwr/h5wzLIBGlIRVXK48fSgwTFa0A65ReqeW9BE0LOeYoK1Xflrkh6DZYuLp1r42lzqSN9MCmlY5HRQkZUmNdL4Es8oLkwGgSJTokiOnYCnSSgqDWM6EpSRBcdawJ9KKvRiOOl7pHlNal7n8O82ngu3GA32+Mj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=njAZXvtz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njAZXvtz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso69961315e9.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769605903; x=1770210703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QE5UXJfkrM2/s+DJa3wmxiaiFjGzF6QP8186WpGj+o0=;
        b=njAZXvtzCJ/SLTSAQXIS5LTYng9wYeIZhtb1uujbmXhs5VpRuZBZ+eBh9yEEEV7Foj
         7RPyavikt0N+s7lB47Idu/YtpvYv+BDxt+n9QItQlPqZM7dv/8WlI9uV5nbqQ4bxwGdW
         g9H7onc3XPY+16VcW1LIKLPWaHJFskNCgCeJB/+7eMTbqcF4VT2OHrGPkAE/CDZS7fFc
         iRsA7n1Po9PtQq8d+ewzjGAGkIwEdixk+AzXJB351m3O8WVfxaodFt28lXc1FatZR37p
         oO0JXymK+4kvK36I4XSWtOxQeOMhZDtxf9o0x/dJxs2UWwN3s6SyaN964hShfaNC3WON
         IcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605903; x=1770210703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QE5UXJfkrM2/s+DJa3wmxiaiFjGzF6QP8186WpGj+o0=;
        b=n786ts+A5VouCUswCnS+XCi+vTDgzQXEcUpwzm2PM+8aHNGxkaxV+tnzWd+jZMWvsY
         /8446bcW1/WsHs67/kH3U++7sfoAimSWLHgori9ZOsgymZGFfp7VxTKqqMXyuaA7XXPJ
         UNPQbnHrFMrDp3qWO3DtlKoL6b368+sgviOcMqPU2JFI05TnPw0ugPRHu3RCu/xcPyaa
         /xAJ3oQ8YWq+crfYvy3lys10ZkUiZCshS7J06pmmUPqQiOREnyPKvG6SHSwpKY9xLpZt
         yP9YhL+AtHjNU7tMPD9WA7o0bj4bKp19x2sAfTSyKhDf/o341RMSdMrFMvpFl3FtJmcf
         u8KA==
X-Forwarded-Encrypted: i=1; AJvYcCWuJAuV0HxB/WlyLUqCBZUBed1Q9qZOVYTyAqSvVN4swqq/3Z9Yjcvk+8Zl5Epj0AyoSNjlpYVDDclKPKb/@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ3OshQUypHquinST8vLKpG4Zxb6AZA9ljPZcx+vyOtddPdP3t
	0rc1bnUACrnDXR8E8C8hmqspMC/xfhzw/PhZK61+2GT95R6NWlDQ7nnSn/cbtXpUsOcdZ8JN3vW
	Y2a9P
X-Gm-Gg: AZuq6aLjYKxJYpnWvrPsPM2Ir6Myau+RZC5HGB/CFy6m2VXo5urDyOb1m4AZiZe5n9x
	St1F5aXYKzKc1vXbfY+TLCnrDn34+VJhFvMosOb6im0+nxtFyN4hr753u6YtOvksbErybJctSEj
	k2SmCxqSCi77afPeNIeHr4Zn7f6P2fTRYKItkTF1sSzYxc2xT0EheZDzHqCVhYRusF4pB6mpz4K
	IeYJLijsjG1j2sboIuUqswKJoKAxWsJP1lBYifs8xXnJTWZ77zNtKv6fl/XxXyL+Wj5vrSYv5Iu
	Pe2uZcoIkT1531smgp+GKTgnDG2hHG/BbYOpsPD4jpdpCJIpoVLKlfWtVi42kcmdAFCYMrw1DUa
	bR3aMnBycEeuxWpCKRIVflo/8tTj6lbkHcTnhfGjfbJvBvT/q3diGYjC3CZeG9Sv2jTXLPgAsNH
	KbqJQTn6tLbCpNq5On
X-Received: by 2002:a05:600c:8b85:b0:480:52fe:58f5 with SMTP id 5b1f17b1804b1-48069c57137mr74819975e9.31.1769605902991;
        Wed, 28 Jan 2026 05:11:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322dc7sm6799578f8f.37.2026.01.28.05.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:11:42 -0800 (PST)
Date: Wed, 28 Jan 2026 16:11:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] staging: rtl8723bs: remove dead RX info reset
 logic
Message-ID: <aXoLCt5q_NkoVt21@stanley.mountain>
References: <20260127224747.40305-1-ethantidmore06@gmail.com>
 <20260127224747.40305-2-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127224747.40305-2-ethantidmore06@gmail.com>

On Tue, Jan 27, 2026 at 04:47:36PM -0600, Ethan Tidmore wrote:
> The function rtw_reset_rx_info() and its associated counters in
> struct debug_priv are used to track AMPDU and management frame
> statistics that are never read by the driver.
> 
> Remove the unused function, the write-only struct members, and the
> now-unused pdbgpriv/psdpriv pointers in rtw_free_assoc_resources()
> to clean up the MLME code.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

If they're never used, why can we not remove them from the struct
definition as well?

> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index f81a29cd6a78..411339ebab7e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -819,15 +819,6 @@ static void free_scanqueue(struct	mlme_priv *pmlmepriv)
>  	spin_unlock_bh(&scan_queue->lock);
>  }
>  
> -static void rtw_reset_rx_info(struct debug_priv *pdbgpriv)
> -{
> -	pdbgpriv->dbg_rx_ampdu_drop_count = 0;
> -	pdbgpriv->dbg_rx_ampdu_forced_indicate_count = 0;
> -	pdbgpriv->dbg_rx_ampdu_loss_count = 0;
> -	pdbgpriv->dbg_rx_dup_mgt_frame_drop_count = 0;
> -	pdbgpriv->dbg_rx_ampdu_window_shift_cnt = 0;
> -}
> -
>  static void find_network(struct adapter *adapter)
>  {
>  	struct wlan_network *pwlan = NULL;
> @@ -848,8 +839,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
>  {
>  	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
>  	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
> -	struct dvobj_priv *psdpriv = adapter->dvobj;
> -	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
>  
>  	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
>  		struct sta_info *psta;
> @@ -874,7 +863,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
>  	if (lock_scanned_queue)
>  		adapter->securitypriv.key_mask = 0;
>  

This blank line should be deleted as well.

regards,
dan carpenter

> -	rtw_reset_rx_info(pdbgpriv);
>  }
>  
>  /* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
> -- 
> 2.52.0
> 
