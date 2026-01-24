Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291022D785
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296590; cv=none; b=Fis3icBpV3UZumhgaNoyXiz0AgDVwVqbBCWlt+PktgIj5m4wFZIolxcw9sV2TcVxT1XT+gNDUDieeRM6NFt6wkri+r+lD17SxudB5O8HY22Vb0AULuNVAT2EbUTdRSaiCYAKBreluJmOm6fVEP5qIy3Wp6By8qUD8qq7U/loONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296590; c=relaxed/simple;
	bh=sOln3+rJQNEvtV4tGcxDekPbZxNBSlSJQFE9hTu3ANo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmUFPJPaRsCn2/S69kt3AXvnyAIyZA+7UjdHaFN7b66d/nmlqnEuWWhUou2uOMjQU+/ER/odhI+MNRupX3kvbH/DB8V7dzrU5gnMokNsXysInfO9Nk6zyXgBK7RR6x0gXf3QZwVeptouExae1s8WeR4WQYNE61KbzrOhakavwos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAwpCpqo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAwpCpqo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1397575b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296588; x=1769901388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLmegVfgzzBEocXutz4GWNfQqGA8YsUK3XtTcBteOAo=;
        b=FAwpCpqoHcyNZpRlx2QFREry8YOvbMl65QrlGuuaWh7INBwMBYK+NGJ3JmDN3p2RER
         zWtpQxxgMVgVTjtyGWMjeAyjaqxyYcdboIOdUPuooVro4tEU2GLDb/9FeHFdvzwtOoPD
         0/BuEIs79lnaylO01QiBpbhol7AmHX+XAsG2EPhbF9Yqrp/2bojv/KPhCU+gCzDzKJ9U
         BUZgmEKYXrIu9jcbp1uklP1Nbt9xTX9b0w/graxvx33zo86Y+5KfOha+90zzSFSrZ1ie
         yJYVOMn3bN0/ggTtTFLWg7H5B8olP6cboEzmxa+e6MoYbYbqMLP2DY5XDR95V/t5PtQH
         2Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296588; x=1769901388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLmegVfgzzBEocXutz4GWNfQqGA8YsUK3XtTcBteOAo=;
        b=diV7gtnzx2JfSDhQi8JU3+xrx0Gb6VFUvRMefEUnJSspoh83sdihTR6rUE6cu9WFim
         gS9XbkyXYftaMoqxof/FUIKrOxzvKGxD31nU9ecYVwVafjNJYKcizlPfhQsY9aSIydIi
         7YTm4WmhU1yjlI7gakYmu9Ww1Id3zMuDuzcvZbKTeRFCGRMu7aud2fd/jjfj1E+8uRPe
         bVnGG8ReRHUjq79Vuxnzm+Ki2px7pL8JnXzGwtezEzZx/iYzh5dBZBv7HgsWHl/oRbca
         EUcotj4X2ERZmJpEwS+yauhXu5DRXvi+7Z5BxJJDnR05+SoBm3+eWEwsA+u5f/XvaNQs
         LsXA==
X-Forwarded-Encrypted: i=1; AJvYcCX03YrHrnRiLCG2mnJtAZACaOYAvRcVOVwrbdrq+9JahjsV+xqOosMoVsLpSwmz5nROvaLdc0CXIeL2J3RG@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi/1xspSdEd2UZdF+VxLuHyXA+dL7zuOkDrbOGwugpjGzUNoPA
	sIHlDnxm3ygZNjVxS/LS82LOSxlUKgKphxUTBPqFD/PkC7lNuM1BDpv1
X-Gm-Gg: AZuq6aIhCd5w7xRyrNrBLVaRSa2tRShLIs9j+YcPlGEzs5lpwLnS5s1En5R2eDrKhbx
	AFu6sDmPPbzGZ2NG1HJliW226eUjIonBbmLM9e8zTORK8Bx/MCloBMxuYTWEI+c8zYBmaF4pgsu
	CDs2ORgaFCeXicyYlYfpD6qxTk9nENbDRzmLqNX7475Giih066eTlzAIsiMxdzqc02da8VC/2ce
	9lW1Dr1ImT+GGB+dvbHkueT+99P2gE7P39oTmsHpUEzs2xsaa5mXJS+3GHvYTpZSLulqdVSJxjR
	IOu5UAji+Qhl0TldI3idPrzsknn4QrhR6q2A6T8+8uYlbqM1HqB/L3bG+xV2ZR6kELWgHjKzOf4
	lwouD7Hpus6rGWjjNTnsP+YpGUYSNi2gCPmEFi/+2D43mvvfI2zohM2O8o6nwPY3PHQyi867HeH
	fRgFM1xrYYMnK6Xt4cHVjXVxvBlNwT0ABU
X-Received: by 2002:a05:6a00:37c1:b0:81f:3a05:8a7a with SMTP id d2e1a72fcca58-823411fa536mr105614b3a.19.1769296588094;
        Sat, 24 Jan 2026 15:16:28 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:27 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 3/7] staging: rtl8723bs: remove unnecessary new lines
Date: Sat, 24 Jan 2026 15:15:53 -0800
Message-ID: <20260124231557.18189-4-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the unnecessary new lines

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4039504ad666..bc0c9ee801e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4971,7 +4971,6 @@ void linked_status_chk(struct adapter *padapter)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
-
 	if (is_client_associated_to_ap(padapter)) {
 		/* linked infrastructure client mode */
 
@@ -5045,7 +5044,6 @@ void linked_status_chk(struct adapter *padapter)
 					continue;
 
 				if (pmlmeinfo->FW_sta_info[i].rx_pkt == sta_rx_pkts(psta)) {
-
 					if (pmlmeinfo->FW_sta_info[i].retry < 3) {
 						pmlmeinfo->FW_sta_info[i].retry++;
 					} else {
@@ -5063,9 +5061,7 @@ void linked_status_chk(struct adapter *padapter)
 		}
 
 		/* set_link_timer(pmlmeext, DISCONNECT_TO); */
-
 	}
-
 }
 
 void survey_timer_hdl(struct timer_list *t)
@@ -5208,7 +5204,6 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	return H2C_SUCCESS;
-
 }
 
 u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
@@ -5565,7 +5560,6 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	site_survey(padapter);
 
 	return H2C_SUCCESS;
-
 }
 
 u8 setauth_hdl(struct adapter *padapter, unsigned char *pbuf)
@@ -5695,7 +5689,6 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return	H2C_SUCCESS;
 }
 
-
 u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *ph2c;
@@ -5820,12 +5813,8 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
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
2.43.0

