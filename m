Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26C134AC
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154442; cv=none; b=TYzOkYrRt3oe2zuOh+mcoW79PCeqyRvlrbNjxvD5tvugghVmuXSEh6khs9vItkAR7CR9Z2LIdEvcSHz5IDkWSG+o1gTV/EvHw/3iN9eoCBC9ONf25Xa8ndCC6CG5KLVL99AJJ/T0OlazZhhxN8dDI1km8l45gBa6OYFEuaR4keA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154442; c=relaxed/simple;
	bh=8u8fF5ha9BCebV7dj4HE28mCFH9G7mXA1hYQMfM+p5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kuhRasXXIkld68XqSmlosfqxaZqwMacGygcAPjEUAqRtwpb/dvACGyWwYk1eFBe7kQZ4oVaO+1xiTkZyLKZjC9dHn2IYK4JY/NX2Mq3IqFdp1vL53gZpoTwks2LySngoyj88jpzjX2yBc2OXyHU5Q7UliLvvejUTEWl+FDN1V6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JA1j0mbZ; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JA1j0mbZ"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ea55e95d0fso2110318b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154439; x=1733759239; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=JA1j0mbZWT6aFeAwDr4fRxsolMAX7kqQnnWTfrbjIVj2egw806yY8uan+fE2+hhc9K
         W3JaZkWeQDygHky+UaQo/Tak6JqPu7ChyX5oxa74aTjFSpF68t4iT0pffqR7jAxTdUpP
         UXk0sBpgtoZF91cOkLibV4XTTwJkC+LKX/+ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154439; x=1733759239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=vCNN6IbzPyRjuAYJejpFX7kyjxSQU8VDPBTvk/eThzhuiWNt/BR+92kt/uodPe1Wr9
         jyZVlSQZNlj6ALMlC//HHxM54WRjEdrodY9iVKyX/ybjhftEP0pP8JvG0v4w39kIAeLK
         xv4zAPdqmNZr1qmCQLlbp2pincSXyGXKFm+FLCd/RV9SmV7yPsyZ5cFvz779sS+jXFr9
         0GYLTwJDoTOV5Q/10U1DkeRSbzzvIDXgzmikZIMOdmdiOLc/5iluUniyLw1JgpWbiQOc
         3Nf0aNvsTbqS56clNk/iXhuFagwmiRz4HxI1/5I2pElP9T0GJaulsueXXaJz/G2X2r2u
         IjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU193CHaK93DUF6UytDYT2JlB69v6GF9AOHPujtn3/klW3JFZXxZVbAZ1Ak4a5T4BmEqxpzRnLmXtewrcMI@lists.linux.dev
X-Gm-Message-State: AOJu0YwQeDGgjeWiciM2Ue6OOpm1hg6RPdHHEDgPoKPFO4Vyix6kVkBn
	iPAuVxTa0eJye32MAs0jJJEU3QjPuzBtxjvy2Jelkh1O36VruglLCV2EkT5x0g==
X-Gm-Gg: ASbGncu6SLqKCQaCxX0R5747v+ud+6ucjekHwErc1/os2sqYNT+FCMud3Ic8Nt5bMc7
	WpmVPCiSb106zoX6nCBAnT0w8MrpIaAzuuf/rPa0Wakdpw6u8wKUKuZlhFT6GWAGaSJ0Vi9Ci4I
	5a5Qz8d1yngtiS18qLz1ZcMBuAQr1ykQCIjP0ImJf8j9cC2Ncv8A34ezljvFbPz6BYgZ3RRF6qt
	6Nimwrgp24pwbz1gFaNfszEinw/27RJZz7/AVzwWZFMrHb7d7huzEYWYJSk1fWnCCox5/FNJFRK
	IYVVb12aAFDeXxelLzV5kvPn
X-Google-Smtp-Source: AGHT+IH/7hpTfNse9nN9Jr+DgfzObAaRxU/S7oa2RXexy0e4f94BDSUNP4uGp0FObZdTBwMHoHxTgQ==
X-Received: by 2002:a05:6808:1589:b0:3e6:2471:4d10 with SMTP id 5614622812f47-3ea6dbd43f1mr21613568b6e.11.1733154438947;
        Mon, 02 Dec 2024 07:47:18 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix warnings with llvm9
Date: Mon, 02 Dec 2024 15:47:14 +0000
Message-Id: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPWTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbllmhm5NTlmupa5JskWJuYJpsmWqcqgRUX1CUCpQEmxUdW1sLAOK
 puwFbAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

When we tried to build media with llvm we got some new warnings, lets
try to fix them before llvm is part of our CI.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: cx231xx: Convert enum into a define
      media: atomisp: Use the actual value of the enum instead of the enum
      media: mediatek: vcodec: Workaround a compiler warning

 .../mediatek/vcodec/encoder/venc/venc_h264_if.c        |  6 ++++--
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h            | 18 +++++++-----------
 .../media/atomisp/pci/hive_isp_css_common/irq_global.h |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-fix-llvm9-4c8d705c9e3e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

