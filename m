Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FAD149C42
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551123; cv=none; b=PlqlOjGYcRjbVwvrReOy59JBXL/QqJXBbNgIEFJpYHiwWHZ3NLOX0dBCZ0HPAAYoO/dxYeJDCrgbQR4LGEjMFH5+hxWTwqFhKtGKH6v8gvmYyGLDyQRfRuwqFoqAjQQm/7VpPEy5pVxvl33C2N2GQtIvZQQOxRXFAmqEO5ucl7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551123; c=relaxed/simple;
	bh=8zSIpfttX95m36PD/Re1w3MokteJ8O4kuDOGNKsYBfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8MXuJU7Y5t5JCD/eggvXLbLIJf0v/++f6/G/esXr42ML5oen3YmmkHx7crQ7ZmoAfHBwJZ8UjFPAXAInxtYTl5n7Zy3rq2ZajTlX0ITLAt4bVnsC6hVE7snrTCs8PjxnEP76iTiXvdcETEExFHQl1pRyfaozmezfq55r94kFyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=LlMZs+fQ; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="LlMZs+fQ"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e03f8ecef8so2870288b6e.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551120; x=1727155920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5mbYRsj6Nd3jVYuccTxUGwM6zWHiTfD3OTp16s/FMQ=;
        b=LlMZs+fQ98ZG/QfVrDaYK0BKfGjR2giGMSC2oKXnYbErqJbj8FxEi4gizLyPiXiW9A
         z/K/umj23NY+YFC3MbkI72vn9MTHBqda/fGdVr3KwUajWpM6TR/SeO24ns+Q2QMRDtnA
         6uZWU4KyLnnyyQ4Z7f98XEoBZbKkryQ2IgUXE77JLpQkWVr7b596yShUmFs8G3XxJtzg
         OOGKoini9u3LqsLsXt0501j9HyXfaHviyrdcNh40wFtbYCIBaHHZzH5imTGbIaRJktcc
         1mtzIJkUY9ck/ZONn0UKQ2obV8aZSZY80+TfbbXEgOH0uc4IefwPnqqO6X+5bSZl4hq4
         O4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551120; x=1727155920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5mbYRsj6Nd3jVYuccTxUGwM6zWHiTfD3OTp16s/FMQ=;
        b=XlNMqLRQE68KVHKnj/eRnJfzr1DZLOuQAO5DP9aVLn33qoEIGfyBWuSn6VM+13QMSc
         w3XXl+piaFJJTmYdI0FZB4etjzas9fh0Vza89u+E1xeKRJGwEZ9uB6bp8x7xwqyNZ0SS
         ekffmsDkWcDQOFtL6XL9NCQp/2Sg95BvclJDyNyIrsb5qST1yuhDB4NAHR+9GlrDwKv8
         3llG9x11SduXkE8VIBXdhuemw9AJv6oTzmUrrzeGxVj+ArhgFx3DvOIIEb7lpIbhEkok
         Pw5ipyaADamh2fklrIVtz4XjjhOSHJghODITPP2JcNf9t/jTKJARao3VvRFcVp/6uXqx
         Nv7A==
X-Gm-Message-State: AOJu0YywiUA05eHuva0kFCSz9BLpRGizqq2ma8HSentKYEtemuyPwAKa
	i+mHfC4I2DdjfPzyQzK4Sk9ViCIrj+8zFckjSYonSEkYnEokKnjpcXrXtA4ye5M=
X-Google-Smtp-Source: AGHT+IEC7s/Y/5FSwSUzOovr9eWhzwY10d17OVlYZL9RTTdrUwi+pPOqtRNWeCrMtal6UICa6sCjYA==
X-Received: by 2002:a05:6808:138c:b0:3e0:3d83:49c9 with SMTP id 5614622812f47-3e071a85532mr15225206b6e.7.1726551120573;
        Mon, 16 Sep 2024 22:32:00 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:00 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/18] Staging: rtl8192e: Rename variable RxDataNum
Date: Mon, 16 Sep 2024 22:31:41 -0700
Message-Id: <20240917053152.575553-8-tdavies@darkphysics.net>
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

Rename variable RxDataNum to rx_data_num
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index dc1301f1a0c1..32dcccd58b9a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -924,11 +924,11 @@ static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
 			(priv->rtllib->link_detect_info.slot_num);
 	priv->rtllib->link_detect_info.RxBcnNum[slot_index] =
 			priv->rtllib->link_detect_info.num_recv_bcn_in_period;
-	priv->rtllib->link_detect_info.RxDataNum[slot_index] =
+	priv->rtllib->link_detect_info.rx_data_num[slot_index] =
 			priv->rtllib->link_detect_info.num_recv_data_in_period;
 	for (i = 0; i < priv->rtllib->link_detect_info.slot_num; i++) {
 		*TotalRxBcnNum += priv->rtllib->link_detect_info.RxBcnNum[i];
-		*TotalRxDataNum += priv->rtllib->link_detect_info.RxDataNum[i];
+		*TotalRxDataNum += priv->rtllib->link_detect_info.rx_data_num[i];
 	}
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 352b79c2df2f..c6a9cc0b2760 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1086,7 +1086,7 @@ struct rt_link_detect {
 	u32				num_recv_data_in_period;
 
 	u32				RxBcnNum[RT_MAX_LD_SLOT_NUM];
-	u32				RxDataNum[RT_MAX_LD_SLOT_NUM];
+	u32				rx_data_num[RT_MAX_LD_SLOT_NUM];
 	u16				slot_num;
 	u16				slot_index;
 
-- 
2.30.2

