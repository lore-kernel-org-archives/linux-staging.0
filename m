Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0117BB2B
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823605; cv=none; b=TutPsw3ad+47ZvvYNlAuU6m9L26OEkV10Upwi+ZqNjRZ/ZQbMxHkcMjFHGj4tCyKJMnfRCTGvjoCUhCVVzbfMQZgLGIfynityG8vi+Zk3m+J+ni246hNpUY/wGYgoYD9LY4NYbX/O64RiXBjg+WGJXNlRcsbraiPtQDYeZpAN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823605; c=relaxed/simple;
	bh=oSGIlgcB5bk+3npew6/oY4O3djXBrXcqVa3FtH6ssNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBm5s84SziqeefWXFIDb1PMKhUUI4/zAQFOPlUlCgRCIToUfJruBUZUAIlMe19p980rNvkhd4NyQ/xusZrMTk8iW9uLhAoujkP1Y9aSDryIX/L0acxuYMyUf6Q96PcR1Gd+ApU4bKB1XZCdneseJUw3PDECPT8kkkd6mP65Y/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=hromAc5Z; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="hromAc5Z"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20688fbaeafso35369175ad.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823603; x=1726428403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pbiBs+OMZdnPenhE+VdtplWlVCSPQUlYP7gfJvkFEk=;
        b=hromAc5ZRdoYe99ZNQqwrJqhtUoiiY9YZBVBQfvdS+4qdhegp3IETk6c7NSl+1Hv3O
         XSSQfm3mvN2dWs/HsJ71E/aty1YPbsgyJPhKRmX4z3EvB+wTzRORF6Kv8i9tyy5uO70X
         T+SfaodksVFrcH2Ov6amXjgyjZZ2vNPaLgOuD8grX6obWoR9vwxxfTCAvLQfQ1G0L2kw
         G58RcHd6O+yLBJ3UvkS1YT/BViKo/uEo1CSnSuYnRc7xy6PRobpR4+DkfQYgXnT0E+qm
         PUDopXF7FQZOBTfSgML0wSG33lrI0EDaJ6EehYkdcI5wd1VcNuBDPY7/atVyYMUYoB0f
         dYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823603; x=1726428403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pbiBs+OMZdnPenhE+VdtplWlVCSPQUlYP7gfJvkFEk=;
        b=TZG2s5a3mRPFPLy66q8MXadf8EH179lEeU+fd6R8klaEmDaQ9BnFdno1yxNShRP+NH
         9xdNkU3e6S+eHPSTMwq7raXYY00JxKbIKO0ZL2Vp9n3DmgBkmmBDa6DDpLfhcm7m4Pk5
         VkfzVNxHOs/r9QWKPUTyXCOdzj5MLpQhm7u9nQtbh9vc3Tb90b/0Q1KHlG/rM+GLKeB6
         OEjM+VNUMdAo3zGU0T8c2Lbli0vnt7K/6dBjAOvA4Vcfg7WbB1LPhxi9iY920GZdve0+
         GCFYjd0m0YPAmowqbUgEPGmqT3Y+3ZWcd/CPfxMvrHIkD9uM8gpuxNrEy4IXd8/fnrot
         NsXQ==
X-Gm-Message-State: AOJu0YxrWdoahWnJlObclKP8HDy9ShaOM528k1NXuQFJuivA5Jgf76+P
	jEjw5ge6IEHXd0e8Nr1bx4JaoeXo/lpL+wtWB2xXcXJ0vinYaJLeaPmVlxUcmxc=
X-Google-Smtp-Source: AGHT+IEfiqlAgyYC3n/LMWnEE7mW3A8pj0k79UjUYmC0ClBY3O71MuUBybCEb6fRCI5pgMLH6QL/Ag==
X-Received: by 2002:a17:902:e952:b0:205:56e8:4a3f with SMTP id d9443c01a7336-206f0624654mr74639885ad.61.1725823603009;
        Sun, 08 Sep 2024 12:26:43 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:42 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/16] Staging: rtl8192e: Rename variable ScanOperationBackupHandler
Date: Sun,  8 Sep 2024 12:26:25 -0700
Message-Id: <20240908192633.94144-9-tdavies@darkphysics.net>
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

Rename variable ScanOperationBackupHandler to
scan_operation_backup_handler to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 744588a27302..a5980253183e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -665,7 +665,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->init_gain_handler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
-	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
+	priv->rtllib->scan_operation_backup_handler = rtl92e_scan_op_backup;
 }
 
 static void _rtl92e_init_priv_variable(struct net_device *dev)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index a054592a7364..fe3a42a4fcd5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -288,11 +288,11 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 		if (priv->rtllib->rf_power_state != rf_off) {
 			priv->rtllib->actscanning = true;
 
-			ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_BACKUP);
+			ieee->scan_operation_backup_handler(ieee->dev, SCAN_OPT_BACKUP);
 
 			rtllib_start_scan_syncro(priv->rtllib);
 
-			ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_RESTORE);
+			ieee->scan_operation_backup_handler(ieee->dev, SCAN_OPT_RESTORE);
 		}
 		ret = 0;
 	} else {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d63044607fb5..ee5de93a90c1 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1461,7 +1461,7 @@ struct rtllib_device {
 	bool (*get_half_nmode_support_by_aps_handler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
 	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
-	void (*ScanOperationBackupHandler)(struct net_device *dev,
+	void (*scan_operation_backup_handler)(struct net_device *dev,
 					   u8 Operation);
 	void (*set_hw_reg_handler)(struct net_device *dev, u8 variable, u8 *val);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 11542aea4a20..c59686d68a33 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -314,7 +314,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 	/* wait for ps packet to be kicked out successfully */
 	msleep(50);
 
-	ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_BACKUP);
+	ieee->scan_operation_backup_handler(ieee->dev, SCAN_OPT_BACKUP);
 
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht &&
 	    ieee->ht_info->cur_bw_40mhz) {
@@ -339,7 +339,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 		ieee->set_chan(ieee->dev, chan);
 	}
 
-	ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_RESTORE);
+	ieee->scan_operation_backup_handler(ieee->dev, SCAN_OPT_RESTORE);
 
 	ieee->link_state = MAC80211_LINKED;
 	ieee->link_change(ieee->dev);
-- 
2.30.2

