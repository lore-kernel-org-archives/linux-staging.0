Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131A3A4F20
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418902; cv=pass; b=FkSJpW8qCgjOMbEipWeISXT2sSMIkhaPVj8z6ewyuzPaHDX3UombP1aC5d4ReTtFQa763CG9o5wuzZlnHnsAk/ZOlZis0PeG0GiqqIZKavF/U5SQUGnG5undd/bBkuS4ryTPtH/QM35ibiDSNb+bLUlN0pw9e0gi70VJuqD15i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418902; c=relaxed/simple;
	bh=JfJAqk5oIrZsohve8ZfE/wBhlkGru1jKp17SUQ6K+xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=favPLJI5tSRfmCnnKAC27las5znbZXjLHDzIAp6MjMkq9Kg+AEUv0mVfyF9fcdW4d6o1Ad1saTGCn2jRTrLmOIgJjTtaoag4Vt9wzunK4EHAvi/U8onFbZqaC3+wvhar2SXbodU4cZzStjLFsTiY7Zhl9FJyTt/YCMezO6BhBfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HguYqlZT; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HguYqlZT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso5100355e9.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776418900; cv=none;
        d=google.com; s=arc-20240605;
        b=WBPw7pn99KUWc2FxNPKbRSgylSje938nbtBViE3fjeOfJmMip0yVK5jdN6CXESNvyF
         Lk88g7L2+OWospfu5ABEEcSHTJwLeqMmwGj24M2GThzEx7YADugKkRfNKUB5PaARjOUo
         Lx+R2hCF/yPoA5uHNSx7u5mE0DuZul2oApO4STjy3kSPZwVjBpWJE9oXXLiCr1/ixVhN
         OkA0VCu1QCNVUCMy/jBEyRA8HBQ45T1+zBJEwhOGePAxyj/AhJFXIIDYbrCLKwazsJFL
         vh0G/1w/q50dvIVVyBS3iXHXij1wT0+nDYNdIwXjo7+mNs1SoZtCd1PaZ6ymWkI2Rt8Q
         MC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QrDrIe8FR3tZyBg9NmE79HAi9ciGBsGaf6xAQfWRS8o=;
        fh=KMw4J+w4/1VjmOkkLSepmX1SgIayysEH8KY0PExm/F4=;
        b=OcAf7Hp9+WaTXlV5ot8uwjyHHRhGtMPoaapbSVdr04YdIreBJX4ifkvnYtju9vneP5
         NYwLtnqFTt5WKYtV6MCt4uNUSMQ31SFrWl7SfSBe4HrRB8F+ElZeBFTKZXerhXPKnFyt
         AkpIaE6a1DX3no2PtCHxaRzqDvB9Gd1Tu4nV2klPJCds+LvHVlGOQfnDwigOdtzqcFk1
         HeV248U4SfsFoQkv948BTUGIqHaUMIG/asxvMksb/VAVQ2opNsGt8bCbeIPjWARDsoWJ
         AoRqg8xfC6MqTkq/bioKNbFGsfPiSF2y6C5xTJlJKRzBHjEZOl2i4WzBCPNi4FbdJH1A
         zJDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776418900; x=1777023700; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QrDrIe8FR3tZyBg9NmE79HAi9ciGBsGaf6xAQfWRS8o=;
        b=HguYqlZTnU9AVANJ/grWC1pTL7Rj74mOLi1/ZctbzFbl4MKPHuvwn8bUGD44ssLPAI
         A+mXpOaSZFdTAAvIkY0sDx6mstG8ZbVZ8bm/yC0yqOjjLD/jMvBsYl3DwtQH/l2WyOIL
         yDVPw93byF57SvQd7Tt7g0zvv1ifOfefZm392uo9Ppkn4iU6iX1y+xP3VwuA6Wi9hDYQ
         BoRFxi5yTBC7anR7aibpP5tT7+9s1KdWAcvIrtEvJlCu4anGD0YwfXd+Jv2F98ta994f
         1/qjgVm9HKqQgXLEApzQXVtzwevV43mi6K3BoN1Kehoiyh/J0a+4390PqAic6gOQqvXj
         lhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418900; x=1777023700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrDrIe8FR3tZyBg9NmE79HAi9ciGBsGaf6xAQfWRS8o=;
        b=KVxeA1E74Rg6+wZy/m38z8pwXTScsVqsPBN49ENZ6lorfw/mYCczGt8zlGn8SJT28e
         kl27rQT0ppDdvkgnJdPkoPI0J7GU3z6xjREKhF7tsr5qAyPLQT8y79VS2D3OPesxPgxe
         Z3xQ5vFUhMzPVa//RhWiSMUI8yE5GuyOujH57YfQjWPTBBX+/c630s8kvzlOTqpOQmoP
         roJZkboUNN3B3LCvR3j8OShFbN2w4PFZoUwU6Ys1m7f/f0ydnZVT1pfq6BdRFmmaF9J+
         XYOSyFuvy1sEySNSiCjxR+Goi+XA8Hf0gNmk0D4h+UTM5O1n04ba0J9LjFxTtqiYvfXj
         3gjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8G3tjYO7ZZ2eZGD3jW/YAKyOisatRwplddnk8pS0Dmv1fFbMyyzhCe3+1yZml7daN1sc/FDGUjPRmS6TSH@lists.linux.dev
X-Gm-Message-State: AOJu0YzcsRidbcqpN49gwLGx9uMRowA/3J8Hvn5P21vpE/jI0rqYus0A
	AyeH227VVWPIugGmtQ9oQKyarf24ET0wPO3PEnnL/y6nMEgk+1L7PzFHUVgCvQzfENZIB7ihZm+
	H7Ha2knlvyfMkr1i8zuahCCVhrURPMos=
X-Gm-Gg: AeBDiet5gc9UsSWMD4lHiLMEei9zONJC/9oms4RL4GSU0YFoP9qmi982nfgrxCTqmei
	6lFIohEfBFgh8yBa4dj6BYHfwGtHMgG+wMZDcEWAp1ulszt2S3cj6OLquH362eZ/fIM0SoXbVXC
	Idnfz3KrPPhra1e+3WG3MabTLywNiFthXb2zlLEhExXvyG9oR/XkphmIEXf9T2kL4UgAYjtb+WO
	U8dp/G+a/p0F/BL5IYefP5yagpPdShJJqC5sScztcyM0l0A0g2L6BDZwzZzX0fvB3pMpHvZwvy4
	9CmFlzrkGA75YAfNTcB/Tda6DSCd/IMyNT8qaqhMr+FOoWv7wBJhTDzcWN2VObqdzR9qVW4anBu
	Re3/Q/VkB6rEm2PykhwTCXP2P4PpsuYUCr8haugKFe3f68Xwff+0vt/Nui2lRQSHUgXKJTzAzit
	/EqqpbtcHvD6WpXfBd
X-Received: by 2002:a05:600c:8587:b0:488:a797:f0ac with SMTP id
 5b1f17b1804b1-488fb7880bdmr19258525e9.28.1776418899584; Fri, 17 Apr 2026
 02:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416065118.1299-1-joshua.crofts1@gmail.com>
 <20260416065118.1299-2-joshua.crofts1@gmail.com> <aeCe9Za3aGPiRFC1@ashevche-desk.local>
In-Reply-To: <aeCe9Za3aGPiRFC1@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 17 Apr 2026 11:41:28 +0200
X-Gm-Features: AQROBzDqnTOn1YvsDC2Rr16HAGzs8AJwRihGFl_bNTLs3HtHHbMW3-SABh6dQ6I
Message-ID: <CALoEA-wTk+32wUv3M_wLX-+4Fi=6BjLh6UsRZYqQM1Wcf+-+5Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] iio: frequency: ad9832: remove kernel.h proxy header
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Apr 2026 at 10:34, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> While I gave a tag, it still seems need an improvement, id est
> there are missing headers:
>
> array_size.h
> dev_printk.h
> kstrtox.h
> mod_devicetable.h
> mutex.h
> types.h
>
> asm/byteorder.h
>
> and unneeded one(s):
> device.h

Adding the headers above is fine, but removing device.h even
if there are things like struct device_attribute in the code? I know
linux/iio/iio.h includes device.h but I thought that we're trying to
eliminate these "includes in includes" unless they're trivial (like
linux/bits.h in linux/bitops.h).

-- 
Kind regards

CJD
