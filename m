Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D92F3B;
	Wed, 13 Apr 2022 20:11:45 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id j6so2343713qkp.9;
        Wed, 13 Apr 2022 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZneH4LjchLUspCBR6Lavef7yu8zFb5eswSR3q4Bedk=;
        b=kKCkE1mTU+DdqnCj8NCQAqkogQ028mQ2y6QjWGNcQr+hrftJSy+u3+nzCJ96AwSM4r
         oz96E17JiW+6xRft7KWEPXYIXgSI3M2+Zd1m39eXd0OoMk+awKUvRfjMe+u58DEReZb3
         nXiKIewoKfdO217K5vJ3TnVUsXa1Zs4AAYzDJMp7OM4t8wB74i/Io/Gpw+maRs8wxuXz
         cqTNeTYXEq9CB99afzfBBNKUQQTq1ssFY/Lorgn45Ad0Qst4E+bs0vUOm4ukni9WXVk8
         V9g5fXIwL2JNWAnnoXSIxF+vFl2vKeBov44HfZ7GAGB456+rllUtmPNZTUfQ+qu8JWoi
         ZFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZneH4LjchLUspCBR6Lavef7yu8zFb5eswSR3q4Bedk=;
        b=iywM8LXDu1/s5eqgggsMwZFQe9pj3mpAHlAOuKsT7HAOEdjlopSR/SHXN7t0eKNYAY
         RYV2gLyvvHYTX6roaXGGoZ8QBMQXncIUInlxCwVRXN6NQEqmfkts7BFDbeXPoGTy9npw
         i9rlEKfq/J/kWIQ4+ofryt+5wXSgYD/h1do/7Z5DfYxM7JnsIicSJmULVT7MapozNfyZ
         oA8Zb4fmWQN4hxW8lAxheyS8fO4QpnAesnphSeMio19ej3b9MpwIQuFwLNo9QQRLlV5R
         K/yGQZwRQz0mSQflGuP4jKYq/KKMQPk2bjlm4hW4ezTkLmpsF/8bCYZbhUkQnWGLi/8t
         ojmA==
X-Gm-Message-State: AOAM5324FyfnQdf0IR4nmYoR6PIVAdQO/8gvMyG/O4YOxcPdmIjIK0Er
	MOQphiBUSJf9c5iKwYVHUuk=
X-Google-Smtp-Source: ABdhPJy9A6fW1l4McT2TwRVX5CNaNpmRadFkLVNz0G3g8v7kVVnnqa4vb8jKg7THdaJd4RxkGE8h/g==
X-Received: by 2002:a05:620a:4154:b0:69c:6976:1ee4 with SMTP id k20-20020a05620a415400b0069c69761ee4mr551891qko.463.1649880704808;
        Wed, 13 Apr 2022 13:11:44 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 7-20020a370907000000b0069c5598584esm1469827qkj.105.2022.04.13.13.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:11:44 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 2/6] staging: r8188eu: remove spaces before tabs
Date: Wed, 13 Apr 2022 16:11:30 -0400
Message-Id: <9bad09e5de45ce0c369e9eb26c98d0662219e6e3.1649880454.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649880454.git.jhpark1013@gmail.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete spaces before tabs in the comments. Issue found with checkpatch.
WARNING: please, no space before tabs

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d3f4d7cdfa08..2cfd8e8d74a4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -573,8 +573,8 @@ static void rtw_add_network(struct adapter *adapter,
 
 /* select the desired network based on the capability of the (i)bss. */
 /*  check items:	(1) security */
-/* 			(2) network_type */
-/* 			(3) WMM */
+/*			(2) network_type */
+/*			(3) WMM */
 /*			(4) HT */
 /*			(5) others */
 static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
@@ -909,9 +909,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
-		/* 	Commented by Albert 2012/07/21 */
-		/* 	When doing the WPS, the wps_ie_len won't equal to 0 */
-		/* 	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
+		/*	Commented by Albert 2012/07/21 */
+		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
+		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
 			psta->ieee8021x_blocked = true;
 			padapter->securitypriv.wps_ie_len = 0;
@@ -1634,8 +1634,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-/* 		-1		:if there is no pre-auth key in the  table */
-/* 		>= 0		:if there is pre-auth key, and   return the entry id */
+/*		-1		:if there is no pre-auth key in the  table */
+/*		>= 0		:if there is pre-auth key, and   return the entry id */
 /*  */
 /*  */
 
-- 
2.25.1

