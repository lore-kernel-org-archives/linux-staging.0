Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE46D0C
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id k128so11051688wmk.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zt8wwpKO+XJo6Mj2sE4A/VzWqBUSgjIzVt+IoK73rXY=;
        b=RVXnw+90mNdZD4Nv9EOVBkzKXs0eCQjA9z3bA0byKAkFNH0vMDbEmKrCZpZShCGfrP
         nlKUMXPVGsdQKulvLAbM3Xjoe30qd+FkWj4Enz7J8TeaZQIfcZsH/cMeK6MuH4aufjoE
         qucGOk8srOjYOyBd1ueH7j6w4iSuDmfK6yQdCNLYFa6FOQhqe/Yju1ec7o0YwVxCWIH6
         +xslwIrezOXi5CSOzpFVneiZdz38RG8Uo79LluWJT/2HRf1/dOao/dEIxRWfNNwvjJz0
         b2YhD+dslvx1/dx9DP1wkdN3qIaj2ipBsUMILeemyHyehfiU1rDXakt/kDMMI7wUi+Ix
         xWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zt8wwpKO+XJo6Mj2sE4A/VzWqBUSgjIzVt+IoK73rXY=;
        b=qMEf970UBBTCn5OgOWuN/GkUtJzcgpJQNLF+BMUUoFYUriMwnnp99RGiHPtMraps0O
         e4vRGDQ9x7xMqDHOTBwQyWF69pEHV+2TgQBHdDXpK7N4iHGfVK8ybRqPHrLmQ2DO2odl
         6FzozBfxn+qFhBX9m3Fp6+DgGWJqUiEemwW48dwAJPFEZuoK1ucRufCYQNXpGlws/dzi
         bquCzqLxgZ76vvuc2p3ruQQy0IqEoWM1Q6wkyXAT7xbwh5lOoWFG791CECZxO62ihU+t
         l9qAOTpFP7pekubSpo5MrxywZn30417oAuos1qD/bnPKtmrhXcvxBQb5A2bMIuCDVgwg
         qhcg==
X-Gm-Message-State: AOAM532hgadCLL+tEq+LH4VQU8otbI6cGxZltAlVqBG1V3sJeFbwS3oM
	EfizeBoZtc6bNFWXZ/luWxk=
X-Google-Smtp-Source: ABdhPJxykWymjDJxX6nfQD9Fx5fRA/xZvO867ixRbVXSd6LbzND6fSvFVBAGSLqiJDUUSvx/h4ps9w==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr4299796wmi.32.1616611126969;
        Wed, 24 Mar 2021 11:38:46 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:46 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/21] Staging: rtl8723bs: remove enums in wifi.h
Date: Wed, 24 Mar 2021 19:38:36 +0100
Message-Id: <20210324183847.5595-11-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/wifi.h:

	enum wifi_reg_domain
	enum p2p_proto_wk_id

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index efef549bf811..18abd493e172 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -88,20 +88,6 @@ enum wifi_frame_subtype {
     WIFI_QOS_DATA_NULL	= (BIT(6) | WIFI_QOS_DATA_TYPE),
 };
 
-enum wifi_reg_domain {
-	DOMAIN_FCC		= 1,
-	DOMAIN_IC		= 2,
-	DOMAIN_ETSI		= 3,
-	DOMAIN_SPAIN	= 4,
-	DOMAIN_FRANCE	= 5,
-	DOMAIN_MKK		= 6,
-	DOMAIN_ISRAEL	= 7,
-	DOMAIN_MKK1		= 8,
-	DOMAIN_MKK2		= 9,
-	DOMAIN_MKK3		= 10,
-	DOMAIN_MAX
-};
-
 #define _TO_DS_		BIT(8)
 #define _FROM_DS_	BIT(9)
 #define _MORE_FRAG_	BIT(10)
@@ -778,16 +764,6 @@ enum p2p_wpsinfo {
 
 #define	P2P_PRIVATE_IOCTL_SET_LEN		64
 
-enum p2p_proto_wk_id {
-	P2P_FIND_PHASE_WK = 0,
-	P2P_RESTORE_STATE_WK = 1,
-	P2P_PRE_TX_PROVDISC_PROCESS_WK = 2,
-	P2P_PRE_TX_NEGOREQ_PROCESS_WK = 3,
-	P2P_PRE_TX_INVITEREQ_PROCESS_WK = 4,
-	P2P_AP_P2P_CH_SWITCH_PROCESS_WK = 5,
-	P2P_RO_CH_WK = 6,
-};
-
 /* 	=====================WFD Section ===================== */
 /* 	For Wi-Fi Display */
 #define	WFD_ATTR_DEVICE_INFO			0x00
-- 
2.30.2

