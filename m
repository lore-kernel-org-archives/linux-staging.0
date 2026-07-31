Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D243B8BA4
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845464; cv=none; b=m6oyLMyrhS5TfY/PnMdYNMTBycuiFmbgOUqqV1SKEjLEtd8pwJRI106AfgaUGZ1s2io/cy3nukc5uGcRDY62P4h0orvvu4vibLkCmiLPbf5xT9h2DNmnCw8UFQGbQzulEi76Ezz7LODZnAjprZRjqdGDCpa1zvzTf0Cwh0XcnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845464; c=relaxed/simple;
	bh=s2ejx7F5QGA4/pfGRZ0mxACFQwkfGTp44+9CiqNsCjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKTk6Zb8dETxCWvGaKHuqEhXnNXjStR/g27DN53ox3fuJGI0dTa/f8pix4AmxZz/VgK0QBGAfpaVgzqyvKUExIm2qWgnGAS6hJQIjsFpII8fRnO0Vt5d03jkIMCP/NNRKvLonV3a2EXJwHG9/TzpYssxKnss7N9XLw8nxsBzkAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2V7HAGk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2V7HAGk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3890698a91.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845462; x=1786450262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2c2UzrU1lo5IxLJOBK6JuXRe5pbOxY4V1jiy5fHlbmI=;
        b=i2V7HAGkx1xBobN7zgX1FTRqrgxdMy/uNtXV3pOC8M0Cfrg/sTJo42rrDApORkHGEy
         Wdg9sVTaC5lOHfyVw6h2VIQp0KPIJNdjfZKB4FMkGNHPknPIlVOoRSHc1CqGUcIbZWgZ
         au4g1fvgdqvG/S3fmFmPnsY7h/qHQYz66tT+6xqfu8TcEZ4DAOdCsc6Vai1igmOnr3t/
         MlIx3wRPilpGMU3GbI9RQRCdJEnIi8cvjohv2IsuzjhxwFii8ySNJRgqkOGU1nOHcCP7
         PCYbbWqCwmIWP46uWQdRXKBRwgKBm1/yC9PES+JHWOSmoswdIwlNRUGdnouvDkSLU2k1
         ITOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845462; x=1786450262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2c2UzrU1lo5IxLJOBK6JuXRe5pbOxY4V1jiy5fHlbmI=;
        b=LBBWQiu3lGAYa55wjp0NyEilc7VelPP/wfZ12/1x0ZYxUP/fArapeX/IT35LTVM5rP
         S33Qlxl0Y8gbSIm8SJrE+Q6hSs44ricJq1KIoczO0mUWCzqwGhoLiwbGbX5Jaw2Hsy8B
         kfOx3SLSSaKRQ/DbPHnVzpNIDiV5sE4qV2F0FPuL3OohRhdI9uqkmGAIpIsOeMohuauP
         9HS9EB5q13DhuLnyQLgm9AMMt5ACAlVCv8vP0G3rJZ5h2FxRPH4o/w+3r//oZdycCRvR
         wk3H4zBCNFyrc+R8YbmR7+UEQo8uGHSs3VN5Jw52aNJcggfEOaJ2RxmMkXKXIh0/qq0I
         wlBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfgBu1xL1o5Xyz4XB58xl58wI+1WW2gDByYlMQhfcnFu/iEuncSjZNmY2o+TfN6yFb3dUGIcoAcXEai6P8@lists.linux.dev
X-Gm-Message-State: AOJu0YxOnJvUqpunEPjd+dhs+GbxjSE13xHAyKnHqFnpUuO8qKc0wEXv
	oJTEwydovw98IXQND+KiB7bx/KwOn8vTW4HsP8wgW3SuLcOgaapBjI02
X-Gm-Gg: AR+sD11jnvExZmIlj1v65ea/zn4yAiZ6E21lzQiF2NaHZ3UWdNq+GXB3eMMM9yTdcSW
	veNIFrBihY/hOqzfgYxTi3U4lpUdQ1bng1+zLX8FGMw1RKRvSrG/D2LOkKCDFFbHy1Vd3ZkM2QR
	pWdWLqCJcg3EFZLzPOlYEzUBLX6KdfFpRJQTT+SYjEQZAKxXF+83zu1y/NsORpGBBR6s7BUWcme
	lHuySxfoWaqEXcYGtFVcXMJRCnPidZsvNtmex7lNjjMx9W6oXaTn1f4PRhal+gnAWXd3/6FshbR
	IY4RLcfxRnOoisLJybhENmaOXQu8W5fk3s80Ci9PgTJ5QMdYpI56VvKi8uueLnTPNDkX9CQ3K4/
	7Ou3XAWQJDciLeIQrlDYjeqxpmPmV0Pxb1YRz5aA+CgQcrEZJt15KOvM4ru6LIRd4Wa7B8cD7v0
	pPPG2KO9czYKGfjHwltLDbuquAjP4RaOs8zdzR7NTwG3b4wRAbqXYDIg==
X-Received: by 2002:a17:90b:5746:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-38fbc40e2f2mr12500934a91.6.1785845462377;
        Tue, 04 Aug 2026 05:11:02 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fec15dc70sm1260042a91.13.2026.08.04.05.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:11:01 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:08:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key
 material in rtw_set_key()
Message-ID: <amyQQxca75_qXlg4@stanley.mountain>
References: <20260730231315.79688-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730231315.79688-1-skunkolee@gmail.com>

On Thu, Jul 30, 2026 at 05:13:15PM -0600, Ivy Lopez wrote:
> psetkeyparm holds WEP/TKIP/AES key material copied in via memcpy
> from psecuritypriv before being freed. Use kfree_sensitive() instead
> of kfree() so the key bytes are zeroed before the memory is released,
> consistent with how psetstakey_para is already handled elsewhere in
> this driver.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---

This should have a Fixes tag.

regards,
dan carpenter

