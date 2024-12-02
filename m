Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234F4D8D0
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154444; cv=none; b=ZcTQuXAE4Y4WIIEhu/xf20xddIKQRpd9qe3Pq0rSzXtS5YKEBvLsqH6fY7opYio+CWI/sNlbFJUgjBUmVc5nePrkky5LL4EObcVmyAb2v161FvngCx7FahbKJqcLykSzIxRlrf/k+DcWaOyXUm9UwCVu8ar80PK1CUFC2rM6oJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154444; c=relaxed/simple;
	bh=mtiQtlXyI3b6sJIsjA4TwpaNavz3zj9aF+MIz5P2kic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYSJ/i9whFZU+JwKKo2n0wyELKAEYeKmotu9mqpjc0V5w5NnE5Hm56duyxpCfMWAaYCRrXsPEH05+jERCtx5WmKhv2q6n0CLckT6lPGUuJwDCO91HV9S/HPGCmywFliMY875risOGNYIM9SaU4XkdK2stWm9d+WwCBkY5PL1RGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZcPxR902; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZcPxR902"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4af1ace57c7so2558757137.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154441; x=1733759241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=ZcPxR902LlwKgGyKa80VkKcBvrxpLQThpoLox3hjQBE86upHqUf9OMwn7qOC9iFRjB
         njhV3OJZ1PkHl7yI3IYaC6GggAg1VBeMLqgxyk7uRcrqUoURiTiG00dRVP4mMS1pvzUk
         iOrUvwjjif0xcfUDa0RZPUU5gQrgYARAoxcsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154441; x=1733759241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=C7AI4O5IYwqJHmYwgHVuC4YP6hNGH106ghpCXFD09FV7ZVRTg1SUnApy6AXvaZpkU6
         x8o1lLwFDJzlzl3M10kJdqlli39m/sU3/yg4T/DQG7s3OJ4Ul4kxq9xknOlqltqS0Mzh
         RF/0R5Ho1zKXL0e/EYjWOGJar7PE//p/Zea9bawE1u+/w577m0vLo0j2RLw7f8ONAX+c
         rkZQNOHiKTWarjVBaEf2b9IuA0IaljO/2Nv9R6y2lpxBw1LDlH/mgP92AWTRkli2/Kbz
         grVToDLR8Oll3vweIEOWPdoRBjZMIb/i9HS1C+xVgwi241N23eSDfpMfz4zIu/lnQJNT
         isbA==
X-Forwarded-Encrypted: i=1; AJvYcCUDk+G1Y6TNfkTGk9Jd5tqz0etEmOrxMAulAK0n+lmkZCR7Lz6nxy/HIMt+FWo+D8hvf5P2/ovFiv3vLiMG@lists.linux.dev
X-Gm-Message-State: AOJu0YyXm60vBOjFU3Qztx2yRYJB5hka+AIpr2nZebiVA/JKgjzrhmp6
	M9vp2G6l5vW7Tqsfh/tNEc/Q2ecmUCFCs4RwXvxHKhyq73FExdyZc8c5abMbNQ==
X-Gm-Gg: ASbGncuERZKEkZqyNMEqAn602UAII07m0oCSjnYJgZAWxRTmtf7shhX4ZsskbAODtXB
	jeaYonxGA2b70e32FCC7YenYSc3Rq9+MawyxTJA73p47b8ME75ZgdStxY5QOGFOtmXkGYGf4yVV
	G8zzC0hI9Sl+2vMADa+0t5FwQzGyqJQJz/ogPGYchVjDyeVe4BQDcBX+6x8pE3s6rqRCLBl04Xs
	xAsEVi0Z8TwIt8+ZsOTQQYOr7jl8OUfqrPc4vV441JJsNo4S+cqNJEKd/BmNbWPEZE+kiyr25s9
	h+Xw54LFI2tcR9xWE81U0Uce
X-Google-Smtp-Source: AGHT+IGBHPCXG9TwBD4LE/oxUh/BqCKafbDdQlV9UV4NbH/ohrUS+/WPS+6wYQbT3toO5YK2KCH6Sw==
X-Received: by 2002:a05:6122:500e:10b0:515:20e6:7861 with SMTP id 71dfb90a1353d-5156a8069d4mr18897232e0c.2.1733154441340;
        Mon, 02 Dec 2024 07:47:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:15 +0000
Subject: [PATCH 1/3] media: cx231xx: Convert enum into a define
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
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

The code is running arithmentics with the enum, which when not done with
care makes the compiler a bit nervous.

Because those enums are only used as defines (no argument or variable
from that enumeration type), convert it into a define and move on.

It is required to build with llvm 9 without these warnings:
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
index 5bc44f194d0a..62ffa16bb82c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
+++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
@@ -57,19 +57,17 @@ enum USB_SPEED{
 };
 
 #define TS_MASK         0x6
-enum TS_PORT{
-	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
+#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
 				   only offers Analog TV or Video */
-	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
+#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
 				Digital or External Analog/Compressed source) */
-	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
+#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
 				(Dual inputs from Digital and/or
 				External Analog/Compressed sources) */
-	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
+#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
 						to external clock */
-	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
+#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
 				   TS2 Input (from Compressor) */
-};
 
 #define EAVP_MASK       0x8
 enum EAV_PRESENT{
@@ -89,10 +87,8 @@ enum AT_MODE{
 };
 
 #define PWR_SEL_MASK    0x40
-enum POWE_TYPE{
-	SELF_POWER = 0x0,	/* 0: self power */
-	BUS_POWER = 0x40	/* 1: bus power */
-};
+#define SELF_POWER	0x0	/* 0: self power */
+#define BUS_POWER	0x40	/* 1: bus power */
 
 enum USB_POWE_TYPE{
 	USB_SELF_POWER = 0,

-- 
2.47.0.338.g60cca15819-goog

