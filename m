Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004711;
	b=jWxNyu0T1ybiqxFCzWQJEDXuHs8aa7LBPrXAEVmljUkDMl8sq62UFb083TFIXQL+LEER
	 wIeaj3VQ57Z5cV+vXJk5I/W1JKgsqmfrhI4fr+EyuAPOThmWNznoD+abPQgXtFw2ogY2s
	 HVY/67+N0wEnido6fMQbKDwMGA5G+qtGNyPdHuVFeyFeikR2ZdK5duFz4GdEwDh0l0taL
	 mZtvh2a35hd1CflijejvjWnAsN2dzmF7gOjTpcrQw+n1gyKV3Z6UGVm311QzHmpwwnsAg
	 tAD5nsjxgBM4OodpjoD95NnhJ06z0vTBhCR7LmsKdBLBt0V2LHGB9Ee5ETnfiSp3vJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xWiTlDTyc6PTyNRCBNyeHOu3tzSbgoo2LUTk5932AiQ=;
	b=rSGtySi/sBP7F0dw+q0zxp3WuEGg+3sRlbvOU+lfK6I7qK7PcbnbgDOXLrYHkalOEeAK
	 041Mj7196P5/p8c1goxxGM/QhaBB/S9+IhIglAyiTHLVoFVWO0bsCBT1IjepYiUAR1cB8
	 z678kmrupMUwEWxf9A5tt1PfDKLQCjOAsUUx4zu7RchS3V+fujAmLmMT9mwloYtKXR8cm
	 v8pfFnWPzBf+tJG8wODi+WS6+id5feP0YZ187MsjEB5qTxY7OKox4Li5yHJRRorCwsC2J
	 rWcZq6el1AGzxMVQf+2mi96FkmTFpapp89tAFC65xiv3rPjxRqr3EbtP4Wse06ed6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H2GucDwa;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB5606A326
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 08:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32AB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H2GucDwa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so8072935e9.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004709; x=1793609509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWiTlDTyc6PTyNRCBNyeHOu3tzSbgoo2LUTk5932AiQ=;
        b=H2GucDwa28C8OvbEmD+hlCt4lUixAxwB5M3a5SkP+VuI1mT5MN7LgJ0HvJPvJuv1p2
         RGjo37GOnwjtgnFXcgDdlzz9Gzfvc4RT51b99p/3SbL36+Nr7a4Uv0qkm2J74serC2wb
         cMws7C5FIDoeJmg6PYpJcHEQbyFCiTVmibaDTXFBdu/19Q/Ll5HBXumIOvbOE5MBxEYo
         metkC7sLZHC7yIkYvaci0y6RRwu2mQ3fps67Dp6DBPzJ5jhK6D6J5HwuTUWfwIqGXxV3
         Ka2oM1Z9e27sPEhfB0SNPkpmEzUMy2oekhvRyHCqm9riWLp0Fkx5JgU/359PT9OhbREV
         htzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004709; x=1793609509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWiTlDTyc6PTyNRCBNyeHOu3tzSbgoo2LUTk5932AiQ=;
        b=YHvlaz9npKEru9LaBxLEZkeSvxZjWRwVbzaxK9tYnaFPyLMP07xr3QP7Z+LI2fblTu
         pGghyEhtkO5Qat3jQR1uL4pPoK8Ig2TDOJqlSJHJXg5n53JtvjqnwUckSdvlzQRRi4e/
         d2k46MCYD7reqntfYCLAKixjfHg0Z70eB5El2G7MAjRJ5VHgzLyb5nSdDpuTUjs7ezjX
         Ez9SL9xPbBV0ZKl6uLpc+O0YRnPA06zAJpTlDVLe1JH/Yn5NZbT2I51axv5+/hgjj5QZ
         9CicUWd+QifHS+DKLiOeqCuc/lBYf49tDk+VanG01nj9e9Nphm1OhgYdUSuj6dGNgpbH
         VQuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkF/6dfG8kjCzCOseyNIoeOKNWyuDT1n5EBle2d/TQWERdeiKtDbTy8e+6jPkSTHwQjhxMgiJeVRekjKgK@lists.linux.dev
X-Gm-Message-State: AFq9FYLD9DmloRwqTzeSpatFMj4EQnm729b9QYY6CxhKKqhyqQNuvR/b
	/2nD5aCVQVXqHuVS6wolk/UMeujtGxCVz5CcNAhguKoRjjROCmAFi9DS
X-Gm-Gg: AYBFou2v1Nia3EH6q9LAdCs1/gLG07bIS73gXmrB4SSw+1K0qw2q86/MXYYa3ee7Fze
	tl7H1Dka1qF+NUUmvHDkMZ0YizM3WAxLAuYYEi3WvVhKRLRdgJ6nfyWzMCXrpIYXbJjWPbLWKfz
	E+xgzH1IJxJ4VrLPgho+fl7QBHw2dxFbOIOc/2VKeqWgpOxK/gVEwQ6KKijeQWPQydA8Y2qUFO7
	k8SJNQcUwW7AGGVAkxXBGmwqiUtRaHg+svkRcYIRdvs3REvgapdGse5keZr52G34msFPkBPEqGB
	cbdoxZR4I35Yz0oNpC1gk6EPx6lvwX+DNxVWoAs7//o5pn4AC2NOZzBHkKuEfbeDcC2b09nZDFu
	fx4VdotdgvM/rQJAuAcSreEYwHyjf3tJsZFz/Ff1J0VLz3aOec6KucOyCUUnXa26BhFeQOidb5p
	MceGNAcAnDog2xP1Q2suM35xQ6VtNYdy9zWLw+Ikk9irGaE0vbs6EGdPEkyBqjhH/XysddC9oe+
	UH9W0AZCyrRhVIZqpsLUChIVhoNFdSztBL12asvy9PSAdtbFaTO
X-Received: by 2002:a05:600c:630f:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a35ae9e071mr121463405e9.12.1793004709351;
        Mon, 26 Oct 2026 01:51:49 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm224781085e9.4.2026.10.26.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:51:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:51:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
Message-ID: <at8UoLDzrO9ypMeR@stanley.mountain>
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>

On Mon, Oct 26, 2026 at 01:48:32PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> fbtft_init_dbg is not used in drivers/staging/fbtft directory and
> since dev_dbg messages are good enough, fbtft_init_dbg should be
> removed. After compiling the driver, there are no undefined macro
> issues.

This commit message is sort of acceptable but a better commit message
would be:

"The fbtft_init_dbg() macro is not used, so delete it."

1. () after the macro name to show it works as a function.
2. We care about the whole kernel not just drivers/staging/fbtft.
3. No need to discuss dev_dbg().  That is unrelated.
4. No need to discuss compiling the driver since that is assumed.

Otherwise it looks fine.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


