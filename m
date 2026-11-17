Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938190;
	b=26iJxNko4d2vb8LyfDVwyEQxyrBLhyaIfYmK9yVfwR+Nfk3BvEhT/h0he7q2y8665iox
	 7VKAS4b0WfGA0kHmGocgmlQvjDpgi8riFmvOdTZADy9TjIecykCxA6BHCQLOBjK4zKTYs
	 HwO3gfLbv1L0MqJf4Ec6Wx5Zmi5iEi84zMpgbiCDrcNJ8t9JhPcH0ypUraJXVz1e0aONK
	 xX+5AI9iSB4Zm3+e+KVRS177KbO991jhsuHACrC7CNIUl8XGhSDShUj5U5s5sX9tj6vrd
	 xPpw5vbRUg4QtQXq/s0vfoVtOP0rR2aPDOCIlMgzPd1PpGnaQ0Lf+gIiSgpD1WwcWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
	b=YufjydfgF34FfvUOliTpzxgqdx0ilRqPVdDRAC3z5qtriXLzQUKGzMWCqz7DaNlrMBzh
	 bz2TJ4PQhe3ayhkwlqTa5fAQeYp1d7wiCxPY9BUy5GfvCubPOvlyT2gceM4jFRBkrYsfy
	 EMHst/L3nXUyO3nGwIRIxCJrPsujrTvQMW3/SxuIaorPSu2g+YNWi/cu6GtkON+/OVX/x
	 hQnWzkpeANO8wVsjgjxVU56bc0kRx6w7PhqwwMV6SAJwwkWs6QCdApdXlQyZdi62hW1yT
	 6UnPngDSlLQQtArMGZKI4qTQK/E0JDNKYG03ZC+G8FJZ/8HkHaCbOiVs2WVhEbpFCFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFgMiOh4;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C6606A32C
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFgMiOh4
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so30202f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938188; x=1795542988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
        b=CFgMiOh4ZS5+R0asVWZwWbDW245bcBIPPQpYe9lHFh4WR0C31YDTJqs9Wc3aHBP18/
         ondi0jFpiyhocIouZNACh7MC/Dk2vWnikcOz+X9MZtXz7pqV71PXru42sQz4yDdpQua2
         ffNdLSI2E7A70Ir42atNMV2Vl1nyLGFBAd1M2PeT3vWqlM9QFdB/cbflLh3KyIOB9dGm
         iRamCwTLaPy75SGrf9KETbNKZNdg0Xmg53Z4QuQsN8c0DGKsaZkCop7yb9O09abfXIMI
         tQ+4X3S91ZjOhkz1hx0+Sk2fYpqOEViH7Odhb4uBu30sAbQ4ayRWZvXyJ5thtFQvEOM/
         gaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938188; x=1795542988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
        b=iRfdc+dKbP1Fm95bnWyqF1FfysUvSemLywJmcZjCa+Q0OyZ0WVRQmDo9Rptc0/RFCn
         UYE1l73JfIkS5U3OSFZvPqX0dtmRP3vOomhpzbeD+ViC8V2iveDEl4r2CW5EzNvEr/Wu
         cgyyu42smA4FXvuw6UOH/yrBCiBIf3Js+0GtAir3GNGOgCR4WaRMK+ln53TFQKzYIVCf
         uGl1gpL8/+StOpfC0h+z6qRDd3ExYruxiST16U+tOogaTh3pO5HfOpQbkyUs+Gn+WiQZ
         W4J8jRB01EHX2S0YfvCIgz9aDqJ2ee6BE5B0jPmU/RHRWwDXLSyZxcFvFnDS20Uv1rOS
         Nmzw==
X-Forwarded-Encrypted: i=1; AL+hErHNAvbq7Ti5AQ0hObPdeG8fD+xm+LcEp1QPgMlvpKM/c6dtiJfko1asCWzEXlxAmEzs4XdJdJGXj0gGl3+C@lists.linux.dev
X-Gm-Message-State: APuU4Z8GPhfDWSvyRThXHu1s6qHDvny5Fjg0He3aFZpKCFs9TBc9QSqe
	/Zb1WZyAuOzDiu+nTtGsSYs+3zaNW1g0eYj8H4DycEycF7gksD5RJX5C
X-Gm-Gg: AZFdTZfOe2YCrSt5poHvdCvEo8qMMgUDu47jATy0raQhkZRsc5gKvA4AGs/wUmU/AwD
	I8GiD3rwcevXfIyi6rEBH+cFTf9hp7clef3XS/EYgopu8oEcP7LBOoBBS0XDgrdyC6BM04Rnqqa
	V3mBs9CIpYppc6Hkf+wt35COAO8vE42AQp7YB5M8zLZ1NDBSXwViNf+UQ3kzig613YP9qfxQlom
	8GkcJSZTnvExvNaEenbVd4EwI/xL1rFMuxOM/9/CP+HLdLbqRGB53HlAXAB9naDlMB+/rTAECYk
	ItwB2x/Az0FvLaRIFDo+vpbQg7Ms1Jo/dNvyP/8tlHsoG3Oh5xjcQeVvySjUcG5YZRWVcNeZ/0b
	a0Ig7xMO4tYW5OmaJB/XSh+4BuZgCyEBlI4vcAsTkEuO3kyX+2dfix29o+JxwrUBt5qNP1AdwED
	HujMQ40sK1mOYxgX9yaRntMQSonzPZgLxucHXGF0I86s50xxjcAWjho1H/czBTk/XcSXWGWBL5F
	b397tF9cvNBwrvqY888uPhtfibYZa+jCGPOkRaN2pmLUQQjTwyvesL+5728NLi/4bM55Lw5qkYz
	+Y3bjZZOEnDvee0kzzVoG2fa3cFVJH2PmC+rF4Q8MZpbRw==
X-Received: by 2002:a05:6000:26c7:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4a639ff6138mr506509f8f.32.1794938188531;
        Tue, 17 Nov 2026 09:56:28 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm47723f8f.18.2026.11.17.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:56:28 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: andriy.shevchenko@intel.com
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo ThinkPad 10 rear camera)
Date: Tue, 17 Nov 2026 17:56:14 +0000
Message-ID: <20261117175614.11710-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avwnh1o6rFzayxkj@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com> <avwnh1o6rFzayxkj@ashevche-desk.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

On Tue, Nov 17, 2026 at 12:08:07PM +0200, Andy Shevchenko wrote:
> > Not supported: the voice coil motor (the firmware does not name its
> > type) and the LM3554 flash.
>
> Why not flash? It's in the kernel provided by drivers/leds/leds-lm355x.c

I should have mentioned that leds-lm355x cannot be used on this machine as
it is: it only probes with platform data (it has no ACPI or DT matching,
and nothing in the tree provides the platform data), it does not drive the
LM3554's HWEN enable line, which has to be raised here before the chip
responds, and it registers plain LED class devices rather than a flash
LED class device.

When atomisp's own LM3554 driver was removed in commit f1aa35ab5943
("media: atomisp: Drop the atomisp custom lm3554 flash driver"), the
commit message said it should be re-implemented with the
led-class-flash API if it turned out to be needed, so that is what I
did. The new driver binds to the same ACPI ID (INTCF1C) and uses the
same GPIO order (0 strobe, 1 torch, 2 enable) as the removed one.

I have sent it to linux-leds:

https://lore.kernel.org/linux-leds/20261116180809.26946-1-volodymyrchapman@gmail.com/

Whether that or extending leds-lm355x is the better way is up to the LED
maintainers; I will ask on that thread. In v2 of this series, I will reword
the cover letter to point to it. The VCM has since turned out to be a
DW9714 at the address listed in _CRS, and I have a follow-up patch for
it which I can include in v2.

Thanks,
Volodymyr
