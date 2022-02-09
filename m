Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71F2C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:42 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id h7-20020a17090a648700b001b927560c2bso1547563pjj.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kgATqU9c1hElp+Wd/gtbcr99xTSxIouLe++OQoZawys=;
        b=LbBAdmqxQGrIHhwPyiZPcCUa9v+KCfzvzxRYxIWNQLtk90sLp5HPW1rbZ3fTnaK0PD
         jJL00j40twvO5u7DEokkXM56xGLUApP3y/ui+i/LRHid8hyfNlMh7UgPtz+BJC7goVDD
         JNu8m5r4mPMWyfFc7d6YemVlXekXfTRETJXehTnQmtflKcVpp3FygNbb4ChqtgSfshvn
         jLMIc1FzrXfcU6SYt+7jtXc6C/REj+RkbRt203rhgNXdP9NhLEZAT9kn2yjlo6egdosJ
         m/woHYjDmMpbNav4OHU/CgrUTet7NUlVlmPupkZqC26XQj8DwGlANGsbby9zji74ZFIT
         NPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kgATqU9c1hElp+Wd/gtbcr99xTSxIouLe++OQoZawys=;
        b=M4Oun2bF9OpYZFW61Fv/Zpg7T3oXiBdkhzhwh/2D6TGakgRTrytryUSpx9JNDiTDAr
         2/riU2Fz7m3Fh1N8od7u73984xP6vy5pjgRDENoln48pfa2sBzE7sUUapAY+wPOga6IH
         O0zdNO9nJDKg40iPkgnY2/RZf581OBVxY7GvuewLl0VYhc/U+50t/A2yB62et+zEYgeY
         J+OdT+MfAv7hOb7D+zfU6tk8W1Ypr+gKkX0uPgNt388o7S0q2DfHfnKg9xBZ37IEP36D
         TWOzSbZynDWZsODyYcQB5myEUS1UqlNAkcqyOtCYSj1S1Q2S3tbXJYslR1gLv8Z5ssPZ
         Jtjg==
X-Gm-Message-State: AOAM532HrQEAZ6UvUnW6cEJRPHMVd9dZVVaxVjokyscrw0pUyJp9fLJv
	OvodFCQdcMHxKdjnbX2FeU8=
X-Google-Smtp-Source: ABdhPJyeJ1klmNjps3PIopH3mxh7qImtE/5HuoP4T+LudKukmBHOLHxD6VIkFCf9FblvEuptqMzscw==
X-Received: by 2002:a17:90a:670a:: with SMTP id n10mr3361325pjj.123.1644424661930;
        Wed, 09 Feb 2022 08:37:41 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:41 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 5/9] staging: r8188eu: remove empty function __nat25_db_print
Date: Wed,  9 Feb 2022 22:06:03 +0530
Message-Id: <98d201e029dba9acf707ed020b5a5604029ca710.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of function __nat25_db_print is empty. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 4951f835feaf..088145118b41 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -319,10 +319,6 @@ static void __nat25_db_network_insert(struct adapter *priv,
 	spin_unlock_bh(&priv->br_ext_lock);
 }
 
-static void __nat25_db_print(struct adapter *priv)
-{
-}
-
 /*
  *	NAT2.5 interface
  */
@@ -422,8 +418,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			__nat25_generate_ipv4_network_addr(networkAddr, &tmp);
 			/* record source IP address and , source mac address into db */
 			__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
-
-			__nat25_db_print(priv);
 			return 0;
 		default:
 			return -1;
@@ -454,7 +448,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			sender = (unsigned int *)arp_ptr;
 			__nat25_generate_ipv4_network_addr(networkAddr, sender);
 			__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
-			__nat25_db_print(priv);
 			return 0;
 		default:
 			return -1;
@@ -535,8 +528,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 
 				__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
 
-				__nat25_db_print(priv);
-
 				if (!priv->ethBrExtInfo.addPPPoETag &&
 				    priv->pppoe_connection_in_progress &&
 				    !memcmp(skb->data+ETH_ALEN, priv->pppoe_addr, ETH_ALEN))
@@ -597,7 +588,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			if (memcmp(&iph->saddr, "\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0", 16)) {
 				__nat25_generate_ipv6_network_addr(networkAddr, (unsigned int *)&iph->saddr);
 				__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
-				__nat25_db_print(priv);
 
 				if (iph->nexthdr == IPPROTO_ICMPV6 &&
 						skb->len > (ETH_HLEN +  sizeof(*iph) + 4)) {
-- 
2.34.1

