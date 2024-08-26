Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065A522F
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631454; cv=none; b=reLp4R6L6elo3ryMoayJt54w2hsaQGWkSoxXz8MKd39Xkp6EkPpNNRCbdmaTepJl7UvcL5grvawrXBpScrXvZuB05wzS7m1TJI9w472ITbBHKDPTa4rHW7vAl5NGFOCHGAMlA2pQafn5X5zdLH66BlREJ6S/V0aBDCSolQYya28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631454; c=relaxed/simple;
	bh=prRiS44P0Iof096cPDWfqkcr1mi//kjz52Me642CfK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y5xwDNIG3x5CASZl3NWniIRt37Fe4QHluGiQthZo+8ulOh4/o3r8Z5ZUvZDs1/d5z8sca4YV/AfCJzLQiXeZnVEgQaRrmFF457kKdqEYzy6UJhMwcO/QSTgf2GcozGHiMpHB/GMxwrjfszz0fMJmE8FYIvNXRNccBYgOpCQbo+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gK/WUznh; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gK/WUznh"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so2304628a12.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631452; x=1725236252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rqngQI/4sGkKpLaL5rsoSzvVLXDgXzNrKFaFzkUU64=;
        b=gK/WUznhi2ASPODaV2iOizYiRXzWKtWB+mUW4FPC4hvm4wv++OlVTmrm2alsibNPwO
         u3ukrTCCByOOAMbczG++Nj5kvsxpK14lkQ1057ZgMB+riugfDtJUs+1uAejSzZtDgA+1
         DYYSeu3fRWqBkgb8Ob81LWSEclhd0dz68VyNoq1OMwL5uT3rf0Pn6fCdCBVl5G4UhDwU
         035gGUfLBrWKEwUAPl4ak5aIXgGgS31u+LdRzIBLkU1nioDzKTdu8KHHQWMHzhyXGmnd
         J31R9dwj4ixqU/NSQsCzVVrKVOF/paFQL3N4qLa0vPzUigMRmhLSJa7kj6kHPU3Kt2CR
         zTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631452; x=1725236252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rqngQI/4sGkKpLaL5rsoSzvVLXDgXzNrKFaFzkUU64=;
        b=JyyX3/i2CBnrX1kqNx4tA0+kKQt8rNYhpcz7PaS2MNbkXx1aGijbczLAd6POTNtVzr
         JKpYVys3EL3Qh69N+OTl2qG9cIIoTYH6OavlHNQeCTcatfK+LEFhNw/PDWSKOscTMqGM
         bKQg4dwLfICb44HV/zTarAUteG0WvFimieJYtYX56eHrzdXR8CETBlHElWmV5znb3Kye
         WHnKAQmR8B0a7lo5tNuzGhfE7oBAQKRuC9IygZOHaX+ns5bFOn7/5/zBG99gJDYy67xq
         4CiTF91mCoMqSciZjNKyeoi3kU7e2JM3mNkiS9zeGix8ZrcTRPEfbEEusNJjspv3v/yS
         uqGA==
X-Gm-Message-State: AOJu0YwwwSqvLhAXRDHy8+gT5T7IHuVcU4B0VtVCxJVt0AaapPAdoSXF
	zj3gFRD4fhDowZLqrKRo2gdayzUngY8DikBoztZDWQ8e89TJfYRxxvvnFJzIcoY=
X-Google-Smtp-Source: AGHT+IHxPd7zjdnIo6iOsBV4KQBEh1xqjCrs5S0hw2TD8B8kin9y+UD+rez4FNo0/O/VybFBs68HFA==
X-Received: by 2002:a05:6a21:6f83:b0:1ca:edfc:8550 with SMTP id adf61e73a8af0-1cc8b59174dmr8524171637.38.1724631451983;
        Sun, 25 Aug 2024 17:17:31 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:29 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/6] Staging: rtl8192e: Rename variable CmdID_RF_WriteReg
Date: Sun, 25 Aug 2024 17:17:21 -0700
Message-Id: <20240826001724.274811-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240826001724.274811-1-tdavies@darkphysics.net>
References: <20240826001724.274811-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CmdID_RF_WriteReg to cmd_id_rf_write_reg
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 6bed5363ec54..1088352a315d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -579,7 +579,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 						  ieee->RfDependCmd,
 						  RfDependCmdCnt++,
 						  MAX_RFDEPENDCMD_CNT,
-						  CmdID_RF_WriteReg,
+						  cmd_id_rf_write_reg,
 						  rZebra1_Channel,
 						  channel, 10);
 		_rtl92e_phy_set_sw_chnl_cmd_array(dev,
@@ -629,7 +629,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				rtl92e_writeb(dev, CurrentCmd->Para1,
 					      CurrentCmd->Para2);
 				break;
-			case CmdID_RF_WriteReg:
+			case cmd_id_rf_write_reg:
 				for (eRFPath = 0; eRFPath <
 				     priv->num_total_rf_path; eRFPath++)
 					rtl92e_set_rf_reg(dev,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 8ca36d1c7fb1..f588f01d66fa 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -159,7 +159,7 @@ enum sw_chnl_cmd_id {
 	cmd_id_write_port_ulong,
 	cmd_id_write_port_ushort,
 	cmd_id_write_port_uchar,
-	CmdID_RF_WriteReg,
+	cmd_id_rf_write_reg,
 };
 
 struct sw_chnl_cmd {
-- 
2.30.2

