Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516D76410
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551123; cv=none; b=S7eS2Ot+4acMRubpNIKZPBgR8D9yRYIe1aCKHzII61JWR4H+WzjmeW2IFjRiyPoiq4oJbHk24fK+vRZMnwVJqv2V7poB/jCXacHWVJiOwsW24vPmLRIE7LaWL+yJQO+9SypJFH0TQbBX3Us8+o/GoLTXf4GbYYE1sErlAbvYk1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551123; c=relaxed/simple;
	bh=/aRwPhx68qTL0lKrU3BPit/lV8pb86BsZrdljM1kho8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PLP7phz063wIg2/WSSGuCuG79eGaf8UR2p2MJOix8FMoL8ikB5jBnkcmkMruMNkER6oufJDYHwfReqpBH08zsHXoFsxJ2lUfXkkmHD4hgRfw83fcQOeXSysZoet7QhIsu/TObMoJiNyIVgkOuSqvaZ7fQ+/t8r5CXpErsXQBYxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=CdcHWtM8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="CdcHWtM8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4398854b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551119; x=1727155919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O63mVFRoUMn0Irdln2CPxuHNEZxiLeaDCDgudz+MiBA=;
        b=CdcHWtM8x65J48pNeEmFMq7TSm9kfe2fNUNNcqy3XVS5XLjsRJz32h/NFY8hQcYBNI
         q6JOB1J3b7H7T8IsuGNVZVkStXukUczpdxibL7m14GyESdfoJ/mDc7hwMKnxMSL1sYpf
         Pf9mhvdFFUv0CLG0vCTpHs7fS6bDt5IJW4gqDNcPk1KeIz0EhjFRirD5RNdctqCcLOto
         FbuzaTCb0I354L730VPBueKDstGSXVlcna8rPXarNvEga6bl90WmnBU2mDcRXyTuPpbB
         EVDhDTSDjtt5r/nAicFXzZF3y1F9C4YozhxA57YTQ1kASOaIvStI5MEi8nYQfm/347tp
         1PIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551119; x=1727155919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O63mVFRoUMn0Irdln2CPxuHNEZxiLeaDCDgudz+MiBA=;
        b=jutvMx1MQNNeao/X4Y0UBF+7isoYVw1a9q13aJGYcjyanma5YUCBJHs2xDO+2wa1i/
         3r4IP/DOj6IGHrEZlLjXSox/6qdAEdfVHvhWVk6d2pG6czt3UPDEUcOugbz+odZgT42C
         l5rsv5DUvGJ39cfQELkO7tRSk1Y1AMp6FsKlAs+3gyPjfBzgvXY2treWuABz28HvsF0P
         30BwKGZ+PH+eULvdSTNy0OARpCNgCA3Ygq8cVuAQ4vlWkEQaBWJlcwGG7PwHQO0BQBd3
         +quQ2+EqEkSulQa8xOg+zzuUM6hmYhQbLRKnOdfdqJqwKsc6NEAbjusUZ7YiY7UJUaWH
         ZYaA==
X-Gm-Message-State: AOJu0YxJUym6ZeQ5r2xTLjeUEygfbNsPFOND+bSghwj1VvBNdpvGhgwZ
	PgJO56KPs2iM8ioyX6+Nm8EqhZKqykiA7aTWv/oMg+YPyTAzCWFNHziOH8R5zIM=
X-Google-Smtp-Source: AGHT+IGrAEsEAnjGA+zMNlmnFwBOh6t2QXxQQIZ0eykys0/fb6bX/LEkDWQMrANrnLrZtghqtVh/nw==
X-Received: by 2002:a05:6a21:8901:b0:1cf:46e1:5b7c with SMTP id adf61e73a8af0-1cf5e05cad6mr35860187637.3.1726551119208;
        Mon, 16 Sep 2024 22:31:59 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:31:58 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/18] Staging: rtl8192e: Rename variable PreCommonCmd
Date: Mon, 16 Sep 2024 22:31:39 -0700
Message-Id: <20240917053152.575553-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable PreCommonCmd to precommon_cmd
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index fbe624e235df..ac9aea228276 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -550,12 +550,12 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 
 	{
 		PreCommonCmdCnt = 0;
-		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PreCommonCmd,
+		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->precommon_cmd,
 						  PreCommonCmdCnt++,
 						  MAX_PRECMD_CNT,
 						  cmd_id_set_tx_power_level,
 						  0, 0, 0);
-		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PreCommonCmd,
+		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->precommon_cmd,
 						  PreCommonCmdCnt++,
 						  MAX_PRECMD_CNT, cmd_id_end,
 						  0, 0, 0);
@@ -591,7 +591,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 		do {
 			switch (*stage) {
 			case 0:
-				CurrentCmd = &ieee->PreCommonCmd[*step];
+				CurrentCmd = &ieee->precommon_cmd[*step];
 				break;
 			case 1:
 				CurrentCmd = &ieee->RfDependCmd[*step];
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7c575535d074..ce36f0979294 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1400,7 +1400,7 @@ struct rtllib_device {
 		struct rtllib_rxb *stats_IndicateArray[REORDER_WIN_SIZE];
 		struct rtllib_rxb *prxb_indicate_array[REORDER_WIN_SIZE];
 		struct {
-			struct sw_chnl_cmd PreCommonCmd[MAX_PRECMD_CNT];
+			struct sw_chnl_cmd precommon_cmd[MAX_PRECMD_CNT];
 			struct sw_chnl_cmd PostCommonCmd[MAX_POSTCMD_CNT];
 			struct sw_chnl_cmd RfDependCmd[MAX_RFDEPENDCMD_CNT];
 		};
-- 
2.30.2

