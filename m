Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF86D00
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:20:38 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d78so15863307pfd.10
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 02:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SJBXwjmQxlDJj35yQdpTUYgfqMS8ZGbhH8f1wKExiAI=;
        b=cF9xLTMJ+pU64iRwPGX9er3cCNibQ8WqGQ/BY2TVv0u8rLOaIAp1dpp7OTdYBRfkoR
         Ww/k9H/Zx7IOBUeS/FXsZDZhXOHL8XugRHRmZfF0hJqlIupjtCDE+O3yAHT5cecEshPQ
         h9gZ6/uiew6yhndu5bFXdBHkrGaBC1m2qNQhzxEj9t0eO34P5FIrjRRneiyDQ/CJxaVQ
         /Os13DVq31JTCACtgm546NgYHJVAYTNohJAvfr9bhNkPJNBH2KU4lfmzO8vedEe/QV/P
         btbQZjGzzXhMRA/mZRsgg7RhGR1Ff2MT4BaaxWlMd+xmugZwScfPoHazFllfY7XYLJlo
         HXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SJBXwjmQxlDJj35yQdpTUYgfqMS8ZGbhH8f1wKExiAI=;
        b=gjaHIAhEODqFD2ISfKygyN+c+MRNe0/qEKGZxKRJDa2flxOouAgcvXJZpobJPRDw9j
         wq327/pOv9biJ275SNEp0GgUf1Xy2PgKyQ2S8KYUCfQSdCo+Gn05yznmtyrnWKJS8oxE
         lB4qlDkXo2wUjcl1mbcNU0sion4AMu/f/omxjlqLp7V3hu8kz65cWB5YN6E9x2vhSzIB
         +HmBfrlIhG0/nlwwEPMkBbq3pM3EeEcwbygVCpTq+MqZR+HiK6naSrr05Ww0iBdIFLRJ
         tgCStEV8YO1qvNFabsowQkFD/IBukV47eV87XuLxclWxNfwQAwRj01tyzwale7jC+S0E
         Pgtg==
X-Gm-Message-State: AOAM532qQ6BlodyZH5Dm1vn55g1JLvGZUMPyU+hKRANdC8ags+7PLn9U
	EeQTqIgjYp90h4PKcBBanEw=
X-Google-Smtp-Source: ABdhPJxouJCUIDwK1lWiJC5/3Ax9Y1LMEgCyVT0bJ7ojlaowowixUewyW9YjsSXVI1S/FMwF5y8zGA==
X-Received: by 2002:a62:1a0d:0:b029:2da:21a6:6838 with SMTP id a13-20020a621a0d0000b02902da21a66838mr14142991pfa.76.1621675238568;
        Sat, 22 May 2021 02:20:38 -0700 (PDT)
Received: from fedora.. ([2405:201:6000:a04d:2131:362f:d566:c9d5])
        by smtp.googlemail.com with ESMTPSA id gt23sm5925752pjb.13.2021.05.22.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:20:38 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [Resend] [PATCH 2/2] [RFC] staging: rtl8723bs: remove unnecessary braces from conditionals
Date: Sat, 22 May 2021 14:50:24 +0530
Message-Id: <20210522092024.65018-3-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
References: <20210522092024.65018-1-chouhan.shreyansh630@gmail.com>
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

