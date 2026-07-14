Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CFB34CFB9
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012705; cv=none; b=PihMu8lRmBTxwloMIjW3bDHn/yP5dPpKSOhySFRH2ON5eQI5umQLadpLhEe86IHqnbYXeqH17MZFgf+LehsISwaxA5ZLf1AHZqkVJMbD1jkYhPmldiuTVnf7kIe6Qk1ybxvz4nIQfzU2PvItfSticLcdoL26M+ycZHvpKhR/Pgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012705; c=relaxed/simple;
	bh=HO/sIgNPdw7t4nLYxmowkr+/DfStiW/sFeXA7ShWpaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXSJF1avsK4hRtPwNrktJH1bmHYzM43GgK6gHRIGQKwtQH5K8fMyF6Yd4BGU2I0NUj+hmOenOqUNw6l8/cP917RfmFAzbLnRa7rvBQrjKJMPzaAtf4G6UTO7GXLOBlNESRUZN1ecZcDzv/zskdiS2w+MbdDXEfiqNeiAhdTOsrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT5q35BA; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT5q35BA"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso530795a34.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012703; x=1784617503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHa72c4+nay2FoW1wgA2FzfDfV81XjSTaeTSFxhPGw4=;
        b=AT5q35BAhf2REUGfQEfO3+HWza+QWC8OuL2FN10YZD7TzKhWuT8Qfng9cE5tmKObso
         SpjOSEXmqMgIP+zkifJYucLsOIF4dcjH7Bid2gnHSuc6g1jN+OEgJ/CiDPIcPuwyp6rV
         a+ewTa0REEbV884dQOvb6H5Oq0b25VW5+VG0xEDRWdgoFj2yoWT2w9bjUGWZwLrEF5eW
         YiT+E7HrrOg8LRN9qj6IqTNL5W6j1jrWcjYB+7wozCpin4BOiz3DRsfpwhh4AAl29gNG
         ydKMnp4C872auQ/Y/Zr40Zj4j9iGQJ3BWHFxjL1Sc+iL2F9XgpAzppD+kl6Jj4oqyKEZ
         Oodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012703; x=1784617503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHa72c4+nay2FoW1wgA2FzfDfV81XjSTaeTSFxhPGw4=;
        b=anh8hHzzY0fj0wOPC1qNOWh2AUiUBsy4ptSocRiTPxiyU1o4gKzQBgz3ytwIRWmuEw
         qpOx7ROQKfZfruGRIUBhU/UK2Ch+HZMvtZ4L3cOqmdUCJo9jC4meSaRdF9cIRUUKXCFO
         fVxcpDHlVn8mIGr2Cw0F0dIs9NvavyVEB3chyyyB7qf/pH4Kc2LSm8Opom4RZ7ErkHDy
         uZMX6ghOkpDThp6lyvJU5HjQxjLhwxNDSdhhvDKMB1LquDsG3GBbCuC/AIRwygfdOxQC
         OMIjLpNYFNuO4L6jY3r5kG9prkr/Y5Q5i0WaiwibnZ3a5Ds6Fdw58J392b3q9Bqb4Yd1
         uZXg==
X-Forwarded-Encrypted: i=1; AFNElJ+bllGeQ9bLWEsK/gUkAdQaVTRXAdms1DiGKi2NzIUSRitBYxtPhC5xIUjKuCzkIdYcLdHD0DTzdlb/PGd0@lists.linux.dev
X-Gm-Message-State: AOJu0YwJxIHnaSxfDU3VChWE0sT3Ip5u62H7e4vNvVEpv3dLhSeMJHn7
	rYhVtPkJWrsLo10imMt3n/uP6Zh59nwCwbMlAfCLlzGB3gM8/SDotQk2
X-Gm-Gg: AfdE7clGE3oi2DGf2tZ1cnJQI7WEXNACv3cfo0O+22FTlTBPi4QYdLLzASwiqGg1ZdJ
	xke2ee7U3U5f0N38q6re6TFIwTDq3AJ+kgUMe8UMX6VqitVH0LAaI3NxouI3+UFwzrWra0ipmE9
	2UH/tlSaE0uhWBYsnKVoATd6VupoKex/5DAcpeBe+B2qTypn4Jtpak36M4U5Sty5Bmma6oT5NNF
	fQYamhFKjF1qq6SNiOVsd748D6K4aTlJVxVBvlEwo5yFj0miU2FiWBW2U/bQMs2spUa/xzFeq17
	v8H+q53hnHBYkqavWkiWudamx0KKBZNua80/tYLJczglnmEIcNmt4biWwF+6S9m/mTdtiT7oLGF
	ogyHgggd8Qu7kIMaUsSRAaWebR8JGFefLVRtLM+V+btHbVniMhwrP+riez2XrnisOC1Cu+ppHjN
	krqlZA
X-Received: by 2002:a05:6830:8218:b0:7e9:dfc7:5523 with SMTP id 46e09a7af769-7ebf279d733mr6723853a34.10.1784012703208;
        Tue, 14 Jul 2026 00:05:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm14711533a34.27.2026.07.14.00.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:05:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:04:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: return tty_alloc_driver() errors
Message-ID: <alXfl0fLlc3VrGUG@stanley.mountain>
References: <20260713170845.1518-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713170845.1518-1-alfievarghese22@gmail.com>

On Mon, Jul 13, 2026 at 10:38:45PM +0530, Alfie Varghese wrote:
> gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM. This
> loses the real errno returned by the driver core and makes failures
> harder to diagnose correctly.
> 
> Return PTR_ERR(gb_tty_driver) instead so callers receive the actual
> failure reason while preserving the existing cleanup path.
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

I don't have a problem with this change but the commit message
should say that tty_alloc_driver() in this case always returns
-ENOMEM so this is just a style fix and not anything which matters.

regards,
dan carpenter

