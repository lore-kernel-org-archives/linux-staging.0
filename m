Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA15A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 18:54:34 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id p15so14153085ejc.7
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 10:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Ri3bVYAnXxiYaGvnRik7h4+hlVS0hY9TiXALlzUhYY=;
        b=p71WLpom8CBwzQ6n96+OVUxb6GViE1ixM0pX7SHAUOMnypb4usr/7l3ZI8BBeMBogO
         khv3FXbQW84AHPqwX5QhyfH/sSAw+uk8AE9uAPkvFsJfllcc6ffWMPkYWA347lWLRJA4
         fFUvRhwT78CjOPys2ESfDJjmLOQ/3oSteEUTJSfI/jBvTo8wD4bRyhFVGidh3pBCSqBW
         sAQ29bkcFvLRnTdCepzYQsUPZYxA7SRYwx1eXrmWXImLk5jCFN+pn22TBvgXJ6uL55EG
         YHMi07ioLa3TTJLNn5VjKU4Jfk2rwJfCw5QGraeEyexhWOjsrxaRQddQPPsTBDL5Zp3M
         rtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Ri3bVYAnXxiYaGvnRik7h4+hlVS0hY9TiXALlzUhYY=;
        b=mV33Xwxed0YV3zD7gAZfrKZCqUW8gikshK3amIF+pvz200LDpk4sLLp3CY81vcyMVK
         HzSZVNIrimb3C4EwytzYS0ddpRFMF1Y6/HwQxEJLCSuq1Lu702Qud8XxPx4SVOiTuzVq
         hdbfVjEIs4guBi36o71QCtpKLSJ7/AjjQsC7Kjoxa1Vm1GaEnw9+C+ZXThJqtQZnyZYv
         3olmFVn8GROHLld5XsM6MBn/Bo6PeWD9y7tO7s/t3fHD+xS+7bhS2PywEAUm9CZNeiuX
         zk64FItE5Mxsba94yd2UBgxfdxPL/+CTpjGMtlOSvtT5E+y03Dapt8mRH7pOT3HjcZq5
         qGKw==
X-Gm-Message-State: AOAM532mj/uXTvA84bEKu27Le086OTR+6Wn3CHHNrDUluRza/P4ISE0T
	4BBPtkZe88IG82FaahH7cyg=
X-Google-Smtp-Source: ABdhPJxipjjuA2Ab6aX2ZDzxYGE88i39T+CjYXvbZ985rHUeM5A3y5p+xuWoejkSr4Bdjb6Et8wHVQ==
X-Received: by 2002:a17:907:1c8c:b0:6d8:795b:b458 with SMTP id nb12-20020a1709071c8c00b006d8795bb458mr5283423ejc.706.1646938473217;
        Thu, 10 Mar 2022 10:54:33 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id fs6-20020a170907600600b006da8ec6e4a6sm2071346ejc.26.2022.03.10.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:54:32 -0800 (PST)
Date: Thu, 10 Mar 2022 19:54:29 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: vt6656: Remove unused rf_type in rf.c; top level
Message-ID: <e111923dffc4781cf9d4e7966c9f365beb93c5ee.1646935331.git.philipp.g.hortmann@gmail.com>
References: <cover.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646935331.git.philipp.g.hortmann@gmail.com>

Remove rf_type that supports 5GHz band.

To keep a better overview this is only the first part of the patch.
Compiler Warings about unused variables will be removed with the following
patch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/rf.c | 65 ++-----------------------------------
 1 file changed, 2 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/vt6656/rf.c b/drivers/staging/vt6656/rf.c
index b9c06b312ae1..6f57f7af1aed 100644
--- a/drivers/staging/vt6656/rf.c
+++ b/drivers/staging/vt6656/rf.c
@@ -528,10 +528,6 @@ static const struct vnt_table_info vnt_table_seq[][3] = {
 		{&al2230_init_table[0][0], CB_AL2230_INIT_SEQ * 3},
 		{&al2230_channel_table0[0][0], CB_MAX_CHANNEL_24G * 3},
 		{&al2230_channel_table1[0][0], CB_MAX_CHANNEL_24G * 3}
-	}, {	/* RF_AIROHA7230 init table, channel table 0 and 1 */
-		{&al7230_init_table[0][0], CB_AL7230_INIT_SEQ * 3},
-		{&al7230_channel_table0[0][0], CB_MAX_CHANNEL * 3},
-		{&al7230_channel_table1[0][0], CB_MAX_CHANNEL * 3}
 	}, {	/* RF_VT3226 init table, channel table 0 and 1 */
 		{&vt3226_init_table[0][0], CB_VT3226_INIT_SEQ * 3},
 		{&vt3226_channel_table0[0][0], CB_MAX_CHANNEL_24G * 3},
@@ -540,14 +536,6 @@ static const struct vnt_table_info vnt_table_seq[][3] = {
 		{&vt3226d0_init_table[0][0], CB_VT3226_INIT_SEQ * 3},
 		{&vt3226_channel_table0[0][0], CB_MAX_CHANNEL_24G * 3},
 		{&vt3226_channel_table1[0][0], CB_MAX_CHANNEL_24G * 3}
-	}, {	/* RF_VT3342A0 init table, channel table 0 and 1 */
-		{&vt3342a0_init_table[0][0], CB_VT3342_INIT_SEQ * 3},
-		{&vt3342_channel_table0[0][0], CB_MAX_CHANNEL * 3},
-		{&vt3342_channel_table1[0][0], CB_MAX_CHANNEL * 3}
-	}, {	/* RF_AIROHA7230 init table 2 and channel table 2 */
-		{&al7230_init_table_amode[0][0], CB_AL7230_INIT_SEQ * 3},
-		{&al7230_channel_table2[0][0], CB_MAX_CHANNEL * 3},
-		{NULL, 0}
 	}
 };
 
@@ -641,24 +629,6 @@ static int vnt_rf_set_txpower(struct vnt_private *priv, u8 power,
 
 		break;
 
-	case RF_AIROHA7230:
-		if (ch->flags & IEEE80211_CHAN_NO_OFDM)
-			ret = vnt_rf_write_embedded(priv, 0x111bb900);
-		else
-			ret = vnt_rf_write_embedded(priv, 0x221bb900);
-
-		if (ret)
-			return ret;
-
-		/*
-		 * 0x080F1B00 for 3 wire control TxGain(D10)
-		 * and 0x31 as TX Gain value
-		 */
-		power_setting = 0x080c0b00 | (power << 12);
-
-		ret = vnt_rf_write_embedded(priv, power_setting);
-		break;
-
 	case RF_VT3226:
 		power_setting = ((0x3f - power) << 20) | (0x17 << 8);
 
@@ -714,11 +684,6 @@ static int vnt_rf_set_txpower(struct vnt_private *priv, u8 power,
 
 		break;
 
-	case RF_VT3342A0:
-		power_setting =  ((0x3f - power) << 20) | (0x27 << 8);
-
-		ret = vnt_rf_write_embedded(priv, power_setting);
-		break;
 	default:
 		break;
 	}
@@ -766,10 +731,8 @@ void vnt_rf_rssi_to_dbm(struct vnt_private *priv, u8 rssi, long *dbm)
 	switch (priv->rf_type) {
 	case RF_AL2230:
 	case RF_AL2230S:
-	case RF_AIROHA7230:
 	case RF_VT3226:
 	case RF_VT3226D0:
-	case RF_VT3342A0:
 		a = airoharf[idx];
 		break;
 	default:
@@ -790,17 +753,11 @@ int vnt_rf_table_download(struct vnt_private *priv)
 	case RF_AL2230S:
 		idx = 0;
 		break;
-	case RF_AIROHA7230:
-		idx = 1;
-		break;
 	case RF_VT3226:
-		idx = 2;
+		idx = 1;
 		break;
 	case RF_VT3226D0:
-		idx = 3;
-		break;
-	case RF_VT3342A0:
-		idx = 4;
+		idx = 2;
 		break;
 	}
 
@@ -831,23 +788,5 @@ int vnt_rf_table_download(struct vnt_private *priv)
 				     table_seq[VNT_TABLE_1].length,
 				     table_seq[VNT_TABLE_1].addr);
 
-	if (priv->rf_type == RF_AIROHA7230) {
-		table_seq = &vnt_table_seq[5][0];
-
-		/* Init Table 2 */
-		ret = vnt_control_out(priv, MESSAGE_TYPE_WRITE, 0,
-				      MESSAGE_REQUEST_RF_INIT2,
-				      table_seq[VNT_TABLE_INIT_2].length,
-				      table_seq[VNT_TABLE_INIT_2].addr);
-		if (ret)
-			return ret;
-
-		/* Channel Table 2 */
-		ret = vnt_control_out_blocks(priv, VNT_REG_BLOCK_SIZE,
-					     MESSAGE_REQUEST_RF_CH2,
-					     table_seq[VNT_TABLE_2].length,
-					     table_seq[VNT_TABLE_2].addr);
-	}
-
 	return ret;
 }
-- 
2.25.1

