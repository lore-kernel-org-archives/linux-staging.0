Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B917F9
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:54:07 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id fy5so7621108ejc.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lgIH+anOUapmsDT3madCqkJtVLuh/Inv9K5cFDxhThs=;
        b=Oh9zPK94Un8fe7pcbMnsK/FIG9oexvu+SEqI4AyylhS+RG8LRAqWzTa6PLdYrqYOOs
         UDKJzLpmoQNEfwX758srbGm5yM7auR7ZLiZahTVPfcCIu5rXCcJyknnRSM0dcJKPYBos
         4ikZgl1KiavaemU1RwCOupVTMEoJnew/tDp75Pcu5ZDq32gn+V/lun6teEyK/jv7yvHW
         I80/JZI60mVAerWg88PYR4VyqVEsOcl6h2DY8kjLWIn0j/XHTeUYZdHVOaxjAmogf4HG
         oYl9G93PZ66ILwCavLMpgk9kKqq26jJBTM9VRKHFuEd2bdySoy1vt1YrkHCwzvtDaULD
         bNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lgIH+anOUapmsDT3madCqkJtVLuh/Inv9K5cFDxhThs=;
        b=hqEL03yqt/yNrxj0iX9F+0wgnnoh9cVO3MNT04a0cR6LYc9d7UjR3h8McbLGXbAvnn
         U90gFYcXtwTzA0TQrIiCXrUo4cvuNDZ+wY/Eyi73D5n8VhVp2kp14nEmJNp26tOOAxeC
         7mqWem24y+DfSJUmoEw56uz4/oaz/9pLS1roXNrNm4v85vOFrFqMI5kQJtS2OF4lb9jp
         TxLzn13hz3fhGnkSholgQuDOIWopFa3TG0gXr1IPQ+A/aYEJgNKNiRbT5dgD2XH9Xoto
         ZedCoFevaF4jrpyEHmdMOqBzRsnMlE7lmzCw32LYUkCIkSKLy0lAD8BURZ89KXyRfVKd
         C28w==
X-Gm-Message-State: ACgBeo32JU6um411BBhSEptBSX3lHW/JFSuah5BX98Xnk66CuUycnbRK
	gH30D2YJ8A3LQjp++9YOM/k=
X-Google-Smtp-Source: AA6agR5oGhiIgaRuZCuyvZPAgLaEKfWKYc7sQTTjsVGONpso3TbsB11bAN332qpegNz+MDrOEc0i+A==
X-Received: by 2002:a17:907:1c89:b0:734:d05c:582e with SMTP id nb9-20020a1709071c8900b00734d05c582emr4320699ejc.282.1660899246114;
        Fri, 19 Aug 2022 01:54:06 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:54:05 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 2/7] staging: rtl8723bs: remove function rtw_get_ch_setting_union
Date: Fri, 19 Aug 2022 10:52:52 +0200
Message-Id: <c8c5b0c78ee9a4cd8304efeff22b51049c75a3f2.1660898432.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660898432.git.namcaov@gmail.com>
References: <cover.1660898432.git.namcaov@gmail.com>
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

