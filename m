Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153928D8ED
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774107056; cv=none; b=XCent9TuT+pLBGT8WWaoD3OkEXawJrKolYkmUXmh0Y6EiFVEbPFzs7X4pwpnVy2V3BnWSNVcBHpZk417f10R28sP5q9Z0AMI6pQr0Xt5Ycea5+6yKww35p29V854AFtRqWYOtvI1gOOpkNs4XqzDl9IQIZNx8iXqgvWlajNI1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774107056; c=relaxed/simple;
	bh=uRuDxmAabAuXKaQS2RProMtN/0PT3q0XUBIfaFWYVsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQpCVtlfS0dOenwgDwbWeDCyXsdSghCPHBUJa6eYwON0QMy1t/0K65VRYzN39fDdRX/3QB/neUkqlPdTToDYV3f+nIFiUt065Nv/wP3XfC/lxq9OegpUhUiz8p2dH3cb6VUwK0wi300t+bbGZhgKZYljZjBrQACYvP0cIy6qMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4T1pzKe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4T1pzKe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486b9675d36so21935515e9.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774107053; x=1774711853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJiWVYpHcKGuwSr7LcfwsR9eG7Wsk/QkCXWhA07YOuk=;
        b=L4T1pzKeejl8iicg1Wz6P1BN4HdG7BFjOw2UsJj4m4jqOKuFDf7LyeHOqQdhcg7mw9
         yLc2NcVu3k02ZR2OMf96DjdmrTd+6uvpupO0vJiCFQU/ehrLeiL7w92X5aSDYXZzQxhk
         cTEhQsSbFuowM1hBzf0TRiBP9lbm/XYtcOA8eyBoW3iAmGu0SPfc/cWvRcCUAmbvotn9
         AQPCo5T6VsROrefi/daM1FNMl3GPEOSolF5wgON6Fo9MZeDA/oyRJKfDivXkAhiEJIoB
         TARDAatSSDB1qtJuzrNqsTOh9V609Od5j1UlqlDOwVb3CYQfFv6ERe/YX9L3/VcUstMe
         Ziyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774107053; x=1774711853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJiWVYpHcKGuwSr7LcfwsR9eG7Wsk/QkCXWhA07YOuk=;
        b=nTL5tPQ+RFLYRDlynlSyNsgjf/37kWcyLy0inn3HPnINmNPuIIiD7HHO3xDgsYRDj4
         hSCA/vBSonhvowICAb0VVsC1THSfcVW9uG/0AR6aWdq6NKKxuWj5HpEtO0A8RgWh/A3n
         Hzb5ycXCxswFCM+4zXgFpo7YvlfJ+f0WN4MG91INlQFJAFnHlSIXihwHvfZ5+KHF7ZCN
         A91NkcbwNWHjoic+5PJ5Hplam4VFuGUbNlApCglEOA5Vzmx9Q/XiVPMPpNCpmyquI03Y
         BNdi4PkwIWinMnzARMKvAxt0IZnalpkZrlypdr2wyZPfwpOqKYJhOsQEJGrrtnk5E9P9
         rr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWz5aP+hxnh+m2KwPfsQPuMWOta9xX2tRLgQJrN+CTe5DSYvFplkg/gsIM2p42sl7u9oe6lfTYZbcGT+DlN@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqgc2awG6Qr7cW8/huGbZzy13uQdNrBIgirKUbcVk/sTIvUklC
	qZmd1pecIkHvZ+jL4B3WErJGbG6OUdSCJIzVDCJwU39BvfLkbIWGTE8PSUrwqUjI6v0=
X-Gm-Gg: ATEYQzwKPlRsxgyI6QpImkY2nsWTlln7BD6DsNHg8EnrscHRVMvxlIj13pDUMsz+884
	c2xDrifjlrA58e4UlV1ACk62TiOtx458QOwLKZWTs8xUG9HG9iNJnwjLOiGlOlFdh83J4QVnJSz
	s0Sa1SlozSgo/HevOwC7MfgPBUa7xkTYU7xvYIO5fPxbRCq4UmoeBzrMSQWF6sp1I9IqHB7cU3L
	LQhpm/LrV3ButJTkJ87d94ejl7Hg+GUAE25NAqCVMQQX6I0GZXbNfCelS74rV4iUBpD+QQyI65g
	o12CQL+peeD3wt/Kofs2G9/r98VdBGoL9dNMEub/jnQYN2Red2BktLPUfGQ41Dbqh7s2Dup5NQ1
	dnyTtePoyDiV8pW0eay43K3vB5IOO6PkNyK5Rv5C4WUck3vY0uIpxhIE5SQfzvB6VD6qyGBCYLV
	IGizmN4hVHZP7Eo1UFHk/9lNzhIdXa
X-Received: by 2002:a05:600c:3486:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-486fee1ab98mr105300065e9.25.1774107053387;
        Sat, 21 Mar 2026 08:30:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fd9845a2sm268001885e9.6.2026.03.21.08.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:30:52 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:30:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: rename rt_channel_info members
 to snake_case
Message-ID: <ab65qcSOBxLcp9zs@stanley.mountain>
References: <20260321151342.19864-1-marcosandrade95963@gmail.com>
 <20260321151342.19864-2-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321151342.19864-2-marcosandrade95963@gmail.com>

On Sat, Mar 21, 2026 at 03:13:40PM +0000, Marcos Andrade wrote:
> Rename the CamelCase member names ChannelNum and ScanType of struct
> rt_channel_info in rtw_mlme_ext.h to their snake_case equivalents
> channel_num and scan_type.
> 
> While at it, fix a pre-existing whitespace issue inside the struct
> flagged by checkpatch.pl.
> 
> This change brings the code in line with the kernel coding style
> as described in Documentation/process/coding-style.rst.
> 
> No functional changes intended.
> 
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---

This breaks the build.

regards,
dan carpenter

