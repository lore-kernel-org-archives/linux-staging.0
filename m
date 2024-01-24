Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AA13664D
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136301; cv=none; b=F2USqZkBSSsggDAt/IucT9tlQgu6Jiu1Wa8GcdWbJTsf0eTSovTai1W1O3gfNQ7Ddy1ve9Z5JL/DSttK8MqN3+IFYVodgzNbRzBVR/47mnBDSPLN/88Et4A8QPNNgfMjqdPjJJmMBHNk/7Zu7iUefnZ13u6iI8yIlbXwilFCd7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136301; c=relaxed/simple;
	bh=J/YJ1L2U7MOhyvgl74ECxlPzLA74B580IQn9Bn3ngTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BiLbFsvowWeluBfQl7ZYU9jKPdI3/z0pbdMC5/L+uAsWrAcSUfrUwCio7ueKAHlXQACiZqVdaOhNAcgzGxlv04jFBjUbSrB11x8wWmpVVU10sMIfjL3At4E6W8hz50AjWh1u4AFR7GxARvhF2V1t3wfABlf+oLAOPgHiP7UwYxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ZBVsuCCd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZBVsuCCd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d76943baafso24173805ad.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136299; x=1706741099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n891Aa14yCHagKfV0zzWF+pMBWwCfZl9aAjaNjmbXMs=;
        b=ZBVsuCCdN1hs3Y8xqe7ZAYNvkomjUIUNQm1zhxRE/+PfmZcAcTvPChg7Fs2Du6dgUP
         dpE/NcSbJTymd4l0mYzs8PC3fbgEjnGUmfSHsviPwsESAklhKKTZuqTsrBGm5tEj+57u
         eQ58zWoQS3XaMraUAaARj1afOCwt0QisPNiHtEUxf+ouDy1T2kNEa0Y165uvThVOU/1B
         i1PWN07SCauvpzA58MOh8Kape4VJtGdZXD98ClMGr8cdCsCgpTRsR7Lq5eTroa99eh4b
         JOrH/6Tv6H1btoIs7q+c1PbqURr+BBSUiOdByg2ozCtky3f4+wYkX4tWDrdGX7V+LlAO
         LfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136299; x=1706741099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n891Aa14yCHagKfV0zzWF+pMBWwCfZl9aAjaNjmbXMs=;
        b=GDFoQYtLojEUO1cyqxAnOzKWcUpidYmIrI25zNd1Uv6TiOULNcBqadsS3XI8JV6JPm
         eVsEhf6aLgKhHHO0N3dqRgJyorAzWHwU2c3pu8huN9g8moRgXfbSoFQxI5fd8krg8782
         YoKmuM20/cK/k7dW+ajjlYrl6CY8agw5EuOGNF+KN04y4f4req4Uv6SgNwD77tdkC9BU
         apOgXEm4TnLmb2xrzMKVZ5RsU5dWaNNIwtAomvn4EV9C+uMQe2yfye9Xb8U90TqUuWAb
         N5yGRGP4C5DUwSbV3HaKycb2QA0mmABLKrGwxj8HHQs54TCfIBC1MTNV/O8T1Agil094
         AVhw==
X-Gm-Message-State: AOJu0YxhpqzVrLeWCNEoICc+XDanz540GMSImChEJ+iUIiEe0S2uEok2
	XdED0ZPwJZs0757AcBhbc1vCwL2Uzp4GXqEZsA5pqxZMthHVnFTpi30bNbcbnkE=
X-Google-Smtp-Source: AGHT+IHoy77vjPyfWBism+TfdISx1bBbLBC7s1uych+VJs8/75LV7TSdwA7Cw+CKtr0FqAU5jUy1NQ==
X-Received: by 2002:a17:902:d4d0:b0:1d7:8816:a816 with SMTP id o16-20020a170902d4d000b001d78816a816mr94166plg.3.1706136299513;
        Wed, 24 Jan 2024 14:44:59 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:44:59 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/18] Staging: rtl8192e: Rename variable LPSDelayCnt
Date: Wed, 24 Jan 2024 14:44:38 -0800
Message-Id: <20240124224452.968724-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable LPSDelayCnt to lps_delay_cnt to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 4 ++--
 drivers/staging/rtl8192e/rtllib_tx.c         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 76aacd27e157..f986dbb215e4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -705,7 +705,7 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->hw_rf_off_action = 0;
 	priv->set_rf_pwr_state_in_progress = false;
 	priv->rtllib->pwr_save_ctrl.bLeisurePs = true;
-	priv->rtllib->LPSDelayCnt = 0;
+	priv->rtllib->lps_delay_cnt = 0;
 	priv->rtllib->sta_sleep = LPS_IS_WAKE;
 	priv->rtllib->rf_power_state = rf_on;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 94f370b40378..0a366874a827 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1375,7 +1375,7 @@ struct rtllib_device {
 	/* for PS mode */
 	unsigned long last_rx_ps_time;
 	bool			awake_pkt_sent;
-	u8			LPSDelayCnt;
+	u8			lps_delay_cnt;
 
 	/* used if IEEE_SOFTMAC_SINGLE_QUEUE is set */
 	struct sk_buff *mgmt_queue_ring[MGMT_QUEUE_NUM];
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 8a60bf3b7079..b5cd030f28c8 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1351,8 +1351,8 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 	u8 dtim;
 	struct rt_pwr_save_ctrl *psc = &ieee->pwr_save_ctrl;
 
-	if (ieee->LPSDelayCnt) {
-		ieee->LPSDelayCnt--;
+	if (ieee->lps_delay_cnt) {
+		ieee->lps_delay_cnt--;
 		return 0;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index b82f3415085b..e61eb6e87ab4 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -595,14 +595,14 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				   ((((u8 *)udp)[1] == 67) &&
 				   (((u8 *)udp)[3] == 68))) {
 					bdhcp = true;
-					ieee->LPSDelayCnt = 200;
+					ieee->lps_delay_cnt = 200;
 				}
 			}
 		} else if (ether_type == ETH_P_ARP) {
 			netdev_info(ieee->dev,
 				    "=================>DHCP Protocol start tx ARP pkt!!\n");
 			bdhcp = true;
-			ieee->LPSDelayCnt =
+			ieee->lps_delay_cnt =
 				 ieee->current_network.tim.tim_count;
 		}
 	}
-- 
2.39.2

