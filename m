Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49F107B8
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GY6kH6bB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28bcc273833so256750a91.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520583; x=1705125383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N42mZy1RgaAJUilwQhTajtyKurcz2hbVBGVg2l51zRg=;
        b=GY6kH6bB87PhLYAnR26gWsyg3+s9JGA/Y5jRQLhSvuIU86T8kGxqu/b47ePSG3GQBh
         BqvQsYFQcVQ71gC/qf7fVGOZIM/FYMUmkRuLetTkkMJtXCkjoQiT2ICDTFgw7vwyEc1e
         yBOz50l5p1Bj2yhjKGqwpwBcNMqx6jE3HH4Q+GeerFoKiGWIgCFsTIUbg0IftvOe7l/M
         xAh+zt+UDTRotPN/MPxbVeIxL8L5O7D0bF6NmNjO4x5pap/2lfpFAKTZVD4DKYEFnLjX
         jS8UZmxw3ZmYCjNC+CjSKu77mFLyMtyVwwJKJ2f9GN32AYrOLxhHS3PRd8QFaI/9obnf
         +34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520583; x=1705125383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N42mZy1RgaAJUilwQhTajtyKurcz2hbVBGVg2l51zRg=;
        b=AZ3oJNLyLfaomIhMiGdaHyt6GVidzk+Pi+yqbyCFxUgHnpuMY915Kd6V0tuVq1f+Fs
         L6NATo6qDATlmsWQaBXaYE1GCJwFJB3fW1vgNjd8EwaB7y2YA4HbCZf9YyZHAv5ibxLq
         enVAwo2YxLCMxFT62Ma3cOFk1rOWA0AwnUtWeN3q89lyH/Ob1e3e6uXTJv3faqSFlO25
         1IwmC8Hmm6V0/5O4sBnVjYnNuxWUeiVs6jmgjEI5AVV2TRFHZVRkufIP0OmnwI7YyWZt
         3mrVL7bhTkmRuieC+UMOR/72vZNOVm7yblaiEJMAsIP/VZePyGYIXHJnjuqgo747E0Bf
         fcJQ==
X-Gm-Message-State: AOJu0YxNjfGm1YiubGe6DMv74jhv0hwL7jlv8ZDK4GZlCOu67NMCpOdP
	CVr7khAVKOmIKxViZ3Wm3rv7zlEWDMJiBQ==
X-Google-Smtp-Source: AGHT+IFNgYABUJkfp3G/eZs+VA7Zg2b6D0hFV/4CrTYr/uVIryh0+5T5Bp8AnxH3AVY4cv7otCv7wg==
X-Received: by 2002:a05:6a20:4f2a:b0:199:6afd:2dd7 with SMTP id gi42-20020a056a204f2a00b001996afd2dd7mr497101pzb.31.1704520582886;
        Fri, 05 Jan 2024 21:56:22 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:22 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/21] Staging: rtl8192e: Rename function SendDisassociation()
Date: Fri,  5 Jan 2024 21:55:52 -0800
Message-Id: <20240106055556.430948-18-tdavies@darkphysics.net>
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

Rename function SendDisassociation to send_disassociation to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 drivers/staging/rtl8192e/rtllib_wx.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d20a1809cffd..c453af8dec47 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1662,7 +1662,7 @@ int rtllib_rx_frame_softmac(struct rtllib_device *ieee, struct sk_buff *skb,
 void rtllib_softmac_new_net(struct rtllib_device *ieee,
 			    struct rtllib_network *net);
 
-void SendDisassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn);
+void send_disassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn);
 void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee);
 
 int rtllib_softmac_init(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 7c5056f9f6f5..b422ffbf0cbc 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1998,7 +1998,7 @@ void rtllib_stop_protocol(struct rtllib_device *ieee)
 
 	if (ieee->link_state == MAC80211_LINKED) {
 		if (ieee->iw_mode == IW_MODE_INFRA)
-			SendDisassociation(ieee, 1, WLAN_REASON_DEAUTH_LEAVING);
+			send_disassociation(ieee, 1, WLAN_REASON_DEAUTH_LEAVING);
 		rtllib_disassociate(ieee);
 	}
 
@@ -2199,7 +2199,7 @@ rtllib_disassociate_skb(struct rtllib_network *beacon,
 	return skb;
 }
 
-void SendDisassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn)
+void send_disassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn)
 {
 	struct rtllib_network *beacon = &ieee->current_network;
 	struct sk_buff *skb;
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index f92ec0faf4d5..55a3e4222cd6 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -636,7 +636,7 @@ int rtllib_wx_set_mlme(struct rtllib_device *ieee,
 
 		ieee->cannot_notify = true;
 
-		SendDisassociation(ieee, deauth, mlme->reason_code);
+		send_disassociation(ieee, deauth, mlme->reason_code);
 		rtllib_disassociate(ieee);
 
 		ieee->wap_set = 0;
-- 
2.39.2

