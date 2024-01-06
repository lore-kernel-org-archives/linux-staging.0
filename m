Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD637101C6
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="b57kGsNu"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6dbfdb41a63so193363a34.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520581; x=1705125381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMCv5trULBLT55NBDg4tupxyaVglLY4THsMtNFhieP8=;
        b=b57kGsNuJv8FU0Ux9FFjAXXEItUz544cF6lVU/DwP+TYuRP4IjCqlmgto1PTIM1Z/K
         nigdgqt+mlHDI3IfydDwHk1IJTakSVKXCRhKo+vStUla0oZozzH64pIT7FajMldVFgEu
         HMDXVAkryTWQofVSQlG6Iogvfp5N7pt34MI5LKcD8NL0CqZp6TLQqJDdplx7LEB7t6LK
         +gtDCHDHgig+/nk8FXHoXOU5OY7l2ZA9dYVoz/S45GZVN9G0kv2VLQ++eT426cRncwV1
         RF2Zq7NdpPyg7n2zY6Amf5laDsXTdtHY0dekZLBk7vvQYP6w4iFDfcmviB5h8Cxwqvli
         +2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520581; x=1705125381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMCv5trULBLT55NBDg4tupxyaVglLY4THsMtNFhieP8=;
        b=ZYh6kiW2JKRhnoZrYB7TTP5hAFVcLx2hzHK51g6z0sHLHBUxjrSJNXEufk9ipnnOaA
         /GanHwxXsT58bGFoW0qkhWuxIPbwIwKBIL0RqfQidMfp3Kv+zB5/H+KxoC9leDhZS0tn
         zTWaKMgBaGl9bnWeDYT7GjFm2Epa2tDjqyhj11R2MBGtYye9Xjo15smru6BGO4I+eD/9
         a2+c0yPFg9usClTrhBazfEkeYE70hWU+Z3pkluasCMoDC0AhCfnlFOx6wCzy38JYjPco
         Kxphdh5cMNUolxWCSlXY91VOGVkEeDevhTVQoQ/aErViPf5jFYErhxNc2vMF1+K77nK4
         Ts3Q==
X-Gm-Message-State: AOJu0YzO1fwE0+WntZeTsUG7UhUdnMPjD/slrLrtn5CBZ8BNHfOe7njq
	CNVBJ+PvhvDkYharEFe1BPZwSFwjhU0wYQ==
X-Google-Smtp-Source: AGHT+IFjq5QCpT2Ab8e6eb8zvJePSncO+Q3j/gL0PabkGnEABLuW337/IV1F33Bsx+CNyOO6KDoHhw==
X-Received: by 2002:a05:6808:11ca:b0:3bb:edfd:42db with SMTP id p10-20020a05680811ca00b003bbedfd42dbmr585814oiv.63.1704520581121;
        Fri, 05 Jan 2024 21:56:21 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:20 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/21] Staging: rtl8192e: Rename function RemovePeerTS()
Date: Fri,  5 Jan 2024 21:55:50 -0800
Message-Id: <20240106055556.430948-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function RemovePeerTS to remove_peer_ts to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c    | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f4e48b4a122d..e499f96e9010 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1032,7 +1032,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 
 			ieee->link_state = RTLLIB_ASSOCIATING;
 
-			RemovePeerTS(priv->rtllib,
+			remove_peer_ts(priv->rtllib,
 				     priv->rtllib->current_network.bssid);
 			ieee->is_roaming = true;
 			ieee->is_set_key = false;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 48374cae816d..e9a193b5ab10 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -360,7 +360,7 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 	}
 }
 
-void RemovePeerTS(struct rtllib_device *ieee, u8 *addr)
+void remove_peer_ts(struct rtllib_device *ieee, u8 *addr)
 {
 	struct ts_common_info *ts, *pTmpTS;
 
@@ -400,7 +400,7 @@ void RemovePeerTS(struct rtllib_device *ieee, u8 *addr)
 		}
 	}
 }
-EXPORT_SYMBOL(RemovePeerTS);
+EXPORT_SYMBOL(remove_peer_ts);
 
 void remove_all_ts(struct rtllib_device *ieee)
 {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ed9ca77fbcb9..d20a1809cffd 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1788,7 +1788,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8
 void rtllib_ts_init(struct rtllib_device *ieee);
 void TsStartAddBaProcess(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
-void RemovePeerTS(struct rtllib_device *ieee, u8 *addr);
+void remove_peer_ts(struct rtllib_device *ieee, u8 *addr);
 void remove_all_ts(struct rtllib_device *ieee);
 
 static inline const char *escape_essid(const char *essid, u8 essid_len)
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b9750c9b3952..ff43697768cb 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1736,7 +1736,7 @@ rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 		ieee->is_roaming = true;
 		ieee->link_detect_info.busy_traffic = false;
 		rtllib_disassociate(ieee);
-		RemovePeerTS(ieee, header->addr2);
+		remove_peer_ts(ieee, header->addr2);
 		if (!(ieee->rtllib_ap_sec_type(ieee) &
 		    (SEC_ALG_CCMP | SEC_ALG_TKIP)))
 			schedule_delayed_work(
@@ -2247,7 +2247,7 @@ static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 	u8 i;
 	u8	op_mode;
 
-	RemovePeerTS(rtllib, asSta);
+	remove_peer_ts(rtllib, asSta);
 
 	if (memcmp(rtllib->current_network.bssid, asSta, 6) == 0) {
 		rtllib->link_state = MAC80211_NOLINK;
-- 
2.39.2

