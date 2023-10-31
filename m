Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F51D507
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSpF0cIj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cbf47fa563so40686245ad.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730493; x=1699335293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5XLM640bv+J0vNNG10yGetIJPvzUtgJiAwDN315ob0=;
        b=GSpF0cIjSloGMzC66Gfg3Phm3hOFQif+51Fa9E+fVnaVHVygVpNL+Kpbz5VnXv/LE6
         EvWoghbM3zCi6Yk7DXUEwi2EGDX9034iVBekZr1VddZmcBRaXZuW3WituNvL/PEf3zG+
         xFiHyniAimxmgUpVWKGpok0e/6UoCarxReMmUGCHmGq1xKATteoFbJ9ca7LiwDwOWted
         ErNrS2WJDybTBXZAcBr3YUTuaC1A+xb9k8n8w4htEcw/RZ/nBfioRodhSj9O38nzyr71
         Stqk7uSsHoQ1iRcevjUi2e8yluthrzMSGjZcGrI/muafAr4ssrIiLJIgtssgjnxcZ/DY
         2vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730493; x=1699335293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5XLM640bv+J0vNNG10yGetIJPvzUtgJiAwDN315ob0=;
        b=uyH1VRPwWDtKNSWA2WcPyPx3DPf06KEcE9f8fVF/U3yY4X6E6q7n/6BTlYcUx4RwHv
         iKr5Nc0lWKgjL1afHmYs9DW3Pia7QwShdKfk6HxSAisey8WjFqpXQK4J2o7sxFEGfPF3
         XBzES4eL/xE/vhL45bKDSJPNsc15DnvZsV/9ViqCSAmH1b0tFXlxvaMCGCHh5OMtcvhl
         x2zET5mRm26i+6VDVmhZe1SrVckk5b03wWnLEZKecb2Ku0Jbi/r2967RtxTd3PzkkfUM
         Zt3OE0P2rPOSWUZ0Rx4DTHSgzxlCRbWXRAQwhNXMyTtHbdoWBdZv3041cqqQlkqhuohg
         6FWA==
X-Gm-Message-State: AOJu0YxaqbVka6JLCoonVNMQ/puD436SQLPk4VmqK55LauI1Ozm2kR6g
	bvxRpA39A5KouqNQxt7IyAw=
X-Google-Smtp-Source: AGHT+IFXqOC/pjhUca0vvLn2/xRT3KFmprpUEOA5nv5+MiueHmEpc8Z1GLdvCMlD4UhZq+kMmKXszg==
X-Received: by 2002:a17:902:f305:b0:1c4:44a0:5c03 with SMTP id c5-20020a170902f30500b001c444a05c03mr8231269ple.9.1698730493314;
        Mon, 30 Oct 2023 22:34:53 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:53 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 06/11] staging: vt6655: Type encoding info dropped from variable name "qwNextTBTT"
Date: Tue, 31 Oct 2023 11:04:29 +0530
Message-Id: <6b1fe342f7577c46a980cdc1bee0c7f560f05d87.1698730318.git.opensource206@gmail.com>
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

variable name "qwTSFOffset" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c18cbf0aad75..e4b40125b094 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -323,19 +323,19 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 bool card_set_beacon_period(struct vnt_private *priv,
 			  unsigned short beacon_interval)
 {
-	u64 qwNextTBTT;
+	u64 next_tbtt;
 
-	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
+	next_tbtt = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
-	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, beacon_interval);
+	next_tbtt = CARDqGetNextTBTT(next_tbtt, beacon_interval);
 
 	/* set HW beacon interval */
 	iowrite16(beacon_interval, priv->port_offset + MAC_REG_BI);
 	priv->beacon_interval = beacon_interval;
 	/* Set NextTBTT */
-	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
-	iowrite32((u32)qwNextTBTT, priv->port_offset + MAC_REG_NEXTTBTT);
-	iowrite32((u32)(qwNextTBTT >> 32), priv->port_offset + MAC_REG_NEXTTBTT + 4);
+	next_tbtt =  le64_to_cpu(next_tbtt);
+	iowrite32((u32)next_tbtt, priv->port_offset + MAC_REG_NEXTTBTT);
+	iowrite32((u32)(next_tbtt >> 32), priv->port_offset + MAC_REG_NEXTTBTT + 4);
 	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
 
 	return true;
@@ -795,15 +795,15 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 			   unsigned short beacon_interval)
 {
 	void __iomem *iobase = priv->port_offset;
-	u64 qwNextTBTT;
+	u64 next_tbtt;
 
-	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
+	next_tbtt = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
-	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, beacon_interval);
+	next_tbtt = CARDqGetNextTBTT(next_tbtt, beacon_interval);
 	/* Set NextTBTT */
-	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
-	iowrite32((u32)qwNextTBTT, iobase + MAC_REG_NEXTTBTT);
-	iowrite32((u32)(qwNextTBTT >> 32), iobase + MAC_REG_NEXTTBTT + 4);
+	next_tbtt =  le64_to_cpu(next_tbtt);
+	iowrite32((u32)next_tbtt, iobase + MAC_REG_NEXTTBTT);
+	iowrite32((u32)(next_tbtt >> 32), iobase + MAC_REG_NEXTTBTT + 4);
 	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
 }
 
-- 
2.34.1

