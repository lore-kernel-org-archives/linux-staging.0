Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8701F2E7389
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250518; cv=none; b=tOlNzyFHk060QCQLw9WiQh8Gp0n4CwQd79WZFMcl6NOJ/JMlY2L3gcYfb9RntM1eov0GAGvf0WcRj3Stsx18fMxBvfZSx6MMhev3FmCEOVD2VqVKBmm6jDwr1KMX8xictzAS5DUFvJ2iALEfWtbMb12vLxwrhqzxRHgq6Hpog1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250518; c=relaxed/simple;
	bh=aUOlwUMmvUxeWUajWHyxa6VY5afRmReJOBvfaFefO1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvcePm8xjUXQlAGbq6VGIRkxu3HlH/nDFC8zS/ZCwbsAUJmWSfpBsj1Lz9yJV3PvazYcbCIVTOUNnl0zrwBVznLmc6PURzSh6x5cjcouqw8LncLQnJZZLgmwX4oCbI4j2X1dqUYxVhHtr/0do4lcca7lmUl9oREODDcsWNRGHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BU7Uk2Tk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BU7Uk2Tk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4924593f45dso3550005e9.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782250515; x=1782855315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npX1zE3oC8B9i4AqwB/UnRyXW+2tBx9spPlY9cjsius=;
        b=BU7Uk2TkwNG0atjVmKae+hD6ZjWnFhOHJ5r7QDhECWrkKLDOTwj187UdfW95rbbQvB
         e9/pWDqDV5SHHgPkE2I3Wpy3w6UmaGb4KABMNfkO7RkieOjvRaEhDcFFhu52ySKojsgR
         WGejXtrslyETI/QnuvCtKu6gD2fV/nYuAtV4hSmkmOS9nXF9fmcIQp1/Mnspb3mL81cr
         3e7Zt5fY0RA5U8w73JL1mpYsk/a95WjTCm1EG0wqEiFIqL54mlrt/HP/W7s0H5Ev0Njr
         nMLUKyALP9LqkmMpROwQHfWWpr9rPg0zrtVCum3Gx+z56XQ8FQ5HJh8jAA9Vco6Eqc3k
         SE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782250515; x=1782855315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npX1zE3oC8B9i4AqwB/UnRyXW+2tBx9spPlY9cjsius=;
        b=OIhuSL1Ax/OF60sX5vK2O+2IsG1arRybCTsj99tdXOci6DHzPqNfJ5gCThgjwPZaQd
         FJs8uB0gA/jgXp35JktCdtaboQ1odC4pLIUq2hfl++sJu6M5tpKkECprmc/lVwJkZdjF
         j9JcEojQHPaABErg0xG5RQkQS7umJP4nxNiC7gbAiC0zGY5ZJV12dIaaAE5u3xafxgay
         hMRu7lbSPh/2PTnhvxQ+sjHiu7xGrFOCnTPyuhp4Hhv7fN8p3z3ideh6Y8qYuMf3wOJD
         msrXy4T5mexA8cFYMzIkroXlM2rXbBqdkgfgRYUbqe1PPJ35CuFNOTTyxZgi/J6YFIgb
         OhLw==
X-Forwarded-Encrypted: i=1; AFNElJ+YG9BWlOozz7X7P7ALh2ngxVq+2J1VIUiFEs5hdycpmiBeUhX3W/C98IX4nZDPcIyPywlKh7YrPCriHwsd@lists.linux.dev
X-Gm-Message-State: AOJu0YzV65NvJHoNhKQ69X/tGK8FXZHUeKgBO0DuCGRYuYstrWpFLRy/
	V3oklbbxaC7zCugrOBpLXYI2neGkNyCEFeb+m3CnwIirDusgaF9T7Wf5
X-Gm-Gg: AfdE7clMWM75KDd0OdnmVBQCb3GwRmrmcirUUl70UioJ3oSWnvnh36j/aRI+/7ktYki
	nvvVB4r6UtqSTon4235rhRc+vPyy+8YygqEYEb73PVVOlThpkerD08VX0iPf5m/hRgYcakCxmFL
	0/ZEC7EjJ2UtB/XJ01/ps/WDe+R44Runs2yavksH8CNC5wTWjInBshUh8okH29OYbsKoueHGyP/
	+fpJNOYf0IEsWq/D85QG1yOLfBCD0rNKkahVIGIc0QiNCz2SHw2MID32A9iU9lz7HpYHN+70avG
	+qdZtt3JQjdzLF28KIPctNB8DumyvF4LK5cWrxlJQchQnSBKzpY5AFCWDX2LwkGwgCvxlOJNYy6
	sggrQF1oixkU2lw4imbU8xx49amrsFBf+nrjFQ46dJSKFr2jDbTbCgNgp+7JQXZyo7poL2x0eVk
	lcKvhSOYzWe2xVIzLRPFi4eKqKtWsYI9S7enSpRA==
X-Received: by 2002:a05:600d:10b:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-49260840c5amr3352535e9.2.1782250514831;
        Tue, 23 Jun 2026 14:35:14 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93d8sm1059435f8f.23.2026.06.23.14.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 14:35:13 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: markus.elfring@web.de
Cc: airlied@gmail.com,
	amit.barzilai22@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/4] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Wed, 24 Jun 2026 00:34:47 +0300
Message-ID: <20260623213447.30196-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <16a86f3d-caf0-46d0-97a4-c9585bdaa06c@web.de>
References: <16a86f3d-caf0-46d0-97a4-c9585bdaa06c@web.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Markus Elfring <Markus.Elfring@web.de> writes:

>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -146,6 +146,33 @@
>>  #define SSD133X_COLOR_DEPTH_256			0x0
>>  #define SSD133X_COLOR_DEPTH_65K			0x1
>>  
>> +/* ssd135x commands */
>> +#define SSD135X_SET_COL_RANGE			0x15
>> +#define SSD135X_WRITE_RAM			0x5c
>> +#define SSD135X_SET_ROW_RANGE			0x75
> [...]
>
> How do you think about to use an enumeration for such data?
> https://en.wikipedia.org/wiki/Enumerated_type#C_and_syntactically_similar_languages

Thank you for the suggestion.

I used #define to stay consistent with the rest of ssd130x.c, where the
command constants for the other families are all defined the same way.
In my opinion an enum could be a readable solution for these values, but I
don't think the switch should be included in this series.

-- 
Thanks,

Amit

