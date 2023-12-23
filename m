Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F72574C
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 02:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="aUxvCD7k"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-594019698b8so1656879eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 18:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296802; x=1703901602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cMw9uPLWTNNtgp8qyV233zk0hgUTq1NsfnpGqgse+s=;
        b=aUxvCD7kUOR8VBmmKqjDqttuwj40w/qhB+2bFU66If9fRZg+I1mWTTJX/ktHrxWo1q
         rqVK+AyXFEqIytl3EDzzY9E2Og/+i3Qc2buYjJltFb6g2FEJeZjFML0H3Bpb3dpLLz1B
         kG4LCGn9umG19VPD5UaYzRzVL/D6kLqhvRaO+1VMrgWm6bBc2vDWmq1JiDHDSrMoJYny
         qVnrhQy3+qXtOSnoH11MvHizDdWcryXQe4K3M8OMc3RoPTCa0l7adLTMGTC2JQ3HB6dQ
         ny1NkEcwptnQy6YFYghJMsRatcVXmW1Kl22rH7zsVD7ChTIJLL3rDUDHuz2FErPRRptZ
         msNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296802; x=1703901602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cMw9uPLWTNNtgp8qyV233zk0hgUTq1NsfnpGqgse+s=;
        b=o2Pyd8WfeFltNII1jC5FAAU+/a0oDkJDX9um1YoG3tkF3W4128Ndk6+YVXTELU/dTU
         zYh864/OnyD9yGezgslilL/o421zP4weWtEbG9ZnIOPCTjQOqpi9TB8wo6WFnJTXKmDm
         LTpO8vJoLqI52ldN+s6w9Zm5EziKKOPrggBYPIhbuD/hCh0qaUVCTgTgYzV5kT/AE9mo
         EKWDyNbkTcBrbUnZgBeWKM+oGfn1U19qujPhzTnO4yWKcRffTr5VjLRBsrHd6rmvaDqE
         /6QmJ7LaUWSVK/piGzTbbLBNEuDuLmxodYcum9kOy1IA12w9o3bcqwqYcEdHXsKBbBfg
         CHsQ==
X-Gm-Message-State: AOJu0YwXgMpLu/4uA8+W7YrbmeNde9v/GmQfVCYV/nUfH+MtYAuesND4
	oBcQTdJnppTuZtO8XSxQgir6zb2WdFBsOA==
X-Google-Smtp-Source: AGHT+IFcCtJelhgjn5S5sHibmlozgH5RuhGV56MxhtIKmbB1P2bMSt992tFWN5qJSkXO56IjxQs4wA==
X-Received: by 2002:a05:6358:52c2:b0:16d:edaa:921c with SMTP id z2-20020a05635852c200b0016dedaa921cmr2205422rwz.12.1703296802301;
        Fri, 22 Dec 2023 18:00:02 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.18.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 18:00:01 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 19/20] Staging: rtl8192e: Rename variable bInitState
Date: Fri, 22 Dec 2023 17:59:41 -0800
Message-Id: <20231223015942.418263-20-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bInitState to init_state to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 4 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 9fd8a7199ee0..0158b5595c3c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1677,8 +1677,8 @@ void rtllib_sta_ps_send_pspoll_frame(struct rtllib_device *ieee);
 void rtllib_start_protocol(struct rtllib_device *ieee);
 void rtllib_stop_protocol(struct rtllib_device *ieee);
 
-void rtllib_EnableNetMonitorMode(struct net_device *dev, bool bInitState);
-void rtllib_DisableNetMonitorMode(struct net_device *dev, bool bInitState);
+void rtllib_EnableNetMonitorMode(struct net_device *dev, bool init_state);
+void rtllib_DisableNetMonitorMode(struct net_device *dev, bool init_state);
 
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee);
 void rtllib_softmac_start_protocol(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e4e1a84932ba..ec7bf27820c6 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -349,26 +349,26 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 
 /* Enables network monitor mode, all rx packets will be received. */
 void rtllib_EnableNetMonitorMode(struct net_device *dev,
-		bool bInitState)
+		bool init_state)
 {
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
 
 	netdev_info(dev, "========>Enter Monitor Mode\n");
 
-	ieee->AllowAllDestAddrHandler(dev, true, !bInitState);
+	ieee->AllowAllDestAddrHandler(dev, true, !init_state);
 }
 
 /* Disables network monitor mode. Only packets destinated to
  * us will be received.
  */
 void rtllib_DisableNetMonitorMode(struct net_device *dev,
-		bool bInitState)
+		bool init_state)
 {
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
 
 	netdev_info(dev, "========>Exit Monitor Mode\n");
 
-	ieee->AllowAllDestAddrHandler(dev, false, !bInitState);
+	ieee->AllowAllDestAddrHandler(dev, false, !init_state);
 }
 
 static void rtllib_send_probe(struct rtllib_device *ieee)
-- 
2.39.2

