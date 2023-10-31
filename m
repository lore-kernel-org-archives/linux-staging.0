Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63CD506
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ink2bhzd"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5b980391d70so1791903a12.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730483; x=1699335283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVf1TCOQjv+Cr6JcAc0RWqhLliUBptkMGzKk4XZFEzo=;
        b=ink2bhzdvKCb5A3/s5sXG7Zob0QWRUSxcQJG5Xo2yiR9iNuEVwgqUWsFq+bUM8EoAw
         NNj9qFdRcUapmlTOwF3yRd2fjkAF6ADoZMiyPzQOi3TsvHfEYzvJFsIohmSn/uMETfzi
         Yix+ieyzUH/7fYnn9vfG/qXzlW2MmPh6cTi5AGhqsUg2ja7AxPpLjx4Kf+jbriMHSJaG
         7hYcBaRpJBhTUeDJjS0njxJ6f7hh1Fu3sLvs2FnAHYXtcTIA6s9VwOhjDz4z2rN+QCye
         N9ODIy8BRwmvGz1butG/tE6Sr1duDj8jqBeLnyzcPABGq6lqM8DKpkDjelKa2ky3O6AZ
         zdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730483; x=1699335283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVf1TCOQjv+Cr6JcAc0RWqhLliUBptkMGzKk4XZFEzo=;
        b=X+BelZxm0zosYQhvoFM2UmVhjW72h7CIgX8FQoMFdA3ie04qMXx/JjxHnx7bbMMu07
         tziwGlY96D4Psi+8YLMsGt505158W5/i/vfuT81QgBLkSZsQ0AEDTHbVcIK62/PTxFB8
         Pxxp4qdvoLq6MMlCkopgB7EvOduWxt35ARbk3vTuwN1Vfz3QYYIEJmZ5x/KJ8kHk/5PM
         kXtvPxVPSR8XPeeOrZApADcvKfvgUvw0/ygyo286t/uZhEffWMMVNHtUQJR+EcL8k5DY
         eoJlJzfny48hjyF6Dgc5T0us4ZhYxxJx3obl+R3qo6kFvQvsojGV+6njFKM5jJfLoHIE
         G/HQ==
X-Gm-Message-State: AOJu0YxIuwOMef8b2k6ROakjthXBZS2PqyXLF7MTiM5lBP4vUV7PvAgp
	jFjt24x823tWv5ZLKKFdEuPgq7jLwco=
X-Google-Smtp-Source: AGHT+IFXGFhUU/M369Fhb4bNhxFN6VDO2lvFSFxyKfCqDasScfLG3d+NlkJEFUVueSzAX0VpF7b+Rw==
X-Received: by 2002:a05:6a20:8c19:b0:161:2607:d815 with SMTP id j25-20020a056a208c1900b001612607d815mr10667430pzh.24.1698730483544;
        Mon, 30 Oct 2023 22:34:43 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:43 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 01/11] staging: vt6655: Type encoding info dropped from variable name "qwBSSTimestamp"
Date: Tue, 31 Oct 2023 11:04:24 +0530
Message-Id: <977e5e538610d28dce6a02a6d475ee336fc0899c.1698730318.git.opensource206@gmail.com>
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

variable name "qwBSSTimestamp" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 8 ++++----
 drivers/staging/vt6655/card.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 350ab8f3778a..59a788b7e268 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -280,7 +280,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  *  In:
  *      priv            - The adapter to be sync.
  *      rx_rate         - data rate of receive beacon
- *      qwBSSTimestamp  - Rx BCN's TSF
+ *      bss_timestamp   - Rx BCN's TSF
  *      qwLocalTSF      - Local TSF
  *  Out:
  *      none
@@ -288,15 +288,15 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 qwBSSTimestamp)
+		    u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 qwTSFOffset = 0;
 
 	local_tsf = vt6655_get_current_tsf(priv);
 
-	if (qwBSSTimestamp != local_tsf) {
-		qwTSFOffset = CARDqGetTSFOffset(rx_rate, qwBSSTimestamp,
+	if (bss_timestamp != local_tsf) {
+		qwTSFOffset = CARDqGetTSFOffset(rx_rate, bss_timestamp,
 						local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		qwTSFOffset =  le64_to_cpu(qwTSFOffset);
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 19689a291f5b..cda969b06fce 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -55,7 +55,7 @@ void CARDvSafeResetRx(struct vnt_private *priv);
 void CARDbRadioPowerOff(struct vnt_private *priv);
 bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 qwBSSTimestamp);
+		    u64 bss_timestamp);
 bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 			  unsigned short wBeaconInterval);
 
-- 
2.34.1

