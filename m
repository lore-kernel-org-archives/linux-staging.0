Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8006FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:09:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e3so18189272wru.13
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5ygW0iNMg8HClPWoVPtKx35n6wKs6NqAz6ewUsuKhU=;
        b=U4uzPDwfHDjBX1sGGDZR/XNANZn19pibtwG3TSQnL7h8NKJjBFoNFxIopM5mF09P4B
         trCEIeBvh8aypzWPgonTJsO5i+f/xkkmUEc05qEoPxe0moqC4EtrpBO0wsgBlH+zqnBa
         UrKuJO9ZesiSt6ssBWl9gx7zdJ8FpfRYlPNiWl62SdvQPb552rdemNgl3TSdID5jGW59
         Fc7n0bmzig2tBVE4zl45CLXRfWMORBGk1QByX1mCzhJmu2+DKNpkP0yJ/sHN3VlcCdQj
         2tJXHR2PM8KmCbVwzGnMssOxseXaqNPgbsPID+skaRPC8X+IsSBXfbBGIck7VmWm5jtl
         lkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5ygW0iNMg8HClPWoVPtKx35n6wKs6NqAz6ewUsuKhU=;
        b=LEdWe6557CpO4+6+VLuoGXpxNvPzpMfBNXZncFXvnT3frQ7zCWLwZoKcD48DGEpBGq
         d0k/YBZnLkOg3gpZLscSvalJjS2zWDnsUO3GXDrPzvqUuu0vUq/k3J3vwi1r4pygc0vf
         D8bTJFvMxG0CCOEZs1qu1G3W13epbUdnT5yVwBiH46oIwCT4Z6rJk/Hca2Gh1AI5whjZ
         cqVbN/3llkHuw9UFcNgcaUay9ijWYA6AYx09bl15tzkm8FP8UUyrsQ7sqpfC2GOM+ht/
         O9FKfb5OrFcjc/7FI07Q6pG2HhAmKel0ebZk80sQuiVVMQhX1wL+DtGFf/prC4BwmjTj
         z6nQ==
X-Gm-Message-State: AFqh2krqJ0P9AnSoDR9wYIVcG8qqrr3HTXQhnuaKYbgECUf4r1+GEBol
	4eevpufQe5NOOB01S7FB0O2O2ghcwQQ=
X-Google-Smtp-Source: AMrXdXsBEHflsPtdPSO01GmeB+48rssoXjzAYdMT6pVDyZekdlTG5+TNb9jTPssgYJ2aHStNGZD+4w==
X-Received: by 2002:a05:6000:69d:b0:2be:184:8af6 with SMTP id bo29-20020a056000069d00b002be01848af6mr6524730wrb.0.1674677341944;
        Wed, 25 Jan 2023 12:09:01 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id q6-20020a056000136600b00241fde8fe04sm2287868wrz.7.2023.01.25.12.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:01 -0800 (PST)
Date: Wed, 25 Jan 2023 21:08:59 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] staging: rtl8192e: Remove unused variables
 num_proc.., recei.. and rxov..
Message-ID: <ff9daec237b795a01629080d0d5f7ec73b2d89da.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

num_process_phyinfo, received_bwtype and rxoverflow are initialized and
increased but never read. Remove dead code. As a result prxsc is unused
which in result makes rxsc_sgien_exflg unused. Remove prxsc and
rxsc_sgien_exflg as well.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: Remove prxsc and rxsc_sgien_exflg
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 13 +------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  4 +---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  3 ---
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index f62547e54261..9d13fda33fbf 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1296,9 +1296,8 @@ static void _rtl92e_query_rxphystatus(
 {
 	struct phy_sts_ofdm_819xpci *pofdm_buf;
 	struct phy_sts_cck_819xpci *pcck_buf;
-	struct phy_ofdm_rx_status_rxsc_sgien_exintfflag *prxsc;
 	u8 *prxpkt;
-	u8 i, max_spatial_stream, tmp_rxsnr, tmp_rxevm, rxsc_sgien_exflg;
+	u8 i, max_spatial_stream, tmp_rxsnr, tmp_rxevm;
 	s8 rx_pwr[4], rx_pwr_all = 0;
 	s8 rx_snrX, rx_evmX;
 	u8 evm, pwdb_all;
@@ -1464,15 +1463,6 @@ static void _rtl92e_query_rxphystatus(
 				precord_stats->RxMIMOSignalQuality[i] = evm & 0xff;
 			}
 		}
-
-
-		rxsc_sgien_exflg = pofdm_buf->rxsc_sgien_exflg;
-		prxsc = (struct phy_ofdm_rx_status_rxsc_sgien_exintfflag *)
-			&rxsc_sgien_exflg;
-		if (pdrvinfo->BW)
-			priv->stats.received_bwtype[1+prxsc->rxsc]++;
-		else
-			priv->stats.received_bwtype[0]++;
 	}
 
 	if (is_cck_rate) {
@@ -1535,7 +1525,6 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	if (!bcheck)
 		return;
 
-	priv->stats.num_process_phyinfo++;
 	if (!prev_st->bIsCCK && prev_st->bPacketToSelf) {
 		for (rfpath = RF90_PATH_A; rfpath < RF90_PATH_C; rfpath++) {
 			if (!rtl92e_is_legal_rf_path(priv->rtllib->dev, rfpath))
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index e0d0f4faeca7..c5fe8e0aa83f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2183,10 +2183,8 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		tasklet_schedule(&priv->irq_rx_tasklet);
 	}
 
-	if (inta & IMR_RXFOVW) {
-		priv->stats.rxoverflow++;
+	if (inta & IMR_RXFOVW)
 		tasklet_schedule(&priv->irq_rx_tasklet);
-	}
 
 	if (inta & IMR_TXFOVW)
 		priv->stats.txoverflow++;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index e38de4d8a467..bb942283bc7a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long num_process_phyinfo;
-	unsigned long received_bwtype[5];
-	unsigned long rxoverflow;
 	unsigned long rxint;
 	unsigned long ints;
 	unsigned long shints;
-- 
2.39.1

