Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18272C81
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 10:10:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id e3so49033386edu.4
        for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bfcy5GO85I/YEABOM6teid4ZMWCnzDFALpVwMAU2S0M=;
        b=k5DvSV0HEghPeamCefoIg2ZeYHdwAR5DnyexpvuCTr9MKySbtMjrEC3TqQUOsfjgAb
         Ku4yKuXXJUhSauoEV+U0Y6AMN0Ina8MFuYIFhjWj8Wq7YB1Z2LhRymDBZUusAfICQ8J0
         J/MmDgCoHraVlsDtbgqrwW3GALyiW5Ky7425coyKeq/qXxj2uh8B4e2fYuRWjo2GKC+I
         rzVk++fG7rCyszlL075TjrRHGT+PY9DWPvpYEKQSTwyu4XxE2SuAnzmcyGTJpJS9W3EU
         B/ZrlzMqr9+qcg9TKsjLccpc7GaMVa0Ni8RrAzgHbenzfWe8PZ5TtKlzJNuL25b4NmsM
         XEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bfcy5GO85I/YEABOM6teid4ZMWCnzDFALpVwMAU2S0M=;
        b=N4J+NcohkYuVt1Res9wXfzLYqmx9Atw9BzVqP9cjn83jXPfXMOULKADXZr6aA/7HZD
         OZM4QRiNHXX9Us8IYHwPQl3n7JCyOBdUe+AjKad8LYIL32cGYLqltzNeJrgDzWrN+Ibt
         oX5Kp0Aw/ztIn9Wolotcij2e7osRpKZZdWpYt3nUflL7LkGaZ0fY+eH4uwjYgQ6FFBSF
         78nlPvvCMS0rox/rjldEfWU6QU0dlyIrmovnRbEeHsh35fNK7VDNDUWKUU/pt3QtCHaT
         rIFF+QER3EUJkFk24M8XKJQVidCg2bTAAUCCCFEb0kFgP/baTSTTvsZILW0gzK6g+oM9
         in9w==
X-Gm-Message-State: AOAM531/HVB8YR5UTU1+03moqQ+Uyd6tFqU/cYxkIiE+3Fz0LOhiQtv8
	qD/zohoQU6eYaHt6MSkBRjk=
X-Google-Smtp-Source: ABdhPJxu2JhTBwIGJPikPiEhcVCiRH9AWtNjecvD4+sBPOFsZiQB4K9cdm5bP96qSshuIs9KaFRxfw==
X-Received: by 2002:a17:907:7215:: with SMTP id dr21mr44912097ejc.505.1638007803015;
        Sat, 27 Nov 2021 02:10:03 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id hb10sm4286204ejc.9.2021.11.27.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 02:10:02 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] staging: vt6655: refactor camelcase uCurrRSSI to current_rssi
Date: Sat, 27 Nov 2021 11:08:02 +0100
Message-Id: <20211127100807.3113388-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase variable "uCurrRSSI" (current Received Signal Strength
Indicator) into linux kernel coding style equivalent
variable "current_rssi".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---

v5
- change patch version
v4
- rebase against the staging-next
v3
- change tab with whitespace next to current_rssi
v2
- correct mailing list
v1
- remove whitespaces

 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 4 ++--
 drivers/staging/vt6655/dpc.c         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 9e5f060f3784..c51eba94230d 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -165,7 +165,7 @@ struct vnt_private {
 	unsigned char abyCurrentNetAddr[ETH_ALEN]; __aligned(2)
 	bool bLinkPass;          /* link status: OK or fail */
 
-	unsigned int	uCurrRSSI;
+	unsigned int current_rssi;
 	unsigned char byCurrSQ;
 
 	unsigned long dwTxAntennaSel;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6c5140e29f6b..897d70cf32b8 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -980,10 +980,10 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 	if (priv->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		return;
 
-	if (!(priv->vif->bss_conf.assoc && priv->uCurrRSSI))
+	if (!(priv->vif->bss_conf.assoc && priv->current_rssi))
 		return;
 
-	RFvRSSITodBm(priv, (u8)priv->uCurrRSSI, &dbm);
+	RFvRSSITodBm(priv, (u8)priv->current_rssi, &dbm);
 
 	for (i = 0; i < BB_VGA_LEVEL; i++) {
 		if (dbm < priv->dbm_threshold[i]) {
diff --git a/drivers/staging/vt6655/dpc.c b/drivers/staging/vt6655/dpc.c
index a7d1d35de5d4..c6ed3537f439 100644
--- a/drivers/staging/vt6655/dpc.c
+++ b/drivers/staging/vt6655/dpc.c
@@ -80,7 +80,7 @@ static bool vnt_rx_data(struct vnt_private *priv, struct sk_buff *skb,
 	RFvRSSITodBm(priv, *rssi, &rx_dbm);
 
 	priv->byBBPreEDRSSI = (u8)rx_dbm + 1;
-	priv->uCurrRSSI = *rssi;
+	priv->current_rssi = *rssi;
 
 	skb_pull(skb, 4);
 	skb_trim(skb, frame_size);
-- 
2.25.1

