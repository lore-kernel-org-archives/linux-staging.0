Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E7CF4FA
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795732; cv=none; b=lYjkHjzu7gZK9b6TiBKW9VolTHyaX6W+2rNkCF4MI/U9MMPLt/2f7AUcwH2b3deShi56wnvinpu8Gmk6bjLS6L1hRyXYCFIrO8VimqNOvoz1yewKr9pypAjqtH4tNbAL4BGJQdrfRc3uEPLheT4EEtQczVb/USxe1UA7XRWSdUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795732; c=relaxed/simple;
	bh=0U9koCOJzgH9JvfmV6YnkoehTxq2ubIy486JlKUz+Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgVRqmUBKH0oVpQ5zB0akbZcUdzAMsz85STmCzNvZtFizsBTS7yKlg++vpuHPqGUbLqkvfK6gSbX33fXcs+RS22HHQo5JalMwVc3BfzhMMTl6QLI6XApgU2nktQ481oE5vpa2svp+cvjWjE9UqcR/M/Pl0YcG+V/jDD6KfpZQ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zHOV6IuB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHOV6IuB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1077787f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767795727; x=1768400527; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOW2y+VKVeFQcfSJXk3+EmObS/JtRwV2ILjhb679FFA=;
        b=zHOV6IuBHnxjjG3WpNDLXuTqrTwdudJMLfuralonqG+ytMCcNOefxHa47BVFMfWZcp
         PfKzVbtWr/HKubO1yXiqQlhjLmjQhdItI3cqMGj3UsS7AzOS2e6KeoTwZ75Eh0TDARAB
         xTZcQq+bp/sw9F2/TSR5cb6W9xVKGFV19Azk0FgymcrB1hEMglAG7RUbu4UcnPbLP48y
         jUu+MaX7lP95icpDs6u2nf9XaS/rM5Dpbs3gs32X0IKi23gyGAi4CZztwPHQk45PljDe
         jSyj7HWq3bfuCJwhDmjOjX95uGfK7ubPAYpF0ehNJK3d7fVlNVWMe8QD75ftJAt4e9Ld
         nmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795727; x=1768400527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOW2y+VKVeFQcfSJXk3+EmObS/JtRwV2ILjhb679FFA=;
        b=Me7Bpt1lFdLV4tF8OcOsRBjaJS9CKMvVjc/kXokcGwc8GGdMeEAntkvdO3KSWl5Omq
         nQhFVoEg6RAx8uKQ2Q5c8wTQ/g1xNq2R5alQJRJBf2JZDwYSpf0zrzN4FktShSMRoSpk
         lGR3/yuE9c6Aad6Y2E8yPMg4Q2PRzvsRkMzLrhUcefZe/7mov9PW7R0dui40xGnM6pQP
         vg0TCHXr6rOW/pZHr4LUnGK5Pun/OKZ+TR4SL4YvR0mrTsMGXefvTJE3SSCKKw/KahA2
         st65PFfrVBH3Isex4HR47ZKKdGajYcWMSXC/MyID3D2mTmzwTMief0s3YAuUg2LaCoGA
         ZhzA==
X-Forwarded-Encrypted: i=1; AJvYcCX3wDKsM6R86HbfFHUUctjmA8zak8TYDUK473q95KRrAWzhi6aKRhEeyeaYMcPUOKK7/xCSUVRU0xblCTSS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5JH4cS+tgGre2Sz2R6DGN3Waouw5Z+1S5Tz1LVeGUnRmT+e3A
	jwuFpa9ArKp6TNjJqtt8zm3iSOoNCLCcp4oZiH0suw9hqKITyv4ms43e3jS3chxP6t8=
X-Gm-Gg: AY/fxX6atJXm25iyHQ3VK1A7sVi5Z//Lt87qdF4ZFh58+vjp0GvrEb25N1HBPf1ZQ33
	661ci10DWvph7cUsm1VCsaOHOZWeGCkyY3BPcnsEvBlBGfdImoh4gMSJ3TLDJeisK0rH0932txj
	JZ/6EaMyrqEq7OEuxPGqHqvic6KyUTTMF5SSSacJVcOBZTZD8E8tRnfShiLZS4u9arY++NazZYn
	beDPTMMd7EzS7x5xLpxTODruNtjligx3bLhKUvD81VDI3rhxNCpX7Ky8wHYk+xWj6t4/PE3UBaI
	HzJjQqa6Zv65GM3aUnOzT0Ev6LZxMzCt1sQeimJ956S9x1ks2+eywvfrm1LxT+F6OP0P7qAzeYC
	sdWVXnW84wfLvV/nI6xg5dSM4Oj3gn9ZYtXFU/d6CqMqUWTmMKJNMEwVqowuxWwYkynEXxJpH+y
	LNdTVLMKD9i8f5eGkz
X-Google-Smtp-Source: AGHT+IFJwknu9uPiQ2jlGnRv7HuAdmdncQ8NphWGfQ7jlTeHbYr70BvYEzG8mcTbKTU43DrbU8ZoXw==
X-Received: by 2002:a05:6000:2204:b0:430:ff41:5c87 with SMTP id ffacd0b85a97d-432c3775a44mr3337365f8f.60.1767795726838;
        Wed, 07 Jan 2026 06:22:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm10912638f8f.8.2026.01.07.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:22:06 -0800 (PST)
Date: Wed, 7 Jan 2026 17:22:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 0/3] media: atomisp: refactoring and fixes for
 V4L2 compliance
Message-ID: <aV5sC_udoJ3qdjBD@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>

When you're sending v2, it's better to just start a new thread.  We stopped
sending them as a reply years ago.  It makes threads too confusing.

On Wed, Jan 07, 2026 at 07:18:41PM +0530, Karthikey D Kadati wrote:
> This patch series addresses maintainer feedback and fixes build errors
> in the atomisp driver.
> 
> Patch 1: Standardizes the 'Bridge' structs significantly by using v4l2_rect instead of custom shadow structs and aligning ia_css_region members with V4L2 conventions.
> Patch 2: Introduces a helper function for statistics buffer allocation to reduce code duplication and centralize error handling logic.
> Patch 3: Adds missing error propagation for IRQ enable and XNR configuration to improve robustness.
> 

Please line wrap your emails at 72 characters.

regards,
dan carpenter

