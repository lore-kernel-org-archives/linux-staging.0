Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658F33F8BE
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696119; cv=none; b=StmR8T3fXTR2SCKjp9gs3dd2HmZ8sNsWO467iTqVdlrsUxJCeRRLc2hK8jEpJi7TNJEIowQa9ZZTgNVSFAm4a6EMV5V1Ea23hYwfGvlhx3fGt7gtNLOpKd7G+be5TS4z1SQa7UkfktOEpsK8W9PPCdZxmJAuzTmhifw8dAfeWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696119; c=relaxed/simple;
	bh=gxT0mGEGc0x6fTOQayF1sxxS6ki972VUL7prsGHTFzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxgR7Gi9W/qh6zPtqZldlW75uyPo1tTMgFuN3u6zKHmLV4mdFQ6rOs1JhLPAThmClxKRLWsj+I6VJ+VXUb1APtLxD6Aop6l134QEF3d7OAeP0PNwb4/vPlTe8jY6aaAMCwhpOsWZ9XLJ0ridmDoWXaYmYI5oYtkju/C5vUIMkj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKQytp+a; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKQytp+a"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44e5624c053so5550442f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779696117; x=1780300917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HALvVAGVZpW4SFGgUWC1AAMHEQ6arvLYXGA0/5eX59E=;
        b=TKQytp+anbHu10qVliFKGmZKQl7rGoCsxyIEsuggQi8rz3OHgWrOVcizxdVT9gqscK
         aXZIkomg0VzXi3cOTCXB1UzRyJjAs9+XpOhLSJE7YHMk6IajErJvGclnbKtpA3wxzhuw
         RQAQU4WJwTxnzx3atHr7HwxiAZOQ1RAH9OaFGvLvTfIpnJ7AujTjmUYqodQr6B59wLxy
         CajA8NndoD1UAM/aELa9Z2ULobl3Xmw547/m8FRqqkib/6hkiowPt290g8+S08LNARAv
         +ZkxQPmBtSfWmasRKUCvkXkVRL38jKhuUdVwTF6XcnkksvW5oHtUfwRs2+PHFNp1ZRfk
         2U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696117; x=1780300917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HALvVAGVZpW4SFGgUWC1AAMHEQ6arvLYXGA0/5eX59E=;
        b=Ob1FkSIJ6s8sJ0jJml8mgpCzHpIUZWruNLPtji2YGP3IZd0EifXJ8eptNUFx2FECh/
         B641CQexscyboCc66JcMKe8IQcCedBUTENQcCdkNOVTg4c1u2CArlQWaYZGXwE+3wDdK
         nCIcyVVypDIeQjPI70KutTNPZGPxo6+EWhCO1iPSaC8PSZTJ1QewgqkQUFX3jSLhgvWZ
         ncgkTdPmK3Y0RKw6uIZtDoWdEWZXm6yJSgoMVIQ0NBm+MwywOYyP0qgtBHW70RcHRdIn
         i9PjDRg0Dh+UIwq2j2i2UNZyNkWnd1HGGyrg+K+HuDvliJ4r9l7BFXl2o+Bbh8UuxEgE
         DnAw==
X-Forwarded-Encrypted: i=1; AFNElJ8kOi1cBWGH83gdrsuP2Rc6qSYzDuN8EvR0uFZ2eudbyPysc7nAIq1MyZ9pp3IaWrjI4rnS45pFQ4daqzyF@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg+fipFehA/wjmsGJYF79Pqz4IZ6TIJjhcotwk/PhkJY+ZDnOT
	bCBioyjEJvEsqCD9dT/OEYq88GCQzybZEkuVMRZ3UYy3MXgytF6soSvk
X-Gm-Gg: Acq92OFbO+TkiKcDWgYC83IIxZOLVvRZBWiDwiokAVU2p3PHighfRnKP8nhqyFxVMn/
	rlI4hAmLbrxoB1sd8kwOC+AgHxU6K1qjr5bi6efstAnY3sgWOc/A2sfY2HulC87opy4q8FqQ93g
	Q6wUGsb1Po5uQ1tyRB+xeYXMrIa7CdAYJzCcg6Qj0QsDfKM6w6QHRJw9zT8jaftZoAxJ61IYzdx
	7qi2W4axy1MRb6ZEmYtnKxWFJj4VOI2cO2Ys1h8lM6h5j8lB8PqySGa1Kn6v6LeCb2DW4+h6iQG
	vx0hlCurLLT7wwOGX7sECkFbRcc0IwqJ+eD3QGLL9K58ACfjMTb8uywBprkfFozLipP/AkfknYh
	VuKVstrclQZ4U7aOq5leTqnjHT/1hmybrsRngnsItmbEyUuIGPqkrLyHK2nPDrYQMvm87OI+Vrf
	s8sEINowyMKQ/AJ9CPl6/PBeo=
X-Received: by 2002:a05:6000:388:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-45eb38acbc6mr19616507f8f.34.1779696116400;
        Mon, 25 May 2026 01:01:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9b980sm23029778f8f.3.2026.05.25.01.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:01:55 -0700 (PDT)
Date: Mon, 25 May 2026 11:01:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: sm750fb: deduplicate fbinfo loop in
 suspend/resume
Message-ID: <ahQB8C1gTr7LF0FO@stanley.mountain>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
 <20260523051509.166152-6-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523051509.166152-6-ahmet@sezginduran.net>

I was waiting to see if anyone had other comments bout this patchset
to decide if I should mention these minor nits.  But then I was
confused about v2 so I think there might end up being comments... :P

On Sat, May 23, 2026 at 05:15:09AM +0000, Ahmet Sezgin Duran wrote:
> @@ -388,18 +388,18 @@ static int __maybe_unused lynxfb_suspend(struct device *dev)
>  {
>  	struct fb_info *info;
>  	struct sm750_dev *sm750_dev;
> +	int i;
>  
>  	sm750_dev = dev_get_drvdata(dev);
>  
>  	console_lock();
> -	info = sm750_dev->fbinfo[0];
> -	if (info)
> -		/* 1 means do suspend */
> -		fb_set_suspend(info, 1);
> -	info = sm750_dev->fbinfo[1];
> -	if (info)
> -		/* 1 means do suspend */
> -		fb_set_suspend(info, 1);
> +
> +	for (i = 0; i < sm750_dev->fb_count; i++) {
> +		info = sm750_dev->fbinfo[i];
> +		if (info)
> +			/* 1 means do suspend */
> +			fb_set_suspend(info, 1);

You didn't introduce this, but the rule is the multi-line indents get
curly braces for readabilitly even if they're not required.

> +	}
>  
>  	console_unlock();
>  	return 0;
> @@ -414,6 +414,7 @@ static int __maybe_unused lynxfb_resume(struct device *dev)
>  	struct lynxfb_par *par;
>  	struct lynxfb_crtc *crtc;
>  	struct lynx_cursor *cursor;
> +	int i;
>  
>  	sm750_dev = pci_get_drvdata(pdev);
>  
> @@ -421,21 +422,12 @@ static int __maybe_unused lynxfb_resume(struct device *dev)
>  
>  	hw_sm750_inithw(sm750_dev, pdev);
>  
> -	info = sm750_dev->fbinfo[0];
> -
> -	if (info) {
> -		par = info->par;
> -		crtc = &par->crtc;
> -		cursor = &crtc->cursor;
> -		memset_io(cursor->vstart, 0x0, cursor->size);
> -		memset_io(crtc->v_screen, 0x0, crtc->vidmem_size);
> -		lynxfb_ops_set_par(info);
> -		fb_set_suspend(info, 0);
> -	}
> +	for (i = 0; i < sm750_dev->fb_count; i++) {
> +		info = sm750_dev->fbinfo[i];
>  

Better to delete this blank line so the NULL check is next to the
assignment.

regards,
dan carpenter

> -	info = sm750_dev->fbinfo[1];
> +		if (!info)
> +			continue;
>  
> -	if (info) {
>  		par = info->par;
>  		crtc = &par->crtc;
>  		cursor = &crtc->cursor;

