Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D14B134DC
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvuCVtpZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32337a39009so426104f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208239; x=1697813039; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8MB7xPzHf04XyceB1JLxAP8TnhpBNOxPI35yzUOf6A=;
        b=PvuCVtpZYymXMZJFCBU4Mkgebq3ru8M1QCCATvj7wK33LEHloakjHFsitiOoMP07Qj
         FCf3ClOrX7eW2Y8nBOw6d9nEmHYDKyMZw5M5SEHIUFELb81PONmt5Lt+NvMI2idysVoW
         YHCLIVHD6+VqmDWnazuErUfofPS3Mj7n46L08R/sZVYtVGbS71eI4gBKNuKmtV/xDT2I
         1WbeEep+UPLG2wYBD7Swjpkfn1gmgQlW2RNEnOAgaWHcO20laVuq7puSMHBn6fc2sq46
         A1JQFyFC06cuzAyZuyaK/1Z850ysyrgPjV0f8iMasLdn+wg6ATpa76d39bvzroCWiJZK
         d3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208239; x=1697813039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8MB7xPzHf04XyceB1JLxAP8TnhpBNOxPI35yzUOf6A=;
        b=r8HRv8Ej11ljNNQn1MiuU1ndBYJaHtp+ztTZMbjgIbJU8c76Y0aQxe3ukvfnJIJAzS
         OUMUR8cgA3XgDmYqv26zC4D6R27ABOfPCJm/bpZu9FdNJdgtAIIHnSEo+iqgsqfuZLLF
         oTSUrsU9bBKd6/a7nAcRg7ykqOFnLIYPuKrXYc4EnDRP5IjBaCHgd+7/2mC7ag/EFRFu
         EeEXie0zim/MfolFqpI7AiHpizQhDlorj/77rIU2lLl9HF8fZVj3AqFFSTolG98lmvkg
         W4VTBhGKNRdQLR0NOJo+YLzWoCO7xeMXlA+Ud4fo6XJXODELVTtopo7yJvkKnNA0N/qx
         MGig==
X-Gm-Message-State: AOJu0YzT1P6tS4rY6+v0weno3Q743L4GhCRCFYnsDMKPSbee9bcGklJn
	O/KsYse8Yo0MPE246Y+7g5g=
X-Google-Smtp-Source: AGHT+IEb9FEF2/ovxsr3Xtts6ZNg+IzB3L73Po3QSFmFUm6EynuuiaLoxiaVJz/+Ezvqx9mCF6KN/g==
X-Received: by 2002:adf:cf0a:0:b0:31a:e54e:c790 with SMTP id o10-20020adfcf0a000000b0031ae54ec790mr23130655wrj.6.1697208238545;
        Fri, 13 Oct 2023 07:43:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id h12-20020a056000000c00b003176aa612b1sm20911022wrx.38.2023.10.13.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:43:58 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:43:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8192e: Remove unchanged variable
 dig_algorithm
Message-ID: <66f7275aa46e68577cc4c20582ffbd16de13f470.1697127817.git.philipp.g.hortmann@gmail.com>
References: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697127817.git.philipp.g.hortmann@gmail.com>

Remove variable dig_algorithm as its value is set to DIG_ALGO_BY_RSSI at
initialization. No further writes to dig_algorithm are done. The
equations result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 11 -----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     |  9 +--------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     |  1 -
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 875540a2079d..bc06c2cab35d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -920,9 +920,6 @@ void rtl92e_init_gain(struct net_device *dev, u8 Operation)
 		case IG_Backup:
 			initial_gain = SCAN_RX_INITIAL_GAIN;
 			BitMask = bMaskByte0;
-			if (dm_digtable.dig_algorithm ==
-			    DIG_ALGO_BY_FALSE_ALARM)
-				rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
 			priv->initgain_backup.xaagccore1 =
 				 rtl92e_get_bb_reg(dev, rOFDM0_XAAGCCore1,
 						   BitMask);
@@ -947,10 +944,6 @@ void rtl92e_init_gain(struct net_device *dev, u8 Operation)
 			break;
 		case IG_Restore:
 			BitMask = 0x7f;
-			if (dm_digtable.dig_algorithm ==
-			    DIG_ALGO_BY_FALSE_ALARM)
-				rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
-
 			rtl92e_set_bb_reg(dev, rOFDM0_XAAGCCore1, BitMask,
 					 (u32)priv->initgain_backup.xaagccore1);
 			rtl92e_set_bb_reg(dev, rOFDM0_XBAGCCore1, BitMask,
@@ -965,10 +958,6 @@ void rtl92e_init_gain(struct net_device *dev, u8 Operation)
 
 			rtl92e_set_tx_power(dev,
 					 priv->rtllib->current_network.channel);
-
-			if (dm_digtable.dig_algorithm ==
-			    DIG_ALGO_BY_FALSE_ALARM)
-				rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x1);
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index bbd18b6cc252..2bbc6a67188c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -913,8 +913,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	dm_digtable.dig_algorithm = DIG_ALGO_BY_RSSI;
-
 	dm_digtable.dig_algorithm_switch = 0;
 
 	dm_digtable.dig_state		= DM_STA_DIG_MAX;
@@ -939,12 +937,7 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 
 static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
 {
-	if (dm_digtable.dig_algorithm == DIG_ALGO_BY_FALSE_ALARM)
-		_rtl92e_dm_ctrl_initgain_byrssi_false_alarm(dev);
-	else if (dm_digtable.dig_algorithm == DIG_ALGO_BY_RSSI)
-		_rtl92e_dm_ctrl_initgain_byrssi_driver(dev);
-	else
-		return;
+	_rtl92e_dm_ctrl_initgain_byrssi_driver(dev);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index faf08763c340..15af490d2dcd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -50,7 +50,6 @@
 
 /*------------------------------Define structure----------------------------*/
 struct dig_t {
-	u8		dig_algorithm;
 	u8		dig_algorithm_switch;
 
 	long		rssi_low_thresh;
-- 
2.42.0

