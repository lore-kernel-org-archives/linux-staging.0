Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9555C1B0
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093180; cv=none; b=XuglciBMzWZpPe8Rc15Wi/1e35Bsg7L4/DFmcM78YafCe2cwaxYiGdznRvhFRhdg8KeFZ4HBTAIVhK3zS5E6KcCcpxq7JZ7KHJ6dEqwsixrPvyfO7gLxOfgm8tz9nK6/vOWn3tomgRXBQw1LqYY3RLTnE285fB/tmAzmzc2tQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093180; c=relaxed/simple;
	bh=AmGEvpoEhurmj8yaGnkYLsgknvbqePnIdxyWbvNO7Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWREBaKMFzEtyMJ8+xbERB5s32CMXImXRWSRbZd2unKpb/XRKmXfpUuavim/dREBSCnrzMvC6em7+BHPFuu4Ag5A1z/yhw/gJcjxyIngl6JWNl7FmCleXGI8RXnpCARN9DZI88wcrfQeX1bSPHrlu7najgZerAUliZY9dtSIN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUFLruX+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUFLruX+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so26965945e9.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093177; x=1790697977; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkKczT0xLYYsxaNg2GK8Ovzvtfa19Alb51sjGmOPMSI=;
        b=PUFLruX+XVxrpFxnsb1ZooUnKTZBKhGH1blr+NQQxYEkTZg684qIo4rmf9jxwHFyTH
         3H2Rc3jDZOsXl62cNPbasK5qbhHyRyhWifn8fc3hikXCYG68pycmUDp5cdbQMu5RJeu+
         k7x5mItsG5IJ5yMBguqnAGhwDOPUPLMqEBvt3Clt8/ywQYAN+LdWOaxkgtaMAICVqqP/
         Fog7HLkAVBpLKQ+RYQw3hGg4Ocqv4srcj7juUhqz0jg0bPSIdYxB/esDBpJOVdcJaqHx
         s0I7WZzeT+DgS5aumLYdWHRZjMHpFk0uJXKIUtmj89w5FIvnEPIvHUWI5T1/eN2o/wo/
         foWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093177; x=1790697977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkKczT0xLYYsxaNg2GK8Ovzvtfa19Alb51sjGmOPMSI=;
        b=dguD/dK6zXjwRz4HM82wKUFJNEBYhxealVvbPeL7poyxbATDI+5+G5WrwCw3rjrG/o
         VaRSeXuy9sYoPqW24r4YHF2l8+NOReDmjsbXG/cGUpc+91cbD8/BZKKD3KINy0fQpmXO
         zK/CcD2S1pUjEGf0pK/fhrOzIp1ubz0CMbpe1/HEo3dYg9mEdPysjDaQHsAIKRDN9ttR
         okgEi4mEDlwo4yQ0hOKNlrjoXkzA1R8OEp9FG7KMM4tyDdpx8ikHEGY/9hTQyGRcO7cf
         RNBifipSkGUzvjk+7MoJY1jer4p13qPsL55RixNs6gkViimDpW0uUEGQ3FYzS4FEsvJY
         W3Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxnYRImnQtuMiqTFJ3pGWW4vHX6EG/NJ8+dz2E8Un798iZKaYMOcbAOHVlBRJkPQYa5wAL69DoOc7SwGROX@lists.linux.dev
X-Gm-Message-State: AFuF++m7Hb5gcAzf119H2iqJBJf4SEsFtsThLCPrZqu2avJ2kw+ruf2g
	+B+VSRttKxGw89rtGD2ulcljB75XMh/9dbPjF8KxNZgGEUm1EBfUBiMb
X-Gm-Gg: AYBFou3srqFgD3Zg6R4GJCC7Hz7ESczpEl5Jg+CUAofszcBum0HePBi7i5HtD47/WEs
	o7TPYpMOe3RldsDw55rNjR5PUGyGJCuKEaey4Ku7fjXsYki5QjymdOVGAB3CVGu7XFrECdSCHRE
	sNLetF+SaBTjAjfFcykPWLmSs2bJK0vE4gzDMprf4OJaf0Wl5fQTmVFajXK+IU187W9/IB+gB5g
	FrkiKu9vggKDHmOkyPFB//n3eer9s/dU2VdkhqKg0IJFeuoe0Ivr0WUweJ/OuhWxoGAThWr6Kgs
	CBH+ggLk2xZIJaak+9/ptHM6WGo2Izs2jMlgRFhHwoogJzq8efKSt7BVCx3xM8JbusrbM+AhRTB
	4vsq/VO8f/6I4oAZ0B7hiy/iMBw2lXtNOJ1HNgG+jtxj8P7X9O1u7MXq7vNk5Kw4NVaHf0vz06V
	1TteIX9xIZn0yMcA7ulT8Y2jOheYtKVtAeIf+gBC2RgvGXhWJEbS4MKWwcu251UVWt1mM=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr214229925e9.11.1790093176406;
        Tue, 22 Sep 2026 09:06:16 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa9dbd6sm66967855e9.2.2026.09.22.09.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:06:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:06:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: free cmap on framebuffer release
Message-ID: <arKnc5rrOxe4l3Hf@stanley.mountain>
References: <20260922035302.167378-1-2000.costalucas@gmail.com>
 <20260922142851.46724-1-2000.costalucas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922142851.46724-1-2000.costalucas@gmail.com>

On Tue, Sep 22, 2026 at 11:28:51AM -0300, Lucas Costa wrote:
> The cmap is allocated by lynxfb_set_fbinfo() but never freed, so it is
> leaked when the framebuffer is torn down.  This happens on every unbind,
> and on the register_framebuffer() error path in
> sm750fb_framebuffer_alloc().
> 
> Add a lynxfb_unset_fbinfo() cleanup counterpart to lynxfb_set_fbinfo()
> which deallocates the cmap, and call it on teardown.  In the alloc error
> path it is only called once lynxfb_set_fbinfo() has succeeded, so the
> cmap is only freed when it was actually allocated.
> 
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> ---
> v2:
>  - Move the cmap deallocation into a lynxfb_unset_fbinfo() cleanup
>    counterpart to lynxfb_set_fbinfo(), instead of open-coding
>    fb_dealloc_cmap() at each call site.
>  - In the alloc error path, only unwind the cmap once
>    lynxfb_set_fbinfo() has succeeded (Dan Carpenter).

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

