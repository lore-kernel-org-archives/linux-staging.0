Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9413CC9EE
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597711; cv=none; b=FUuqkb2/9tTVM0maiV5xWHAedy5XRZKw0mDuH0NZQXBB2XtjAc8DB1ONwmWPODgBqaIyS/n8AEhMfohNctPeRDkXXAhKEO20XQ7wxUGDwNrJeNYlJTvaJ736KKPkx+kOdB4uR44EwrZ+ZZg6XyqtwJwPezTx4n+7UlGqCs9hC/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597711; c=relaxed/simple;
	bh=buffdZlpRpvl1pdzGDXhe9vAwC55peGRtfGgw+ibFUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHfcwaPIY9JUXcQONABaLZCd765BcHVJTAIcG1DhJO7ggwVUAtaoDuG6tUZvs8TtPkjlqQ09f9HUXOoVanZHqjDetyjZZpV8h8TTCOKD3xDc4GsNnHM6mgtwHUzOQT7MRJraaYizMLwn5KaU28uSCqghipcOYtiUk2ShSIaTOsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvCzF+bE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvCzF+bE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486b9675d36so15876755e9.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774597699; x=1775202499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fj/sXT0MBVY8dwqBeJTNK45zDHX/R0Vgu5oPKLbp8Ys=;
        b=XvCzF+bE67r58CeAxNUx2jkKSpQxG6j748aslAwZrASd0ihOSIMX3dRzWe7EFSMAzx
         F62vv5OVWxr9lG8QlAm1WVgRZfLCVDbB65/LniGd8BshuzEOSqwitK8qgyqzzWHfdAda
         SwgdCNzCfKtQDXd/no/RRTykRCQ4MpKjjylCbxTp4/rcnhirST3E3IRa6DMXdmEpat/G
         EoAhdcRBPuqWG7RVAZDAsy3a2GXDVxulejzx9TtyBIJ8ou1Fi/MAKHDZUqI4xqE9aZjk
         0JvC/5+ZFSQn6oTdg9NqiYXX8owbOWzQfF9/MtBbHIU4xeDTW3EFOeD3YXl8kMXQuEYC
         2eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774597699; x=1775202499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj/sXT0MBVY8dwqBeJTNK45zDHX/R0Vgu5oPKLbp8Ys=;
        b=XA32cEVl51WkSU3W2p192ATgtb5y3rnPDwiYtAkc4qVeYfd55rjycn5Lbvxd0NEYh/
         H3AWWcE3CwOahaxm1a3AxyJKaiZUv9kc4vpaRAkxzLVTlIg6nes4Cs7/QsYA1MwUVJG4
         9/ISkfjipNSTWpq/Qd+fNvMP4gWgNew3Ig3y1tIsSvoX8N/u47xlZikqERMhqnsYEgp8
         eM7HOZf+6VWgHXpXDXM4oQN/TPYdulOWAUGjwtSVp4smo30I1TKNCwloTn+qHH6myq8l
         LPLK5YOhRZucQVnLe8u4lzpl6J95ZtXO3/gFsX25STRhCpiNXHux9mSJNCM8hT29s+Aa
         PGQg==
X-Gm-Message-State: AOJu0YxHbD8+R86SLUvwAnCjwQXjh5l52+aETtBw9Xtwh96kXDbHX7yZ
	Bg/pb8OC1t5cG9jBuZXIaesAuD0KdKJ9qwG0ZQ521OEl/ft1ufzUOA9dJ4I1YTy9/iw=
X-Gm-Gg: ATEYQzwFKz/1Icbg+pn8jLOuAaBFOf5WNVRRq9zZYRnhcMwAGuk0LWlyace0+L2lgFT
	DvVnW+9sGBaLektoNRL1LaWkuatSd+Ch2suObSlq8in2+mRk/1nh9yLhcEF87fnc0hhiJxL7t94
	pg4lLXFiNXDaLOsRLqGg3CHjm7Dx3tyGlZHfPrYyy/TT0fB5p4ng3+iP3HfXXCag1M2/5nyaBG3
	3MfG88eck3pytTeGdclpdLPOy4pGaQorIojw2a2VdlJ1JOvKahBHc2PWccMZf5I0DLozy/GQL5F
	lKiDGNYo5g2g9obMcZoLRYkiy4kFwDXhFZHWkUAn1zrG59hrLw4BiWw97shT9PexJBNZQ+KoiRi
	ICd+dXt0oLsVn7ezLfnyDTXnfl8iKJyU97SwBlComBw78jGguqDcrOq81Ted/UPSCWGRHqeScQW
	2noB6tMA8MuvP+RcShM6csggsI+h5M
X-Received: by 2002:a05:600c:6287:b0:485:469f:5320 with SMTP id 5b1f17b1804b1-48727ef6865mr22737015e9.30.1774597698669;
        Fri, 27 Mar 2026 00:48:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271154d8sm14045775e9.9.2026.03.27.00.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 00:48:18 -0700 (PDT)
Date: Fri, 27 Mar 2026 10:48:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: media: atomisp: clean up
 ia_css_stream_destroy
Message-ID: <acY2P24KESCLXA2g@stanley.mountain>
References: <20260326213442.876745-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326213442.876745-1-azpijr@gmail.com>

On Thu, Mar 26, 2026 at 10:34:06PM +0100, Jose A. Perez de Azpillaga wrote:
> This series fixes a loop shadowing bug and refactors the ISP2401 cleanup
> logic inside ia_css_stream_destroy().
> 
> Changes in v2:
> - Split the original patch into a 3-patch series as requested by
>   Dan Carpenter.
> - Added a Fixes tag for the loop shadowing bug.
> - Separated the extraction from the logical improvements.
> - Added clarification that assert() is a wrapper around BUG().

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

