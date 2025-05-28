Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE422069A
	for <linux-staging@lists.linux.dev>; Wed, 28 May 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461139; cv=none; b=B1gF6gkd/w3ipJfEROXQXrRnd1maP+9jayyWTlwasNbm/pK+zbi0/jhoFW5Ptu+93Gr17xqDcpJTg8ayKT/f2BBlsdd+uPzIAFPBwDitump6fDTc/Ji05HuRkKWGy6UywoQR9X/MrOxCRuVkmk6QSIk5pTdG3tQsC8A9GVn5QIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461139; c=relaxed/simple;
	bh=qAlgiZE6ubh5iHvoct1giz6jhFlPlq4WJUF0qIjr0bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euFA1IG8+wL+h9xJ4qCRtCaYmYP9iR+5dM3/GXQ806fQKE+/WSuFRV7G9eI9jiQXmAQAbUAR2cLy59sz42FPtUEiGT00MFVEwQ9FQxLkoRb7apHDWsK810cDF19aWQVEKF7/SKyiFwNWkANfq3hQjF8vyHIW/eUHHtNwC/OkmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WhIxh+wC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WhIxh+wC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a3758b122cso126926f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 28 May 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461136; x=1749065936; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plXt1Ax7l5ZZocx/9iEw4j8ASiL+K7iAWJMDAiTUmzM=;
        b=WhIxh+wCm+RSh3ro9Pa7YycNmhH6hb/cexUx8eyolsfqztsItXb5GfsRd/irIjDsUF
         bWJqkXiFm70Es8Zdb/6Kjv2wsUHS/G8Y2NEcmNSRYFVEU9ddqp1RzGzdzPegqLImqtNq
         8qhe4/068g8nUboUQq8/kvcQHL1kFvZMepVJ4FrUWbce8HOatuqWyGXryJQGqSWG+O6j
         7gbt6SOue6pxBGau/DsYyLuo6WU7+L4TBj65tTW38qHluNj7npwu52E/ZK5bukVSL4O6
         0Ybm1HPae1uDyc3FKcIpvARD+KhumxU+wv4dm2s2Fivs1D/dUr2CnWSB+aSgwrX/Ae2J
         LuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461136; x=1749065936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plXt1Ax7l5ZZocx/9iEw4j8ASiL+K7iAWJMDAiTUmzM=;
        b=lQ4lbylGCP+sbHAw1lapOsEMXunpjcPYM4eY6vecbFW1IiV8RTfbxpvA3GeIDH2IBb
         2TLGqcGcYXJnczR+7N/Zf8P905234PtwO/2g5SfsNpncY109OgLt7g0z5vGWEeekt1BO
         Q69lbeQO/R54NjxwRFyGe9/ztPhKdQoK9HKVCr1Bj8QJBNKvmHItRY5Nx8O5fS1F5i+O
         5FTVHHEhszfSacjsG36UWRuUqH4glChSaSQF680QbBTDIPoDEQyEAA4n8xWEK7cAwID1
         wZKnUCn2T+kuk3cf4MWZbcXk5rg05ug2aDntq+DF/kZv3rmTp6xpsEy/+S5vJvX4E0R6
         r7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVuEQfJbem28e+6HlyqFkbt3my4w7hSchfbCIeENWM6Nu8WKmFLrz6OdIXb9BCslg96NvMlJYeyIcu96bFf@lists.linux.dev
X-Gm-Message-State: AOJu0YzMPcJBq0whYr7z7G63kas42rKXDww39iK9mYF+LX7sr9ExCEz4
	IVd0sFFWEYQEUUzNfuXx3CMi7zhuaZMF/nNWnjHmrhC0hERcItdjl3Z3/ac8wJNp/2k=
X-Gm-Gg: ASbGncs3aXwNGmAlLHYPk9JiZG9mJsQIU+POCAUhcVV+9cW+NtsABESMSuZDAx6BrkM
	uhjSTp3M+34Mn3ICE1LMW5WPi+BKs4CotpNYQpTFfogMURTEiyiv4Xdb3yAA7pNT7wUda7uUTty
	VJYeFKjBbgrHXQ+bNhnW59RPU7pBNkJzD2I1x83SPmahCu2ir6h7dwUhiSfqkf6FM3J3XwTlYIT
	rBMiGhFSLhwb1j4sgJEVqi2dQdxOZqkJ0UnHlASGM5KO086lTJ5bT4aG3VuQ21duqm6WUo+0gp9
	Z8X96OqVMmXVgdjWtcJnGca65++QWgk3Kv9rcyTeZ780KQae8fLjKyc=
X-Google-Smtp-Source: AGHT+IEohOPMzN+pE/FspwUOZyTq3f/DaGNNjqVAcD+QKVM4fgErWjBcDpyCCi/2vxtZ5wPSlADAxA==
X-Received: by 2002:a05:6000:2504:b0:3a4:e387:c0bb with SMTP id ffacd0b85a97d-3a4e387c5afmr8004139f8f.59.1748461136127;
        Wed, 28 May 2025 12:38:56 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eacd6e8asm2265146f8f.70.2025.05.28.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:38:55 -0700 (PDT)
Date: Wed, 28 May 2025 22:38:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add invert display parameter
Message-ID: <aDdmSy4lYH6WrMWS@stanley.mountain>
References: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>

On Wed, May 28, 2025 at 05:42:30PM +0200, Bram Vlerick wrote:
> Add devicetree parameter to enable or disable the invert feature of the
> ili9341 display
> 

This commit message is so unclear.  The parameter doesn't let you
--and this is a direct quote.  LOL-- "disable the invert feature".  It
would be better to say "Add devicetree parameter to invert the display
on a ili9341 device."

regards,
dan carpenter

