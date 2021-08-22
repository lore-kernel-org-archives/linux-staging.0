Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C12F80
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 14:35:37 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id i28so32114610lfl.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ssEJXS5mWPr1Oq2NWHBdclycHEgmiyzEVQ1hB54zJfc=;
        b=pjAn+uBvIPFIFfp0yCINIP8zg+2OhZDpzQMbzAwWNzOelpi0j8ERk1d20oSj2FCZ7p
         pYtH98cS7JE3IJ+xIetFZPSEAvTazBSGucfLf4UrT5SDEUWV63/czSFidMlnttKVlKg2
         /hf/u8vxHuvoU1/mFKbwYsI25NX2AIA4YmmnOxW0KN+BUYRqjEfUhAwThIbqfAQOwps/
         9cE4Y3d8eu63jnSQG3muAv//A1KvqmlImnSjv5jUG3YPtIJ7XwmogVhS0AcTm+ZJ6/9a
         4baOQB3aKTWoKQqNqFvFnkvQIBJGDCqwvlOpLLQ3WJP0lAnwE9bQaPV6wANq4YUhoEP7
         nO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ssEJXS5mWPr1Oq2NWHBdclycHEgmiyzEVQ1hB54zJfc=;
        b=tO1TzA/Q1Gvgu80Ol20CVes9brlnr3uBjMDQPAWmT8ARiy/79rLGaJExGuKHK4HF2x
         skoHmZtdWh2OhzRr3oZ9eWtMm8jgLKyZZu3VWJq6+eJU+zPJCioiK4Ae5pA9aC2hU42j
         cYOTMp61Ipy+v/xn/3ut4l7s2askJ0OUMO/ps5ZzFrBb+FlLUmEK6tnbzb2589DOsIlW
         ObfZ9yHgD5ddf1Ovm63KIpsv7EdKRfqXB0+BzeubPHtoSqps1PCNdR0EwCHtkZbRUa12
         yabbrod3bWdK9ByOqQn3xKnvQXM5lAZT9kvBUna+mRNGre4JlDVQai4Jb8igKGmVFcvm
         QueQ==
X-Gm-Message-State: AOAM530RMb+cnqemU9wAUaJxd/z3uI2pUYv4u2psmLUt04GmouDv8fXd
	mKr4rNM2p6he7N/+LBLGuQw=
X-Google-Smtp-Source: ABdhPJytcLAVyW85XS85pjOeTzUTLzU8DGHCcOLZLHwBA9FDE+CGIMmalAKyDzN4pJ2I83BJdeAI8g==
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr21737643lfv.613.1629642935914;
        Sun, 22 Aug 2021 07:35:35 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id d4sm1204424lfg.178.2021.08.22.07.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 07:35:35 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH RFC v2 1/6] staging: r8188eu: remove {read,write}_macreg
Date: Sun, 22 Aug 2021 17:35:33 +0300
Message-Id: <d591e29d77da73790c71f7a8e508a8b16fd48f65.1629642658.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629642658.git.paskripkin@gmail.com>
References: <cover.1629642658.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 2 functions are unused, so they can be simply removed

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp.c    | 39 ------------------------
 drivers/staging/r8188eu/include/rtw_mp.h |  2 --
 2 files changed, 41 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index 93bb683b628f..0a0a24fd37b0 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -7,45 +7,6 @@
 #include "../include/odm_precomp.h"
 #include "../include/rtl8188e_hal.h"
 
-u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz)
-{
-	u32 val = 0;
-
-	switch (sz) {
-	case 1:
-		val = rtw_read8(padapter, addr);
-		break;
-	case 2:
-		val = rtw_read16(padapter, addr);
-		break;
-	case 4:
-		val = rtw_read32(padapter, addr);
-		break;
-	default:
-		val = 0xffffffff;
-		break;
-	}
-
-	return val;
-}
-
-void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz)
-{
-	switch (sz) {
-	case 1:
-		rtw_write8(padapter, addr, (u8)val);
-		break;
-	case 2:
-		rtw_write16(padapter, addr, (u16)val);
-		break;
-	case 4:
-		rtw_write32(padapter, addr, val);
-		break;
-	default:
-		break;
-	}
-}
-
 u32 read_bbreg(struct adapter *padapter, u32 addr, u32 bitmask)
 {
 	return rtw_hal_read_bbreg(padapter, addr, bitmask);
diff --git a/drivers/staging/r8188eu/include/rtw_mp.h b/drivers/staging/r8188eu/include/rtw_mp.h
index b64b16554343..3a259d991348 100644
--- a/drivers/staging/r8188eu/include/rtw_mp.h
+++ b/drivers/staging/r8188eu/include/rtw_mp.h
@@ -410,8 +410,6 @@ void mp_stop_test(struct adapter *padapter);
 u32 _read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask);
 void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u32 val);
 
-u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
-void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
 u32 read_bbreg(struct adapter *padapter, u32 addr, u32 bitmask);
 void write_bbreg(struct adapter *padapter, u32 addr, u32 bitmask, u32 val);
 u32 read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr);
-- 
2.32.0

