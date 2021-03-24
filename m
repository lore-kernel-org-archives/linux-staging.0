Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAB70
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e18so24315549wrt.6
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjcH4anbFAppFfLV2eXxqorVZbuvPY9gPL56WIAT0Qs=;
        b=ET+m+KNo6U1ttYIS1q52Y6jO/cJVhQEfYEpSWZilydXyGHWTAJCEUUaJN7Uur2U7I/
         0SbQsbueMrZy2Ctahm4/Slaeme7QUdShmiR7xEaIg2HERlSgR3Vbh3sOhlpE7YAOxUR0
         hJGVDg92d97gp8/XaGbCcJujBbKhoEZsyVOW13WxQNo8j2aO01VCr6ectkVUzd65IsRQ
         6T254YJ/dOYJskVitZWaBQrGoOy7OhP0fH0JjomLdGIefQpus84srWcINVzlSIibpAyO
         F0zyxKIT00MBuQyNCv/X2FshsgR+/EWSFQZ8PCD+XgTG2l+cRg/Ok5DUANGFnJfOjSHr
         lIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjcH4anbFAppFfLV2eXxqorVZbuvPY9gPL56WIAT0Qs=;
        b=RVWjSfOzKz9zpUM98pYJdKkv6C1YIA2OujZ/6pmDraADclgNYpK7qDBNIl7CRkCUDe
         gAakiTMu6LYPanyNb6hX7YqU6aueDNwYbSOkYq3F1T8ztjElmFsxK6mQZKuYyHZ4fXQ5
         jj9cgfrYz0Gs53gaKasrnvYawZ+phPo2MyzhEepvaH1nrx2LvOHqAknnWSP+Suuu6hjA
         25l1080XButRNojJpuwOO39jRsTtbUTZLZDhM2Aoa/e3nT5WdPa2Y2jAOBxAzpeMPc3h
         lK9fWO5ItFyDdAX9GAeSkokjH2a7O8nxZwuZxF/GM6AkPuT6a2pywHvfWzgTTWYIS+WA
         SxPg==
X-Gm-Message-State: AOAM531CspckMe+n1jaMyYriMtaaUSRS2Lf/kjCf5u3UZ2oR6EKO+5Bw
	+iNaXuQh2uMKKc3mz59MKIA=
X-Google-Smtp-Source: ABdhPJzFIB8/8De9FQVDHz8vYAS+GzQIGehQYkVdOthtD7/WFN8J+5uTEF3/JWH21lNBexw9qrrsfQ==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr3254519wra.103.1616589901830;
        Wed, 24 Mar 2021 05:45:01 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:01 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 16/33] Staging: rtl8723bs: remove named enums in wifi.h
Date: Wed, 24 Mar 2021 13:44:39 +0100
Message-Id: <20210324124456.25221-17-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/wifi.h:

	enum wifi_frame_type		[name]
	enum wifi_frame_subtype		[name]
	enum wifi_reg_domain		[definition]
	enum p2p_proto_wk_id		[definition]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 28 ++----------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index efef549bf811..48db55419bb3 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -43,14 +43,14 @@
 /*  This test verifies the WLAN NIC can update the NAV through sending the CTS with large duration. */
 #define	WiFiNavUpperUs				30000	/*  30 ms */
 
-enum wifi_frame_type {
+enum {
 	WIFI_MGT_TYPE  =	(0),
 	WIFI_CTRL_TYPE =	(BIT(2)),
 	WIFI_DATA_TYPE =	(BIT(3)),
 	WIFI_QOS_DATA_TYPE	= (BIT(7)|BIT(3)),	/*  QoS Data */
 };
 
-enum wifi_frame_subtype {
+enum {
 
     /*  below is for mgt frame */
     WIFI_ASSOCREQ       = (0 | WIFI_MGT_TYPE),
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

