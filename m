Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A66F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:56 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so1100316wmf.5
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KoSeXaHuJaBlMQq1S9CyWlExfD1r0dDdqleD/JQYkg=;
        b=RBBNdo/7RBO01xkvWiWQfFMWa22Lxw3XfkxTNoQMY2vktGV0I9sUPN3psB3QI/ZNNO
         OJH2DMzKL9lfvDcfbAvSIwSmYWXbrdpReXBCDRihfkiIJ4BEthf3Dznk0JFBdr4oHUXi
         8rI62dSegf7jBBQDCA8X54PoEFBnogeibO+a82a5zFMFdpT7lCExiKQhqV4khiv4BSBS
         WhVzof/1v2ictaJ3YTOqk95Gi4Fz7rVg9hLEX410Qilfy4yAEoaWYrRHWXTpnqf/qy/E
         P9KSBtZspBxKVEoElpdXsYKZuaZl7KuE0NFLSZe/xUBqtjjq7nOJW7uRyKZQsRC0nqa1
         BUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KoSeXaHuJaBlMQq1S9CyWlExfD1r0dDdqleD/JQYkg=;
        b=BkQeVvz/yK4QyFhNfKa0G5BFyi+ZCTzoA4Gyeg/h4MaO1gCC4b8f2nEjduE+CKq4Rs
         eiB6rkE++tWrmzaZg5OIyiH15aU1upGFZU1ro25KD8iZXHETIDR1TT1LGxYmQI/HEo/A
         7aoouGPbxMvewTtT5DyXzSK2ALlfBBzH8DQh41FwXtoPUZbc8O+1kDmcjLC6CZrAp8zN
         5M/srogUKbNhSTYlg9JSy0XgpPKWNHMnVCfjbNlrEDW80jvJTjzN3SrMpoW91t0MnTD+
         Nh64x7p4MCCWNa2o4abh9yp8N4uF3zi9fMo9J7b2NFItQ5QxBH8TE1QNoeEfyet/lbj1
         cjBw==
X-Gm-Message-State: AOAM533ZqfVTrneeho84qiHem1cmJiA/dzGkcjVsZQHAGTxY1w2u3IiL
	SEpB5v6tsZ59jXnRM2MQkIQ=
X-Google-Smtp-Source: ABdhPJyf4cFyCiDSQsUZ6zA+Dr7qjwM1o7udJI5xRA3erKBjdVF7CunmC9/TayPIrybBb8Al2t7E+A==
X-Received: by 2002:a05:600c:358c:: with SMTP id p12mr2735725wmq.19.1616589894702;
        Wed, 24 Mar 2021 05:44:54 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:54 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/33] Staging: rtl8723bs: remove named enums in wlan_bssdef.h
Date: Wed, 24 Mar 2021 13:44:31 +0100
Message-Id: <20210324124456.25221-9-marcocesati@gmail.com>
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
include/wlan_bssdef.h:

	enum ndis_802_11_wep_status		[name]
	enum ndis_802_11_reload_defaults	[definition]
	enum vrtl_carrier_sense			[name]
	enum vcs_type				[name]
	enum uapsd_max_sp			[name]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 9d63dc003795..a45990bed80c 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -91,7 +91,7 @@ enum ndis_802_11_authentication_mode {
 	Ndis802_11AuthModeMax   /*  Not a real mode, defined as upper bound */
 };
 
-enum ndis_802_11_wep_status {
+enum {
 	Ndis802_11WEPEnabled,
 	Ndis802_11Encryption1Enabled = Ndis802_11WEPEnabled,
 	Ndis802_11WEPDisabled,
@@ -127,11 +127,6 @@ struct ndis_801_11_ai_resfi {
 	u16 AssociationId;
 };
 
-enum ndis_802_11_reload_defaults {
-	Ndis802_11ReloadWEPKeys
-};
-
-
 /*  Key mapping keys require a BSSID */
 
 struct ndis_802_11_wep {
@@ -210,13 +205,13 @@ struct	wlan_network {
 	struct wlan_bcn_info	BcnInfo;
 };
 
-enum vrtl_carrier_sense {
+enum {
 	DISABLE_VCS,
 	ENABLE_VCS,
 	AUTO_VCS
 };
 
-enum vcs_type {
+enum {
 	NONE_VCS,
 	RTS_CTS,
 	CTS_TO_SELF
@@ -228,7 +223,7 @@ enum vcs_type {
 #define PWR_UAPSD 3
 #define PWR_VOIP 4
 
-enum uapsd_max_sp {
+enum {
 	NO_LIMIT,
 	TWO_MSDU,
 	FOUR_MSDU,
-- 
2.30.2

