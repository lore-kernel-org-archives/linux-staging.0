Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720044657C2
	for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756655; cv=none; b=TQs3XhzwgOYvmTMMlhD2w/+Ix54t463PUmbH0eAjHSCdaRHFWtFzrYM+zDHdqlA70Nmq5KE+45HJl6yNXg/79U2j93XoNo6GpoTR5SK9Jg+AVrlPEmskvIZrj7uSGKkoQuAEP9sS9H3UrR3BDPJtQsR+Lx8gObv/so+sKC0BhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756655; c=relaxed/simple;
	bh=ipGQ97f7MUkelnfRrS7W0DNwckkxAJ/D9GjaelK6Pms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+ZR4oJzC74xdowiHjaDsTBzcLp6ydI3tKiBpXHGPTQdMIFTpC+JmssQJSL+PR2GogfbcZWv7Ebkm1RXrJo458aGlKSbiykky5Y9R9JuFZQL0sMh0NQ6NdLyUy5rRlf1UYAIKrTgFIrD6b1zUtcRWzABe2pF3lC1L1kWmituYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDKRZSDA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDKRZSDA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so29458085e9.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756651; x=1791361451; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/vpu6nOACLN1GW1gZlQkN6/DVvLR93ljsvBEfccVh4=;
        b=SDKRZSDANbfL2NBJNvE1XuISGFmnXMuP1y8b4MGyhXFl3cB+4sTTm29JO31NOf+EHk
         IUTAz2aZsyQ/rJY2gjZCiwGI62tSE6SH4c+Uj2CAtetnjpcBmJp3N/961gNuNovGVnVZ
         UXPmFRcO8CO1pbJ1t+RyXEtAE993PRAEO45EdRCjT/Xfp/w3MN7bDm7FmbV31+ML80pV
         9Cr0Fh2qdfd6flMxqkDLyx8NvNbox4ToL/FOAZV7MmlhR+WaCXDBsSFAE+pxX3dkDQz7
         LuAmn1jdonHlRa8f+406Oublb+zLl21BNmKQqRArhULX8cJ3AEUrKRd6fYZ1ML2cHDCO
         PDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756651; x=1791361451;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/vpu6nOACLN1GW1gZlQkN6/DVvLR93ljsvBEfccVh4=;
        b=GLVxjzUgmAYQH1HmP5c5G+2pjqQZV+pjVh6bjVwGF7iaasSPzh5rQw0N4y8eBTTofD
         Uuk+reHCDDKEys7XMABesxCdCCvGqROINAmFNodW8C6edw8/rHFxRmrFzm8ZatKHT3F4
         IaqXzjz2a6Y0TW0ymBNoQ6Bt1ZGISXDysCkPd0MZOrac/hUcESSNrOZfyo2UvpNENzRL
         Ekftpi3I9MauxyRMNQ067FHeaUX+xILH0rqMUrG+fuiNvtfDSNH6RQejbpQ5oXozA9aV
         Pxp7ZUwgonUOa/mlrmaHc1vIHMCyYlf41pN4pBi54k/YfEo11BfzcteXseUh/QwQMAAp
         XSeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz//EIKRHhjJ4zqZzAmiEgjt/XH95VhC3nWlklAL2ZUx/IdLSo6YS3KOiUzuIdv79SrL29jIEEC2h7P5P4b@lists.linux.dev
X-Gm-Message-State: AFuF++lJZaNuwofT+3P+gVGho7Qg6xNdh2rjnW/TUXGfJjHkXAGCT0qP
	isKGIAXPoEjluPhPAr8HXt2B7/2Ez7SjE0rVQIUKozAscpTi0Psvh0FV
X-Gm-Gg: AYBFou3wqqjzia3HX8hDVQHGHONahoXFVgZw9wJmrTqLgKr9HOD99MSxroYP0HKeMXK
	3JqFieanVuxAx4YGU10pCebyFptVmnsTkr9q64B4WQtPR1HlpyY4dArWBnenDu33xFr7IqgTVYf
	tWIDgYpZukDwtX0TDHsscvHDeYLeslQO+865jUT2XxNZBdhlvw2tmKWY+MQDGHjM4TI2svXOW/T
	2vkif49j6iY83Fd+c8EWkWbZILbnsw9GgywedO6JM3/Zr3eLOX/k4G899cXsiatyFSeXGCNGkwk
	s+Q3VoxotijLIIWiO8K4Tmg+38kqewm83sF5GVQ2xzXmk2pHu31NS1qMCA/mjY2Imlv4wmh+iAp
	HQkqAUyhZrrmoqU99xy30YJQ8wLEB358swE7Pn2k/cHkDTrN67a7zhMY5Mz1KcPHXFFBIyCtci8
	ljXrZc5Olxczeq7mtLeatcKlzZD7Yn3aOuFfjRVkFaTvSZTvIEBj2mKmWYmUIBaBlYnErSfzt1r
	j4NYelu1Xag6k9raDgb28EcAcb2tlAJqSyucpmFgB/FLP1oeCjaUX7kq6bHP9yO17Y7e47q9jay
	op22syn8oH/9318adVtqrUOeVLH6OxQsbdNGku/1WNnw29/HfPHvHSkajfXSPTGXgYUsKwJUMOE
	yLAMXU8RJqL9xkzVu1FQh/Q2BRRRFRCUZ6yRyt8V5wOVY7hRvKMpXkfu17xMr4aLQ41YNounx3g
	hFodnE
X-Received: by 2002:a05:600c:3b9f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a01b212757mr10135465e9.23.1790756651411;
        Wed, 30 Sep 2026 01:24:11 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174fb909sm40727985e9.12.2026.09.30.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:24:11 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:24:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, error27@gmail.com,
 narcisaanamaria12@gmail.com
Subject: Re: [PATCH 1/3] staging: iio: accel: adis16203: fix inclination
 naming and remove unsupported Y-axis
Message-ID: <20260930102409.00003055@gmail.com>
In-Reply-To: <20260929184900.39515-2-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
	<20260929184900.39515-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 21:48:58 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> The ADIS16203 measures inclination around a single axis. As per the
> datasheet, register 0x0C gives a 360-degree output, and 0x0E gives a
> +/- 180-degree output of the exact same measurement.
> 
> The current driver incorrectly maps 0x0E as a separate Y-axis. This patch
> removes the phantom Y-axis, updates the naming, and adjusts the timestamp
> channel index.
> 
> Note: The ADIS_INCLI_CHAN(X, ...) modifier is intentionally kept to
> preserve the existing userspace ABI (incli_x_raw). Furthermore, removing
> the phantom Y-axis inherently shifts the scan indexes of subsequent
> channels down by one, which is expected to correct the hardware
> representation.
> 
> Fixes: 2df79e1bddc4 ("staging: iio: accel: Rename source files and update Makefile")
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
