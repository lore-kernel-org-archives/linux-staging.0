Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E7D506
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG9ohaaV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc29f39e7aso20985695ad.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730489; x=1699335289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvaPVxqSXSqOgVBO3lNlv/s8zA4GhoxNEgdJessNhBc=;
        b=UG9ohaaVQzxU5PRdLNpJGH0PbBfUuX2qNazDb30sLa1aafEtLr5iBkLidIwGog+HXQ
         A3c7Y7muByZkYlqF29/jKfJ1tnXoO5Ye8VNoVpqADOgnqRPX/d8HdVE5AXSMi6X+HNZ6
         hQJruRaiaTd/aua9ZAdMmbcJ+FPohJydxY63EP1La6s347KI6XgrWWCykDJ6OQQdf1Dh
         H7+hBT2umzFO2F8njHd6QzL54mvRTw4WZ0AD7sk70T/IqJDlMPAP9EHBWMTmDJ+OPpEJ
         nFB79mD9WXfvCwQDmE6wtBLiEx5bbtdpJN7gInbZyjLpheCqfcSjDEgXbQBrHdhxBUXF
         5Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730489; x=1699335289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvaPVxqSXSqOgVBO3lNlv/s8zA4GhoxNEgdJessNhBc=;
        b=taYJgFpeY3fyrSPfP9BPpRwwxzHLqAvrrsCguk6RIHPJxb9c76/HRfllCZaQ4tbX6Z
         Yev+Lo7jjGfgqdDQM1ywM65InDz9WPFl2rJP66/9f/Z01NO7C/0tzqnchLh9lt9PAyZ7
         QuaETsxUugo4afWsQ+fqJRB8A0tbe0DDbOuQeCXzDso5SQZYx7anovP/XmnivQLKGaWz
         jzkMdER+rQ1vZNCw/ldStOpu7WjmbSxomOGQKQ7vyGhKy2pHrBm7QXJIuTCm5//ashGr
         nexOQ7VRlpthS0QU+NHaIzUIqe91jUmhyhmTz0XAiBZiS37lXeeSZW7erhNRhbuisHmX
         mhFQ==
X-Gm-Message-State: AOJu0YzmlpW9V089i497gSpAHN3zp7vnlKg/lgOZSAtWGEV/XaYRyhjt
	rOH4SrxrMxG/QzrblaTR1FE=
X-Google-Smtp-Source: AGHT+IFjkiiRbzMPbFkKbw0UuSWWbioMLoHDJ/cfzLo6pWToKmnfFAG+8B8wy0zBcpRjo5gUE7Es7g==
X-Received: by 2002:a17:903:245:b0:1ca:e05a:93a2 with SMTP id j5-20020a170903024500b001cae05a93a2mr11395438plh.32.1698730489442;
        Mon, 30 Oct 2023 22:34:49 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:49 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 04/11] staging: vt6655: Type encoding info dropped from function name "CARDbSetBeaconPeriod"
Date: Tue, 31 Oct 2023 11:04:27 +0530
Message-Id: <8d4c10ac86f80bb46d5cb1f18079276c3326e5dd.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "CARDbSetBeaconPeriod" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/card.h        | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/rxtx.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 1edf65e2adcf..bfd02a869d64 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -320,7 +320,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  *
  * Return Value: true if succeed; otherwise false
  */
-bool CARDbSetBeaconPeriod(struct vnt_private *priv,
+bool card_set_beacon_period(struct vnt_private *priv,
 			  unsigned short wBeaconInterval)
 {
 	u64 qwNextTBTT;
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index df1b9a7c1f21..f84e4190a2ac 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -56,7 +56,7 @@ void CARDbRadioPowerOff(struct vnt_private *priv);
 bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 		    u64 bss_timestamp);
-bool CARDbSetBeaconPeriod(struct vnt_private *priv,
+bool card_set_beacon_period(struct vnt_private *priv,
 			  unsigned short wBeaconInterval);
 
 #endif /* __CARD_H__ */
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 7d297526e653..2e2a8da571ab 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1537,7 +1537,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 			card_update_tsf(priv, conf->beacon_rate->hw_value,
 				       conf->sync_tsf);
 
-			CARDbSetBeaconPeriod(priv, conf->beacon_int);
+			card_set_beacon_period(priv, conf->beacon_int);
 
 			CARDvSetFirstNextTBTT(priv, conf->beacon_int);
 		} else {
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 522d34ca9b0f..5e5ed582c35e 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1456,7 +1456,7 @@ int vnt_beacon_enable(struct vnt_private *priv, struct ieee80211_vif *vif,
 
 	CARDvSetFirstNextTBTT(priv, conf->beacon_int);
 
-	CARDbSetBeaconPeriod(priv, conf->beacon_int);
+	card_set_beacon_period(priv, conf->beacon_int);
 
 	return vnt_beacon_make(priv, vif);
 }
-- 
2.34.1

