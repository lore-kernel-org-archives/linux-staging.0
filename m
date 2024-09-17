Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3C44C77
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551119; cv=none; b=pwty9jIveNfy5Tq8sLvosfvk9tesGca2ADPkHjfrN0lTNg9GwPn65d3s1kNxLM6Vdi0KhxVwaGjjVVmTGMZj19c+BlYGOvQYkUW2KxGfJ+jyjWiH/PLldj9Nv8u1X8iJwecDaQnyP0pLDfXta1SWL143/4iVLHY7zhtSOe5Fpcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551119; c=relaxed/simple;
	bh=K8nfSr10EcF6PUvU89ZAJtY+Y0GNw9MlRURLlC/EAkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtppPPLTVabY7+wADCBgLvhNkluxMhY65+27vDhWG1Z0WLyz7CcP1hUE35PFqMkaxqDuHXBFbI3CkI5a4rEHX2b/ji5jsUsBi8Xd3pTcU4ZT/6ggiZ2bl+1ve+PLRPySRYW8JkU+CzERIWHn3EDElneEPU1dOdmT79Mg/E+wt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=PYdJaAZx; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="PYdJaAZx"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7d666fb3fb9so2565913a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551117; x=1727155917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGyWd9SjHJRazr/twXm1zqpgxc6lZys6CmSWJwhQDgI=;
        b=PYdJaAZxZsDQpdqdXIygysKIrZQWWRbJpQiYfoOm6pQWMqKeZ9brhEEu+Y+oKXAI9F
         odhBMBpO172WnKRDNoPHvfnhHsvdTtIh9prdv1HxEFrJjzc/HcnybbOOFm3Ftugi8tGl
         3MTVviGBzplClEPs8zntb+zcRpOVdKcwcBGqh+DweFhRKZVdIjc5RWC1qi5oypVz5QPS
         Zmj6xI6xSMEckZcProucmaOofbDGkbHim62Vn+Pad41yvH+ZJqoq631buLJkPQORxLc5
         KNTdJNpBK6Qyz8sKW/FFRbPmD7jescVFiG1cTk+N7N0Nm576/CwFWBzogIjr2oi6CVyS
         Aw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551117; x=1727155917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGyWd9SjHJRazr/twXm1zqpgxc6lZys6CmSWJwhQDgI=;
        b=Onq/msmfUJcLwL9tuUxFeIuttvb1NC25Imm8ZddQLCBJkSIekOYbO9T8z0g7ib39mF
         ri/2QC3et6jYR0f9G/7W0Cl2DumfPMhexoK4boEBgM9lurbKCLoVhFQJ1BB6T3hhAcht
         +oy8EKfpbCzwmP1sW4Kg22QQ7/WJ1q0Cx2Wh8pmQ17QuzoQU02beJP+qPFT3yfJGBi4j
         VVGNdZ/22vQj5d7YEhc3uz89TU7al2/zIFv97+7lXbV5YSLZDRjsCSCg3xFKA2WumHXR
         qCopI57m19W+2c3WK/LiRC1w4VBgYPv0W996lKcKaqgEoBTcGrEWOxuPknq8og1WB76N
         SaJA==
X-Gm-Message-State: AOJu0YwKlz5qrreMQr867t/GkBGMnQBQhBXYDkfbVJiWcua2a0goP07C
	Fdqxv/D3X4c6VQdnYxRSQ4qdw+a5UhfKDFRWBnnWf9WxKM7f5xoCUtzAKomfS9o=
X-Google-Smtp-Source: AGHT+IFIxP5DxAqqxP/TrO2OFaEEhBVHJ4XkTh7pzSCwK9Y7KSmdmb/nl/G9Y0HJjKeV/BTnpIzeMw==
X-Received: by 2002:a05:6a20:4322:b0:1cf:651c:52f1 with SMTP id adf61e73a8af0-1d2cecf6d8emr10057411637.0.1726551117119;
        Mon, 16 Sep 2024 22:31:57 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:31:56 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/18] Staging: rtl8192e: Rename variable bIsCCK
Date: Mon, 16 Sep 2024 22:31:36 -0700
Message-Id: <20240917053152.575553-3-tdavies@darkphysics.net>
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

Rename variable bIsCCK to is_cck
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 2672b1ddf88e..2000289720b3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1173,7 +1173,7 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 	pstats->bPacketMatchBSSID = precord_stats->bPacketMatchBSSID =
 				    bpacket_match_bssid;
 	pstats->packet_to_self = precord_stats->packet_to_self = bpacket_toself;
-	pstats->bIsCCK = precord_stats->bIsCCK = is_cck_rate;
+	pstats->is_cck = precord_stats->is_cck = is_cck_rate;
 	pstats->bPacketBeacon = precord_stats->bPacketBeacon = bPacketBeacon;
 	pstats->bToSelfBA = precord_stats->bToSelfBA = bToSelfBA;
 	if (check_reg824 == 0) {
@@ -1370,7 +1370,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	if (!bcheck)
 		return;
 
-	if (!prev_st->bIsCCK && prev_st->packet_to_self) {
+	if (!prev_st->is_cck && prev_st->packet_to_self) {
 		for (rfpath = RF90_PATH_A; rfpath < priv->num_total_rf_path; rfpath++) {
 			if (priv->stats.rx_rssi_percentage[rfpath] == 0) {
 				priv->stats.rx_rssi_percentage[rfpath] =
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 21d8ea153368..08eaa98c0a1a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -483,7 +483,7 @@ struct rtllib_rx_stats {
 	u8    RxMIMOSignalStrength[2];
 	s8    RxMIMOSignalQuality[2];
 	bool  bPacketMatchBSSID;
-	bool  bIsCCK;
+	bool  is_cck;
 	bool  packet_to_self;
 	bool   bPacketBeacon;
 	bool   bToSelfBA;
-- 
2.30.2

