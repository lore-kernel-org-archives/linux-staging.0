Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55CA3FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:16 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u14so14917903ejf.13
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8j2ZRB4ao6UP+171+LDKHORW3G/O4Ani+xbmAGpa/c=;
        b=XF6F6HSbX0/FelJvNhKzKmpj65n2kzG36/VCu90/iM7GGix66Auw867Brys8gA9xTp
         WQSbRnKR0b76ciY3Tq/EtB9lYEoXB61uWpmJ7a3Ifswe4UZ+8FYH1mao0iV1+EwlrusT
         VSGKYwhSTpIwNMELL5wSSpLPxHond9ilfgapgJFe0j0a6pRM4ixxHRT1Aw12jme+BjLj
         h0/uzOHAYA2GhA1pAEZNih93j+XqkeHZCLvGqb+rLFkBIaflA8fgsQ/wHHaDNQ66xwTT
         7I/jexNGIjOJwiH3/yzLIGlpyGYsEPyCwvAJlKOJQa9dewxgJxDzBmq3G6wuOip0JzP8
         YAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8j2ZRB4ao6UP+171+LDKHORW3G/O4Ani+xbmAGpa/c=;
        b=YIDCk3Urn6TzzTvwODZ6WT3mls/xDAo2oJHYwefUvCBpaQE1y8zI2BtBeDG9pTuid1
         TtWkX0RwoS4H5BIcKS2JaWalH8N+e6MngDRHce85DPfVffZvWxSEeZyP/RJf0sClM6Q+
         UzQAsuY87GUN51s5hmWhPmnUmmHfZ4Y3byy23utI09F7GCLcYUD2PYd5TMIxu5WYGamU
         afvola85HRXQ3QFUBEH6AwQ+tag+aB61su4ATwchIQNDNOHdQqutIBJ/Z5NmhDDKlqVA
         sHPrVt6XOcJiCc/6wTEY/TM1FheoRIOLPNZhR8KBxIT+qHx19mlnOY+LiBsTNBUzIpbV
         KvWA==
X-Gm-Message-State: AOAM532uV25i/s0fKhZyXZ1WVS+4X6GPYdbCPXR3McePvBAITKIXdagG
	vGWBRT8dtWFZLJBAjtLCpyo=
X-Google-Smtp-Source: ABdhPJwr7vkbH25VHm4PTReDNHJOOMn65wmfEboAr0ETMHmfSfutv6jUu9GCGmfLvVljYnT+SOzBPg==
X-Received: by 2002:a17:907:168b:: with SMTP id hc11mr14422438ejc.226.1630952715383;
        Mon, 06 Sep 2021 11:25:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 19/40] staging: r8188eu: remove sreset_linked_status_check from hal_ops
Date: Mon,  6 Sep 2021 20:24:17 +0200
Message-Id: <20210906182438.5417-20-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove sreset_linked_status_check from hal_ops and remove its wrapper
rtw_hal_sreset_linked_status_check().
Call rtl8188e_sreset_linked_status_check() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 3 ++-
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 57cf74d30984..2bdc1ed18149 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -10,6 +10,7 @@
 #include "../include/wlan_bssdef.h"
 #include "../include/mlme_osdep.h"
 #include "../include/recv_osdep.h"
+#include "../include/rtl8188e_sreset.h"
 
 static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
@@ -7400,7 +7401,7 @@ void linked_status_chk(struct adapter *padapter)
 	if (padapter->bRxRSSIDisplay)
 		_linked_rx_signal_strehgth_display(padapter);
 
-	rtw_hal_sreset_linked_status_check(padapter);
+	rtl8188e_sreset_linked_status_check(padapter);
 
 	if (is_client_associated_to_ap(padapter)) {
 		/* linked infrastructure client mode */
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index b1a71a8fdf38..1840c4046859 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -221,12 +221,6 @@ void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
 }
 
-void rtw_hal_sreset_linked_status_check(struct adapter *adapt)
-{
-	if (adapt->HalFunc.sreset_linked_status_check)
-		adapt->HalFunc.sreset_linked_status_check(adapt);
-}
-
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *adapt)
 {
 	u8 status = 0;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 9b44fd2d93d7..0ee7da10633a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,7 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->sreset_linked_status_check  = &rtl8188e_sreset_linked_status_check;
 	pHalFunc->sreset_get_wifi_status  = &sreset_get_wifi_status;
 
 	pHalFunc->IOL_exec_cmds_sync = &rtl8188e_IOL_exec_cmds_sync;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 2f4bc16aeabd..baa08d9346f9 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,7 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	void (*sreset_linked_status_check) (struct adapter *padapter);
 	u8 (*sreset_get_wifi_status)(struct adapter *padapter);
 
 	int (*IOL_exec_cmds_sync)(struct adapter *padapter,
@@ -270,7 +269,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
 
-void rtw_hal_sreset_linked_status_check(struct adapter *padapter);
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *padapter);
 
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
-- 
2.33.0

