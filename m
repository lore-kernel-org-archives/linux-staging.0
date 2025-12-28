Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8965C27AC21
	for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766951113; cv=none; b=QEXXlz0tmLkOxuTJynZMMnOKnklb8+UoQTCMw7AjcCKH5RTEPdf1ga7xsA/Qf3a8kdC3zjjVXlyHdajUszc5dH8fni2XALUHG2klFqL1EsUTKACwZDuxcxthpujk3+tAZGdkXhaqWNP0mt76SCr/2/yz6gKIMZo8EU3H3FXXN0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766951113; c=relaxed/simple;
	bh=Y8lVm+b+iuMHquOULkclzj04JR9FU0edxjSfMd3U9TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBu9oICYU++z49tRuknHuoMJ3A453KDWbmXmb+Z3eZThMlwgQFg7sTzEWley0IxNF6sGS8xjril9pDVgj/PLDU+/NwF2zqt3T0qF4WKhJAucPTrx+GzqFJYHYR0OOniz1pAokF7NV6FCrGCsvxyrGJwHv04Ze4s4jOEBaREb+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giEvKruD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giEvKruD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso69339475e9.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 11:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766951109; x=1767555909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXbVRc3InDM50Uy6vO0yorlQ6aJybn/ig45e5N70JTw=;
        b=giEvKruDBjDic14KQg4WdCsAVek3mSkPcWzlMhOqZu6V1Fmc40BrgFTtNIPTQb/4vS
         MlW3CrYxrV6OEw9j8ib5OYkIOsZdH/BZ7Mpklo1IFeV6ysnKE0X4+PIgjUfalpOmv1GK
         EE/qiPAwOzX11p0ITagqVQZZ//KsawRcO3/A1TuPp5v1qJPP8jveFXPWT0hvWJxn78/X
         Iqvnip6mDKjMaQEH6s+h8oq4SIS0vCbpG9AfFxVme9+aNoESopZe7RVtmk/UicKV1JV0
         ih72asjohPJ/3XNjHYxgKyupG+M0cxnDXEdIcAWn6JeZIsWuZQ2jyfckppAfvYxOIWC8
         TgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766951109; x=1767555909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXbVRc3InDM50Uy6vO0yorlQ6aJybn/ig45e5N70JTw=;
        b=rKtv5ypqfdg3wjfI2ry/6kYbc6hD+n+zmyiQGnN5uD+F8in18gwCekLwBzdZ5zWtD6
         deCv5euV1diRZNyHQXFWnwHc1ltyeEwpcN7vt3RSQoFGcMi5I46vmev3zJWPgUc9xs+2
         8iu5ZFPXDKHP0OFXpEo+AbDzU0xBbesnF15oxwq9aYJcJJbJVvAdLCC9DxtJMfKFGM10
         TaO9gQvUqC4oaEKuyfDlUWi1W/Yz+TV0Pnf5OuLw+yv6mY6dzDxLnRaTOVqDviNpIsY+
         auEENA5svYtoYIyTnFlgaatx6PhEwGW59Dija9qy0/yGAnX5vN27VYQZ12AkVjFia1ng
         zNnQ==
X-Gm-Message-State: AOJu0YyS8ZWBYBric+nk1OPr2FpJb9bFQ1i3KHeVgyiwAC1ntZCZMVyY
	U2GHiM6RrrS2bAKaBznm87S+yr80Aj2wx0X2Qm7A8b+J0rdxInJNUDpCG2L+bQ==
X-Gm-Gg: AY/fxX7jl3FSlIbeitmmTLbKXIUf1H8OjOrMpwsak/ue/uADkJ/itDlrlf9go7uelME
	grZkncCNZaT6ECAsUAUEmGH2gFpZifKlJoLiCAoCKn65DuAa3CDhw8qAQg2/K1tkY3/poO5KCNh
	/yRL4L9kbswmo06nhelZpeDSFOrZMxHRiv5VqwRiUbEi2vtFejb5iNG68zy57IZ+zODethyVdj7
	eS46hKR2oHkETDR9DwDIOq37T/DU2MIqA3qzfXpoEfnzycxvQgVgP2Y8hYgpcmJ1H02cgPltn+a
	PqxNBB6+j3DIfSQ4G8iZY8RCRxx3rV/45biZJmlgDAV9eu1jjKfsk67q9cauel/322Q8nowjCZg
	nOU5wygtUuOK4A9dRAjQTyFrFLhW4aeYe8cpy3y507FLbrSb81MdFjXZ9RCW84PadwuRHCmdGWr
	xtNGCstk9RcGms7+xlbrrtMvrYWag/dntR26M+3dSTKMDEgqsa8MWX7eWtbFW8HrIwRg==
X-Google-Smtp-Source: AGHT+IH5nF7t0GEAUmVvQZDUeRDiIfgoWSrnOzRP7YW0KMu+bL0ebF11GuXPbXn/BHAKQEB0UWD/Ng==
X-Received: by 2002:a05:600d:486:10b0:47d:333d:868a with SMTP id 5b1f17b1804b1-47d333d86c2mr180029705e9.33.1766951108451;
        Sun, 28 Dec 2025 11:45:08 -0800 (PST)
Received: from LAPTOP-2QR70VTP.localdomain ([77.137.75.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbe58sm503733665e9.9.2025.12.28.11.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 11:45:08 -0800 (PST)
From: Ofir Mirovsky <ofirmirovsky@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ofir Mirovsky <ofirmirovsky@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix block comment coding style
Date: Sun, 28 Dec 2025 21:44:59 +0200
Message-ID: <20251228194500.971-1-ofirmirovsky@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment coding style issues in rtl8723b_rf6052.c reported by checkpatch.pl:
- "Block comments should align the * on each line"
- "Block comments use a trailing */ on a separate line"

Reformat the comment block to adhere to standard kernel coding style.

Signed-off-by: Ofir Mirovsky <ofirmirovsky@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ac..f10120d34 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -24,7 +24,7 @@
  * 11/05/2008	MHC		Add API for tw power setting.
  *
  *
-******************************************************************************/
+ ******************************************************************************/
 
 #include <rtl8723b_hal.h>
 
@@ -40,7 +40,7 @@
 /*  2008/11/20 MH For Debug only, RF */
 /*------------------------Define local variable------------------------------*/
 
-/*-----------------------------------------------------------------------------
+/*
  * Function:    PHY_RF6052SetBandwidth()
  *
  * Overview:    This function is called by SetBWModeCallback8190Pci() only
@@ -53,7 +53,7 @@
  * Return:      NONE
  *
  * Note:		For RF type 0222D
- *---------------------------------------------------------------------------*/
+ */
 void PHY_RF6052SetBandwidth8723B(
 	struct adapter *Adapter, enum channel_width Bandwidth
 ) /* 20M or 40M */
-- 
2.43.0

