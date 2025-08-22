Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F363054E5
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870922; cv=none; b=t4cTlnrD2VFZwdtGticHRn8z8AwmCG8ypkDyoKgNeMWE+cpXkjj1IZEl9PSSi062kmzgfE6SHghHuuX1k0TwGzFCRLawuIbM+5v+DnE370LV+PYcQzTNW+8Pzia5+wufzLicaeMjD95BrD/ki98YEr/im/ffm1ZMu6qsFKZzBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870922; c=relaxed/simple;
	bh=sVdC2hU/SSPlglTMWz1ueCPAtY4Ily5J6k4KXXBlx5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogNwsz+K9CCrpGO+yisXKXDybUbDpHEXGXEo3Q7f/hjFvDhfoxImTEzp0s93iap3OuruP8rNIWKkswUHrsqXsowJHMAW5z0jUtBfu6Y3BvkVrMrCGLibNWIdYzX6tt9feRLYGWHYgZMqKbzWbtr1WoWgsqUx03VQupWxTh+bNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX+WxwaQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX+WxwaQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so2695295a12.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870918; x=1756475718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv9g6cDQmujFG1oPRSFe6TPkH+3laec1tY9I5AIeBsE=;
        b=XX+WxwaQUGHUA8pCzXNeiABQM7K3rB+F+r0uVCosag7YWrRaIC22R1puEWaOCVBf0O
         r/Joog+oS2yzm2lyuX81lu7Ax48Lw2eP/iMEcM1/LlVwbXXKsSIjHFxfj/FNh0u7i3nA
         IS9Df8GURpG5jEysBKGnNs/uO6z6Yb9PZPS52z4V/V0ZhIiyG8y+/t+uRXrf7GmWT6xQ
         jgwM3xTSd003a9kP/oXDRfD0633Os7YVrRG/Wo169agkFg+4kSbUz3VtqMxJcN9CjKcx
         maRVp49AtfLYXGcMWyxY2g1z9NmUPdB6btptsb8JGMEMsDIUwJbyG3Lc2ttKwfVSJNx4
         Y5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870918; x=1756475718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gv9g6cDQmujFG1oPRSFe6TPkH+3laec1tY9I5AIeBsE=;
        b=gCOMKln8KDdcTiBSUNxsPBiqsfSXo8Rpv5/DSxhWiYaeo0qAGTroW+M5cEmJ2eUICl
         LjvX7Hhq3NQ+z02fhqmmz52S5fnHc6cBCWrmEAZQBXT5srfap5K4rOfdSarptJCt50Mh
         BzIKajpusTmYlYPNuqcff4Gdpyb8eCy8l0IidbQhi/vienqhTpJ4tpJ0Oqj3zkuAwWeq
         mez+MfS5ESedHvS6OOoMDOF8tFRaLc9VaJo2RYEJB/L67a5J/9IMV4p5JSpaAcQjGOnV
         Okuf5mvn3WyT0vDYPSjjrjrTEIj9WQpPGOfgHlQNHegJXaIuv7teHrwAGbIBMhou+TiF
         09VA==
X-Forwarded-Encrypted: i=1; AJvYcCVUJQEFpav8StY0Cy7odifzso91Y99mOzkjWoWN92C/hAnnr6XeORIJKGmoRXYu9NOh7I1krpgw/ywG25PV@lists.linux.dev
X-Gm-Message-State: AOJu0YzLIAMOKKS+Rln0AQA4HaBkv3Q6Ke0pGMqIA+6JPb2vo5jZdrAz
	eALM+m44M4panydwDSUUfJbl40ubmft4j0dTcF7pOFS7jFCLyBdyiKmp
X-Gm-Gg: ASbGncv3sM57yNz5Jz7/z69vhiLehfT4IP+SCAix2ZdhKY0nuaE0OyYNkF+xxA1/odv
	nviq3hZBntybED1CT/01KNXIg8wBjjLGhdE9dbIQR8rVhYLOrkr1ibkZMuDQiB9xa17LrhnwuXu
	FqLDCMkvg4K54djOLptop9FxesivXmNFghf8R6VCYNc7m9cB8mHxloclNh0bghE5FLRlj0MO5Py
	MV8d8na5NbQCy4Mk7Ws/twdb/7jjXVrpANaUC077966q+M62IJeFusGZuiqGXcD11OjQLHOMY/E
	eQDXfPr1SqAgFNu/XghjnsewOUNfGCRLJZVoN6qxvP3aVWPMln9jDL0bqIALmZjX9UAU6gqR7i4
	0YmI/8c88WkAuU0V73HsLK058q46rtMKxh4jv
X-Google-Smtp-Source: AGHT+IGMrws2TvXqG52SlSp4a/tgZdhmkILCp0HBmaLsjoehzHc+bZRbjj7jqXlS+zcy5swwEVRl8g==
X-Received: by 2002:a17:907:7246:b0:afd:eb4f:d5d1 with SMTP id a640c23a62f3a-afe29742ad7mr246391666b.65.1755870918342;
        Fri, 22 Aug 2025 06:55:18 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/13] staging: rtl8723bs: remove os_dep/recv_linux.c
Date: Fri, 22 Aug 2025 15:54:17 +0200
Message-ID: <20250822135418.118115-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous patches the file os_dep/recv_linux.c is empty now and we
can remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile            |  1 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/os_dep/recv_linux.c

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index 19c0525ec3e0..1768b8123f03 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -50,7 +50,6 @@ r8723bs-y = \
 		os_dep/ioctl_cfg80211.o \
 		os_dep/osdep_service.o \
 		os_dep/os_intfs.o \
-		os_dep/recv_linux.o \
 		os_dep/sdio_intf.o \
 		os_dep/sdio_ops_linux.o \
 		os_dep/wifi_regd.o \
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
deleted file mode 100644
index 193725cc60bc..000000000000
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#include <drv_types.h>
-#include <linux/jiffies.h>
-#include <net/cfg80211.h>
-#include <linux/unaligned.h>
-
-
-- 
2.51.0

