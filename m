Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7111B46B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:20:13 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id mp20so17107053ejc.7
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IxK8DpXvkR4uchbGfoXdnD/22mDhbHmb/J1TTixnGM=;
        b=ZAMAEjTtCW2nWjyyGx8PE2nzQQGpNlo/bT8oy34Ht/nsT9yar0mZ+3FKyWBL48eKEk
         ddVDTzFsyddQ8cbK/uASLlOulscT2V6iAsKjc6unClX2KaAlRs2AUOjHidNQWf0HSExN
         dnfeP3ElO0BFwSM1jVUaczp3jhfoLHL/cq3MdJCSPpx/47dhBZQ3t828LtgIPv+NLpAo
         PBM+HbVjXcb6f5uf2bGBXJQcJty4b8820gt5StMg8IKnMnoKH+/jK/nP+f6F/DMKWNS0
         S86YLB0HLOfg/COI3G3n+sJgueU8PqDoMabXUSEnWzBn1rsHaOdVSg53Vvmn1ohqhvg3
         z65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IxK8DpXvkR4uchbGfoXdnD/22mDhbHmb/J1TTixnGM=;
        b=Lr5HWDcwKFSZMGeNkPFNH4bYRHbSmzFyUZ/B3JPY5b5fJpFTlYZwgYPO6TpADfFLMe
         FSUU/9MSxQhg0sUFtuIKCVBpvzgr9lBQ7s5KSHFepF22WuzU3Z8OKnggla19WkfntGLy
         W6JoQ29K8fupd1FbVP+srGoDuQM1I50tCqJ79rkO5hgBNG1hOdPd+u6VUubYaboYgLli
         F0ed6QqInzsAf4VNTgyNibVA54pft1or49K8Our96kUy5Wxn5jfnLt6ZQ1VLijG9RfrQ
         MaLK4MG9BCb2SUaTNcVpRBzP0a1U9sHqspXlO03XuhFSSr4PnbKIBCcNUQtu2673Uh78
         SbUQ==
X-Gm-Message-State: AFqh2krsjqegizNC4jKBaI76N0aOlGL4Eqy0djczDukNLMpTPta5Zf2j
	tjd3tPL25Q9YZPbMyvZmcNg=
X-Google-Smtp-Source: AMrXdXtE6MJKnQeHbyYQI7CxM1UF+s29/prjBHpAtrMx0GbJa0FVYpuEoUXt+hv/DcuHxioE1uahgA==
X-Received: by 2002:a17:906:d8ba:b0:870:fc65:37a with SMTP id qc26-20020a170906d8ba00b00870fc65037amr51393ejb.3.1673814013009;
        Sun, 15 Jan 2023 12:20:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id ku5-20020a170907788500b0086ca5a99a15sm2184625ejc.80.2023.01.15.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:20:12 -0800 (PST)
Date: Sun, 15 Jan 2023 21:20:10 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Rename Record_CCK_2..,
 Record_CCK_4.. and DefaultIn..
Message-ID: <2963e704afae2382bb7fded0453adbc4a8d48db3.1673812849.git.philipp.g.hortmann@gmail.com>
References: <cover.1673812849.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673812849.git.philipp.g.hortmann@gmail.com>

Rename variable Record_CCK_20Mindex to rec_cck_20m_idx,
Record_CCK_40Mindex to rec_cck_40m_idx and DefaultInitialGain to
def_initial_gain to avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 7ba60d93b9b3..a0233281ad94 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -574,10 +574,10 @@ void rtl92e_get_tx_power(struct net_device *dev)
 	priv->mcs_tx_pwr_level_org_offset[5] =
 		rtl92e_readl(dev, rTxAGC_Mcs15_Mcs12);
 
-	priv->DefaultInitialGain[0] = rtl92e_readb(dev, rOFDM0_XAAGCCore1);
-	priv->DefaultInitialGain[1] = rtl92e_readb(dev, rOFDM0_XBAGCCore1);
-	priv->DefaultInitialGain[2] = rtl92e_readb(dev, rOFDM0_XCAGCCore1);
-	priv->DefaultInitialGain[3] = rtl92e_readb(dev, rOFDM0_XDAGCCore1);
+	priv->def_initial_gain[0] = rtl92e_readb(dev, rOFDM0_XAAGCCore1);
+	priv->def_initial_gain[1] = rtl92e_readb(dev, rOFDM0_XBAGCCore1);
+	priv->def_initial_gain[2] = rtl92e_readb(dev, rOFDM0_XCAGCCore1);
+	priv->def_initial_gain[3] = rtl92e_readb(dev, rOFDM0_XDAGCCore1);
 
 	priv->framesync = rtl92e_readb(dev, rOFDM0_RxDetector3);
 	priv->framesyncC34 = rtl92e_readl(dev, rOFDM0_RxDetector2);
@@ -1072,13 +1072,13 @@ static void _rtl92e_cck_tx_power_track_bw_switch_thermal(struct net_device *dev)
 
 	switch (priv->CurrentChannelBW) {
 	case HT_CHANNEL_WIDTH_20:
-		if (priv->Record_CCK_20Mindex == 0)
-			priv->Record_CCK_20Mindex = 6;
-		priv->cck_index = priv->Record_CCK_20Mindex;
+		if (priv->rec_cck_20m_idx == 0)
+			priv->rec_cck_20m_idx = 6;
+		priv->cck_index = priv->rec_cck_20m_idx;
 	break;
 
 	case HT_CHANNEL_WIDTH_20_40:
-		priv->cck_index = priv->Record_CCK_40Mindex;
+		priv->cck_index = priv->rec_cck_40m_idx;
 	break;
 	}
 	rtl92e_dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index fea5f547b7be..af377f7c7f7b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -499,11 +499,11 @@ struct r8192_priv {
 	u8		ofdm_index[2];
 	u8		cck_index;
 
-	u8		Record_CCK_20Mindex;
-	u8		Record_CCK_40Mindex;
+	u8		rec_cck_20m_idx;
+	u8		rec_cck_40m_idx;
 
 	struct init_gain initgain_backup;
-	u8		DefaultInitialGain[4];
+	u8		def_initial_gain[4];
 	bool		bis_any_nonbepkts;
 	bool		bcurrent_turbo_EDCA;
 	bool		bis_cur_rdlstate;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index f03b479a9143..9789cdd8ac15 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -823,8 +823,8 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 	else
 		tmpCCKindex = tmpCCK20Mindex;
 
-	priv->Record_CCK_20Mindex = tmpCCK20Mindex;
-	priv->Record_CCK_40Mindex = tmpCCK40Mindex;
+	priv->rec_cck_20m_idx = tmpCCK20Mindex;
+	priv->rec_cck_40m_idx = tmpCCK40Mindex;
 
 	if (priv->rtllib->current_network.channel == 14 &&
 	    !priv->bcck_in_ch14) {
@@ -1378,12 +1378,12 @@ static void _rtl92e_dm_initial_gain(struct net_device *dev)
 			dm_digtable.cur_ig_value = gain_range;
 		} else {
 			if (dm_digtable.cur_ig_value == 0)
-				dm_digtable.cur_ig_value = priv->DefaultInitialGain[0];
+				dm_digtable.cur_ig_value = priv->def_initial_gain[0];
 			else
 				dm_digtable.cur_ig_value = dm_digtable.pre_ig_value;
 		}
 	} else {
-		dm_digtable.cur_ig_value = priv->DefaultInitialGain[0];
+		dm_digtable.cur_ig_value = priv->def_initial_gain[0];
 		dm_digtable.pre_ig_value = 0;
 	}
 
-- 
2.39.0

