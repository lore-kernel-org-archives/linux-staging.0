Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6DA28EA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 09:51:58 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-947a47eb908so16057266b.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680429116; x=1683021116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kLb8IQUT4+CAKzjeCA5AxiV6CvhrMng8FzIucyahWM=;
        b=GmlE4ygRZEOIOnMBg94rr+q76rKLFyj+RlkqpMsBHVrx0rPeQYQIs/dR0nyxdf/EAa
         AnUd8eYZLWB58oL5RYTQJTwWW21ZuqnxQmtSKTd7wQDtsnJAd6F7Go5sXXFiEpeNZc8v
         kjSUdQV2J4v+Ecvh3Q9CpHCopfvzw9SJ9xsqprSUS9fxKul+Sq20RaGrzmQYB+uHToHU
         ivPO38uZm4xVQEcwTKsKt7EpN8RVHfZPG313eoINCLtRz+BtbxBKS41hD3T025tRXnDG
         WUrzGZWr/s/1epGq3pnqHJ4+OFPs9Qi3YazOmzJuc/xxaEBZC5sIreYwbdZVAqaDBGo8
         yvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429116; x=1683021116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kLb8IQUT4+CAKzjeCA5AxiV6CvhrMng8FzIucyahWM=;
        b=E1ByIcISGAh4ZmBlIMVFbsSDYWI0wRtrTPpB70PTh0cVNCA8rfJIhSfVMOnzCe0HYZ
         NVmwN2kp6o1TuC0l/gHH9Rb2VcMqJaY6Sq4muPnHk+Pb725Igm4FhFIKl88y3JieSLxE
         KESJTv1bo0Ys5nK6QtRVH4etuNOxX1Na94m/Afoc+JDEns6ujigS/IKZajuoig6GVBfg
         b80IgMujJX2KS7AjlDK2mzi0/YJgzJqyccAxx0Ivdhpf2zTKXlvuSvFTsdC8pUMm6Rzx
         JuxHhBEG9ROE0HdFSolmN6RdOIGbOk6pev63MsPjry0HCC2UHIjpzQdv4uJ9NR8A6ETe
         3Q/g==
X-Gm-Message-State: AAQBX9fv8pZNMWcUnG153jzYJv2W7c7JT1QjgwwmNS0weLbtHaWZEWp8
	1B7GvjQAlr21MVFIETDSUS4=
X-Google-Smtp-Source: AKy350Y0s0AYsZKidB2zTZIkSdH9NklojZ8K5orQJCFvh/z4GPo/V0Uq3CQEHZEzg4k2UHASeTjzKw==
X-Received: by 2002:a17:906:2098:b0:930:7f40:c1bb with SMTP id 24-20020a170906209800b009307f40c1bbmr9702476ejq.4.1680429116281;
        Sun, 02 Apr 2023 02:51:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709064e5100b009312cc428e4sm3026075ejw.165.2023.04.02.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 02:51:55 -0700 (PDT)
Date: Sun, 2 Apr 2023 11:51:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] staging: rtl8192e: Remove local variable Value and
 powerlevelOFDM24G
Message-ID: <2076dc2f8f5afc11cbab23bc3f5d4ace9bf33bfd.1680427945.git.philipp.g.hortmann@gmail.com>
References: <cover.1680427945.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680427945.git.philipp.g.hortmann@gmail.com>

powerlevelOFDM24G is set to priv->pwr_track. Then Value is set to
powerlevelOFDM24G and then only once used. Remove both variables to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: No changes just rebased
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index a21b3798db48..cde41111012a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -516,10 +516,8 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	bool	viviflag = false;
 	struct dcmd_txcmd tx_cmd;
-	u8	powerlevelOFDM24G;
 	int	i = 0, j = 0, k = 0;
 	u8	tmp_report[5] = {0, 0, 0, 0, 0};
-	u32	Value;
 	u8	Pwr_Flag;
 	u16	Avg_TSSI_Meas, tssi_13dBm, Avg_TSSI_Meas_from_driver = 0;
 	u32	delta = 0;
@@ -528,14 +526,11 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	rtl92e_writeb(dev, FW_Busy_Flag, 0);
 	priv->rtllib->bdynamic_txpower_enable = false;
 
-	powerlevelOFDM24G = priv->pwr_track >> 24;
-	Value = powerlevelOFDM24G;
-
 	for (j = 0; j <= 30; j++) {
 
 		tx_cmd.op	= TXCMD_SET_TX_PWR_TRACKING;
 		tx_cmd.length	= 4;
-		tx_cmd.value	= Value;
+		tx_cmd.value	= priv->pwr_track >> 24;
 		rtl92e_send_cmd_pkt(dev, DESC_PACKET_TYPE_NORMAL, (u8 *)&tx_cmd,
 				    sizeof(struct dcmd_txcmd));
 		mdelay(1);
-- 
2.40.0

