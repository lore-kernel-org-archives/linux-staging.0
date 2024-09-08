Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E117B516
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823604; cv=none; b=OXsQVAaSliSHNk1qHuM64PAeO6QsdKNctWg30mddgmN12lCWUICJ57M+gB8ob7cxBY4L9pol7fHvMW71f9JuvTIAQdjCpmaRrkCelixmN3drpVPE+GUph/Co00R8jxntjzq3BiOMhEZqwheyz4QnhhP2QW20Lu8WlQT9GcYvr7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823604; c=relaxed/simple;
	bh=MH6aGyjyCR3+hd4QwFcOX19n1eDoWHGgClfqbba9mJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VOxLFGgwDdo/4yRua9ffgBqmHRXdVUCPHZmuGGyANLGDmZCzt7gCfw/Bj5lO71PNoHiPPYmnqucA5Xsv4osdeiS3xfzgjKvWst/EFPtEHFafzDPfbeIOziWYa2xm9iUKTXuUyDnTLCQYAddwstk4O76pozmBzkbc2gyX9huad2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Y4AuPv0P; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Y4AuPv0P"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20536dcc6e9so23554455ad.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823602; x=1726428402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftqolyz8gWWGPvTvx6N+frI8E1w5G5SfE2BkdB0MfNU=;
        b=Y4AuPv0PTjnEkhH8QEYm7Cx1G7UW6j3t6TFG9PVgLWVPfXpSdpiMRbKlev2+iiPOEp
         FX8u9DmImZ1QvRcTm+P7HjoqebjXEOaelMBe8ZvzcBfwy9ogacS6QAi/RCm/vu/cAA6N
         NxadiMTtAPlnC97dzvZ+jThqugYxLic3fnMMTYz6LuTM6zvwFsl4dZ5NO9wpWu6QRigJ
         UtLUJ5pPAoAFz0jVqHTcHEsXBAEnKyEVcWfwajqHQnetEqVVUCP2WnYoAPJhcXoxkhdl
         Fv0Syu/n6L0QqfT7dtq+H7vPHzfm7EyEdK3kWCBfHcwzG5qex1PjPoVYlDaRar2EWa7x
         Mwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823602; x=1726428402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ftqolyz8gWWGPvTvx6N+frI8E1w5G5SfE2BkdB0MfNU=;
        b=Ewq+pJGMxaVTUJY0jyJYfnQns4y0vLe+EqLRYQgt/SB4o2VnMEN5lmuPCrdWClv7yT
         4/xYmxJypQyzeDGYc3kRV7ArQrL+ExwnZWk/6aButl40VBPFz/e0Vz7tgGsn7NFH2uzv
         jPI8CvSyIKT39e283b833S/dwI+93K71eSmHhLRuMSdOZjMaHiGdxDSSSziFfgMMXNl0
         AYzXB0NbLhxTWr9XPHWaLcOswycJGFvO5qzkXMS4UF0on+5TuzlghAKyGnod4CoPUqXd
         +RGJHT/yCFbfdXwqRAcvfSU13nay0FHz4Qd8qpsDs7S0Pp+vC2gSKv01eZDSGscThrjy
         CX2g==
X-Gm-Message-State: AOJu0YwAYGBIIdirawu66PWzF7jl8qje+FUI9p902rr8vnKySrx772DQ
	DXR4uawXoMxc+KXbAQCAestKrbI/hHcUEUCBLXwaQgeARiplG8fePOEEjeMk+Kb1M/T1olnTDJ9
	FhRc=
X-Google-Smtp-Source: AGHT+IGeZ7nGmva47T5cynSPkefa4WBJUMwXsmqFnSfY/ZmN9V9xEJjArTMrOHW5UbRafO+3C6POGA==
X-Received: by 2002:a17:902:e811:b0:206:9536:9778 with SMTP id d9443c01a7336-20706f2e3e7mr57113045ad.19.1725823602240;
        Sun, 08 Sep 2024 12:26:42 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:41 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/16] Staging: rtl8192e: Rename variable Para2
Date: Sun,  8 Sep 2024 12:26:24 -0700
Message-Id: <20240908192633.94144-8-tdavies@darkphysics.net>
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

Rename variable Para2 to para2
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ++++++------
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 797ae6896d62..fbe624e235df 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -510,7 +510,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 					    struct sw_chnl_cmd *CmdTable,
 					    u32 CmdTableIdx, u32 CmdTableSz,
 					    enum sw_chnl_cmd_id cmd_id,
-					    u32 para1, u32 Para2, u32 ms_delay)
+					    u32 para1, u32 para2, u32 ms_delay)
 {
 	struct sw_chnl_cmd *pCmd;
 
@@ -526,7 +526,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 	pCmd = CmdTable + CmdTableIdx;
 	pCmd->cmd_id = cmd_id;
 	pCmd->para1 = para1;
-	pCmd->Para2 = Para2;
+	pCmd->para2 = para2;
 	pCmd->ms_delay = ms_delay;
 
 	return true;
@@ -619,15 +619,15 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				break;
 			case cmd_id_write_port_ulong:
 				rtl92e_writel(dev, CurrentCmd->para1,
-					      CurrentCmd->Para2);
+					      CurrentCmd->para2);
 				break;
 			case cmd_id_write_port_ushort:
 				rtl92e_writew(dev, CurrentCmd->para1,
-					      CurrentCmd->Para2);
+					      CurrentCmd->para2);
 				break;
 			case cmd_id_write_port_uchar:
 				rtl92e_writeb(dev, CurrentCmd->para1,
-					      CurrentCmd->Para2);
+					      CurrentCmd->para2);
 				break;
 			case cmd_id_rf_write_reg:
 				for (eRFPath = 0; eRFPath <
@@ -635,7 +635,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 					rtl92e_set_rf_reg(dev,
 						 (enum rf90_radio_path)eRFPath,
 						 CurrentCmd->para1, bMask12Bits,
-						 CurrentCmd->Para2 << 7);
+						 CurrentCmd->para2 << 7);
 				break;
 			default:
 				break;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1e119192ad38..d63044607fb5 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -165,7 +165,7 @@ enum sw_chnl_cmd_id {
 struct sw_chnl_cmd {
 	enum sw_chnl_cmd_id cmd_id;
 	u32			para1;
-	u32			Para2;
+	u32			para2;
 	u32			ms_delay;
 };
 
-- 
2.30.2

