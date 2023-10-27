Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B6154B1
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzJo7cTb"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso1754431b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396752; x=1699001552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKuSlWZJl3O7Q/rDrs5s3l3ygimrMHL5aH8Nsn2+Hyo=;
        b=dzJo7cTbSwBP3u+yPE3MZ7DRZYpREh0zLxcmA5nhe7pKu6OlYQSlCLXIQuSJfp6dQ2
         jFnY5e3tRdtRBs5Y5+ZpH86jNCkYg0aGbPntmlxoKuM6LRzFva8yXedXBi8Trs0Sznxa
         DjuR/t0f467I73bfbbyEZR6qYH6fyrANNArsW9qt9gJiH5HJ9nF63qd03s82BYk5Gb0A
         JMl8zE1tGzyZxwOrD8thORcjPU+Lsm/zimdIdBNA2jWBscL6Po8BSEit3daY5anYgPml
         snw5/orqJWvUzBt82n0pjV0n9iVhBXxL1/LdAqLn6VGMtdT4y3Akthzzj2ARUXjvD5se
         NwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396752; x=1699001552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKuSlWZJl3O7Q/rDrs5s3l3ygimrMHL5aH8Nsn2+Hyo=;
        b=jyKVxLDZccZq6FbPxTEXXBkqlz1vumsx0bWbOo30oyKO+9N64apAMgUmGElWeR5OlD
         nqJUgij+Vm+djhxHKEB+z/nfwVGMAw3hlTb9o0/k6/sVzkwbJ1JEanPZSLg5YCFOYcYa
         LVnUt5IW7z+Wfc8rAj8uX8EYAvsgTMftAI3DEZsQSbEC3eGZV+gupQZpWHEByvMKqWJ6
         qrm1Zj1Ko4KwfGJDtSAxXBIYOitjJo4vyr8HEbaJhsrxig4uUw3l7WOoO5+kIj4PZtlm
         eh1YFK1ktwsWOhuSUuRBwGZ9zj7CrVZJJv+2TCEASSQVcCgmEfPDCbkzODtV/VAbfiP/
         op1Q==
X-Gm-Message-State: AOJu0Yw09o3g01TMbstBbOVADYZ9CbhznUbJLjSyV09chq7Ia2eD258J
	dRVx5hY4APE+kJj+LIua3rI=
X-Google-Smtp-Source: AGHT+IFyueIHgkj+fPyPmoXNrGh7gOLatMYsx4WF2Mux494x2OFAi7kBv7DUv719hqOL3d7GXlnQ5g==
X-Received: by 2002:a05:6a21:7185:b0:16b:9f9b:5764 with SMTP id wq5-20020a056a21718500b0016b9f9b5764mr2406402pzb.54.1698396751949;
        Fri, 27 Oct 2023 01:52:31 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:31 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 07/10] staging: vt6655: Type encoding info dropped from function name "CARDbyGetPktType"
Date: Fri, 27 Oct 2023 14:21:56 +0530
Message-Id: <387aa7f3e3c21cab541442d772cec0048f3463ba.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698396278.git.opensource206@gmail.com>
References: <cover.1698396278.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "CARDbyGetPktType" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 4 ++--
 drivers/staging/vt6655/card.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c58a25032a03..7d632d1057c0 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -265,7 +265,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
 		iowrite8(priv->cw_max_min, priv->port_offset + MAC_REG_CWMAXMIN0);
 	}
 
-	priv->packet_type = CARDbyGetPktType(priv);
+	priv->packet_type = card_get_pkt_type(priv);
 
 	CARDvSetRSPINF(priv, bb_type);
 
@@ -684,7 +684,7 @@ bool CARDbIsOFDMinBasicRate(struct vnt_private *priv)
 	return false;
 }
 
-unsigned char CARDbyGetPktType(struct vnt_private *priv)
+unsigned char card_get_pkt_type(struct vnt_private *priv)
 {
 	if (priv->byBBType == BB_TYPE_11A || priv->byBBType == BB_TYPE_11B)
 		return (unsigned char)priv->byBBType;
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 8c0d06da952f..6564682bcd56 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -49,7 +49,7 @@ void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 u64 vt6655_get_current_tsf(struct vnt_private *priv);
 u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval);
 u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2);
-unsigned char CARDbyGetPktType(struct vnt_private *priv);
+unsigned char card_get_pkt_type(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
 void CARDbRadioPowerOff(struct vnt_private *priv);
-- 
2.34.1

