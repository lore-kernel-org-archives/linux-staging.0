Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA943214
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 13:50:28 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id q2so3623269edb.6
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lgIH+anOUapmsDT3madCqkJtVLuh/Inv9K5cFDxhThs=;
        b=lE34wyWOfJ2A+mHfyUMPbaHKwqYn+VsSx0alFzAYSLueTfeysXpz2AA6lhBwktZ+1x
         nG5BuXFVhdwbk8Nhx2541E8Id8vTt+QwctXGG97ez37uMo4jmdIeW9LCK+OuvpsBcVQa
         owTGNQC074Am+gOLo5oxzuL7rBMvTguXgDJMgPbZ3j3znadmzs6Tj7zyJ9q4JRsoxv3y
         KoC7jYKx1rIIxyMQwWPpBv7WvpJqR9KimjVAI2+5Fsu6baC9nC4Acw0qNFl+XcO1Vm8A
         vEhf2MfDYax3H687ISulQe8dw/TeTS42WWrJZuTGZog891s5t6AUIN+GHwUzMp7ptViL
         aMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lgIH+anOUapmsDT3madCqkJtVLuh/Inv9K5cFDxhThs=;
        b=i6o+uzitkaPf2b9hTECqQEK+yvYHzLOtNc2u7rAoQDeSOw5iyBkprwrecT7wzq7Qdd
         f0G6PT6P2rYsUrYgCCha72SEO/map4amqsKQ7kxlzwESO6LAaIbEsa+JTcZtzA99jCVr
         g9rPeUptWwgbgsZtfHN/8jSJDXv3PPcsu7YVlnIzTLYmXxVop99gqwgg9MAFxJSx9D+j
         iGXsfHAMalz6I0vqrXmPlMMxvPWhtLB0U/9JNstSjvgoyVjvD/8+Vg+aVjZxyv5rnjlz
         ZqwLvcdlW689yio7+RRQyq3zYdtHFv0BHhsBCfGz9puOYq1oe1OktDag3woNfyRzVMeq
         RYKw==
X-Gm-Message-State: ACgBeo2t3/s7MkrXvfSQNyDtVf7rnsTL34efD2ea3bCN9RCjFffCCC54
	JpPeJ6QWgzj4NjcpikXpJ8Dx4FApVE7JXQ==
X-Google-Smtp-Source: AA6agR5FwzKIiQPocVDtpf+VP2MPnrriXY3Y+t3WnL0ySLyHI3eH+k0lWM8+nTIq4M/UrhR+G31NxQ==
X-Received: by 2002:a05:6402:40d0:b0:43f:8f56:6b0e with SMTP id z16-20020a05640240d000b0043f8f566b0emr6300221edb.380.1660917026763;
        Fri, 19 Aug 2022 06:50:26 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b0073087140945sm2313821ejk.123.2022.08.19.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:50:26 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 2/8] staging: rtl8723bs: remove function rtw_get_ch_setting_union
Date: Fri, 19 Aug 2022 15:49:36 +0200
Message-Id: <c8c5b0c78ee9a4cd8304efeff22b51049c75a3f2.1660916523.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660916523.git.namcaov@gmail.com>
References: <cover.1660916523.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because this function is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 21 -------------------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 2 files changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f878b04076d8..8e74b4f47b94 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5945,27 +5945,6 @@ int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset
 	return connect_allow ? _SUCCESS : _FAIL;
 }
 
-/* Find union about ch, bw, ch_offset of all linked/linking interfaces */
-int rtw_get_ch_setting_union(struct adapter *adapter, u8 *ch, u8 *bw, u8 *offset)
-{
-	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
-	struct adapter *iface;
-
-	if (ch)
-		*ch = 0;
-	if (bw)
-		*bw = CHANNEL_WIDTH_20;
-	if (offset)
-		*offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
-
-	iface = dvobj->padapters;
-
-	if (!check_fwstate(&iface->mlmepriv, _FW_LINKED|_FW_UNDER_LINKING))
-		return 0;
-
-	return 1;
-}
-
 u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct set_ch_parm *set_ch_parm;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 89b389d4c44b..65e138a5238f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -662,7 +662,6 @@ extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint
 extern u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
-int rtw_get_ch_setting_union(struct adapter *adapter, u8 *ch, u8 *bw, u8 *offset);
 
 struct cmd_hdl {
 	uint	parmsize;
-- 
2.25.1

