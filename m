Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E7E2D94A7
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774771186; cv=none; b=dbj9W7SaExrFkZHN9t/504kJMjqSYuFRXx2De2bPTss8Wmb78BigRRIjsII6Lmo1djFWxVYQyXGfdqEnZ0xCpGfKSYrdR2NSFQCAuoQSm7GZiyr7lC/wXUfd6D9zEhmJYKtPJbrv03YWr85rydy4a71T1iGPx2gtK15fmk181H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774771186; c=relaxed/simple;
	bh=KPvLnOwuYYvGO8tRSwm7wNn+FcgVQIq4VqNWrdtL0Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Km+iqA16lm/kuyLgH3i90zGeHUn6J1cQptHH4Bx7AFDZaXsbu6IvpN6wTb6N+hSVt97DmRWMvB8ILHCkTgOw+LvnOIgKiWNWLpVdbp6bsfX3xPZYEAFU1rXFJk6JDkuBuVXtlELdGmmOaUd1Cq3m4urH1fMj4ybWrVnjtMxeAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg0Gr6Bj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg0Gr6Bj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506a7bbe9d0so30433591cf.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774771184; x=1775375984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q8gMu/KQkGa9ZVZIJsQqiHL472878gatqeYmK2jB/Q=;
        b=Xg0Gr6BjjU2ixHGxLVzDmu/6h/J8Y8X0vc3bj7fq5zT+Mku10DIq0btnejDHQf324h
         RudiOxoi54BfHKBh9wtEVCYbPNJFRxF6qH+BvsTUHxKrPUkTQhamTWSU+xs4Z68XeHOn
         zfAR37dIgl5X5JJrkb1L4aTkva2HwHCuzeTSF7idJe2zkNSI75ZBOfLVJ7i7/W1AzJwQ
         /lqVRu8NpLJvkKhsFDY20BUYuAaYoGZYohv/cFPVf0Uml6Dst6HrdNQ14bMnwNToTZCD
         Zej4AiAsRO3Uq4pGdOQ/gjBUoSRkBrEimfEL4hDTKSbsiIzWsiWanIhd8k0HB7AtzQLw
         IcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774771184; x=1775375984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q8gMu/KQkGa9ZVZIJsQqiHL472878gatqeYmK2jB/Q=;
        b=U76vD2Z7WzqvZx5ki5V6R9KY7imHt1dpzvjIcmOVZKmrpZuHVyOJQpNhIYcvLlQ/1/
         sKKOb5Dbp2B5P1IuUzuMv4j2xGbJ92arofXSz+WMRgrAfxhXPFu5QK9xTYp5IPnR7kLv
         ej9Wf9r/nFQV98apq+dy0Htw12rQYsSQavrNnTOK3jd/UVGApXeWWH4FU0hIapB4D72I
         VMS+6hBNRgNHcPEjDRI9Zj27cUQYVExDWldrEAYNkct52psycWw4w+QJfAhoKCkOnzvx
         ziIX8Y5uicgLye9i9j5IF0m6tG1k3aahMb9WDQTkc5dTbXiXvDz1hV7C2X6D3bbCUA5l
         DJCA==
X-Forwarded-Encrypted: i=1; AJvYcCX3NFZfFmW7TGM59B9uBtSIhcOcMelWjNmJ6V6DDqtDsezreeEurylY0oQa6EAl8nUTEWMm1w2ODkG6M6wW@lists.linux.dev
X-Gm-Message-State: AOJu0YxmIcQNdMLwxH7UkHXv1/6aYPmBWCZ7b71oPFXusVswhq53zgR1
	HTYsjvE1OHCVnRIW9Q1ZpVpbBDhbyAWHr/IMgGj9CcAWyRou0cPUr2kw
X-Gm-Gg: ATEYQzzhLg/BSeu9Z/TJmauYoWr9I/umOO3jsuZhXjQT5OII+D5ndMg8giKIiN6NZqI
	tgHLCKAXkEsf5i6vFRQtY87WqOhpOpkeux6pZFoG0ACycYZgEydJYLBTxHcRwAx4Brvno+Z27+G
	xW03pOSufTaTy3MjhUIe52xgMw6BCA5/hatAmIyGcxfddd5zpXLOll0HNgQ8NCT8nuP4rwjLWYa
	L0d/1t6GkOCB2whqH08QtG4ENY7KJ59poW+k3KW7RpSk99GlcaIevIijDCKAb8cwrwocdzUiTiX
	gtsV4VaCDb3WPyAlWUhzzMvC4ZcpPMuYCyyebyCq/OAQ/LAINouhWQvmQcHouMUGjBwP0fxDygo
	UOvfu1Qhkwc+uAFtXHX1r/TAeH7bvS8bnb0UFZ6Vu1qcq5L1CTweT35QOZu+b2bVYAkgYj+DgDq
	QfzFurTs0BuygsG72JUGWc4TByk7tGEB/x5SoP7wc=
X-Received: by 2002:a05:622a:1919:b0:50b:5258:28da with SMTP id d75a77b69052e-50ba37d16c0mr107251151cf.5.1774771183587;
        Sun, 29 Mar 2026 00:59:43 -0700 (PDT)
Received: from m2 ([2601:5c2:100:2f60:11f8:78ef:721f:37c8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2de76a6sm36046881cf.18.2026.03.29.00.59.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 00:59:43 -0700 (PDT)
From: Xiyuan Guo <tommyguo039@gmail.com>
X-Google-Original-From: Xiyuan Guo <tommyguo024@outlook.com>
To: gregkh@linuxfoundation.org
Cc: b9788213@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiyuan Guo <tommyguo024@outlook.com>
Subject: [PATCH v2] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
Date: Sun, 29 Mar 2026 03:59:41 -0400
Message-ID: <20260329075941.60247-1-tommyguo024@outlook.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the _Read_MACREG macro to READ_MACREG to resolve the
checkpatch.pl "Avoid CamelCase" warning.

Signed-off-by: Xiyuan Guo <tommyguo024@outlook.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..eb902c810ac8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
+	{GEN_CMD_CODE(READ_MACREG), NULL}, /*0*/
 	{GEN_CMD_CODE(_Write_MACREG), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..d204426799ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -630,7 +630,7 @@ struct _cmd_callback {
 };
 
 enum {
-	GEN_CMD_CODE(_Read_MACREG),	/*0*/
+	GEN_CMD_CODE(READ_MACREG),	/*0*/
 	GEN_CMD_CODE(_Write_MACREG),
 	GEN_CMD_CODE(_Read_BBREG),
 	GEN_CMD_CODE(_Write_BBREG),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 95769f90d196..d14cabd5e47c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -679,7 +679,7 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
 enum {
-	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
+	GEN_EVT_CODE(READ_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
 	GEN_EVT_CODE(_Read_EEPROM),
-- 
2.53.0

