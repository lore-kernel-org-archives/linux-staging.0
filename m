Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A32C11DF
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664232; cv=none; b=O8z7GtCArxOeDA+bbywvIFxoSnQLQprmEGOQU+3lpN+5BqpIASBSiBtROUUPNfWbBN2GnrgIKYAZBu/LYdYy8BDMxmUurmpK36/1kjZsM0sh1mb/3AavoZKTzB1CFe85MWZi1dJHEvjbsCvzEN/HYSzv7flw5AJYi3osNsdURgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664232; c=relaxed/simple;
	bh=AwLmTjHbrcU+SOVQa01R8c+bODe7xXJZIanI/IfDJtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZukFiqSB9AC44kuP9ubfs5jcJvfh5+Tcaji+6WuobKpHUPk1oPITZQacoAj68ORQAWs29sbUH9yhPMmMY5/svWbA56M4aYnVSzzHAzcwGZUtEPh+SlZ4SS/RJK9qFRAwAKQnCBswh87J3/N9X/ngIh02e9Waxi630qlJl1AUK3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2Z4QG4Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2Z4QG4Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4926ee9e8d9so10156805e9.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782664229; x=1783269029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMnBtmnHmhK3jg0PxdbXqkHYJjM0gMd6xqD4YPFeDWU=;
        b=q2Z4QG4ZWxD6n+2V9+1EYavbAxet027VedIY6MPhPjvuMg6m/vapZDygnkeHHwUrlW
         c5KadXLHUYZvtKhlD2NAJuPZXd1pv7DfoJ/nRcoXjDN4mSDiXIHAlywa8U0HoFVDVzBp
         GsAfbVLoJwIsEIJ0PhjwiwJ97VmcSCfeASQePtTgDbeIy53hg2ptexhzOhprFp97ioGt
         8uaF2fR/oBrYO5NtGq1pyFR/bAVosM19R82pMdxQRiNN87HdrfPrfo1Qs2e+wyBhfL9a
         0Hj4gan9hbwsw2ORGEyCkJaBo81cP/nFQK1Nsd1vDgCH3Uu4zRgIBic+T6TzSTBYGniL
         a57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664229; x=1783269029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMnBtmnHmhK3jg0PxdbXqkHYJjM0gMd6xqD4YPFeDWU=;
        b=gVjPDHZJo+7XsLogcNaheqC/SveKFOj4XHoXA4jMeFoSLNtuXhlcNeCJjJI4tL3Efh
         0UmZLeO/DyTdZvZCRQlMULIJqfAIdbRZxQURXtel+yNqW1AN9DA/mYMAsVG0T9yEQXzc
         AMTmdP36kdFjivLo4ICX712ebHvwaDpmt6O3LereA+kMEr9fUVdEcc99Mb53AM+HJu60
         5e4VroS1hZOxnnQ6sBsP2X7rRCmX5KvG/Kaw6UrELLyocVc/PCB+76OVzSBpLF2YwEWJ
         vCmytdDlJ2aoiZlvK7TfjF/gqk6K7/66ca5OEvhMSrt/atmPIOVgOKcUtz22VcAS9Emc
         Xw3w==
X-Forwarded-Encrypted: i=1; AFNElJ/fmm2n9PpCQKH3SknRZNFLoaLsf7LojoisP8jkAbKx2lcnsKRpL5BE+rbDrf+rYbBZZ/fE7OBcKoeYMi5C@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7d58wOulIDH2dEt+dD/Usxg0QVJgdO8Fdg1aCk1U8uLer87L+
	cEulGqe+PvkzBZwpcdrCXYEUFYDkzd2N65BC5LwX5B8hBYjOb2R6lYby
X-Gm-Gg: AfdE7cmONpO37bquC0/kjpR/74QK9TpQ0pPVsTCbl68fihwlESRWrmQOn7EcT83y69W
	kH5ojaQ2Syd1pMz/jxKffKZe8ELsXdx+SA2riCZ/1ZTmQES/KJmtxmc8Bm5ngDTlLCq1V6FhHSL
	xQEkoDg1+KKhl0nM6d426DuVja8Xb3CAXEBYnPQGELliq7YfmyRucKELiqijvcuV1Xk9gfnhr80
	AfTeoyQ30gC66dkK1mdFgkoin5HAFO+RcwtiHLdFlMU6R6TMa14nX/rLkCokXXTPq/RcCqLMkCM
	Pvbw1eHaHvVVsWSbG3n3bfgVXTUNTSkfDdbNJYmL9q118JW0AoBWmU/vZMIhIHh7tFxxPJQo72o
	wOppv52MpDDArj7guoFNfl+CHTNK2rmbxHco+l/4sLzf6br79eX1lZnXdmj9DAhwT6KhDy9vFbr
	sYKyf4KR0XGLvuEUMR15xNxwwNG5c=
X-Received: by 2002:a05:600c:e54a:20b0:492:3fb5:3a17 with SMTP id 5b1f17b1804b1-492663f5bc7mr127559565e9.2.1782664228533;
        Sun, 28 Jun 2026 09:30:28 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fde98csm261474625e9.6.2026.06.28.09.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:30:26 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: andriy.shevchenko@intel.com
Cc: airlied@gmail.com,
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
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
Date: Sun, 28 Jun 2026 19:30:02 +0300
Message-ID: <20260628163002.56829-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajpLyronl7a-yxh-@ashevche-desk.local>
References: <ajpLyronl7a-yxh-@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

On Tue, 23 Jun 2026 12:03:06 +0300, Andy Shevchenko wrote:
>> + * Each Segment holds one pixel and each Common output has a row
>> + * of pixels. A pixel is 8 bits (one byte) in the 256 color
>> + * (RGB332) format or 16 bits (two bytes) in the 65k color
>> + * (RGB565) format. When using the (default) horizontal address
>> + * increment mode, the pixel data is sent Segment by Segment
>> + * (e.g: SEG0 first).
>>   *
>>   * When using the 256 color depth format, each pixel contains 3
>>   * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
>>   * 2 bits respectively.
>
> Something wrong with the plural. There is a difference between "3-bit" and
> "3 bits", but "3 bit" is odd.

You're right. This is pre-existing context, but since I'm reworking the block
I'll fix it. In v3 it will read:

	 * These have 3, 3 and 2 bits respectively.

>> + *
>> + * When using the 65k color depth format, each pixel contains 3
>> + * sub-pixels for color A, B and C. These have 5 bit, 6 bit and
>> + * 5 bits respectively.
>
> Same mistake is repeated here.

Fixing it the same way in v3:

	 * These have 5, 6 and 5 bits respectively.

>> +/*
>> + * Per-variant output format selector for the SSD133X data path. The
>> + * hardware can drive the panel in RGB332 (1 byte/pixel) or RGB565
>> + * (2 bytes/pixel); this is a policy choice per variant, not a
>
> In other comments it was spelled fully, be consistent "1 byte per pixel",
> "2 bytes per pixel".

Good catch. Rather than spell it out, I'll switch to "bpp" (bits per pixel),
which is more concise and matches the wording already used in the commit
message. For consistency I'll update both this comment and the
ssd133x_format_info() one in ssd130x.c. In v3:

	 * hardware can drive the panel in RGB332 (8bpp) or RGB565 (16bpp);
	 * this is a policy choice per variant, not a



--
Thanks,
Amit
