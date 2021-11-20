Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6072
	for <linux-staging@lists.linux.dev>; Sat, 20 Nov 2021 10:22:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z5so53611947edd.3
        for <linux-staging@lists.linux.dev>; Sat, 20 Nov 2021 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=BeEy6vcRhKds2a9r3PHLPnOSTPWjtYqMbWVGsXuciho=;
        b=nJ3XAwQD+ApXFBqYl4+P7FiNKmurZPaXvd5HRPAAVFsOVUwbpxWDjgEvMN7qdt7nEA
         fZzqxpfWPb7wWtolicpXilhlRmgUbRSu7dUgRh4yTR0aFdsPyqxi8w3U+PvEaNztvfYa
         2PLY+wrRzihe14vf/N/lTcMc+qrrouMQRLWxl66kM3FixGKc7m+WoEZkU1CfuvDoG1Qu
         hci65pI4IbRJN0wjYt9LZt1TfrfoKMuVJf4hS7PUTysnw/YyKBqA6ZLBeE14guVxuVDi
         VKuvoGp1ks0kFsjYjI9mel6w1rwXRR3A5tWutIketAckvnDBjB+cuCtx6YI64xSDg4vz
         AAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=BeEy6vcRhKds2a9r3PHLPnOSTPWjtYqMbWVGsXuciho=;
        b=PcQYbuA+TdK5BdaftFs3Yy4C0Qmc09GWtm02R1DG4aNuiOWtsBmch42yjJWPjzy9uP
         xfK/Sy0E03u8q/mP3Vuq/5nF5OYTmvdKWvSws3MBw1/5oSLI5FLyoQHd7diQtXYOZmSj
         3/NVTks16aDsYT2vmCHzV4lHTvUcOu5HbPXy7fGorL9ftVa4rcM5zvcCWAc24gTi579o
         ODszBJNcBtdYjprPJlDvQ64tqZApdwnUpXWaB+OEEwIK5bc/XKL1Jz7wVFUqXRbx2RJw
         naJu9aXQRxUmP21c519upf3qqjhTb7EV7VzdMRGaKoBfCvz0H9gT9j0D1db3MhhoK/6X
         AfCQ==
X-Gm-Message-State: AOAM530qRbJwDDEvo+lwa8axRc7tNDV0dO3Bbm9MnNNd4+RbE2mRORoH
	45ROBWGUFIK78yRguqsZfYg=
X-Google-Smtp-Source: ABdhPJxCnvxOIegDz2yVsmrg//p0BNrhE5Le+7R7IlFZmhHfD+Zy+a+H2d0+WpBK2J9qtCEyvhAPHA==
X-Received: by 2002:a17:906:2f97:: with SMTP id w23mr18047060eji.31.1637403766422;
        Sat, 20 Nov 2021 02:22:46 -0800 (PST)
Received: from bulldog (host-95-252-102-163.retail.telecomitalia.it. [95.252.102.163])
        by smtp.gmail.com with ESMTPSA id r13sm1050433edo.71.2021.11.20.02.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 02:22:46 -0800 (PST)
Date: Sat, 20 Nov 2021 11:22:43 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org,
	tomm.merciai@gmail.com, dan.carpenter@oracle.com,
	karolinadrobnik@gmail.com, alb3rt0.m3rciai@gmail.com,
	aldas60@gmail.com, gustavoars@kernel.org, lucas.henneman@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: vt6655: refactor camelcase uCurrRSSI to
 current_rssi
Message-ID: <20211120102243.GA529659@bulldog>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace camelcase variable "uCurrRSSI" (current Received Signal Strength
Indicator) into linux kernel coding style equivalent
variable "current_rssi".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---

Changelog v4:
- Rebase to "staging-next" 

Changelog v3:
- Correct mailing list

Changelog v2:
- Remove whitespaces 

 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 4 ++--
 drivers/staging/vt6655/dpc.c         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 3768791d9744..ff171acc11f4 100644
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
index e74caf22d75a..1f98f2b069c4 100644
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

