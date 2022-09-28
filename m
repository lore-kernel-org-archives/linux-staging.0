Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC24A33
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 17:23:27 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c30so17017947edn.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nkSl1inMpvuvkN+Ej6lt7wMWY0ME+Ef7HkKqG5h0+Mo=;
        b=lSEubK26SLZ+QN4euhY+WZeOrkrou9JiVJYISGUO1dJWdirN+F0jbn01spSxQ2GwD2
         8d6cuNEZosm43QxgXg09MmKgp4BtVmlxKV+oxhWiHI6pyCGWDXVc3NPnSiQDXp7+pBiz
         9UeksiOxMmXZ60+2SW6Vi290gtZsk6MY3QOKNNSdDr/vmFAo0Jas7zcI7lRdCNtsRi/o
         6OI5Ba0SfqXWlprelKiHWWEpU4xZs5T4BUwQgmYla8oHWdcXdlm5QF7Yk73THqZD4cxy
         0Ag09t7MdciHkbO6Pxt0/SZBgncFIJgP9VfLSrPq1m78MHHXzanKxPb7kXoRECcenhBo
         yIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nkSl1inMpvuvkN+Ej6lt7wMWY0ME+Ef7HkKqG5h0+Mo=;
        b=o9qwBQLi8uQ28S5chjd1PEOn6v6g9LDxnEbtIZ3IExssc/bt+m+nRfoqc/A9VnZ6bo
         OvenSQ9pTRpigzNz+7J0EJbOyvCsp0fylh1TlcVUCsjYhLTtex/llj9iEbLIe8j9LG4H
         DfaUTRYxnKyAp2iYYUSqqszNVeLyh8gAOSr+62Os70PU1m2G7UMRljckylGwWHRTMxgF
         OSbs7Cc+naOLTAH0Hj1jfislwfrXcWSZj7WzxpqIAd4npRk9MplMfZUxbrCEHdeME9ox
         kVzr6ZbQ+2GLjuHE1oTDR28iFUCKF7g9Hor4LUtCIdV64i5nc/GIakAd+IiHJHwywU+k
         0fbg==
X-Gm-Message-State: ACrzQf1/HHJpQCWkHoUwfHGjAdcCuviamjf6HAkyBZYygjKlOI6ZYmHm
	ZDeki4nXp8I79/dK5hsOAgc=
X-Google-Smtp-Source: AMsMyM6ahGQHUVH+USq5wTcfIlevhJM1p5e3nEjMiV9BjE060inFT1ykWMpII2siuIfAybtclk04jQ==
X-Received: by 2002:a05:6402:170c:b0:457:ded1:d395 with SMTP id y12-20020a056402170c00b00457ded1d395mr5631505edu.103.1664385806944;
        Wed, 28 Sep 2022 10:23:26 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id lb6-20020a170907784600b007306a4ecc9dsm2725063ejc.18.2022.09.28.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:23:26 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH v2 4/4] staging: vt6655: implement allocation failure handling
Date: Wed, 28 Sep 2022 19:21:50 +0200
Message-Id: <4b88121b8b1aab63c8541c9ed9969315defb4db1.1664384503.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664384503.git.namcaov@gmail.com>
References: <cover.1664384503.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function device_rx_srv does not handle allocation failure very well.
Currently, it performs these steps:
        - Unmap DMA buffer and hand over the buffer to mac80211
        - Allocate and dma-map new buffer
        - If allocation fails, abort

The problem is that, it aborts while still marking the buffer as
OWNED_BY_HOST. So when this function is called again in the future, it
incorrectly perceives the same buffer as valid and dma-unmap and hand
over this buffer to mac80211 again.

Re-implement this function to do things in a different order:
        - Allocate and dma-map new buffer
        - If allocation fails, abort and give up the ownership of the
          buffer (so that the device can re-use this buffer)
        - If allocation does not fail: unmap dma buffer and hand over
          the buffer to mac80211

Thus, when the driver cannot allocate new buffer, it simply discards the
received data and re-use the current buffer.

Also split device_alloc_rx_buf() into 2 parts: allocating new buffer and
initializing the buffer, so that we can read the old buffer in between.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 33 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index c8cae6df7f51..cc952acd9825 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -132,7 +132,8 @@ static int device_init_td1_ring(struct vnt_private *priv);
 
 static int  device_rx_srv(struct vnt_private *priv, unsigned int idx);
 static int  device_tx_srv(struct vnt_private *priv, unsigned int idx);
-static bool device_alloc_rx_buf(struct vnt_private *, struct vnt_rx_desc *);
+static bool device_alloc_rx_buf(struct vnt_private *, struct vnt_rd_info *);
+static void device_init_rx_desc(struct vnt_private *priv, struct vnt_rx_desc *rd);
 static void device_free_rx_buf(struct vnt_private *priv,
 			       struct vnt_rx_desc *rd);
 static void device_init_registers(struct vnt_private *priv);
@@ -611,12 +612,13 @@ static int device_init_rd0_ring(struct vnt_private *priv)
 			goto err_free_desc;
 		}
 
-		if (!device_alloc_rx_buf(priv, desc)) {
+		if (!device_alloc_rx_buf(priv, desc->rd_info)) {
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 			ret = -ENOMEM;
 			goto err_free_rd;
 		}
 
+		device_init_rx_desc(priv, desc);
 		desc->next = &priv->aRD0Ring[(i + 1) % priv->opts.rx_descs0];
 		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_rx_desc));
 	}
@@ -657,12 +659,13 @@ static int device_init_rd1_ring(struct vnt_private *priv)
 			goto err_free_desc;
 		}
 
-		if (!device_alloc_rx_buf(priv, desc)) {
+		if (!device_alloc_rx_buf(priv, desc->rd_info)) {
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 			ret = -ENOMEM;
 			goto err_free_rd;
 		}
 
+		device_init_rx_desc(priv, desc);
 		desc->next = &priv->aRD1Ring[(i + 1) % priv->opts.rx_descs1];
 		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_rx_desc));
 	}
@@ -821,6 +824,7 @@ static void device_free_td1_ring(struct vnt_private *priv)
 static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 {
 	struct vnt_rx_desc *rd;
+	struct vnt_rd_info new_info;
 	int works = 0;
 
 	for (rd = priv->pCurrRD[idx];
@@ -832,13 +836,18 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 		if (!rd->rd_info->skb)
 			break;
 
-		vnt_receive_frame(priv, rd);
-
-		if (!device_alloc_rx_buf(priv, rd)) {
+		if (!device_alloc_rx_buf(priv, &new_info)) {
 			dev_err(&priv->pcid->dev,
 				"can not allocate rx buf\n");
+			rd->rd0.owner = OWNED_BY_NIC;
+			rd = rd->next;
 			break;
 		}
+
+		vnt_receive_frame(priv, rd);
+
+		memcpy(rd->rd_info, &new_info, sizeof(new_info));
+		device_init_rx_desc(priv, rd);
 	}
 
 	priv->pCurrRD[idx] = rd;
@@ -847,10 +856,8 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 }
 
 static bool device_alloc_rx_buf(struct vnt_private *priv,
-				struct vnt_rx_desc *rd)
+				struct vnt_rd_info *rd_info)
 {
-	struct vnt_rd_info *rd_info = rd->rd_info;
-
 	rd_info->skb = dev_alloc_skb((int)priv->rx_buf_sz);
 	if (!rd_info->skb)
 		return false;
@@ -864,15 +871,17 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
 		rd_info->skb = NULL;
 		return false;
 	}
+	return true;
+}
 
+static void device_init_rx_desc(struct vnt_private *priv, struct vnt_rx_desc *rd)
+{
 	*((unsigned int *)&rd->rd0) = 0; /* FIX cast */
 
 	rd->rd0.res_count = cpu_to_le16(priv->rx_buf_sz);
 	rd->rd0.owner = OWNED_BY_NIC;
 	rd->rd1.req_count = cpu_to_le16(priv->rx_buf_sz);
-	rd->buff_addr = cpu_to_le32(rd_info->skb_dma);
-
-	return true;
+	rd->buff_addr = cpu_to_le32(rd->rd_info->skb_dma);
 }
 
 static void device_free_rx_buf(struct vnt_private *priv,
-- 
2.25.1

