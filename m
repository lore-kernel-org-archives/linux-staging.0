Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D95C82
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:05:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id bi26-20020a05600c3d9a00b003c1e11f54d2so5851486wmb.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip2o9+ZALd2GpfPZq3Snus/zSEWDttF1wt0Sssb+ofo=;
        b=gLAzdyDo6XM1jMEDutXuWxE/+Cj4VtDUUEO3nD9tyP6Lo64FciT7TsexKqOoiNDWZQ
         wtxVjbLfdhoP9yIZ4lhEjWG+TWpLx6CBod31cKwJttKNbcLKF9JvD55D3Ia+JuCUo7+m
         tokpcD9AXP9hJ5Igg1eccez6O+dYFjX/UGemNaf+RpErPdaxkYgtK505Yulg94fPH2Yz
         3jB60wP2wIGN8K53wHgcnSCIZStIx0+Wp/jyYAv1bBDl0qJhDZ3YIQ/Pt7TG3VfXa+Sw
         Pe78mHi2TDrP9RW8cKrIQlmSPC/wieQOWBnWCLudMtgvLP3k3jJGmz5GC9v3ct/CgKdi
         rmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ip2o9+ZALd2GpfPZq3Snus/zSEWDttF1wt0Sssb+ofo=;
        b=s0UhZI4MGQAIA0lJym9F8IoTXtPUO7EPsNupX64IArUa9oTmAaBteCEcfNe6WSj2jc
         oLjlob4VLpzlfH3NcU76Sv8gWJeW0CUt7RuWZRzHxUUMY1cW9+BbDytQtuxi7USiWg7u
         4UH2gd3YJIBUgjFpU2jr4IlMS3Y2b0zb+AzPES98zTOpUaVDPLHP1Rs2HDPT4DaT19qa
         vwTLBrGXmDZWo+8hpCU+ZM4Y0MQXDIwON+fjhFzb39F7PXwF2pZ/eFtHPmsMU6o2rHb5
         noe6XA7Wxw4NWFlV9FWOP1IW0fs7LAgm76sqBSF1HD2epJVHzdzd5UjmIxXDtjw9QuV8
         8H7A==
X-Gm-Message-State: ACrzQf1NR+obpvdFofKjfOi6l0RfSd7OjHFlh4BjTvm6ViKfK0vInCCm
	FdxTpx9v4vpsO94Ql5MUoH0=
X-Google-Smtp-Source: AMsMyM7WMMHY1ebCXIOST7Qn6W+UuQO7x/Iqy1i653AunrF9JAQZqU9UVYSEUwzBfOD1I/PqhKsCkA==
X-Received: by 2002:a05:600c:1f16:b0:3b4:f20e:6463 with SMTP id bd22-20020a05600c1f1600b003b4f20e6463mr21168837wmb.56.1665428705660;
        Mon, 10 Oct 2022 12:05:05 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id i29-20020a1c541d000000b003c41144b3cfsm8650140wmb.20.2022.10.10.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:05:04 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH 3/3] staging: rtl8192e: Rename Op, Length and Value
Date: Mon, 10 Oct 2022 20:04:57 +0100
Message-Id: <20221010190457.13199-4-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
References: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Op to op, Length to length and Value to value to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 24d97bd5f821..68fe5b16dc39 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -628,9 +628,9 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 
 	for (j = 0; j <= 30; j++) {
 
-		tx_cmd.Op		= TXCMD_SET_TX_PWR_TRACKING;
-		tx_cmd.Length	= 4;
-		tx_cmd.Value		= Value;
+		tx_cmd.op	= TXCMD_SET_TX_PWR_TRACKING;
+		tx_cmd.length	= 4;
+		tx_cmd.value	= Value;
 		rtl92e_send_cmd_pkt(dev, DESC_PACKET_TYPE_NORMAL, (u8 *)&tx_cmd,
 				    sizeof(struct dcmd_txcmd));
 		mdelay(1);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 4eabc313d71e..65df7fa03214 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -152,9 +152,9 @@ enum dm_cck_rx_path_method {
 
 
 struct dcmd_txcmd {
-	u32	Op;
-	u32	Length;
-	u32	Value;
+	u32	op;
+	u32	length;
+	u32	value;
 };
 /*------------------------------Define structure----------------------------*/
 
-- 
2.25.1

