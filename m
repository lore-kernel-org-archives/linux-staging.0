Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB374C6EF8
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854759; cv=none; b=UwccbrHwgGq7XyX8Jw3cyRj6hNJEdicOa2KxHP2Wq5pDSkFPZuIjdCqeHNtDd0qDIdRqSt7Or0gclCQ1U2l7B2cDgCMGHkkqIVxdCMVwKOBZHke/+g8Fzow0jAxR/QOhIWaUAxZsHiRq8vLKUcnHvFyVdwAOa6kaAuMddPVqD4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854759; c=relaxed/simple;
	bh=laeJaCvRd81udZfwhlzLQ/pBiNLkEyq18mqwuNA0OIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZH/yGLUtsNSpBZiZXCbf5LFe36HABP8CfBOezgx8Qr27ee821FkkKjKH5BIn+tQmrL0UF98fh3lT92NesUHunqbPKZ6KH5z+ul+NV7ZPaodosl/XO/QFAJY8ox8gixH7Hk1CAEXY3bPVzbOiRElRPmYyReHaPV7DjhtzvcUfTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDnGF4/k; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDnGF4/k"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e4998d28so89406f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854754; x=1788459554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXazbZDjHYS7TxQMC+6npHdpPuAZoywDenkIT58mmgM=;
        b=KDnGF4/kz44r9D+zjhpjKHmj8mNFCYTdUUmbpd0qdr0eQhjf6JHfYxhSLyCqorf3YQ
         fvtgue+YYzJ9HT/QMNEA+97t8SkegA67KGWEHp9EXq2a0MjRIBg8N8226yZLEsZVPeTl
         jAohjYolJ/4okgsTQv8+Vzb0/NsjsTNzI/rjOI8/U3Ue4dt1NbivWZ1Y0VKJrVrl0Mxz
         i3t0QQ8VAc8vhZl5w7geWzpQYuYToW6ha4ArIHCyp/0AWCs7pR3MWvM7Nxb+IbS62gfg
         5+WEE7Ze6aiiM627ekduxW1Y4Q9E2t9w4NOHy78cuyb0Xru+yguFNaXJS14Vjnv03pV4
         ombQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854754; x=1788459554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXazbZDjHYS7TxQMC+6npHdpPuAZoywDenkIT58mmgM=;
        b=XzUK/NZ4Br9Ph+yeCQuJFVcbO12t+uVE3+j5UtTX9n0xns1U6UMkEh7enfk0oq6bQF
         BD2zpwWDp+TvVhdPGJXlE9LCfNRDmXklHk1FYhGJPrSJP6J/ha2XT8LUWi9UsulstHq6
         t/kI9PF5viH+Q/hI78KeJsDKIP8dAmRORdxPs9y4Oeoh46Js6HMI9FJu4/KHknKXlAU5
         QIaxYsNupJvRmZTR1T8HY6oJyPPil7kX1zsPSZY0Vo04gtS+N733aKKednRofUG8kGnr
         XnOTA8w3oBq7fPKiAjYTVlz3CHyHQTUoHRoGXza9QUJCHyivJZ57qwx4R3XiZ3HR/7ZB
         06kg==
X-Forwarded-Encrypted: i=1; AHgh+RpBsqlcH62zBTfAUWI6GfBdh9BhliCaM1UyoNPaH20nZbBRyR/4vrm9r/3XRpinRJtdG1tvH3Rob3aJsoAf@lists.linux.dev
X-Gm-Message-State: AFuF++lJUZ8NyraEMHeNGDqJ5uNH06KuVEVOZPKGMhJrADZhAnd3SBeI
	qJd5Bw4PgnAcdFlLpw9Tc45PJNmfFAtnl5RMRrSi9m/qzfTuC5lwP/x6
X-Gm-Gg: AR+sD12Kal07WMEZVvAm7MAbXMCJ7BB1HLeQ3vUtM0s5d1zM5A/Mw1tMu6WOb7lxwZQ
	dEGgYBpeNgCRjP7kIea8cm6FaMWh0VwgpVy+S9Xw9rP7n9PTstV3X14gFr3FeRmL8vd8ZGECz4S
	J5/2WnHqb6BpAQ4Cd8r5usq8PWNIbht2B2W/GmrT2QVIH3HyNZm+0KREMGnwNFYBqp2R+qSawE3
	FNxyqcfWIlK1HAXbSS3//H5NcfsEmj1zgJC+0OP8dTULN9XiuJ9THmQK5hiaqo9EdgmuhBxFKys
	0m7yfxWJZym7rlno38S8n73TR3gvVSHomeMOQAM7YgKwJUfzQEPfHfMC3JOCXIoYnT/DpYH/reO
	OZomnIDEivGOYtpoAKxqrracpzvfbRUahUTwavBE7x+VEzrvWLK1XqnClt+ehTutVjqim95OMHw
	zsK28Sawb/Yq3l4p8HHAjmj0DZ6xi9LNOL8NMe72pw2bhbO8hm4u+s3/mZNWvNIiNJZFF4/QvgE
	5O2vdii+WfYD+9ANaAS2vI97OXq7kAw6SN59FaRRIl2
X-Received: by 2002:a05:6000:2388:b0:47f:5369:bba with SMTP id ffacd0b85a97d-482f79d7637mr707984f8f.15.1787854753934;
        Thu, 27 Aug 2026 11:19:13 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eef5sm10428350f8f.1.2026.08.27.11.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:13 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Thu, 27 Aug 2026 20:19:10 +0200
Message-ID: <20260827181910.2431826-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is the requested excerpt from the YB1-X91L DSDT. Both devices are under
\\_SB.PCI0.I2C3:

    Device (CA11)
    {
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_DDN, "OV8858")
    }

    Device (CA01)
    {
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_DDN, "OV2740")
    }

The corresponding runtime ACPI paths are \\_SB.PCI0.I2C3.CA11 and
\\_SB.PCI0.I2C3.CA01. In v2 the ID additions are split into one patch per
driver and preceded by the requested C99-initializer cleanup.

Maurizio
