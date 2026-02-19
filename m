Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111E309F0E
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771501736; cv=none; b=r6TzHrsU+6sI7Ioz8dQ9ikF8A0j70cQJs5RNrbkkJjtc+UUB0pvE9nXPY8jRedtQwuAMoWHCj1uYsGyFhg4TPpW5DE6MAOCb6SKN4OZhHwxEed6XJkQ5OH7avWkDTz9zHxG41zMDpdDWVlD1YAwovzs7FUOGenLgVm2vlIMJ4aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771501736; c=relaxed/simple;
	bh=RM0Eu03VswpLUFAYFteC5nx+lC1kqOSODE5iFKN3QHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOxwZD8M71EU3kLLBqXVe8IfqpdDer9TK9OeVGJbK3OEvfNvUur2PoOOpuavI5mhUJZog6A8QDT8shCOSWhojdqM1PGpici3baM7W5qw1bL42F943GcPrhQxDkut0ihzJ/fxyrGcYE90fUOV/E4aRgTGh9zbxgKhXaJx+jYsT7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc6j/rcZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc6j/rcZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48372efa020so6662635e9.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 03:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771501734; x=1772106534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM0Eu03VswpLUFAYFteC5nx+lC1kqOSODE5iFKN3QHM=;
        b=gc6j/rcZEsVRJtUd9z/hYP/HOWTyBqy9pRFFiXmvaf0l3rsX7siLg2hAzlYx7k7URK
         53kP0O5pqCf24/VLvJ+/82p727p+46jGm8lHnCk/E61GLsE9Xu04AgrOeRhNy82O/gjy
         AAwrYnFX6W0v9p/0RKi7ICUtfp05TgvBqW+FLpSNqUx0XZkuLnsswq+m0U4u/BRAS/OI
         sp//kkcMgzmc6LVLN7GLreaCnA/LUHGWJxucmevR1IzlRSzjp4IV5bWxW0dvD1UpHDgL
         qarMp4zPUZWooOtOGVrFnnCy0jmEiyMWvEsKSQ2tdj4pa/k7NAHlKWEVNsG/b117nQPU
         Dodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771501734; x=1772106534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RM0Eu03VswpLUFAYFteC5nx+lC1kqOSODE5iFKN3QHM=;
        b=lP7mrnMva6ca5pnPhKjPk2cIaRHk8hS/Vq7Y/BKM4Pl9nAg/5QPMnRnCNLoRqVDJD+
         2TxHXdkC482gnMx5fm/xgQxLYCDV5GdjvYNRVdWwrdtEkCEcNIzN1vGfi297/xrQ7SOZ
         mqIMOuGuu8qZiVEk2p1SvhfbJk8YZOALf0d3uBKm5O/TZ7NhVhMYxKq4ZqzmlXTnJLsa
         EI1Q5S6CVBKuQ26mw2tU4woq5zBUSvRBNaWYWaUpSb/vSSsdqP5T6hnl36m1eaLlMVfT
         WUFo9NnzRPcwm0+avgwaLhlkC8y9aJ+qEciq4cN1f3cHeaa8MzSfkIhDeNkzXBjPz3QI
         P73Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSzbL2rpZFqC1L9TBGQplJsZfOxvyPHQ/qbbbwof+EFN1BMdC4Am1KBMdU4dRD8z06ZxI44OI5/84titot@lists.linux.dev
X-Gm-Message-State: AOJu0YxsCBfpIrYdEpHHB0wEikGzVM9QFyYOE12mS1IJpAL+jBxQTiKt
	JELwC8Wx68V+n5ZlkKUoOtSqUJ8UEF8qsF0CY/1ZKgNw6LybMBcT5Ya+
X-Gm-Gg: AZuq6aJQA5B7OPAi3Kv8/aOKs9/gBuPKHT1zOQrKUTeGbSUXf7Mevol4i5pq48JblqP
	fkBaqjnWUOYQPUYG1tYTW7KDS1CupU3EgV7s2IhF81QHww9dIPM6j1b2NdIa8FHOFz0Hi9Cil16
	0WBCqrmBepu2Ioa3dDE66muqSSRWFVZjHUuAbvRoM5bBh394lxV1J3ZxZasIIIhZFi10MipCwG2
	duIIbmGT6vq8uXlO+odTMiq1ux4fm1G4E+b2RpCJYe1a+88daJs6pt95KvJAQnEcHnsudLkNaaa
	7tsuX6dDS45YX+l2bONCST3drWcYFI+B3MupEphevi83xDGUobG7cLVzDlDhUWV9pB1VATXwAmN
	gAL6yEzGIv1ztO13WvPFgA7Oj1fd8s1S9izt0tsLAemFZtuqhmk2n3xUgEQTkL25a+ZHYMJ3aQX
	fy1HfJRuA4HbuuK+JGgy1KUYIHPeug43/jh4h78dNeyhBNoIfam6cBSJ8UVumlh3AY6Piayg2NA
	r0QDuhFmZvhz5I=
X-Received: by 2002:a05:600c:8209:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-48379c1f524mr295267145e9.27.1771501733722;
        Thu, 19 Feb 2026 03:48:53 -0800 (PST)
Received: from hamdan-pc.. ([39.34.129.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b4cdsm52037758f8f.8.2026.02.19.03.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:48:53 -0800 (PST)
From: Hamdan Khan <hamdankhan212@gmail.com>
To: hamdankhan212@gmail.com
Cc: andy@kernel.org,
	dave.hansen@linux.intel.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tony.luck@intel.com
Subject: Re: [PATCH v5] staging: media: atomisp: Fix typos and formatting in headers
Date: Thu, 19 Feb 2026 16:48:48 +0500
Message-ID: <20260219114849.12675-1-hamdankhan212@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209162026.18907-1-hamdankhan212@gmail.com>
References: <20260209162026.18907-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this patch.
Please let me know if any additional changes are required from my side.

Thanks for your time.

Best regards,
Hamdan Khan
