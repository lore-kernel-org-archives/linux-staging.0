Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E93BBFC9
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882120; cv=none; b=XhGVehCSdIsvLl1sWXOzZymwjY61IdyIeCd+BP5Qrtj49jHSdP5AXHbpHkAYHG6GGISk6zedUXaOcRNmTOR1ehwI8ZWK3h4WiuP/qI2EQIeqj5b+G2pd5uVXWHwsy2K0cteNvmAx/bn3G807V+0rowDfbpJegXdyFKGs2/0X1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882120; c=relaxed/simple;
	bh=luoUG9srrZKbtMzxXNuzz20df8aeK/+qGfMnUT54RNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VEqrbrHVjtj3j1AzfJs9LRh1qO+8GByNb1aa77CmGzShwZIENXlFO0GH02NpWB6J0zsAUjNJgzNCovrqtnI8TBAh1HZEEFaW382vTjoG/Cyg/094LRFGR21QEQ+WxPvkRj6S/RGxY/dAigsRlRLbAiVc554M8mg0rYFzToH0DzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2BBcli5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2BBcli5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so1640563a12.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882119; x=1792486919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfB66mjBSOtjbCxOwDv0Iq3MBG8MOvNQMiopIMKi1a0=;
        b=U2BBcli5gS8k/5ZpEZHpkbuRhc7SBhL9Ib4cvjLfW0fJrJTE3pGq1y2yIXwYYNXFa/
         wlBawUSSVIlKnwA5cvrjk45vulLqjAQGSHWxvCMzFcHTfX0baM61wYAQUx33+MqbSUPz
         nanZgi3vJxegg/rQwHo4onsgT7P4dxwTgCAf9CvDL9Sh2AA/zoKBGKyBiMAD15jL3f5p
         eKaeVsUJABGvcXBKXrrasEuoWkQ7YH8Ok0W1k2WA5IBeVgJ4t8kOHFwOaeUzgt7EyeIe
         nE5/sfvX+M4gQC/yjBafMvq3Qrf/d2layQkMeBEURthc9npFbNGRX569f5fv3vK82H1I
         ww6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882119; x=1792486919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfB66mjBSOtjbCxOwDv0Iq3MBG8MOvNQMiopIMKi1a0=;
        b=pcn+X1d+BkV3f1PCcqTidQBwBo6/S/KJNCAPXrSQ+r4c/mU/4W3xqHHaPBs7BPW91V
         iOU3+NUJ8PrOWmNEENU7kzdR4JsayuRSn+S7TsyX4aXOKkZabo3cwWuY/Bf/zj1YvWoz
         JYfUnm2tyfWpCr+xBHxqbJhjOepI5/e3Tva9jnE9cw/bDx6DZZlzggZ10u4aeTyqxJYG
         ga/koZTT2h92362Feys3gVxkY+hgntuuTV0XfLOdhmVpG+l7DK+BtWG1YIwoKc4O1JtW
         C+arc0k5ky8hCF5JCht5JKGlrYVWj3P8rqQfgQ54kxwZ4rCZRDN1GZxrw6n6BKaP8eAu
         rbpQ==
X-Gm-Message-State: AFq9FYLtd1fIKd6hAvGoYDXGQxZHVQuFFP0ENadVDaKt7oa98h7roIr0
	sxSXy2Wv7dPWp2/1udN330VxERHbDO9O6EnsTJ/rJvuqQFzvkbnAmzM=
X-Gm-Gg: AYBFou3d1pMzVaL/HVTpulzaVE6qxk+ZBxViiAj39qLihWn5I24tcGtrUm0bK1Qf29l
	RszeK8gdt8zvvByhIpQ4gGEgGRBbbWn5Tl/Yq/rHS2wVnPuCumZWk9DpLwOzX1yLL49wdk70Enb
	wk1pU56M6jGM1fs2pKr0VZC0vuhd5NHRYZim+VQ/aLH6cE9Xa0O8ha2G45z7v6F+YkFRwPRiPR5
	Vff4sC4jc/qUge6l8LwB5+p0eyqBJBwRmm6GnqcnS/MaWq6AIE5tmAR9icQJY+JAbXne7bXzdbz
	Wdp2j2AkULby904A0pwVml/8OWYzEgtf5WZWP6wfjO/7/nDlHcZ+ycSHpVCywqBcFxMgsmnwuae
	l+TbCYEaQUaoXQnBDQ3GlmE1GCZTyfGcLjd/KfsTABbF+pkL1+ktec80ZQVhp6JAbncBTDT1HJM
	p9bSMG46LJatq18PfavX5whVIfjuVvKikzfAueJJCH+8EPLLP0/39Y8+4PwJj24s3y7tnTBPLbv
	rrHv2H8
X-Received: by 2002:a17:90b:1c08:b0:3a4:f75d:d1a3 with SMTP id 98e67ed59e1d1-3ab3ab29dcbmr10519513a91.32.1791882118844;
        Tue, 13 Oct 2026 02:01:58 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21097667a91.2.2026.10.13.02.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:01:58 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Guo <guojy.bj@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused defines in HalBtcOutSrc.h
Date: Tue, 13 Oct 2026 17:01:47 +0800
Message-Id: <20261013090147.374461-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HalBtcOutSrc.h still defines a number of constants that no code in the
driver ever references.  They either describe hardware variants the
RTL8723BS does not support - extra RF paths, dual-MAC/dual-PHY chips,
MIMO power save modes, coupler antennas - or were simply never wired up:

  BTC_RF_OFF, BTC_RF_ON, BTC_RF_B, BTC_RF_C, BTC_RF_D
  BTC_DMDP, BTC_DMSP, BTC_MP_UNKNOWN
  BTC_MIMO_PS_STATIC, BTC_MIMO_PS_DYNAMIC
  BTC_RATE_DISABLE, BTC_RATE_ENABLE
  BTC_ANT_WIFI_AT_CPL_MAIN, BTC_ANT_WIFI_AT_CPL_AUX
  WIFI_HS_CONNECTED, BTC_RSSI_LOW

Only BTC_RF_A is actually used, as the RF path argument of
fBtcSetRfReg().  The "coupler Antenna definition" comment is removed
together with the two defines it documented.

No functional change intended.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c2ac06812bff..12ec83758e4b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -10,29 +10,14 @@
 #define NORMAL_EXEC		false
 #define FORCE_EXEC		true
 
-#define BTC_RF_OFF		0x0
-#define BTC_RF_ON		0x1
-
 #define BTC_RF_A		0x0
-#define BTC_RF_B		0x1
-#define BTC_RF_C		0x2
-#define BTC_RF_D		0x3
 
 #define BTC_SMSP		SINGLEMAC_SINGLEPHY
-#define BTC_DMDP		DUALMAC_DUALPHY
-#define BTC_DMSP		DUALMAC_SINGLEPHY
-#define BTC_MP_UNKNOWN		0xff
 
 #define BT_COEX_ANT_TYPE_PG	0
 #define BT_COEX_ANT_TYPE_ANTDIV		1
 #define BT_COEX_ANT_TYPE_DETECTED	2
 
-#define BTC_MIMO_PS_STATIC	0	/*  1ss */
-#define BTC_MIMO_PS_DYNAMIC	1	/*  2ss */
-
-#define BTC_RATE_DISABLE	0
-#define BTC_RATE_ENABLE		1
-
 /*  single Antenna definition */
 #define BTC_ANT_PATH_WIFI	0
 #define BTC_ANT_PATH_BT		1
@@ -40,9 +25,6 @@
 /*  dual Antenna definition */
 #define BTC_ANT_WIFI_AT_MAIN	0
 #define BTC_ANT_WIFI_AT_AUX	1
-/*  coupler Antenna definition */
-#define BTC_ANT_WIFI_AT_CPL_MAIN	0
-#define BTC_ANT_WIFI_AT_CPL_AUX		1
 
 enum {
 	BTC_PS_WIFI_NATIVE	= 0,	/*  wifi original power save behavior */
@@ -71,7 +53,6 @@ enum btc_chip_interface {
 /*  following is for wifi link status */
 #define WIFI_STA_CONNECTED				BIT(0)
 #define WIFI_AP_CONNECTED				BIT(1)
-#define WIFI_HS_CONNECTED				BIT(2)
 #define WIFI_P2P_GO_CONNECTED			BIT(3)
 #define WIFI_P2P_GC_CONNECTED			BIT(4)
 
@@ -94,7 +75,6 @@ enum {
 };
 #define BTC_RSSI_HIGH(_rssi_)	((_rssi_ == BTC_RSSI_STATE_HIGH || _rssi_ == BTC_RSSI_STATE_STAY_HIGH) ? true : false)
 #define BTC_RSSI_MEDIUM(_rssi_)	((_rssi_ == BTC_RSSI_STATE_MEDIUM || _rssi_ == BTC_RSSI_STATE_STAY_MEDIUM) ? true : false)
-#define BTC_RSSI_LOW(_rssi_)	((_rssi_ == BTC_RSSI_STATE_LOW || _rssi_ == BTC_RSSI_STATE_STAY_LOW) ? true : false)
 
 enum {
 	BTC_WIFI_BW_LEGACY			= 0x0,
-- 
2.25.1

