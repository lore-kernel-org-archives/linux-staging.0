Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1417014C585
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209744; cv=none; b=rRA5rXcijwdCenimVzl1nhrkOxiVMUCF8nA1hHj9G3Tvs5fPEojcmeC6dmxD+JIOOAFsA2HkxJZGx0MaefdupyvcLkbOX7DTZsvJ5pG57uJ8KqWhlfngksIWvAxZwPIeVcDd+ur+2II2VcQD7lCY/CUONJ0YbELtvMyVMDEH7iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209744; c=relaxed/simple;
	bh=MSSrYs+Ev3I5I+MKzaEegdg+eZUUUuBSp+4MOEQm+7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ssFu2wjv8cz4OqlGDDJaT6odvsYYH537H7TIDbtlnYkGV7N7zunwsI9S6qXBmxiwMkEdqYRohSZqr5j0SU6+jkbuavpxeFhDUAx+eTDMqVpG/E8HJquElPZHM84sSp5nuycjOXImEEd3bOu+Zroto8J5zuOlUpJP973zhRcGrjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Ewl0wO6I; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ewl0wO6I"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-714261089c1so93034b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209741; x=1724814541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyVBtoPNvS38G5BU2iCTo12jZw/thaVDEc7UQjxqHpE=;
        b=Ewl0wO6ICZQGoUY+GVG+mAfuM50dAP9xY9ITQcjeNJY1aBJzNVsYXgL17veOkMmww1
         J7fdAP91/pbLAUPCqmKahGm3swFX7slc37jdaqETp8Ha35ipM+H5T0wJM6DopVNzIwAf
         +R0kwl+3XSO8JnUh7ww47JeGINh1FosJg1oesYCuhlYRGOqxCB+k4EgBfl3l8QZ7pySL
         KcrOU4vAsXZPKugaixiLE/K6iy5KLqhdcmOVkNZwc+AS4p9WsYWpaNofaNj6J39/O1Gg
         XUPo4wWYWSxzyeWsdOuGDw4a8L/1MFgppGH2d9BeyDGy6dHvqJbWwr5GKjPFCWduZ1WZ
         n2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209741; x=1724814541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyVBtoPNvS38G5BU2iCTo12jZw/thaVDEc7UQjxqHpE=;
        b=MaEI80IQViuj3GabqX5Fs77Ay4ju6XzMy7yCncKhRdhryZ8qCHhLqOr2FXHZeuONix
         n+yULiAC27J6gBDR0zJgIbastYyM8WXaMKryNbfCYX/UWlVGfGbbIXmQPNRwFvPTUdhg
         eu72pjkXoA68yLeY//KlHJdVssbq2TcVtkgtVdZaEmEELzKxnuWJ5rx6NOxGBJJ80uRS
         L+L1SlZvP5uhyDxgp7h6KRgd70WDjzK4VzTK+fw7wzCP1xmLmec6z++iPdB1tPYI7EmE
         af+SyAWGimznXF2xB0e1bvB38QsCL4quGkn9tX95HmzsCrP+n05yaNE3xM9cQVp6Q9xa
         polQ==
X-Gm-Message-State: AOJu0YxPdR8EQdVpT8MNLwf9NGgb1ZXfJs6bzRhSZ1V0uXXVMrMMvSfI
	NhSpL1GJt5XQRnct3yqDpd8wUhylxP2vp+OpBmpWOj0YTim6axrPw8qV2YOXfY4=
X-Google-Smtp-Source: AGHT+IFXo6FslBQ2+uvZNqOcRyAaIm9YgVPXCABNnsQ0OPz6uv9XsD/eDGnKAf7ddbq/A+ggvYHmsw==
X-Received: by 2002:a05:6a00:2ea8:b0:70e:aa7f:2cb3 with SMTP id d2e1a72fcca58-71423e6822dmr2273465b3a.2.1724209741272;
        Tue, 20 Aug 2024 20:09:01 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:00 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/6] Staging: rtl8192e: Rename variable CmdID_End
Date: Tue, 20 Aug 2024 20:08:51 -0700
Message-Id: <20240821030856.57423-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240821030856.57423-1-tdavies@darkphysics.net>
References: <20240821030856.57423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CmdID_End to cmd_id_end
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 18b948d4d86d..e844f1b4913b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -556,14 +556,14 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 						  0, 0, 0);
 		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PreCommonCmd,
 						  PreCommonCmdCnt++,
-						  MAX_PRECMD_CNT, CmdID_End,
+						  MAX_PRECMD_CNT, cmd_id_end,
 						  0, 0, 0);
 
 		PostCommonCmdCnt = 0;
 
 		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PostCommonCmd,
 						  PostCommonCmdCnt++,
-						  MAX_POSTCMD_CNT, CmdID_End,
+						  MAX_POSTCMD_CNT, cmd_id_end,
 						  0, 0, 0);
 
 		RfDependCmdCnt = 0;
@@ -585,7 +585,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 						  ieee->RfDependCmd,
 						  RfDependCmdCnt++,
 						  MAX_RFDEPENDCMD_CNT,
-						  CmdID_End, 0, 0, 0);
+						  cmd_id_end, 0, 0, 0);
 
 		do {
 			switch (*stage) {
@@ -600,7 +600,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				break;
 			}
 
-			if (CurrentCmd && CurrentCmd->CmdID == CmdID_End) {
+			if (CurrentCmd && CurrentCmd->CmdID == cmd_id_end) {
 				if ((*stage) == 2)
 					return true;
 				(*stage)++;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cf4d48c4d4ed..11408fadd1e7 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -153,7 +153,7 @@ struct cb_desc {
 };
 
 enum sw_chnl_cmd_id {
-	CmdID_End,
+	cmd_id_end,
 	CmdID_SetTxPowerLevel,
 	CmdID_BBRegWrite10,
 	CmdID_WritePortUlong,
-- 
2.30.2

