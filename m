Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461F4084A
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114965; cv=none; b=qaR+0372MYq+kEkSnmTZHZBxSh4GKfz5T4uBAb0/hIKNG7tET0pTLwHmWNOBiwokYkVeiCUIuPMd9snSh0DpcqkX+CuZpr4l4bDkgK3EnHORU9p6MwT0Bga8qeVK1NTzjTZ7fM8dBmE+5Aeu3Ih412gHUNMUcgIBgGRxZZEbO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114965; c=relaxed/simple;
	bh=aaynatjePreX+ZKYWdldnU245uJ/F0v5BQjpQnzULeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SW9Ybl4794RifCxgHv7e7gRBgdodvzMWYJqVHST42TJ+OaHN5Rf5Pe4ENxRyUoy43im2Pm1x2LM4Tsi0krCHHIDY8J+xY+4EHEMeGX2TvG+QX4HdEWqk6T2E6Fed+oiTx0knKzmjEWj3r3jOKu1nAsKWWwKI7vXlEY9RjjFJ20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=B0riOamh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="B0riOamh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29bfc3ca816so232774a91.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114963; x=1710719763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln106wSAsJuT/MNbqsLOu6Yq7Zx1wW1j4VdR3CdkZKI=;
        b=B0riOamh6/F7pI06quAx779+3IGHUpkNpp3KuUUIHLfLMaJ31vRb0qZqDPRtRY84bE
         ks8mtYf9MpPb2Tir0/c2ipwDWxsPLsx6cEoSND7c0PPKE4L4c6Gh4KcswIfYGXIsh1Gd
         5LrQ0yc1TfHtFuvOn2N+D7oL4oy+hIB/7jwBuSgADosIIDu3BHTmF1KCgjk24tayENUI
         0LBIfAM+BcvnntySYl6iddojCtUKyJD28/cuRUkoH0lt9F0N7a1z1lnN14D2XH4YTJ2r
         XSNWdeqlcv339pbbMmyy1MuZZlzy4vNyS/HEINyWuyNlcC+LkBIfyfYtic8Nf1by9nkQ
         qPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114963; x=1710719763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln106wSAsJuT/MNbqsLOu6Yq7Zx1wW1j4VdR3CdkZKI=;
        b=jBlM5/MJ1CvBJYVYZWiuqUxCR9ipVadXjjEOBqTxP+31FeZR1HP7JTjDRJUC2dwDl2
         +xp5Vdtb6JfP9NPvfRJZHGLZqeypxYglNRbGJ8NgAUqsJpQae5UYvKTCuMhTd7VguVL8
         3BOsIKf022Fukm5F0cdP5vWRNPYpgEiIBonY37YRPNcK0EMOAXti6eVLz7JwcYsewSA4
         whCi9oPfHEcw+jNwXQiZ01LIc1HkNAAInE/4nZFUEFrz1u1vHKVo3atiR3/E2S7Ooj6e
         ubZbnbB4ynvS27iytwW24Hr/BPwAUWjoDsTaZ/jAL/AyDB9vd/8aXHYpZWhEPpvjHcKY
         R3Yg==
X-Gm-Message-State: AOJu0Yw7Gn/+VRyt0PGx+3FhB1GB8h0z/gLQoJlLdEzS6ykQWf9uXgSZ
	mdwHIcb04EIK9SQvZ63bEh0kEJgsD1uLAcF3owT659lENhHqvg92QzuqZXhobVY=
X-Google-Smtp-Source: AGHT+IEIAbOVNnGKx6wzOoW8hNNjB2NnNHkQsiZkONPnLfuHT6c9vJuyffUCYHWNfE+Y4POPboHX3g==
X-Received: by 2002:a17:90b:33d1:b0:29b:38c0:b933 with SMTP id lk17-20020a17090b33d100b0029b38c0b933mr3947602pjb.8.1710114963563;
        Sun, 10 Mar 2024 16:56:03 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:56:03 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/11] Staging: rtl8192e: Rename variable WriteIntoReg
Date: Sun, 10 Mar 2024 16:55:51 -0700
Message-Id: <20240310235552.4217-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable WriteIntoReg to write_into_reg
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e3276d2c3616..fdf8fc66939d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -703,7 +703,7 @@ void rtl92e_link_change(struct net_device *dev)
 }
 
 void rtl92e_set_monitor_mode(struct net_device *dev, bool allow_all_da,
-			     bool WriteIntoReg)
+			     bool write_into_reg)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
@@ -712,7 +712,7 @@ void rtl92e_set_monitor_mode(struct net_device *dev, bool allow_all_da,
 	else
 		priv->receive_config &= ~RCR_AAP;
 
-	if (WriteIntoReg)
+	if (write_into_reg)
 		rtl92e_writel(dev, RCR, priv->receive_config);
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
index 1224f190937e..9d9c5051c7fe 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
@@ -22,7 +22,7 @@ void rtl92e_get_eeprom_size(struct net_device *dev);
 bool rtl92e_start_adapter(struct net_device *dev);
 void rtl92e_link_change(struct net_device *dev);
 void rtl92e_set_monitor_mode(struct net_device *dev, bool allow_all_da,
-			     bool WriteIntoReg);
+			     bool write_into_reg);
 void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 			  struct cb_desc *cb_desc, struct sk_buff *skb);
 void  rtl92e_fill_tx_cmd_desc(struct net_device *dev, struct tx_desc_cmd *entry,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 393fff7e6a8d..0809af3fd041 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1478,7 +1478,7 @@ struct rtllib_device {
 
 	void (*allow_all_dest_addr_handler)(struct net_device *dev,
 					    bool allow_all_da,
-					    bool WriteIntoReg);
+					    bool write_into_reg);
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
-- 
2.30.2

