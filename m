Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D19271A71
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 16:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112021; cv=none; b=bkZH64uHWbT5gMyj8mkpS/u+6m0Q7YgqZxnaYklz3N2s8hxA5hFnSKn3eLf3skKIeCA4IMcmLMFTqHt/rkQe8PUBh1zZ8FGTu30O63ATT+MXwFpMImFS90LX5d/P9+OZAcK2BIiY5GhEabp/uTKB9Cfytop36qhzb/wIDHwc+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112021; c=relaxed/simple;
	bh=dAT4XoTqM4srLRTVT7YpxKj02oAsnu7R0+7Qkkkd2cM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:Content-Disposition; b=ATmR4R4K3OJ02b360s1GAoRfnTCw/diWAIMfHRMzarnYnboj1mQftkb3hN2/vm+nCGdfw1aEUER791GfRmsTq+qCukjyq1PFxDcTZMiZCCOF4T85ATdDynPatOaDvhN+AWiocgmVC1N4bUu0y5xwGD7f6aFmrbWmEpeCB3v5s3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huKByTVr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huKByTVr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439d8df7620so1855480f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774112019; x=1774716819; darn=lists.linux.dev;
        h=content-disposition:mime-version:in-reply-to:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAT4XoTqM4srLRTVT7YpxKj02oAsnu7R0+7Qkkkd2cM=;
        b=huKByTVrfCXaUpAs24oFPgXnMbxYsRhFVJ7L5SiNJeFLxAkR8GhcQK7/DKuM/MPB9D
         CvG+i1Crwi2BsXh7hl+nqKlYhokKC+CRnDP75Wd4az24z79I8F3Th0LFKWEZGc8jFjUU
         btI1DBeECBdxrCKv3IzeB0h0SAoYSb02nBWlKVpwIU7nPl3ofNINqT7AXL2xxRAnuZFM
         sNV6ReaZoL5XFodYcxRgZjUpxWhSwLxVfR8itI2HcQW00JuRHEcCyd7oXy0kmA9lXHFR
         rQvTqvKufB1R5vANT46O1HuyDebByIeG13pLj7d+ZhPak7nobEwbKH1xZsUbSNYhWDDa
         pImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774112019; x=1774716819;
        h=content-disposition:mime-version:in-reply-to:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAT4XoTqM4srLRTVT7YpxKj02oAsnu7R0+7Qkkkd2cM=;
        b=BjFD0Qp25/CHoBWNK3QeFhYGAgByZGDqUwKIGDB70qcKyMTtwQDqD3OX4UwQhuEQj3
         uWAi54HX/fCopldFJ+19tBwv/gMqQglO+gaDKXFMKN1zSvU9f9vG3ADG1SQUJPyf9JGR
         ERoft6b5KYH6nwAfWe2ueQrKeDYKYV9swlExEbWDwKsP0gZCmTR/d4TGqU84P0KbjYn4
         DDU2WdDSl4cgil/WfDC7s1a29pGbsYANIGyWtK+JiJO2cDMqwClYTgR+HG8Lq4DK8eDC
         wVzEr72tgNfvQEMP++Cc/aQikA3QESOy7agds8eplSKhmtC7z1PdkBnWJcJN+V7A6aXh
         tZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWuzVWstMaU2KPDSBKzXxrsrQXT/wPaW9OvoWwbgdVwSmFLgXFlFGLrVTSTTTcgompx0vDmJNYtCbVPosE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz63oypjy66n77mtswEknY+XStNlwsqRJTf6Rs9pRXM3yt3Ij07
	CJktrEU96+JbyK7pqXagvn23CKWPEgv5QsqcdUshIAcku0nv1JTKVzB2VAGJKmd/noM=
X-Gm-Gg: ATEYQzytchLVTfkFezX/5+RHFLbYZPibXkdVPl1xZi1MCzXIPYOwRQ2Xd9lHt4udnqu
	yxXteMt/ER0F7Daubuqe8mpHCm92CD5uen8K060dw9VdX6wYL74pCty+cWoL4nKuPciZ7kEaeXz
	QTAY62y2MmUAahfCC16Dy82BRXoSiDQ6z0lm0VUFuVqpDCDp3V8hY8Vn+AuGiiPN6YxK1axwuFI
	qsU+/1jrJODcQBVOtHTMqUXLepuyttkMm5FR7//EoIAhWAsyqFc4ew2ks//Pij43NbcWxe75IzF
	tCg//SCZnfZ/UcZIalHkLYOfH0hnlmHW+MZ9/BF4l2hDbdfpDx55uvnl7701Yp8r3Z/0IGZubjc
	c8Dg+8vZL/uZlc6Ck0iiMNZfg3bqr6GnnvqjhJFFaqz/ykk5Abo1JP1LEtcbAh9tEu/1PHGTkN2
	0TrC0TczuQ1wmQpLNieT9irs90fO5NyZ3rPixIdQ==
X-Received: by 2002:a05:6000:290b:b0:43b:576b:5dca with SMTP id ffacd0b85a97d-43b642442f9mr11136246f8f.16.1774112018381;
        Sat, 21 Mar 2026 09:53:38 -0700 (PDT)
Received: from MacBookPro ([2001:8a0:6c9b:a000:bc11:6b0a:79ed:3d9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm16128103f8f.14.2026.03.21.09.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 09:53:37 -0700 (PDT)
Date: Sat, 21 Mar 2026 16:53:36 +0000
From: Gabriel Rondon <grondon@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] staging: iio: ad5933: use sysfs_emit() in show
 functions
Message-ID: <ab7NEIlXcg3BMmE8@MacBookPro>
In-Reply-To: <ab0BHU8zNOUIAcJf@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Andy,

Thanks for the review.

I didn't tackle the switch resplit or the modern _avail patterns since
those would be a larger effort toward graduating the driver to
read_raw/write_raw/read_avail.

Thanks,
Gabriel
