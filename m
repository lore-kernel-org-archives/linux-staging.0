Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AC2135AD
	for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671483; cv=none; b=cGx6TufnGBTX+RGZQtrhJYB2moXgczRi3rTmKVWyLP3xLocYbz6zjIg6onAbJjim6PaRC/fxQWFm1Nc89NgtCaGkPRvlMwKYfh/1o1k4TSRcE5AQnKl0nIAQ7IzGu9LrmcnvYoKNklB0CP4oQTCXG9NTn/8KxjZTJ1F1j8zf3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671483; c=relaxed/simple;
	bh=/zY5PMOi310ktVYGpnYfeiQf9K4srfJWKah+xam5yrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zzmp8PRlckkR1uFUD89YyIQYvdxhB6dkSdb0ERFC6tIdOV/JnjhtprrRdcle9eQvW6Qv8fWKzjWwEE80ujjqkgv2BLgqMuKUK//PwJnRs9axztKbxa2xexLq050d0xy6rRjCnnbPovFbQ5tTO115ma/S5M3395lHG3u6Le89g1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kglqXJU7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kglqXJU7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso45363175e9.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755671479; x=1756276279; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm2V1odyqTiqeUQ144+lcYOoX8xxycxwVvudsLtseZg=;
        b=kglqXJU7ZFv1hGQVN2WGhnRtdZV9gsA2DmBb+QOe/9fCSp6Qea3hQJIlmHrUjwC1Kb
         9+b5JxHrSxR7qL0NvFER1VtX0hcQDgeFRAUmDUsgbvJNlBB8r4+0296C6lprR4YpPGQM
         DQUOeFIa+5PHaqnKBPU6PzNTvCWq8hmmtoTIsO7fSbShzUpuQJoYSJbOJvQTD/VNyudF
         9TfxCXrcb1vMSpC072zCG3d3WC8r/9p4Ma/yzVYoy4PQ0DMmopTuTNucTIhxP9Bhlcb0
         9MTPR2dURai7AOhn9ROFU7FbnDkRjEZF7xqAnYhu66P9/H+EhBY/Mr1HUcy32M1mAOIY
         Frgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671479; x=1756276279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zm2V1odyqTiqeUQ144+lcYOoX8xxycxwVvudsLtseZg=;
        b=OGLxbcPEursd6D3JoxKMWIIwzp+b0xS2C7vX902tlKEVZ3+Im2wCEsPLjHPi9pHxQG
         zBD15YGxoDVhKfUaha0cuFhg6CyMJw8NwAwpM5+qWfSznRJirlqeCkCyT1EZYY9JLfdo
         mkHqbbQU437ocOHp6kfvuv4FDnHfPbcoeu1FG0ezra1IAPz0rECAmhyvfi1AC0ICyy47
         PMFFTki9sUc6ingJPDoesTx/qSyAP6cL1hNQllpkbjUScepwZLUc98sYI59PU/6biDEq
         zACgbs9PzF7TcNIc1U3OerFNXgWZXMJN9SlYCSQytiZwucwUfGb4MhFAqekRK15cocY6
         Luvg==
X-Forwarded-Encrypted: i=1; AJvYcCXccrwMIVtMrILyHJOnvninEAQ4ahXN8rS0iLJMh0PqJRb5lXICwFX9BOZFsBotuolrxM2dpwFv50uSjtys@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq+gXP6QQ4B/3mT5bDm0XbfhnAR0kLGJAh8ignHa+D6FnukWMA
	+yW4tCzXE/2cUzAd2q4AhxRUGLRX9kXtmEfi7/mdt5Wlk7rdspeTd49G1fsYhDimR70=
X-Gm-Gg: ASbGncs4+QxwLS0lLjKB2n1ML5pjUfEbaUmQEAanKzI05Y4rhVST3MoXLbwTBXMhdpj
	y/iv/lGIb+cCWBcu9FjKPSrMxcNlI5bxXeov/qfd1wdBUXRLwvQr8JOeBVtnIWIEUjEmuE6RAxh
	YZk+zWttk06F5dwWzcZbQlRwaN4WQ4sGnEwFTY9BLAHgnMOGxPYtHUIXH7BaPNMckQT5NFysVIJ
	HtxXsvPdRSuUIUws5+fY8R1fSAPP8hFuffWfHfhQ4UfbwbYpii2/u9KMLxKMTgMAo7hQiwJWFj9
	GoVShOddukMIvScvdHu5KDkZJX0uumisPsVZqhY8esITrIjS2AUJGdqrOpDVmcbuQnrOnHetdcF
	K6piRKglLN+uiTKSNL7T9uvn3w/A2PL0aqHLzG6buoDM67yBxd/HJWA==
X-Google-Smtp-Source: AGHT+IHD67e0X5QiTWO18n/Hjm63pK2HXsKittHH1LjgztM5w2vz+Tz+Iiy0mNFamv15+XzTSBAF8A==
X-Received: by 2002:a05:600c:4fcd:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-45b479a3e26mr11414505e9.12.1755671479001;
        Tue, 19 Aug 2025 23:31:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47cac162sm17779485e9.20.2025.08.19.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:31:18 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:31:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: nvec: Remove unused NVEC_PHD macro
Message-ID: <aKVrsrvMrTEgAY4R@stanley.mountain>
References: <20250819194430.4525-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819194430.4525-1-mohammed.guermoud@gmail.com>

On Tue, Aug 19, 2025 at 08:44:30PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro is a debugging helper that is only enabled when
> NVEC_PS2_DEBUG is defined. As this flag is never defined in the kernel,
> the macro and all of its call sites are dead code.
> 
> As suggested by Greg Kroah-Hartman, removing the code is the cleanest
> solution.
> 
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

