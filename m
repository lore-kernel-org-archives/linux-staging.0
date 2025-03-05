Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2534A253B7E
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 19:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203476; cv=none; b=bh8NHHa7PWpWcKEK7Rghhjy/VqJzp8QmZjQdfn6UE/dKyEVuDyc2UPgoSgpzSAsKzG+d2B84R77pSneO2BNhstxdtgKAydm3I6HpzD4+m33DMIqlO4uJ5mfuCaIHvAXr+Bd+KujqA2d4dNNmUfJkdXIfLnoesaesqxoE1ADk3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203476; c=relaxed/simple;
	bh=r/JCkE1A/VLSmSiv7YzZkQknfhDehP9WWEoKTpqyRXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewYZZq+eRtCi1zzq5Ldc6Nt9NIMtT9ALLo+2/7rPbqcVkZoUSszZn1QXnEBGy51RSdYUUTLKVlVFDK6Oib63wMNFyyxMfjTg955C+buoMky+xX9Vaa+O60Mk9a6qsBsavkyfsxco5etRAqnlfCmnrx48eMVdcK7I0tE04w/d7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2Rc7IhU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2Rc7IhU"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so97645a91.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 11:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741203474; x=1741808274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVL5x+1w+5pdmFPSNp6O0gS3bmjeUt72DJ16wn3q7tw=;
        b=j2Rc7IhUyHYt/TQPMoAbj6ShaDi1uMTPUsactzhn1MxheS3TeJZZtnLKKrMXDlVTdg
         zpdyPZN+sv40pPtrzMnsJ6K0Ywhid8DG4Pu7l9C+Bz8rnAk8IqGCISgcV2DmMhScR2w7
         2vyhggnzUElvRI7azY5q87Eb7zP/F/27S1d46Z60TukJkjs9MtFjo6VXAKQNbDvpIORg
         ejts/floxLNnCnbFnLt9tgu9qs8KgkTDWnY9A0newaFUQqgSzu41aRFR8g2dMp9aq8I4
         6x7Xc8TU9Zp2uhr4pEJGTQ3qQhZNE+GBzvZ3iFcflV+q44+T+F8Q7dflvIj5f9e9w13p
         eJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203474; x=1741808274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVL5x+1w+5pdmFPSNp6O0gS3bmjeUt72DJ16wn3q7tw=;
        b=PKYZq3ZOnNYqtDdYE0diiZbS3EtpqGvGWpCjGf3VxTZD0QHI3x5EEndovNyPX3ZpPw
         j4SVDw5qXQqBOTOw9RstruvuEm8Jelu8uo9AgDtbiaNN6ksqObz8i79LgyMEqWGVPeCh
         NwODmpQ744CnfksWeXs8o7Ueu5w960EcwIW436ri6qJarZUTPF+DpzRysuBZI7pm89lJ
         3aYww2HA/6Nk9zqKxgzKL4ccyGdQwYHUBPiue4Or07+uhfDEHR1qKbOjyUtPMd7rTQdw
         qYcGHkHEYYcft+bMzAQ/c01KHDwYKNn/R7ovPXTTq+oMpLqNup57whIi4gmndgN6+KeZ
         CI8g==
X-Gm-Message-State: AOJu0YxAFqEqJfEI7tdFEOwiFe6pI0iWhkr2OZw/y7FNxx0oSxZCABBT
	UZdgqt9eSZQJQtdO/KI7I0EOxzWjJFr3FB7U7BoeYLanmqFmulA65jD6KQ==
X-Gm-Gg: ASbGncvwtY23UKm4eUJaCUvqHH3jhmxk3QDYfRn6AdpErtQrOkWnzS0iLhOrSR+Ewcp
	P20+m6xynBSjOVJbrfFWXJOs/SUsBGyxbM7EYuzZ6pnjQzZm/nJ53mZDHDegmWMhym8WIcgW4R1
	65/syVeO/wqX36IZexqF56kllUqJZsoA1tOHFwGMCzPZzUnFpzSRFIBF06GYp7w1pcSzKtNpPLD
	RSoH/gzDv/+5R7aGNdhxo3Vj25UnADiCtI7TpXd6UaTBy3N603xWb4MMZqd5kvDM9TJI88viEvX
	IA8YTL0ZIxARD3bBScQ1amiSfRP5LMbXrbiFVX0qCAD0Tf3Ke86o5SAELAp4
X-Google-Smtp-Source: AGHT+IHNsyo24/zrvRg4XtHFBGu5hJ7yR3l2dvNxqCeNbui3/L/DlOgNcf1xKJT/5yBT8maOJNvE1Q==
X-Received: by 2002:a17:90b:1a8f:b0:2fa:6055:17e7 with SMTP id 98e67ed59e1d1-2ff497df3d2mr2866356a91.8.1741203473716;
        Wed, 05 Mar 2025 11:37:53 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7a2bbesm1898148a91.37.2025.03.05.11.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:37:53 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH v2 3/4] staging: gpib: fix kernel-doc section for usb_gpib_line_status() function
Date: Wed,  5 Mar 2025 16:32:20 -0300
Message-ID: <20250305193614.39604-7-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250305193614.39604-1-gascoar@gmail.com>
References: <20250305193614.39604-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function name field in the kernel-doc section for the
usb_gpib_line_status() is defined as 'line_status'. In addition, after
the kernel-doc section, there are three macro definition instead of the
function definition.

These issues trigger the warning:

warning: expecting prototype for line_status(). Prototype was for WQT()
instead.

Fix the warning by renaming the function in the kernel-doc section and
by moving the macros to the beginning of the file with the rest of
macros definition.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v1 -> v2: remove extra blank line added by mistake in v1.

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 090857824d07..4a8e5905daf9 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -78,6 +78,10 @@ module_param(debug, int, 0644);
 			dev_dbg(board->gpib_dev, format, ## __VA_ARGS__); } \
 	while (0)
 
+#define WQT wait_queue_entry_t
+#define WQH head
+#define WQE entry
+
 /* standard and extended command sets of the usb-gpib adapter */
 
 #define USB_GPIB_ON	 "\nIB\n"
@@ -644,17 +648,12 @@ static void usb_gpib_interface_clear(gpib_board_t *board, int assert)
 }
 
 /**
- * line_status() - Read the status of the bus lines.
+ * usb_gpib_line_status() - Read the status of the bus lines.
  *
  *  @board:    the gpib_board data area for this gpib interface
  *
  *    We can read all lines.
  */
-
-#define WQT wait_queue_entry_t
-#define WQH head
-#define WQE entry
-
 static int usb_gpib_line_status(const gpib_board_t *board)
 {
 	int buffer;
-- 
2.49.0.rc0

