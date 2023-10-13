Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4325512B7F
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvKIWcQA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32d842adc6bso359227f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208259; x=1697813059; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R65tSR19h2ERSFEN/PYuOVhJkp4kEom7jNZNDOgm2Dw=;
        b=cvKIWcQACUTckc0e7R3GPaPf/fHJV6KKabAMBq9rG+c9iE/3zqWociOnwdP/jn6QYd
         n/u9vdPifeWinX/9hQ6kTvETaisbEmrn7pMWjs6JhkXPhEoQx9xzLbXmwjXXEBIG1Vny
         CdO78iKI9y6X0FdjC5PNhfhbNpTb/Q/PYYQzoWhkIPRgJ6VB7z7aNP/MZeWcHm8y2d3Y
         gcB5Mj/fHQFlWqSZTZ3gj7KcAMTe7KbhpLrB8MX9GaoRN9Dj3c0BXm+0AQ3j47q4Qlgc
         QMFyDOBmi4S4OfsPxwNS3BmThqiiOEcSjZj8UU9OeL82EHZN3lD0dLSCH5RGu7TrTkKv
         azLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208259; x=1697813059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R65tSR19h2ERSFEN/PYuOVhJkp4kEom7jNZNDOgm2Dw=;
        b=QXI3I/lr4ZWBcNG5eNzxp2BrarovfNh6PzjiGv6y1DjQIJ9OSCe6yuJKMhEPdiCgp+
         Sv3VM2FmVetn58UJ2uLpyIxpaECDVh4+41LTqkFySJrWK+6yzOPwBMlZDuLAYgP5WbrQ
         t3NyHTVCwp4l3NCBuAfeMiRuEn9LQVAzg3W7E2dcquSzAPk9EPq3aBgix4/DB7NRFOl3
         p9hZOYIx9yIQe0s+yjAsdVlok899ttmAHBLcrWREZCYAwQ62XcOdXQSVFgiEjAHtcqnW
         UwfW7HnG89hf/6HQstmBnFFBORoj0hsnszyQIsxX0NjkMPzgx/4t1vbvsfb5BJSPpmRD
         tvJw==
X-Gm-Message-State: AOJu0YxgmGbQq/gb4Z5CSLRny3jcuShr3CvDovP1g/qZbBA85dNuHNuq
	3CtFHKd0N1tvp5/fmkx8vWEepJdAJ6I=
X-Google-Smtp-Source: AGHT+IHYPPr6sH0xTh0JgXu27oRZb4vGWPHKDgwKcIcRqvksiJGAB2sO6wYI4wLMOxfcZ4Mm+JGSGQ==
X-Received: by 2002:adf:8b54:0:b0:32d:9a32:6261 with SMTP id v20-20020adf8b54000000b0032d9a326261mr1801911wra.7.1697208259367;
        Fri, 13 Oct 2023 07:44:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id dh13-20020a0560000a8d00b00327cd5e5ac1sm6402480wrb.1.2023.10.13.07.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:44:19 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:44:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: rtl8192e: Remove unused variable dig_state
Message-ID: <7bacd7e152a2d044527924d57efdbbaae0f4c9e8.1697127817.git.philipp.g.hortmann@gmail.com>
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

Remove variable dig_state as it is unused. Remove unused variable
dig_highpwr_state as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 0bd9211500ac..97de404840df 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -911,8 +911,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	dm_digtable.dig_state		= DM_STA_DIG_MAX;
-	dm_digtable.dig_highpwr_state	= DM_STA_DIG_MAX;
 	dm_digtable.cur_sta_connect_state = DIG_STA_DISCONNECT;
 	dm_digtable.pre_sta_connect_state = DIG_STA_DISCONNECT;
 
@@ -964,7 +962,6 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 		for (i = 0; i < 3; i++)
 			rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
 		fw_dig++;
-		dm_digtable.dig_state = DM_STA_DIG_OFF;
 	}
 
 	if (priv->rtllib->link_state == MAC80211_LINKED)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 12b7d426b6b9..80ac77e269fd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -56,8 +56,6 @@ struct dig_t {
 	long		rssi_high_power_lowthresh;
 	long		rssi_high_power_highthresh;
 
-	u8		dig_state;
-	u8		dig_highpwr_state;
 	u8		cur_sta_connect_state;
 	u8		pre_sta_connect_state;
 
-- 
2.42.0

