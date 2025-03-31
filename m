Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8086347
	for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439127; cv=none; b=hUylWZEQaCU9npIg1cfN1yDm0IlbKEj4pFCvmoiOJmi/lbtH+bCqHqoBMSoLeVSXmePacRCEjHUiJlMIKWZRbxsmOnGFYpJFj/gRj3A5uWbZ5ieGYBkAZW/0WC6e6CT5ktW/twyMdsoqJU9Ibhjxcw5y03CVtZ48+9NWf9hgNaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439127; c=relaxed/simple;
	bh=msHDyhQuwl0lyuk5ghM677h2CmEgt+ySvxiZKKREyPg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PlcUkbqvV8+idz4c4r4gQLOg7EMaGQ62itMWkYZVn56LGcvG1bedS1u2zJBzljs1FKI3hfgXV+G7sTN8St5315H0Q3oOnaG9zv+RFDsTGPxy7P/JxP+3jQrBdt16S+VS+LU25x2DHn0Jrux/GUHRxwATOswwlryqogmKulUI+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CDLrP5Nv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CDLrP5Nv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2840239e87.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439124; x=1744043924; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYZVbCynk+ZVoNdV3LVYecJQ72VIONJ5XFTXiXMNDn4=;
        b=CDLrP5NvO2BFb496H0KG3hyl7c5FWFajuE4Damue6SB1+IkINySH/Yg4KPmRrgqm3c
         w33gpy+IHx/xAjvwuFBmHgW5fGP8w3oNajkkfVnDDbnfkBXxkXrm4vafgg6QVDDOhI/h
         V4zc3temfnzzkCdpoCt51q6gRVzGwsmvMV4Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439124; x=1744043924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYZVbCynk+ZVoNdV3LVYecJQ72VIONJ5XFTXiXMNDn4=;
        b=Kdkf2kL0RXkmcWHUYO29vxbTmh8f2lkYG6ll6TzGUUbQiQQ3focTbk/UFHpn2c5fVW
         bHvl9YfOW6SvBsG7cg34NNI1Gdo+BfDebqOSuY6YRyVbEW9FBUCXRa98OiQlVXDI8KOy
         r51JagoY7+zLVV0kRm3MlJY/INzZIED3W4D2pxXiPfzFr7k55Y01NLsGJHe0FprJgPtR
         INccBjZFW6Z0nx7HT0S0yYhN8c1yYDLrNeVbO3AT5m/6Aj5f0omjixfxXBxVIQlnTdrX
         mpAAmqbvo0c/aVnYSDsH5Qi/M0B1Y663V2MFmV0SI8PPcaURjTclZEQqEb73iKDOt1CN
         PB4A==
X-Forwarded-Encrypted: i=1; AJvYcCXRHPIuSp8LZgVioTN1Cs7s4lGKREodV1sdyMQAmvYt8wOqlOvxfv26kg7scjJobK8B7zFawrTeUN3BqDxX@lists.linux.dev
X-Gm-Message-State: AOJu0YwuUsGim6lbNwmLVAd5BQ+eXpwEPPU2+ks/BUtN3GKP1ogs0Zie
	zqlfthxYEl9ot0aUNr2QkjyeQr1WUlcPV0I1LcqyHArZbfDDXLMMnrBy+w29Pw==
X-Gm-Gg: ASbGncsIZeWEf2ay9rfLWNzlySdSwvdGDecbYp+9z0ahVuotm/H4q8A0+5xPopHZGC+
	sgKhTYB+xKUjN8yMi7LSgMw4F7P0Hn89DYuR45vYbZpwkmoBefEa0HFWPIYybtzsxOY+AH708op
	3bz/t5S6D4oe4hjjTRplApAXGKZksND0GkEcGO8qwOtBTxrnx9ActjNO4waTlahyFWE3x3ImI2S
	h7dYOMhXbREVEJMQW0hLpiAAsZ+Pm8b18RdTm4X/TllI/OVO6uxzinIunwime74UQ6xCDz0JEgT
	bSaoavcIeBXNZ5jszfkZIvusn9SFvIjx9Rt6g9y+PwNuYRbHgHrsIRTNHyZFM+cNKhJOUSGIT53
	/muYkVbbDSMI8sdRBo6yPavsz
X-Google-Smtp-Source: AGHT+IG1r79q5xr7a/3BgTP+KtzgOsT7WxeTIDLFGXSCqIMLUKbuoKzIZY1SaNKhCamPJwufuwmDmQ==
X-Received: by 2002:a05:6512:a95:b0:549:8cbb:5441 with SMTP id 2adb3069b0e04-54b10dc7c04mr2716480e87.15.1743439123919;
        Mon, 31 Mar 2025 09:38:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: Fix gcc8 warnings
Date: Mon, 31 Mar 2025 16:38:41 +0000
Message-Id: <20250331-v614-v1-0-9bc69a873720@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHF6mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY2ND3TIzQxNdCxML0xRjYwsjS2NTJaDSgqLUtMwKsDHRsbW1AL7UnAh
 WAAAA
X-Change-ID: 20250331-v614-8485d3382935
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Kernel 6.14 has increased its minimum gcc requirements. After bumping
the "ancient" test in media-ci 2 new warnings have been found. Let's try
to fix them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
      media: atomisp: Fix Wformat-truncation warning

 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c  | 5 +++--
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250331-v614-8485d3382935

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

