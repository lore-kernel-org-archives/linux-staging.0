Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB1D398902
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277427; cv=none; b=NUw3/nae99G0MYMfsFZ0OH6Da2I8HUjBhzwEnWTUAbcNrQ10+YkJ47QBb+T/kkzjq6PQORDhJ2s/2umTDRG8IhUxEStygVpJGtlnp85QZjgDlJxefUUrAiPxqGwWDxr7++Kn6aXLH6DMuocnVhvJ/2OSH/B3eaNmeKp6Gbj9Whw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277427; c=relaxed/simple;
	bh=ngThY52kKro49SDhJ80iyIG2ZtAGbXOO0XHJaebatqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJhBZT8qrkyXTawF2ctAHiM5WdFE7VCPiAP1gJD4ra7qQ9qlYJd/o4/YV+5A82vUo/VWyVnNQ71JhNYM+/VdBmgZqxUMwLWnHTS60wFPHkbUeqrluJqDYsoUPR1i0MYATst35z8YFrCCHu5ClgIYYq8BVAOeFe/HtarMO9AhV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZQ+jkg5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZQ+jkg5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso91158685e9.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277423; x=1777882223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNA2g1oib0g0LAQmxc1juis1rneq50GMSbdxoOgD178=;
        b=WZQ+jkg5flJxhYqR2iJPyMDZz4eir4LiSXus/mzOfbVLjzHR2H2T7tAtok5trDezKs
         iRfdO4OAXfH5o5jqFFHJbjh1WHbBZv4qfjgbUyzrpHf5BDcTqwSwhfDM1nZoQhMol6In
         6p6vJBpqGBwMCYwyoXacbFDc0Rj6p0V8TFR2Lp5m+/VXBNCU5MaGbT0NsDjG2yTqOuiZ
         plXmNBCtD69qh4FSXBFmk1yU0P71uVP4rA1ztkF7AwUB9ylR6tvWmortOv8yQY0lpRmc
         mMB7RzYIj0Hinx8Tag6Oop9W8Uy/AXNyCNWWrpYJY+vEnvbcwK97882Yrn8yfmbmJh5C
         hxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277423; x=1777882223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNA2g1oib0g0LAQmxc1juis1rneq50GMSbdxoOgD178=;
        b=MDBg8+pC6VMRPzg4i8MXAox+zg9xdb9f9bxwTucbkH7RYBRaqa1ohUTcDNNNmVRj62
         ArIrCmlEM6gXz3zCYcs5WUe/kAy3Kk8ps7LK3oooHBv3TBZYFYb3gqeONJ6bmhFKhQsG
         FKGijwcdmEvPMaTy+dMDD89Z5+BHmaLlrRe4yyyNZThORPmKphNBbNsbGGBhswhQUoSx
         JaXNhJgMBo5Hap6mj7BBe5kL9YlqCdjk9ZPL9GvdjF/zzTUgps7NGJPUVlEBiwB9Sj7C
         rLh5sN70Op8g0zgGLJIt6cKDV28ODLxpXNNK3qThQCJrkKvhvqW37ALj5aOYVK+9Y+mR
         nY5g==
X-Forwarded-Encrypted: i=1; AFNElJ//DEah9+vFIw7Qm1ZsF4CLo8t79YylUzsSCylhGb2EnLadoaOBrVrRr0RrNu5VjzviHXBOHR0StVLe5x6h@lists.linux.dev
X-Gm-Message-State: AOJu0YwG3BigE83S3mBMrQszp4agXud822Q+CmU/7Anb37UJ5jaLQjdB
	1YIxvBNh4mZOLuchxM9IIXUFCV6YrfaTSGq0/lOpkNF/8nTU7rb26oFI
X-Gm-Gg: AeBDiessbLx2707wVoOL338DoR/Hu3WIaxDZ2LOXe7oC/nI/4g/Ey93zX3Ya098Vo/R
	4bGB3CVGsHDBRAwfytK1k5zVz5gVVoXR1zMbQbeiVcqRTObgyfWVt52tTkt0VOr9K8dAsvhsJSy
	2YHlaGfN2+lVAN1dLIvGM/B3NXViUerW4hbn2LLFn7htMTrzxX0pUg2SI3uTPOsfloWstos9col
	+K0W8obGuqLLRR9aV2u9tfw5vNxyaFX7Ouj0mFehy3YxTtzErqg/cs6KaO1SDVyouazAvGBho+f
	5O+u7TZ6tnUY1CH7oG52l3a5ed165ko74PCIqv/JeNDevuwwJS805gWTH4btBJ64j4OmmD3sdXL
	H/Hdnzb1MqZ2eoy4u0IgoPUUxCMHVhNUbIxlWfghks8Q+XcLkKMqZSLtDv9B0rDl068GwxMMdEZ
	l4B6KGzuKDZ7dbS4M+zQBpX4myg4IBBA==
X-Received: by 2002:a05:600c:c4a2:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488fb78eebdmr570309965e9.26.1777277422832;
        Mon, 27 Apr 2026 01:10:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc5e3f4sm436362615e9.2.2026.04.27.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:10:20 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:10:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Salman Alghamdi <me@cipherat.com>, gregkh@linuxfoundation.org,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rtw_mlme: fix line length warnings
Message-ID: <ae8Z6ffMqBNLdmBn@stanley.mountain>
References: <20260424212120.237059-1-me@cipherat.com>
 <DI28VE3I5LAU.9SJM5OX2JD6Q@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI28VE3I5LAU.9SJM5OX2JD6Q@linux.dev>

On Sat, Apr 25, 2026 at 02:45:50PM +0200, Luka Gejak wrote:
> On Fri Apr 24, 2026 at 11:16 PM CEST, Salman Alghamdi wrote:
> > Fix lines exceeding 100 columns in rtw_mlme.c as flagged by
> > checkpatch.pl. Wrap long function signatures, function calls,
> > assignments, and block comments to bring all lines within the
> > 100 column limit.
> >
> > Signed-off-by: Salman Alghamdi <me@cipherat.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme.c | 258 +++++++++++++++-------
> >  1 file changed, 182 insertions(+), 76 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > index ddfc56f0253d..fe996484a6ed 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > @@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
> >  	pmlmepriv->pscanned = NULL;
> >  	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
> >  	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
> > -	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
> > +	/* 1: active, 0: passive. Maybe someday we should rename this
> > +	 * variable to "active_mode" (Jeff)
> > +	 */
> > +	pmlmepriv->scan_mode = SCAN_ACTIVE;
> >  
> >  	spin_lock_init(&pmlmepriv->lock);
> >  	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
> > @@ -125,7 +128,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_beacon_ie_len);
> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p_probe_req_ie_len);
> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2p_probe_resp_ie_len);
> > -	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv->p2p_go_probe_resp_ie_len);
> > +	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie,
> > +			      &pmlmepriv->p2p_go_probe_resp_ie_len);
> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
> >  }
> >  
> > @@ -369,7 +373,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
> >  			(d_cap & WLAN_CAPABILITY_ESS));
> >  }
> >  
> > -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
> > +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
> > +					    struct wlan_network *network)
> 					    ^^^^
> This alignment is wrong please align struct with struct from line above.
> 

You're looking at it in an email client, you need to look at it
in the file itself.  (The alignment is fine).

regards,
dan carpenter


