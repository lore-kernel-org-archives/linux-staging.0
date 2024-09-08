Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9717ADF6
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823603; cv=none; b=l8fo1heKBw1oOcPwCqiSLAmNrlrQ4wnXZv3xoiEikD+L9KKarx6JEhN5XtC5+6uawXbiPuCWN/c+2SjuhUd9Mr5hduw/+SnI+Rdv5v9CnbNL/SL2YRY6o2vXielbDr56Ht8yyyzjPqPLvDF+/XWaAJblm6gFg0oj/OxAhhRhgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823603; c=relaxed/simple;
	bh=Uv453XChzqhmZWRMQkqOnlFkUs+lQ3us5Ni+/tRzF+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YqCRiRY0qHU5WDepHUuxabt3n2mFu+8QovWYBDJsLbu/mwOFYmmjrHspqbBlK8yIAHU8TFRC99tR+ZmU/P/bXXR+IXPbB2482c8Li154V5kYM20w9sm455PW2b+0xWw4m/ZcK+ALBbCpItX5BFNpb7W5xV+d1p+Ur2NrHyAdZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ai76t63e; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ai76t63e"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2068acc8a4fso33533665ad.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823601; x=1726428401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7XnG9e/QAF4rnhFuQuRFT1GYuJxlU3KXfTtbx67LXk=;
        b=ai76t63enG2kxnD84xo0WCV5n4PE7qbtfqA3KMKQbtV5SwWQMVXzEyENGXRmLjPdx6
         h/I3Lp/5ATpao+naVtQjHGKRpxBWR1TwG0TIMEPzitjgGuzA+7DUyL938JatLOG0bYLz
         e/jpPQLSwqSKTM7LyDKNyyoHn3M/1Rf8HzNxiqqlUIzYiX08K2qcR9NxcmpIP5aNnCa4
         3WlGqAlsHFE1QZso8pVQHehhZB36D/PbSUuRyk+51MfrGGC8q6FIRUk2qSrUPK7JOvuK
         3bC3DyKlYIaqsWF479gEAE8yScteuF23pq59VQm400cQWgwZXOIAOws+XV5LSrakPnvI
         /24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823601; x=1726428401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7XnG9e/QAF4rnhFuQuRFT1GYuJxlU3KXfTtbx67LXk=;
        b=SVw1i0xTJynQCTl6rpWD4KFpwq6ohsbNfEjI/AcU90cm8qlqiIhMSjkg6P5zqyYY96
         Fro1dtspkRNlZJUtWRAFIBQGJGvu1+JxoCtqonOzYflo+Mk5u0AMCp3NABSiVcm6k4Zw
         QDxULnXH35LubbhqMStbFfAB4rPMxvjms8dLwVi4Ff8oF4pu3t/FIh7hQndCwdTQ6+e5
         KxBYnwG9O6sVeO9iBGiRxhVRyMNueLZyabAIMLiyIf60l/o/Mz6ZI5PKvProo2CJf5NZ
         DpwLYSJOGFObZSaedBNMLIESoAnKnJRL9nXJCC1RRoBESXgTOiV4TnGWP/N9PTSFAFM2
         Qrbw==
X-Gm-Message-State: AOJu0YzndfPNYjjpqqTnJ/NVpe0VaaVoboPKOU+V9TALNp24SGRx1Xss
	zrwp+H85JaTqGSdwj2KWHNFQ4F9/iPPn62MhDu5HvUUC/W5kiQtNZsxDU7+egRw=
X-Google-Smtp-Source: AGHT+IHTjVvZ1RJRgf1Ym9zLzVykf3yLayQCY1X3N7JsfRGY0hhZBr6pA2fD8901J3hslv0NU1M5Ug==
X-Received: by 2002:a17:902:ecd2:b0:206:d6ac:8552 with SMTP id d9443c01a7336-20707019e1emr49683815ad.52.1725823601421;
        Sun, 08 Sep 2024 12:26:41 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:40 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/16] Staging: rtl8192e: Rename variable Para1
Date: Sun,  8 Sep 2024 12:26:23 -0700
Message-Id: <20240908192633.94144-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Para1 to para1
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ++++++------
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 059b1f478a6c..797ae6896d62 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -510,7 +510,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 					    struct sw_chnl_cmd *CmdTable,
 					    u32 CmdTableIdx, u32 CmdTableSz,
 					    enum sw_chnl_cmd_id cmd_id,
-					    u32 Para1, u32 Para2, u32 ms_delay)
+					    u32 para1, u32 Para2, u32 ms_delay)
 {
 	struct sw_chnl_cmd *pCmd;
 
@@ -525,7 +525,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 
 	pCmd = CmdTable + CmdTableIdx;
 	pCmd->cmd_id = cmd_id;
-	pCmd->Para1 = Para1;
+	pCmd->para1 = para1;
 	pCmd->Para2 = Para2;
 	pCmd->ms_delay = ms_delay;
 
@@ -618,15 +618,15 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 								   channel);
 				break;
 			case cmd_id_write_port_ulong:
-				rtl92e_writel(dev, CurrentCmd->Para1,
+				rtl92e_writel(dev, CurrentCmd->para1,
 					      CurrentCmd->Para2);
 				break;
 			case cmd_id_write_port_ushort:
-				rtl92e_writew(dev, CurrentCmd->Para1,
+				rtl92e_writew(dev, CurrentCmd->para1,
 					      CurrentCmd->Para2);
 				break;
 			case cmd_id_write_port_uchar:
-				rtl92e_writeb(dev, CurrentCmd->Para1,
+				rtl92e_writeb(dev, CurrentCmd->para1,
 					      CurrentCmd->Para2);
 				break;
 			case cmd_id_rf_write_reg:
@@ -634,7 +634,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				     priv->num_total_rf_path; eRFPath++)
 					rtl92e_set_rf_reg(dev,
 						 (enum rf90_radio_path)eRFPath,
-						 CurrentCmd->Para1, bMask12Bits,
+						 CurrentCmd->para1, bMask12Bits,
 						 CurrentCmd->Para2 << 7);
 				break;
 			default:
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index f444e85a6264..1e119192ad38 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -164,7 +164,7 @@ enum sw_chnl_cmd_id {
 
 struct sw_chnl_cmd {
 	enum sw_chnl_cmd_id cmd_id;
-	u32			Para1;
+	u32			para1;
 	u32			Para2;
 	u32			ms_delay;
 };
-- 
2.30.2

