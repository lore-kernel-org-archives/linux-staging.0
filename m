Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1C37DAA0
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779530876; cv=none; b=SlWa65/J/3v27gq6yLWDpu6kGY/fotA1gFGj3y2pczA2pKE/MJBHIH25858doeVULirwCQz1xBRlOpuh1Pwj7KL0wkUXH5h72aTd5mYjcIISd+OmmK78GuZBr8BmGrD+acaeSJzYa4//2cIPG1P/wDTMa3aNZbp7F1hvnIrOAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779530876; c=relaxed/simple;
	bh=yUw57AUKGTJWPjso2A08rWzGSwCN5ccv4SOQJIMQU8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qO2253jh18/xJiobrhVJ+W7qlXCE3yEdNgZoULr2cG6BRrw7dsN05UPjLtJZp4kWdEzKQG4jkkneTqLFdge7kcqrw7Qix8K9DE80y0LwmkYw0qFNOyilxZAV2QpH5LsUtvZbcX8YBR6m4JUY5ArOPtt2i5tykf/Vi7S7iKdKsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZj01HPj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZj01HPj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49040362e4aso22939945e9.0
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779530873; x=1780135673; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBbxljADjESEwUhSP3sGL1Ty2LtZCjUvSCp2wxLG23Q=;
        b=CZj01HPj8LkIwkO/x+3aG8T34tbxNiAsMS3H0shHvHT+jjSGplr+BHShnooIB43US/
         2mPiI2nk5IxXACBt1H0meaNxU5zBCCClsssYytZr/SM+t6NdUTYsAu6AGMxSZHVSlxkI
         RzxpKje5Y5upI3H4Z6/jL62mv+oSoQdO752JN3quDXAZaXuI3yVUT1t+zFZTtW+eNiLT
         XAnH4GUJXX1hp7aFhmjGH1zeP9NCpfHYhSliLWH8qIqDYH+w5XJZLn8+n+65V36Tp1Dm
         HCW8G/LvYm326t5Jma4Tb4LyAv15stuKXl9/hDo6KFj75ZNnlSV1cxj38dd5yOmk8Kpg
         nnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779530873; x=1780135673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBbxljADjESEwUhSP3sGL1Ty2LtZCjUvSCp2wxLG23Q=;
        b=Wod2B956lH6ene2o00/f8eHGlaB/7cIy1hjPHtFmEVACmemudo5jiSWAwPYOR3Wppz
         yaWAFMCsMAiXXJoNuNahN7blKMs37BWksrIUloMKzGSglr4EG3C9D+wTC3W5PvLxawM7
         16mbGTgI6ryeOdEIuZcvNaiMAMMolfmGdDpODK7nffLXm63yoasRlv984Tvd94RhFgeG
         dfcMlgaCo0/lb/Cfi2sH9xXowj6IKQgzTCHUK6fR9e7Aoyl32dIsrIohiQVJkOMSIoNK
         M0fXPiEp3ihM+peKFJIvyWiQPGznEX2g9Ga7uvJd3RHHIwNbkngnW8nzVTF5ahwd1A7t
         7e4A==
X-Forwarded-Encrypted: i=1; AFNElJ/3zUS6mDlCYTQXu5kzVIbnh0LP9ZNfUKHl5uDOGLwE3vMEeZqGGXHPkKVmbBTLGv5SOrbKq0ejc887sCoJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzeMZ1HeEVH6umQNq6tUBOczlkmSP9ZV5AQFItrK0EnTAWtyEGe
	ur/vAaZDypLzABJvMPrvfrgvunKug0EcKUC9AoGZXNAI21A4tivZIwHGufoc4w==
X-Gm-Gg: Acq92OGG7pznMMZpJrOwHYZjZu1Tb7LvZ4DdEuH56yf12bujmYodlNhLAZxGldq/Br6
	h5LW0tunbbFu9Dq4l6GlF6E03Tqx6HvZIp/XzrVAgZW3aUDOrxswBK+c7R7cXLZP0B5yvnbVxC1
	pYEmKl4LBfe+0EbcLsnDaAvTlmpsog/C6H5Df+Vj9xEEeqJAj8iA9n+2ijy4jcfMuN6uiDP3MQy
	3EEnqpyltYyk/5Qz0svMHj/mIBUgDfZfUaob1GBZe7Hk6iOz/tqSIfVs94PDlNRb5RIDQ1EnQuS
	AZwlZx63Ie7m87QDITMTp/G0z6g8Ycx5JXvDMw8GcBVtEE7RScD1PDjjHdu/3kOnft24z48NXUE
	365G8lY7SU3jL0lXRdYDyd52h8PAUMkRx4ouhWFItb2f0oyx1JnfbjVku0TGCWtixBRdaRN/7lb
	kHSyNcUwg+khhO48/zu4Y9rM8=
X-Received: by 2002:a05:600c:474d:b0:490:467e:a3d7 with SMTP id 5b1f17b1804b1-490467ea4a4mr87771075e9.30.1779530873274;
        Sat, 23 May 2026 03:07:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm49634335e9.5.2026.05.23.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:07:52 -0700 (PDT)
Date: Sat, 23 May 2026 13:07:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: sm750fb: use ARRAY_SIZE macro in
 fb_find_mode loop
Message-ID: <ahF8dacOkX0tdxGf@stanley.mountain>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
 <20260523051509.166152-5-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523051509.166152-5-ahmet@sezginduran.net>

On Sat, May 23, 2026 at 05:15:08AM +0000, Ahmet Sezgin Duran wrote:
> The loop in lynxfb_set_fbinfo() iterates over pdb[] and cdb[] using
> a hardcoded bound of 3.
> 
> Replace it with ARRAY_SIZE(pdb) so the bound tracks the array.

I don't love this.  As you mentioned, there are two arrays and they
both have 3 elements.  Why prefer one over the other?  This patch
makes the code look simpler than it really is.  I would just leave
it as 3.

regards,
dan carpenter

