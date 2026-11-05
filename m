Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909545;
	b=mIcE7//4nX6ND1IYZIvh/q1vYbJqNX7sXWt+zJaB+rA6B0Ug16oyYSwLZeW+ZKovogLV
	 GXZpL7IyrjlLhO81e4nV/Vz/3KyXrUHb666xzp/pXgHch43QjcQeDt8z0osJDr+qtiuTY
	 ZJ2ugbH2imVVmlDS08HSfhcmmYcSlgQzPcyG0aiwSe8MLdaejNAVA6MEeiybpo9Z+tkdF
	 3k9UwKjOtH+FlQJzJMLyV1Ew2KIeIdh+h8gN1xDw01qxok3j2lBIz25KsemdmUwSJnt+d
	 044hBVvkLqyeC1NPhuJGtRnV1WkA5mwnf4lw2fCFrOfA8ZPYgah11Rxw6y4iukOJguw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
	b=bAWyLjmqqb5Q4SAHme5tcNAEvT5JCW3h3V8zeuQx+2W60RD/KZQIssOgkMn21iud6zee
	 az+gx26Y+Lilk/BOwmBlb8f+KTFqR1EdS9u40QU0lg6GTfh2kpThswtG73NC7aFJEd8GK
	 8V8xNAMzCVXfKWVjDCGj6X8CnPxSDAk9pmaNat66eTqdACdZPUVxpEjiKrlRHrifNlSBL
	 zM+FCTBpWssF09xWAqicp6F3b0ziC/0nlKh6/j3GFyW64bx8AyicxThrkZKGxb/Zy2iOv
	 pNe8vPOXs95PEw/vCiKb8xOnfIU6NiNpKbBhHjmHOrwkO1L0lTxmZuHbeOtqNywRH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oo3U4yyJ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA99606A326
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 20:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oo3U4yyJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so1941170f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 12:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909544; x=1794514344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=oo3U4yyJIJFA75XV4M2XwFXVV0xBGUi0bLsQI2DPNt1w9GKT2Mxy5XEuTyP54uuUl5
         ASHSTwqcVeGmkHYv+qDNpj8qMZDMJ0eONhtHtll5WWfe9OC3lXHiIRhdlT8Sq12DLqAe
         LCqaNnebjfx6LCvvrQBfappyB3+WWl7Ht1SmeQwX4hnvvAofCjM8iR+87ZRvbLF4gluK
         iR9k9VccOHe+Eyh7rEXgjyNJeUf0ZQTJq1UBOO/4y33Z7RxTHEGI0lu4Qrbla1nrs0V+
         EyxWsp2ouFN96p6slZ7s8MzkJC9tlt9dR0gRTlkIAII6p3odJ/363swmZEtgohEPzXPo
         Dd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909544; x=1794514344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=JtgpbzJkkG5CRSnQPjgFjDcyLf/kXla4dzv9cZDvTvKveQjIONjBWvDn6nWuEP1BD/
         R7nLYH/9AjTmRMGXF2CnpknU0PMXi8p+5oufC9FY9VVcTOGCnf0yDuPmqRJjJNz4N3fq
         utPkP9Y1V74kpyAYXrDJ6WYOABN+SVQcDDT6rS9cNxmRrMCFQrqRE5PsKfjOc6P7uXZR
         z0lx2Qwdz5RgxbYWCdL29EnOoJx3kjpwf6mMl0NB+E6o5Gv4d8ExUW7ZJJQqQlv2mL8Z
         STaiKVYmJ1k62SDTVRfyvXA6KZwx+yDdVCRjshdAeT3nfO12ZexWDKxBVQ9zOgEumS3d
         +H2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAuWqZcFIGfvvWSkN8ABFH39044q89amnNLn30zxIuCluGYhxiYjp9WfNdKPvTo9hdQpOoB97ayuLf4twc@lists.linux.dev
X-Gm-Message-State: APuU4Z8srukBJrCDX0OCvBgr9zcsRPwM2jAA/McNvQKURh/XAWI0YdC9
	hnDGovx7tqj46XA/yQQsK9dy4p8hyxykEg55RmNJTU7/qF1mCb0rzJnI
X-Gm-Gg: AYBFou1Wj81mbzLeP/3rusvIjrHdWqoSkUo44X7AIb3zcXUTKN8E2L6SGkYgAS1SRI5
	FAN78l+TkS4qH7iQQqx2iFlmWnot+F49LnnZtQu3BWDctvRueHPu/cg4j+rLW5bca6c4K2QMDOQ
	plqH0JMmWj0vYl4gCMC09UBj+eN4lKFpi+8XsAzz2CNFdN+KWwQuSlMZ1S0itcxMDigxyam0+m/
	p8HnH5rrNPTNs3ComuKJwNbDgAXpEfcPnRFfAGkt3k/0oSsHj7fPgXhmrPqRomy4eV3bhIhKLCn
	3rs6Z4sfA87qjJpl0Fjbc64sEAJa+BnQYzi+oeZ0Gi8ctpjhYCs+7GrRWRM6sV0tUQIM/dtYuD8
	qYiCwbUV+pGVQ56n+IHzKHzU3HD3rg3gLPgEjYS3httG6QmJz7/766cqur3vWjlUnHRH6/r5upf
	ItIe0mTMg9RfZuue7yUqPRovm3Q7jaGjkiUn7uPnbQu5fp3sIb4qjDgvdZ7HMLruEXFgQJIDXxO
	/0t++O3PNFY6lgc9QfMBvXZ2j+i4mDn8cqJL+vJAdAmtEDCxT06G688Braap92AB+9LN3N8Ggvy
	QHMVBU6Sx8qOM6VnxPWK1qu2wGQRPdmsr5pSmbFngZopmbGV4Jy05uk=
X-Received: by 2002:a05:6000:2dc9:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-492778d2076mr1325704f8f.45.1793909543495;
        Thu, 05 Nov 2026 12:12:23 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm11108369f8f.17.2026.11.05.12.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:12:22 -0800 (PST)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Date: Thu,  5 Nov 2026 22:11:53 +0200
Message-ID: <20261105201154.37294-2-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi,

I'm looking at the fbtft TODO (convert drivers to DRM) and want to check
whether fb_ili9341 can be dropped. Findings against v7.4-rc1:

1. fb_ili9341's init sequence is the MI0283QT-9A one. Comparing register
   writes with drivers/gpu/drm/tiny/mi0283qt.c, the values are identical,
   including the default gamma tables. Differences I found:
   - mi0283qt writes EN3GAM (0xF2) = 0x08; the fbtft write is commented out.
   - mi0283qt always sets MADCTL BGR; fbtft makes it configurable (bgr=).
   - fbtft rotate=270 also sets ML; mi0283qt does not.
   - Rotation maps as DRM rotation = fbtft rotate - 90 (mod 360).
   - fbtft also offers runtime gamma adjustment.

2. fb_ili9341 registers the compatible "ilitek,ili9341", which is also the
   fallback in the dt-schema binding, so it can match nodes that the DRM
   drivers claim via their specific compatibles.

3. In-tree users: no defconfig enables FB_TFT. canaan_kd233 (62363a8e2f56, Feb 2021)
   has a status = "disabled" panel node compatible with "canaan,kd233-tft",
   "ilitek,ili9341". It predates the first DRM driver accepting ilitek,ili9341
   (5a04227326b0, Jul 2021), and none of the DRM drivers match canaan,kd233-tft.
   fbtft requests "dc" and "reset" GPIOs, which fits that node. I haven't tried
   binding it. I suppose that, if the board is used, then it is built against the
   fbtft driver.

4. fb_ili9341 has had only style/mechanical changes in recent years.

Questions:
 a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
    modules to panel-mipi-dbi? The KD233 node would then have no driver.
 b) Or should KD233 panel support go into a DRM driver first? I don't have
    its init sequence or physical size, or the board...
 c) Is removal of all of fbtft already planned?
 d) Several other fbtft drivers have drm counterparts. Should I inspect those
 to see if removal is needed?

I have not tested on hardware.

Thanks,
Daniel M
