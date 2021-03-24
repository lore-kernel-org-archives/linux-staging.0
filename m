Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF170
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id e18so24316550wrt.6
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dA/kKwo/AGg5bRRSI7izI3Vpm/lP44ed2OcA1xp5X94=;
        b=Kt2cG1J4Q6SgDhiFs7KoDoAIqn4KgW7iUV4VvnI1dZp3T0FcgwXeSYQuJhmKfMHjgw
         8EcrNH+H47H6ea2+tggNYd5AghXcL7nroOuYS84nL6YPmKL3lWbNyJ/nYC6zKpO9ZdLi
         j0f0AXHGGTOqfENe8SuxyozXF/DZlJDnV+CVDb0+tyqPpZOALxb1OA4DvfjRmm3FdmpP
         L8JHU3Eo4DquHRsJqvTq37aEDlqNnnOmWEbsgmVYIl7QeBHwh7gdOsgUyRzVusIpLDZz
         nePksHt0w6P5NgW/BPDcVGtJ8Ejeyvu6pJhGaqffBlUZ8UDYJg06ygM+5tPVtlZCpWlm
         FmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dA/kKwo/AGg5bRRSI7izI3Vpm/lP44ed2OcA1xp5X94=;
        b=UcUw+NMVCI6f7qjgnp0jZG8gcnAb027rzMLjQK90p1Cvf0wBBG8AnoHPbBw8mRk4Lp
         KfiKVYyFFgG2CYqDaI7PPvnyS5/10Naw3rAKCM9/XFw0pODt/whDA9rvMsB4+qbCk+9c
         tRSj1HbHX433OfARY83H9ZFKxjyjgy6TuJ7smhTPFT81NztnCl9yGXlvUUyKzFwHsnhz
         FRLDGTxLeP0WVtp+lwl0Mo8FvTJ8sKiNdNVudx5yUtS1S0YzoxjbTp/SMpGWt8Oyxa+k
         WeivvBQOULLWnvOKOzvzPBE+8qI7dXqV37NTAIUJ4rs0LuTO6lERg8lss8C8K/ICx0T4
         UcKw==
X-Gm-Message-State: AOAM5335b5tNt1sJoThlLUyfBovUbAEnyd9ow5Z7kV6BzfhLRu1Tji9U
	Q3SsJ6TK7I01kVkhw3Zutpg=
X-Google-Smtp-Source: ABdhPJz1Z8Dfa4XBeNDdVIyKm0/U/N7zuetF2COASbZxI/SrGkCM5FKINmGSxuWJdcOgwmcharK5kQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr3380847wrd.156.1616589917266;
        Wed, 24 Mar 2021 05:45:17 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:17 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 33/33] Staging: rtl8723bs: remove named enums in HalBtc8723b2Ant.h
Date: Wed, 24 Mar 2021 13:44:56 +0100
Message-Id: <20210324124456.25221-34-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
hal/HalBtc8723b2Ant.h:

	enum bt_info_src_8723b_2ant
	enum bt_8723b_2ant_bt_status
	enum bt_8723b_2ant_coex_algo

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
index 1c220257e2e4..80db3ba34a3f 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
@@ -16,14 +16,14 @@
 
 #define		BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT		2
 
-enum bt_info_src_8723b_2ant {
+enum {
 	BT_INFO_SRC_8723B_2ANT_WIFI_FW        = 0x0,
 	BT_INFO_SRC_8723B_2ANT_BT_RSP         = 0x1,
 	BT_INFO_SRC_8723B_2ANT_BT_ACTIVE_SEND = 0x2,
 	BT_INFO_SRC_8723B_2ANT_MAX
 };
 
-enum bt_8723b_2ant_bt_status {
+enum {
 	BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE = 0x0,
 	BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE     = 0x1,
 	BT_8723B_2ANT_BT_STATUS_INQ_PAGE           = 0x2,
@@ -33,7 +33,7 @@ enum bt_8723b_2ant_bt_status {
 	BT_8723B_2ANT_BT_STATUS_MAX
 };
 
-enum bt_8723b_2ant_coex_algo {
+enum {
 	BT_8723B_2ANT_COEX_ALGO_UNDEFINED       = 0x0,
 	BT_8723B_2ANT_COEX_ALGO_SCO             = 0x1,
 	BT_8723B_2ANT_COEX_ALGO_HID             = 0x2,
-- 
2.30.2

