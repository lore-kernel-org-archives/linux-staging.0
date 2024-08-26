Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292AA95C
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631455; cv=none; b=aQuCmJvqIf/cwFi6/R7hKmvRVog9cCE2749yVkvDqBgvhi9hl4X9Gs8Fjw74XH1IKqBEVLhxXYNgmFMOkj3U/eEiHhJoKwFeV4PqTSeM74tEXOyLfnGpfUb3EBA9ZVkYh41FlbX/8FTOinpEDo3zhSqpOe3+JOHaeGj+qPe6hCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631455; c=relaxed/simple;
	bh=FZq3TlinAw0NAQgAOiZ6+WmbqrxTTJjlM77u29/HlLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u3gUrI5rfZEP9ioNjO4jWJun/w5CsQ7s4xeixpw6eKEK6xAgEGwQOvt1A+mEhFsidwK3rAKWgIKGZlOOM+WHD33j5Or3ciYwCHLO1q0BcFO0+72DvCAn2AGmLRe0Kn66s7JU8wClO1VC8xx4iDZ2ck2olJTPWv1jUlykcyhO8kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=g7bRtJ+t; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="g7bRtJ+t"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20227ba378eso33436025ad.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631453; x=1725236253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp3ZaYZ2bdEs+KuBwodCSVcCtgG051WR1MOG9KDjm3w=;
        b=g7bRtJ+t5eFXg+T0VTMjO6htgnWV4S57fKPRxV0jffwQCEy5aM/4fpkJB2bqDPkG0m
         W/6QFTaEdR/HuZXZacs6FAKqe58vEA3tt4QjsYylVIL+z4BXRuLJui91qzqxjfdbLwv2
         klJjJkrdkPHpZh6y75gewpSgJB73+HZ306m0VKj8wW3WlKqxMFxk4GkhY/0V35Q/uoGs
         s4i1quJx+WNB7rDt+4XrwDayPW3h0Csi2VvTr7pNSAPIDTKXEDAGixnk6KkKDoFNB56H
         ZzWzluPn8y1rVOZX6/yFhm2t4dafDiD2NUppZllAp6c35IGdLFeG3AAMDxB8niIC4J8J
         yRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631453; x=1725236253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp3ZaYZ2bdEs+KuBwodCSVcCtgG051WR1MOG9KDjm3w=;
        b=iAU/k8SYpJITcZjYrTZuUWVfzmQSrrqkbs2rf5xPAfGvlS6P1tUhNRVXAz7ADuqPyl
         JaUHxgMwLS9Bc+wdDc5oQYt/qk+m9fxNu6rLzFLKeniBgdDviMu2amqmnd3qs8WRngHX
         YWCKigFlWcBmsqBi7LM2LczLGOimhU5Kn2O8NYJUXpgOp6YqQCmAYdbvASSssJGn66JI
         SXG084DTNuWt1znp5CAdnaK8Rnf5+B4p2V6nN9DKIp62v8hykGzTS8PAvGFRv0z0xvtw
         fkAml+y/OqAx4k0FjJbacA9Xp+bbzkYA+eSvvvJoPUMO6qZMUzt1aECWEWkXptyGdkTd
         amsA==
X-Gm-Message-State: AOJu0YwOMviNPF8vDwjD6DPzra+YF4fO+JZRKK6vGzbMrGMAu86GTS9M
	mNWSf2b0Vngwvo24I521Rg3LwmIWvfBUSbmuIgao/Ji8sSyrwv50/yQIJlUhO7k=
X-Google-Smtp-Source: AGHT+IFbmTr6SypIn0YhfS/UcntvRY9CSCf8ragk4gVQnPyD5GXw5Yv2YoJooKkgjGFI8jBEIxosPA==
X-Received: by 2002:a17:902:e850:b0:1fb:6663:b648 with SMTP id d9443c01a7336-2039e46ce19mr113805605ad.21.1724631452822;
        Sun, 25 Aug 2024 17:17:32 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:32 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/6] Staging: rtl8192e: Rename variable CmdID
Date: Sun, 25 Aug 2024 17:17:22 -0700
Message-Id: <20240826001724.274811-5-tdavies@darkphysics.net>
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

Rename variable CmdID to cmd_id
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 1088352a315d..939f0a7c3a90 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -509,7 +509,7 @@ static void _rtl92e_set_tx_power_level(struct net_device *dev, u8 channel)
 static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 					    struct sw_chnl_cmd *CmdTable,
 					    u32 CmdTableIdx, u32 CmdTableSz,
-					    enum sw_chnl_cmd_id CmdID,
+					    enum sw_chnl_cmd_id cmd_id,
 					    u32 Para1, u32 Para2, u32 msDelay)
 {
 	struct sw_chnl_cmd *pCmd;
@@ -524,7 +524,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 	}
 
 	pCmd = CmdTable + CmdTableIdx;
-	pCmd->CmdID = CmdID;
+	pCmd->cmd_id = cmd_id;
 	pCmd->Para1 = Para1;
 	pCmd->Para2 = Para2;
 	pCmd->msDelay = msDelay;
@@ -601,7 +601,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				break;
 			}
 
-			if (CurrentCmd && CurrentCmd->CmdID == cmd_id_end) {
+			if (CurrentCmd && CurrentCmd->cmd_id == cmd_id_end) {
 				if ((*stage) == 2)
 					return true;
 				(*stage)++;
@@ -611,7 +611,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 
 			if (!CurrentCmd)
 				continue;
-			switch (CurrentCmd->CmdID) {
+			switch (CurrentCmd->cmd_id) {
 			case cmd_id_set_tx_power_level:
 				if (priv->ic_cut > VERSION_8190_BD)
 					_rtl92e_set_tx_power_level(dev,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index f588f01d66fa..41ae98e01a30 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -163,7 +163,7 @@ enum sw_chnl_cmd_id {
 };
 
 struct sw_chnl_cmd {
-	enum sw_chnl_cmd_id CmdID;
+	enum sw_chnl_cmd_id cmd_id;
 	u32			Para1;
 	u32			Para2;
 	u32			msDelay;
-- 
2.30.2

