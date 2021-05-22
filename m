Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E20C6D00
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:17:33 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so8598975pjt.1
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SJBXwjmQxlDJj35yQdpTUYgfqMS8ZGbhH8f1wKExiAI=;
        b=f5CY9H36ASBn1z7iIVjqVvKwpIsdmiVpc4bErKrwCYwDd/ocDWLkln//TJ5OxnUAR0
         KaB3IGH6y7rR2w2YsYAVy1vOMwaoViLkAPzsLbJG0FC9QEbWIeOlSyLqyec0il6jxTNW
         cj4dSHlB039QbYcduNNVsfcEz43mQA6TZdVV4UL2jEcEAlJSCCbJJH3YKGEnX+eFV7SE
         gnwOLyFH+3X6W3aeNg74w2CeQK+SquXFvdtTOPSE3ch7M+FZozpEA5daRLkVo7cYd7Gh
         ciMxSqbmGE/44v/bPkJ5um5o1jjp8Rg/2kxOt1V7K9CNPFRAzJ9XzvEVkrSif0EWYsKC
         Q2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SJBXwjmQxlDJj35yQdpTUYgfqMS8ZGbhH8f1wKExiAI=;
        b=BhQIcSgSzOfXEOEBGzpa7gFZFyxwAP4T+MgG1w5Bjk7fMXV3iG5F3dXSj/rAJejOeS
         o96vjdnl1bLINItcrzAngt46bh7KNmayvCR+0LyOPmmPiyK2SyCNo6jmXeDZpLFj7m4h
         Un66XbY6QzQaG1+hEE9m2lZJgC9kVZwjbVwy2V5IL88OiHFl53UivLe+rhAVShT7EN7E
         2OlI307O4AOJcoeWpWnXjYf75hVOzqlp9vTGaYxPMydNtMZpUvBMv4oeOWIFiNFRSEf6
         2noOi9EcpK9L94eH+g6lS14oMYHAtkzOR4A4ph9ji473OhAOwwPQ3+mgCTBSHMAsDAsV
         fvRQ==
X-Gm-Message-State: AOAM5314Wy3r+EJPVb85Xqmw1jcPLfsYRXOMcU5tyAvm1rtyb6FkfRG2
	LPYtW6Oe+UNB8RAxmkicZtA=
X-Google-Smtp-Source: ABdhPJwGB5iKz+5rWwMXPsJYYvHzTN6B1wxi9ylrYzKOyONHI/XUAkMUjWskAK97svpyH0t/wQwG4Q==
X-Received: by 2002:a17:90b:4386:: with SMTP id in6mr15074286pjb.160.1621675052980;
        Sat, 22 May 2021 02:17:32 -0700 (PDT)
Received: from fedora.. ([2405:201:6000:a04d:2131:362f:d566:c9d5])
        by smtp.googlemail.com with ESMTPSA id e23sm6334224pfl.84.2021.05.22.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:17:32 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@bger.kernel.org
Subject: [PATCH 2/2] [RFC] staging: rtl8723bs: remove unnecessary braces from conditionals
Date: Sat, 22 May 2021 14:47:19 +0530
Message-Id: <20210522091719.64277-3-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522091719.64277-1-chouhan.shreyansh630@gmail.com>
References: <20210522091719.64277-1-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the braces from if else statements in core/rtw_wlan_util.c since
the previous commit 6a257dd6de516573 caused all conditional blocks to
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

