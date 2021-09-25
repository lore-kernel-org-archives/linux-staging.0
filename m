Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA003FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:34:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id c21so45148772edj.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsaAE8HlzAXVTBpCmEq8PUtA22C9vD/GKBl1wD0YUvc=;
        b=ZVoWXZoAZL8GOtYeD+acu6cV0BqHiDwr8mT1gXhbE9HNHObw516FrkxdLwTWVAYiGr
         TYJ3Ct6D3VjrVqXimMh/8k99f5yhXefSLQV2d/2XZfvk25Al+Wx3gMgMbOflLs6rc+2i
         +iQNtUU8MIv+T3DZoKKe5i+SJIelC1GL5m6U0wL62cbiLbp25nh3b/ScsM7bUdjmWYot
         GtO3uH2sg+l82no7ooyvrmJTHir8iHLp9jpaB2Su9V6KyXQV2/1+SrmK+BWbOme8nLyx
         ZMjYzgy+EMSMp9sOwwqwdNxQ100d8WhDLdFuBdI9JFa2KZNaCwp1s5LVH31CE9RmZ6HG
         YiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsaAE8HlzAXVTBpCmEq8PUtA22C9vD/GKBl1wD0YUvc=;
        b=mXO1+pufJUFGjsV6/0vBRDo0O3dMD6AZX2WPWFlRDxKDTN4zcTyAgPb2kXoIhuMCw9
         PFbDvZg8p9zkPl0wPUa5QZLBv2Tdq64/FViKk/6Dmpd5k/F1o/D8ItRBBGEpOnGV2eDU
         1d434P6iOPrtBSEJKdTm1aABQVmOWHxDpwD30hPNE2L8qdcug9k04j1BG0Y8RX3KACjx
         E3RduOuOhSFS5MXiSW4jSnZtVhn/b3vPkOJWXJsJafqe/WLCKTpTt27ujjhHhXJN8iXl
         40tSMqJvfABjRUeu8PDfPG9qwrBov+eA6297dThj+8PSxz6sa40OafONUfazXH4Ohadb
         dgRA==
X-Gm-Message-State: AOAM5315BrUzmY51v0q+eiT+s5oWcKZ7QsyNL7RhO3INYGvu6XR3y9a2
	xwRZom+EdrPdfJ66rGDMXZs=
X-Google-Smtp-Source: ABdhPJyxZYuYSKaA+bjoKIRc4ZBr6dBM6365oxxX+TjikzOH9L3DxfrI4i5BSSzc2RPEqaEO0b5DDQ==
X-Received: by 2002:a17:906:e82:: with SMTP id p2mr15870157ejf.50.1632558849558;
        Sat, 25 Sep 2021 01:34:09 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id p21sm6056514ejm.88.2021.09.25.01.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 01:34:09 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] staging: vt6655: replace camel case b_short_slot_time instead of bShortSlotTime.
Date: Sat, 25 Sep 2021 10:33:42 +0200
Message-Id: <20210925083350.13996-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210925083350.13996-1-tomm.merciai@gmail.com>
References: <20210925083350.13996-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v3:
 - Fix patch changelog.

Changes since v2:
 - Add patch changelog.

Changes since v1:
 - Make the commit message more clearer.

 drivers/staging/vt6655/baseband.c    | 4 ++--
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index f73f3fad3e05..170c4056946f 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2200,7 +2200,7 @@ bb_set_short_slot_time(struct vnt_private *priv)
 
 	bb_read_embedded(priv, 0x0A, &by_bb_rx_conf); /* CR10 */
 
-	if (priv->bShortSlotTime)
+	if (priv->b_short_slot_time)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
 	else
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
@@ -2223,7 +2223,7 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data)
 	/* patch for 3253B0 Baseband with Cardbus module */
 	if (by_data == priv->abyBBVGA[0])
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
-	else if (priv->bShortSlotTime)
+	else if (priv->b_short_slot_time)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
 	else
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 3ef3a6e0e6e1..7a08ea0c7692 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -258,7 +258,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		bb_write_embedded(priv, 0x88, 0x08);
 		bySIFS = C_SIFS_BG;
 
-		if (priv->bShortSlotTime) {
+		if (priv->b_short_slot_time) {
 			bySlot = C_SLOT_SHORT;
 			byDIFS = C_SIFS_BG + 2 * C_SLOT_SHORT;
 		} else {
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 2af769174e33..63aa62e483c8 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -215,7 +215,7 @@ struct vnt_private {
 
 	bool bEncryptionEnable;
 	bool bLongHeader;
-	bool bShortSlotTime;
+	bool b_short_slot_time;
 	bool bProtectMode;
 	bool bNonERPPresent;
 	bool bBarkerPreambleMd;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index d40c2ac14928..8ae0fbfd134f 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1440,9 +1440,9 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		if (conf->use_short_slot)
-			priv->bShortSlotTime = true;
+			priv->b_short_slot_time = true;
 		else
-			priv->bShortSlotTime = false;
+			priv->b_short_slot_time = false;
 
 		CARDbSetPhyParameter(priv, priv->byBBType);
 		bb_set_vga_gain_offset(priv, priv->abyBBVGA[0]);
-- 
2.25.1

