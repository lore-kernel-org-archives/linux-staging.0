Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14A23A3
	for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 14:58:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so6555984wmq.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 06:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/arEtqUO8wfxYSvaFNgKnF+/02YVjkPsJ1e9Hg8Qsg=;
        b=EiY0/vodIfgdu0k3X2p3c/fRGFbQQ4ddYmIAItYE6pbBlmh5/azx5BOmwR9F6u9nVI
         69o6dnT1mJAIwtbNcFch0+HKlrZAxiIbyb02lm+/AghgrX59nnt0a1wgPjriQe3so3EH
         qjtEKvh6orcP+LN5Dby1Os5jRwZzRJwPawTOfRUkWxYAjq2eEyJjRctgafa5LHFmiLSV
         tRCCzpQ0DdjpGQ1o2jRj8BIwSTgWdC4s7bMWW1eUzPrCA2gX/D2MCMhMHnX3SS7DRxQ1
         xK32YcASzGRO8MiHf9AyYjSDADSxsVwn+Z4LWuOjyh3bPiJdKJbeoT+8DcpLQD7OtgWK
         YQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/arEtqUO8wfxYSvaFNgKnF+/02YVjkPsJ1e9Hg8Qsg=;
        b=taX36UTJBjVOxklppuUlqs8lWuwOuGgp/Qnzu+vgrpKKMf0YP4K9yWNMCLh6KmcBr2
         bLHrqXoeZDkvhAy1/FfcvgYQLf06LDzzGJBPtv9PkI8DOfp5qUOV+bJIo5sJNF0UufjB
         s9ycjX7nJuDPADAyKBNKkq1l1YksR9k25COTr/JA8Qb3lR7jbDe45pvDzVeALSB8peAe
         7T7/11Kuh9CHLwd4i84grtHbH6HcPAQl/qENnJPNA7kZtC2W+38etZe5e6uiWxT04W8e
         cDoFTxUM6lPW04qZxzMFazQrL8mlHbg3UEr9peLLyLgtZ6UqJBKUIvpb1pULh34EpcBq
         XAMQ==
X-Gm-Message-State: AFqh2kqf70mOnZV2I4beKI5dhdDRkZscwQRVaHYVmNZlJUApjPT7In+g
	zzRXhN6RDvPeS75dJUag/3L2rvQnPqQ=
X-Google-Smtp-Source: AMrXdXt/7TLWzDOCJwRw9t+d8pDz2tqYltKXd5znU6nkis/qE6v/QUFriSxILAMQ2RvcY/Fg3/Tkbg==
X-Received: by 2002:a05:600c:5120:b0:3db:21b8:5f53 with SMTP id o32-20020a05600c512000b003db21b85f53mr9978706wms.1.1675004296813;
        Sun, 29 Jan 2023 06:58:16 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c26d300b003dc50c38921sm3173405wmv.35.2023.01.29.06.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:58:16 -0800 (PST)
Date: Sun, 29 Jan 2023 15:58:14 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove unused variable rxSNRdB
Message-ID: <b3150d506556375c4b155c51eabf79e128f50780.1675003608.git.philipp.g.hortmann@gmail.com>
References: <cover.1675003608.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675003608.git.philipp.g.hortmann@gmail.com>

rxSNRdB is initialized and set but never read. Remove dead code. Local
variable rx_snrX is then of no use. Remove rx_snrX as well. Local
variable tmp_rxsnr is then of no use. Remove tmp_rxsnr as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 9 ++-------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 912b50d3fb31..1677b6c5d363 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1297,9 +1297,9 @@ static void _rtl92e_query_rxphystatus(
 	struct phy_sts_ofdm_819xpci *pofdm_buf;
 	struct phy_sts_cck_819xpci *pcck_buf;
 	u8 *prxpkt;
-	u8 i, max_spatial_stream, tmp_rxsnr, tmp_rxevm;
+	u8 i, max_spatial_stream, tmp_rxevm;
 	s8 rx_pwr[4], rx_pwr_all = 0;
-	s8 rx_snrX, rx_evmX;
+	s8 rx_evmX;
 	u8 evm, pwdb_all;
 	u32 RSSI, total_rssi = 0;
 	u8 is_cck_rate = 0;
@@ -1419,11 +1419,6 @@ static void _rtl92e_query_rxphystatus(
 			rx_pwr[i] = ((pofdm_buf->trsw_gain_X[i] & 0x3F) *
 				     2) - 110;
 
-			tmp_rxsnr = pofdm_buf->rxsnr_X[i];
-			rx_snrX = (s8)(tmp_rxsnr);
-			rx_snrX /= 2;
-			priv->stats.rxSNRdB[i] = (long)rx_snrX;
-
 			RSSI = rtl92e_rx_db_to_percent(rx_pwr[i]);
 			if (priv->brfpath_rxenable[i])
 				total_rssi += RSSI;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index a5812dfcd614..d0c88d68b60b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -197,7 +197,6 @@ struct rt_stats {
 	long	recv_signal_power;
 	u8 rx_rssi_percentage[4];
 	u8 rx_evm_percentage[2];
-	long rxSNRdB[4];
 	u32 slide_beacon_pwdb[100];
 	u32 slide_beacon_total;
 	u32	CurrentShowTxate;
-- 
2.39.1

