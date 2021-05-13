Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D929CA
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 09:42:11 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fgmph4KZ1zlc3Q;
	Thu, 13 May 2021 17:39:56 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 17:42:00 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Aiuto
	<fabioaiuto83@gmail.com>, Hans de Goede <hdegoede@redhat.com>, linux-staging
	<linux-staging@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 2/2] staging: rtl8723bs: core: eliminate erroneous reporting of unused variable 'evt_seq'
Date: Thu, 13 May 2021 17:40:07 +0800
Message-ID: <20210513094007.6435-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210513094007.6435-1-thunder.leizhen@huawei.com>
References: <20210513094007.6435-1-thunder.leizhen@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected

GCC reports the following warning with W=1:

drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6003:15: warning:
 variable ‘evt_seq’ set but not used [-Wunused-but-set-variable]
 6030 |  u8 evt_code, evt_seq;
      |               ^~~~~~~

The local variable ‘evt_seq’ is referenced only when the macro
CHECK_EVENT_SEQ is defined, move its definition and assignment into the
control scope of macro CHECK_EVENT_SEQ, to fix the warning.

By the way, clear local coding style warnings and delete several redundant
blank lines.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index acf5578863e17d7..8b7194ccacac0ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5979,7 +5979,7 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	u8 evt_code, evt_seq;
+	u8 evt_code;
 	u16 evt_sz;
 	uint	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
@@ -5989,19 +5989,23 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 		goto _abort_event_;
 
 	peventbuf = (uint *)pbuf;
-	evt_sz = (u16)(*peventbuf&0xffff);
-	evt_seq = (u8)((*peventbuf>>24)&0x7f);
-	evt_code = (u8)((*peventbuf>>16)&0xff);
+	evt_sz = (u16)(*peventbuf & 0xffff);
+	evt_code = (u8)((*peventbuf >> 16) & 0xff);
 
+#ifdef CHECK_EVENT_SEQ
+{
+	u8 evt_seq;
+
+	evt_seq = (u8)((*peventbuf >> 24) & 0x7f);
 
-	#ifdef CHECK_EVENT_SEQ
 	/*  checking event sequence... */
 	if (evt_seq != (atomic_read(&pevt_priv->event_seq) & 0x7f)) {
-		pevt_priv->event_seq = (evt_seq+1)&0x7f;
+		pevt_priv->event_seq = (evt_seq + 1) & 0x7f;
 
 		goto _abort_event_;
 	}
-	#endif
+}
+#endif
 
 	/*  checking if event code is valid */
 	if (evt_code >= MAX_C2HEVT)
@@ -6023,12 +6027,8 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 		pevt_priv->evt_done_cnt++;
 	}
 
-
 _abort_event_:
-
-
 	return H2C_SUCCESS;
-
 }
 
 u8 h2c_msg_hdl(struct adapter *padapter, unsigned char *pbuf)
-- 
2.26.0.106.g9fadedd


