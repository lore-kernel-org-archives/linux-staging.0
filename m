Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA96D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:47 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id w23so17006773ejb.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJrwn1454sssqHehz8g/nkG9vVvKy14dYg0aKBzWpPg=;
        b=YnV5IDqisjNL6H9MnxAEE5C3wbphbYe6gHtC+pVy6rBc9wiAhnAW6+b1O/ipTCGvIY
         OwBSooBFzYl7fJgNuxB+h2FEfPOfHgSk7uC7tivFL5myCxWhTfxa+KszD1lwp/yzu4/Z
         V3YZg7xf/MdpiD54/1ccNYLhAXfMALHn4ghT6wkNkvDSoD+tr0fi1Rv1l4/7T7ZcVVl6
         iuGzCKqvVIvKpTbL0wGlJytjqYvcS4Jxsm4LdJBmsBgUdubkwLyST5e6l5LXyg2i2b1p
         5xnwM6mewP3+PAM6Ckg5LnXLJmSjkhZwLaMQCGqGEFcrhMbRsLdoovqrGspzijGAOnGq
         Uwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJrwn1454sssqHehz8g/nkG9vVvKy14dYg0aKBzWpPg=;
        b=gat7+YHXe+8GS4Yb5ryzfJa7PLJrTh6Bwxq7HimV63eoEVUBjrce2IUt4JxDxXCDiR
         eWl2/ezazOOKH5xBeQZZANGc0rJL6M7uT1ndlG6x7aTmm0n8iY0jx9iQB7rYoXzZsDMS
         Vaq1JP6NuA8aRFGeUivuY/LSVZhp5FFovILbpsRQLwikgbg5Puu8zOf8db8cZ/D05+Wo
         f+DPhux6MuLUzi7vSrs11e3a7nVAe0PsrySOQA+1IP52j319/bxWIzW3vCbukcCtAXOR
         qOlbxnBmPLtymBG+ppRal0/xwuCjSqqS7fdLp35v6XttR1yXvgImn2CjjYxsibza7sin
         tdUg==
X-Gm-Message-State: AOAM531acR82SEge2kR+WyiQcoEAhdrpP9gOJ3TH8MzL+10M6bCP5vgq
	J6t3bPE98t6QKcFMyrjRF1XaWJi49GS+Xg==
X-Google-Smtp-Source: ABdhPJyPutMC/IaaSrE/QZC7LDkMe7cBi2sfQ+/PCon+KgRRJAEAwypOrvs1+U6Xj9GDb2Ctjui0tw==
X-Received: by 2002:a17:906:5fce:: with SMTP id k14mr151351ejv.9.1618423906174;
        Wed, 14 Apr 2021 11:11:46 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/57] staging: rtl8723bs: core: rtw_mlme_ext: Deal with a bunch of unused variables
Date: Wed, 14 Apr 2021 19:10:43 +0100
Message-Id: <20210414181129.1628598-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Some are used inside debug prints.  These get marked as __maybe_unused.

Others are used within #ifery.  These are defined inside the same #ifery.

Lastly, ones that are truly unused are removed entirely.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘OnAssocReq’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1058:17: warning: variable ‘reassoc’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘OnAction_back’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1792:30: warning: variable ‘reason_code’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘_linked_info_dump’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:5393:21: warning: variable ‘psta’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘led_blink_hdl’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6517:25: warning: variable ‘ledBlink_param’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ross Schmidt <ross.schm.dev@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f19a15a3924b6..d1dbf234e9e02 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1019,7 +1019,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char 	reassoc, *p, *pos, *wpa_ie;
+	unsigned char __maybe_unused reassoc, *p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char 	supportRate[16];
@@ -1719,7 +1719,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char 	*frame_body;
 	unsigned char 	category, action;
-	unsigned short	tid, status, reason_code = 0;
+	unsigned short	tid, status, __maybe_unused reason_code = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -5121,7 +5121,7 @@ void _linked_info_dump(struct adapter *padapter)
 		} else if ((pmlmeinfo->state&0x03) == _HW_STATE_AP_) {
 			struct list_head	*phead, *plist;
 
-			struct sta_info *psta = NULL;
+			struct sta_info __maybe_unused *psta = NULL;
 			struct sta_priv *pstapriv = &padapter->stapriv;
 
 			spin_lock_bh(&pstapriv->asoc_list_lock);
@@ -5980,7 +5980,8 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	u8 evt_code, evt_seq;
+	u8 evt_seq;
+	u8 evt_code;
 	u16 evt_sz;
 	uint	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
@@ -6191,12 +6192,9 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	struct LedBlink_param *ledBlink_param;
-
 	if (!pbuf)
 		return H2C_PARAMETERS_ERROR;
 
-	ledBlink_param = (struct LedBlink_param *)pbuf;
 	return	H2C_SUCCESS;
 }
 
-- 
2.27.0

