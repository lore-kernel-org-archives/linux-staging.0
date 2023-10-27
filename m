Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670AF154AC
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fumw7st5"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-581f78a0206so983235eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396747; x=1699001547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9vPJ8qQN6Z7supl7z83Tc2/7ozVv2YV93L49yFOMOU=;
        b=fumw7st572T5yhAZyZCbkv324zgh387BEPHgYhkmw/fL+a6aYN3zZPwy16s2+9v4L/
         +NwwOG4LxhGku2EWkNGUwS0RX908ALrxnXgu4Hhbnxso+WbiDvaAA0MXO1mKEFtfpuCp
         /S3C/eyddI6rPt4eYnZkmlvHx+vL6TtA5wgOQ8DOrtUdiNfI4288kre7L4ufBBMkaUS1
         96CjIqmALgLqd8QG5TmPjHAxyoYC84Mdg/3Lbb7ISaNz8f7V86ngq52ZKuh+FAhD4uKj
         QLOFReAAqQxEgtS4o2NLDlF+cPD/H4E1V2Vi0gi3unbOM/DWzQpSK4vIxuYLcIZapuyP
         G4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396747; x=1699001547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9vPJ8qQN6Z7supl7z83Tc2/7ozVv2YV93L49yFOMOU=;
        b=tXKyTIbgG+AIv1jGF2wpR6cFx1I3DyRZs5FcNHkDTqbqYq6sgR3CKSdSA4bh/0wbSv
         oJScsmPLPMcjOoVteuPQs/gmiAO/pUti8vuRhLplbVq5y84s+VSpkACi20cY7fc5Qzte
         Ll2q++dnP6nBww2/hOzcs37heDHjeMfqWZAVG6UqLWwsqt1D2Uq0gTAHzgv5CB5vEd01
         PJLf8RpCM2P15HPwpMZZfCUbpU5TYwRTPPOJUsU5dvF9jO63QUPCUBxlldDxe0P/k/Ws
         6Zj2Ajo0aebyH7qc4daW1e4dW+hS55bnyCp7eU2SzrW2ymomhvUdQwOtMJqwanrwl3Bq
         uvCg==
X-Gm-Message-State: AOJu0Yy+p0VWhvParJk8BA3DgDj4BCC2H2+z3EcV7uSmc6WNUnMyWRUc
	/tPxmNeGJFfBog7D3sZ0z1EHpIM5srA=
X-Google-Smtp-Source: AGHT+IGdghsjyHgcQd3tYaCfqroNM9abXevTdYe8w/qEljxzK1P1QPX3fgFlhHJfHDY+L9j1WhnlhQ==
X-Received: by 2002:a05:6358:52c1:b0:168:e461:47c with SMTP id z1-20020a05635852c100b00168e461047cmr2801427rwz.18.1698396747363;
        Fri, 27 Oct 2023 01:52:27 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:26 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 05/10] staging: vt6655: Type encoding info dropped from function name "CARDbSetPhyParameter"
Date: Fri, 27 Oct 2023 14:21:54 +0530
Message-Id: <66beb307ac7983b2aa82fa81f6f2362353209859.1698396278.git.opensource206@gmail.com>
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

function name "CARDbSetPhyParameter" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/card.h        | 2 +-
 drivers/staging/vt6655/device_main.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 5fdfc4dc70cc..4f73da832b6a 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -182,7 +182,7 @@ static void calculate_ofdmr_parameter(unsigned char rate,
  *
  * Return Value: None.
  */
-bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
+bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
 {
 	unsigned char cw_max_min = 0;
 	unsigned char slot = 0;
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 22dc359a6565..8c0d06da952f 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -53,7 +53,7 @@ unsigned char CARDbyGetPktType(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
 void CARDbRadioPowerOff(struct vnt_private *priv);
-bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type);
+bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
 bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
 		    u64 qwBSSTimestamp);
 bool CARDbSetBeaconPeriod(struct vnt_private *priv,
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 2152c6850e61..c6627c10a462 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1442,7 +1442,7 @@ static int vnt_config(struct ieee80211_hw *hw, u32 changed)
 		if (priv->byBBType != bb_type) {
 			priv->byBBType = bb_type;
 
-			CARDbSetPhyParameter(priv, priv->byBBType);
+			card_set_phy_parameter(priv, priv->byBBType);
 		}
 	}
 
@@ -1509,7 +1509,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 		else
 			priv->short_slot_time = false;
 
-		CARDbSetPhyParameter(priv, priv->byBBType);
+		card_set_phy_parameter(priv, priv->byBBType);
 		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
-- 
2.34.1

