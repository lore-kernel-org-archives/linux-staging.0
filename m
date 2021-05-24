Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781292F80
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 13:51:19 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id u7so6090998plq.4
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r8hENKovfpvL6qtdxJzB/suCkGhj752NHX7VOuctV34=;
        b=ERK8CtiL4/8YwgrrwO+D0EZ3kHnCqH4RfKxzFBdDq2UqNUrGB1hvYL3SvaDFhT2cAQ
         O6bxOqofbcrxsucfQArl5VorUP0NaYjuThxYXdDfVP/zqeGSQBc52FZKaD+5GQkhvGvq
         XovCQehsX/PwnHIbd0/3gRWAl8iRyAyXEDMLbXdcZ+L2hIHYheOHZqIaJ4pcgLOgLp1p
         VgEdSk3EEf7WQB1j9oBPjQ9KJimOvOTBBj38yYjhXYRi/bL7j7tvjn3RQus9s1V8oXDJ
         MqubMPw3K+5kgs4cnmzLtv3p6k+YY/xId3IaG1c2QnOuQS0eLkCG5fjYyXSsdGXuUXu+
         HHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8hENKovfpvL6qtdxJzB/suCkGhj752NHX7VOuctV34=;
        b=qgSCLMc99PAFw7PC9oGYXgE9ymcKx/m5VKbxXyJhZhLO65CqEM6my+9rrCgUqbvRNX
         gYTA1OnquLPbO90YagF445CZl1vZdhJcLP83bHZycQUTm9wQZvAUgpC3O2q7WpFdt5po
         W3DlVWC1WrYotCfpRf2rE2itJ4RUwH3/aJk05h5UZlYu4tjSo4e8bs59GayBHiCM/nD4
         4q3hCa6wjvIfJ6DaNQWYDNUBpzDF8kzQLwlYddTs0F29x8lbgokvF2oSn5ujZw6c5A7l
         FGgui3oooO1KYqBvAfxci0H9aUpicXB9hzbGG7uM1rxykfeajZ0rKq/xNYRBMAQgYMbA
         2NdA==
X-Gm-Message-State: AOAM533h6wheX/bTBtCM8IAZ7/vzIXTr3dSm23VUTs18pTTLbbgk0Vhy
	HGg0eMzMgFJGjNGZwIiFxq0kaiz3F751kg==
X-Google-Smtp-Source: ABdhPJz0jbc2LkB9lXoPQ4uJ24NWB3wUrOt1yphHzlXsONnxRhE/EHfRL32S4EGveonoA2dqBWz0wQ==
X-Received: by 2002:a17:90a:4bc3:: with SMTP id u3mr25660179pjl.158.1621864279004;
        Mon, 24 May 2021 06:51:19 -0700 (PDT)
Received: from fedora.. ([49.36.218.98])
        by smtp.googlemail.com with ESMTPSA id z9sm8638106pji.47.2021.05.24.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 06:51:18 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com,
	fabioaiuto83@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary braces from conditionals
Date: Mon, 24 May 2021 19:21:04 +0530
Message-Id: <20210524135105.5550-3-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524135105.5550-1-chouhan.shreyansh630@gmail.com>
References: <20210524135105.5550-1-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the braces from if else statements in core/rtw_wlan_util.c since
the previous commit (6a257dd6de516573) caused all conditional blocks to
have a single statement in the function check_assoc_AP.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 36e515a7ab5c..dd965c810967 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1532,25 +1532,24 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 
 		switch (pIE->ElementID) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3))) {
+			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
-			} else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
-				   (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
-				   (!memcmp(pIE->data, BROADCOM_OUI3, 3))) {
-				return HT_IOT_PEER_BROADCOM;
-			} else if (!memcmp(pIE->data, MARVELL_OUI, 3)) {
-				return HT_IOT_PEER_MARVELL;
-			} else if (!memcmp(pIE->data, RALINK_OUI, 3)) {
-				return HT_IOT_PEER_RALINK;
-			} else if (!memcmp(pIE->data, CISCO_OUI, 3)) {
-				return HT_IOT_PEER_CISCO;
-			} else if (!memcmp(pIE->data, REALTEK_OUI, 3)) {
-				return get_realtek_assoc_AP_vender(pIE);
-			} else if (!memcmp(pIE->data, AIRGOCAP_OUI, 3)) {
-				return HT_IOT_PEER_AIRGO;
-			} else {
-				break;
-			}
+			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
+			         (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
+			         (!memcmp(pIE->data, BROADCOM_OUI3, 3)))
+			      return HT_IOT_PEER_BROADCOM;
+			else if (!memcmp(pIE->data, MARVELL_OUI, 3))
+			      return HT_IOT_PEER_MARVELL;
+			else if (!memcmp(pIE->data, RALINK_OUI, 3))
+			      return HT_IOT_PEER_RALINK;
+			else if (!memcmp(pIE->data, CISCO_OUI, 3))
+			      return HT_IOT_PEER_CISCO;
+			else if (!memcmp(pIE->data, REALTEK_OUI, 3))
+			      return get_realtek_assoc_AP_vender(pIE);
+			else if (!memcmp(pIE->data, AIRGOCAP_OUI, 3))
+			      return HT_IOT_PEER_AIRGO;
+			else
+			      break;
 
 		default:
 			break;
-- 
2.31.1

