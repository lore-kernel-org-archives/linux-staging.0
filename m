Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF537159
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710762327; cv=none; b=Hk8hXx9bjeu/PoQ/5Fqd8Ml94mJJcFs04PZpZkex+vc0S7InvCuPsvPa8pR0/w8TR8Nuwuwf11YIFbWNDwHo3LnJMfVhG6IbD9Do5XaUGxm1pAogxt3AjBYQeejUjZIkuFATd/7wp1Q4qD75++Ft7cZ0DNIn/JoJmB9R29d0M6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710762327; c=relaxed/simple;
	bh=DAioQ/fXGesI6b7MLNItTlGNHaD8NUjTvUnQ6rS0NfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdddTH3bDvNu4W9W0BVuR8Gh/baO3S6VsLOiE4AMP3aqOU2vnd2YDfsQyYN+cs7P4ffZhAfOqvrnDPcsGeaspiM4Vng0/Pe8EEpGtKIbJmCh79PmaOTkLFC7ClOqqjE5nTKyXX4lD4KHA+/wCcT4q7yproFPOcrBeEiIr0erLBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VE70X5sm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VE70X5sm"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513dd2d2415so2665095e87.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710762324; x=1711367124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAioQ/fXGesI6b7MLNItTlGNHaD8NUjTvUnQ6rS0NfQ=;
        b=VE70X5smmVnvxdzekjg+yydfE3+Q3Xa8FToVhNVlD9fcs6TX8kFgCISft3xUh777gy
         frryoK6q9PAr49GskQgQ8O1tYyTiJ+ZbpPW5ukA9wRaDKEofdxg+EKTETgjyh4C5896z
         r3APn6YUD0Q8n8SLIaCDqidqMpMja33tH88hTaLweHD4Q7opPptI/7ZnwHFHXM348ywx
         D1bM7SvhBZe0pdRF/bpVh62peOuW8Kezwuqp0q9p2A94uMz6zfnm93h/aYE4ve5mGidT
         Mwo8HI0yYDJlsdo263B6l1unGcRUdfY8jsJJF5LZIdx8xlq5XViGfkQRaQkM3j12u6f3
         vayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710762324; x=1711367124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAioQ/fXGesI6b7MLNItTlGNHaD8NUjTvUnQ6rS0NfQ=;
        b=PpTTu9mFo1u+yJuIopetwT1jfDiglb9Rqyr6+YzNZVYHq0dY+NSuNNMjLfAD74/rSy
         S/gHreTsVjnv0PCtKFVVrFg4CBqhFh/Ei7LF3lhFt5BRqPLGZ2J3/ycK2Q3NILzEAsSi
         wCufHrDSp+h7hQO0/pEM1L5c5oy7ARAF2zQPf/MDJefMvOyh2+vtnnC8OFhYdU9lfb8R
         +NYDOp1NXVezYMcpr9p76T1RWz7ecKCKIqKf3xc7aO642xinduoHc0kzHMYXwqgqoEca
         s4M3JWcJpxlxl155xWq15TAktVZD2M5McuV2qb+wgelLsUjZUdUzYqj/Abs/eWCxEtCf
         gAjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3TeHq5zy1G08UWofLRe9hBxhd08Ek925CfUySRvV3Mb8Gw3B/jGkBe3jOSnZdXMuZnJhCQ2lWGk8P/5RWlhjzkscXTKHqkHW7Lsn85Q==
X-Gm-Message-State: AOJu0YxhDRn/DPaT5AOP2sk5vttgpLJc5lwy9Z2kAJdEAtXZn09wNRyl
	mfe5GxQh+1NvIRDqjzotGakf4OD+ffq1fwrRuV2vO99SxNbexf5WnxWWQOPP70Q=
X-Google-Smtp-Source: AGHT+IG8MlqV0IFElrl61OyL7fOfY/41Sw8w0N8TxSEMfr6QmXvjIx0dLThL/ol2w3e+kJgFYFOgnA==
X-Received: by 2002:a05:6512:348a:b0:513:ca72:7229 with SMTP id v10-20020a056512348a00b00513ca727229mr6293669lfr.69.1710762324024;
        Mon, 18 Mar 2024 04:45:24 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b004142894df64sm976341wms.5.2024.03.18.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 04:45:23 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:45:21 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] backlight/omap1-bl: Remove unused struct
 omap_backlight_config.set_power
Message-ID: <20240318114521.GC16260@aspen.lan>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-3-tzimmermann@suse.de>

On Wed, Mar 13, 2024 at 04:45:01PM +0100, Thomas Zimmermann wrote:
> The callback set_power in struct omap_backlight_config is not
> implemented anywhere. Remove it from the structure and driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
