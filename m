Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE33156C8
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRtbfq5z"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so1794601b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396756; x=1699001556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvpMScDdDG387wBvMeNnvct2F1PCbiwjBCPhHD21wro=;
        b=cRtbfq5zPUtaY4GU+nPCxWRJhUyQQ+VwIBWFlWb8MQuwCBUQaBrrOp2LKp7bS/PwVD
         2kj+kbZ7owgzZUIkm4qmqIs0XWdEy4F5wYb1jlplAzwkFL8Jgf5rFQNMvh9yiBxKFoRq
         PGrrUoDv6SKgd3uHebPoFg8CwT0qpfmYq3WXbSGxyYQOECsYSDHwXbbkXTWJZ7gHM76J
         XyWpAYJ5Qhe+O6BSnLutQ9Z66FeTuyCMUSsSt/VNTz7X0mPfHsuOPSWQhhStaGy1D7xC
         6UljmZl2BwgL2YAs+AM7SFbZnIT706wXKF27eZANJ/ta5rGbWb0VpOIoMo9OKVw/utrH
         8F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396756; x=1699001556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvpMScDdDG387wBvMeNnvct2F1PCbiwjBCPhHD21wro=;
        b=ZSXn0ax4xrIOke6MpKReOUZ6ng6A4ylXu4G2pBFDeVPFR7ph4r52ovwE3QMn5K4AFC
         xrcLzPdSuEsKYcSCEaL48hxjwCyZIYjLpoensxgFQPzi4JRlTYB7xg8/CNXQYWsNZ/EF
         Ue7mqd5eRF/tAksFkT9qHaeIl+LXPZAeReqFM2nOZzf/LYX+BcV94hfx/96iBYR24+sR
         WAtGPn4pxvvPZnFM40XvhJBcj8GkoH3PAjVzgKIwjlwSH0Yg8iMqFzzs6bvvjkzMWnC0
         IYbEBia5K/jqgfjJ9xjNSQGiOzFENGZSEdPayRm+2YPASxLd+A9p0uczhz3zveqLeA2i
         mafw==
X-Gm-Message-State: AOJu0YyWX/tIAz835ndlH6ic8uBk32D0oXU2is0+bzvQiafaogQ2tZ9k
	ujSTEDyXKDIESlSXR3cBqyw=
X-Google-Smtp-Source: AGHT+IEaNgTqwV+EzUB+ZTPKQngqHaOIsZrmocG2meOJs90Ubs+MF253hzAaHpFMEBsysyQlJgcQ8Q==
X-Received: by 2002:a05:6a00:1504:b0:6be:5a1a:3bb8 with SMTP id q4-20020a056a00150400b006be5a1a3bb8mr2219989pfu.28.1698396755778;
        Fri, 27 Oct 2023 01:52:35 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:35 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 09/10] staging: vt6655: Type encoding info dropped from function name "CARDbUpdateTSF"
Date: Fri, 27 Oct 2023 14:21:58 +0530
Message-Id: <926ec04bbfc69926cd1af92684fef392f2d6e04a.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698396278.git.opensource206@gmail.com>
References: <cover.1698396278.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "CARDbUpdateTSF" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/card.h        | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 56beaf6de488..ebb96b4c9406 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -287,7 +287,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  *
  * Return Value: none
  */
-bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
+bool card_update_tsf(struct vnt_private *priv, unsigned char byRxRate,
 		    u64 qwBSSTimestamp)
 {
 	u64 local_tsf;
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index b36e276c699b..caf72892c1cd 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -54,7 +54,7 @@ void CARDvSafeResetTx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
 void CARDbRadioPowerOff(struct vnt_private *priv);
 bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
-bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
+bool card_update_tsf(struct vnt_private *priv, unsigned char byRxRate,
 		    u64 qwBSSTimestamp);
 bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 			  unsigned short wBeaconInterval);
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 17a323800ce9..7d297526e653 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1534,7 +1534,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & (BSS_CHANGED_ASSOC | BSS_CHANGED_BEACON_INFO) &&
 	    priv->op_mode != NL80211_IFTYPE_AP) {
 		if (vif->cfg.assoc && conf->beacon_rate) {
-			CARDbUpdateTSF(priv, conf->beacon_rate->hw_value,
+			card_update_tsf(priv, conf->beacon_rate->hw_value,
 				       conf->sync_tsf);
 
 			CARDbSetBeaconPeriod(priv, conf->beacon_int);
-- 
2.34.1

