Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAE3847E
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="T2zz4kH2"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso189885a12.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520575; x=1705125375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZdkcjJNenR1FH/tfOzFNMs+x8peXIRAxVD9iNNQRUg=;
        b=T2zz4kH2CUILi8hDpP4M1da4B1WYPq2tnFvMFjqtTAwHcEzC9dLcKMZQKfWc3gI8Q+
         lMMkEn8I9HOXW64Dc9UCHQX1QSlyfzfxqHrLNLTPdoETT42LLLgT42aS38jdsPmc76KP
         DmGWejbl/70bN4deDkpa6YRz0Iwe1MNjz9o6v6uD6oq9fnLYnNey5vCaGSKdb565F8T0
         3FSinPPRvswINS605wkfe/UrNCdR6awJYZdoBc0IMxDv6GGAeHIA1dGSJ9IbrGNb5q3u
         WbdsQBrjjqb+ZMEPM1E00+YEuhXzEDQqkXOuqtQxeDJBOPxRuJwVFzPJ3SNsuafGHeuE
         in7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520575; x=1705125375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZdkcjJNenR1FH/tfOzFNMs+x8peXIRAxVD9iNNQRUg=;
        b=d9wdNTUr8N3Z/dxOXMqOMAgIJCEbhcN4sJFx3c5Tauy+9PHu+x5QCB4olNY5Fl+2iO
         28dSInVImJJCcy0MDz+H2TRt4odlfFzRJQWVCGKAYgVt8VhYG9LU4HxXjsKx4gW+clBr
         dMLYhAbbiRxkYbr5nC8jrSr58icS296XRtTCarDSX01bAWvQIXgL67LRCJtP9aHbtfV+
         yaDOLu45HONZn/kVwLlf57AopIo6bXSHpdNTEp9R0q7c1hdII3A569yihOZzYqVIXJyA
         t/upQ3OSHafG64cAEz8HWT5YoYlljYjGf6rg/ATZAIygRvg9w5/3P2XmlzCEVuCdy2L4
         EspA==
X-Gm-Message-State: AOJu0Yy/cQTxpo7e+QO4sbaAco5cQMD6JKJIzMefnJ5DU2xPu3Lq4Fk/
	3pSEW35u3qOpn08SMdj/XMvkqI1JaUCHqQ==
X-Google-Smtp-Source: AGHT+IFfCeG8c6aNIEvPtknCTwQQ6oy//2eRx0XlMvPPkvigwwIeNc3+k5j97KQqi/+aNXJWKdhB+A==
X-Received: by 2002:a05:6a21:2797:b0:199:1d4:1009 with SMTP id rn23-20020a056a21279700b0019901d41009mr443113pzb.95.1704520575287;
        Fri, 05 Jan 2024 21:56:15 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:15 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/21] Staging: rtl8192e: Rename function rtllib_MgntDisconnect()
Date: Fri,  5 Jan 2024 21:55:44 -0800
Message-Id: <20240106055556.430948-10-tdavies@darkphysics.net>
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

Rename function rtllib_MgntDisconnect to rtllib_mgnt_disconnect fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 16ce207f5bd7..ac72f7dcd5c1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -172,7 +172,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 					priv->blinked_ingpio = true;
 				else
 					priv->blinked_ingpio = false;
-				rtllib_MgntDisconnect(priv->rtllib,
+				rtllib_mgnt_disconnect(priv->rtllib,
 						      WLAN_REASON_DISASSOC_STA_HAS_LEFT);
 			}
 		}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d127528e7932..35c66ecd20e6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1805,7 +1805,7 @@ static inline const char *escape_essid(const char *essid, u8 essid_len)
 }
 
 /* fun with the built-in rtllib stack... */
-bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn);
+bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 asRsn);
 
 /* For the function is more related to hardware setting, it's better to use the
  * ieee handler to refer to it.
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 40d6ae15b246..3d7fad28c414 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2278,7 +2278,7 @@ static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
 	rtllib->link_state = MAC80211_NOLINK;
 }
 
-bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn)
+bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 asRsn)
 {
 	if (rtllib->ps != RTLLIB_PS_DISABLED)
 		rtllib->sta_wake_up(rtllib->dev);
@@ -2290,7 +2290,7 @@ bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn)
 
 	return true;
 }
-EXPORT_SYMBOL(rtllib_MgntDisconnect);
+EXPORT_SYMBOL(rtllib_mgnt_disconnect);
 
 void notify_wx_assoc_event(struct rtllib_device *ieee)
 {
-- 
2.39.2

