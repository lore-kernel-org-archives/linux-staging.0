Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231EC22A4E9
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426343; cv=none; b=lsuDl2ey/uZ/y2ZfD0U6y0zcr5pkWbgVrFnV2kE+8NzB/mCbmaWuWUnny1h0ui9Pf+n5gJK8t2yTXjDGiEis8nXlTUZcks7vPC58v7sVdDtzvCKZ+DJde8kmkhMCTmtmlzA3jjd63JRS2/rI+2MNigR68GH837W1yKUWa5iSxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426343; c=relaxed/simple;
	bh=RI50rFw7CT6PjZHeYuwXfFBCjqKZGX0v2lcElPFPDOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGaFtbAly3eDRKinteFJSaK175xWmZofPd0a+KLw2BIZ4b7X1gObkdE2hU0qxMLsxK2QNRcb33y6spGqiiyyA0Yr8puaMZosCjimWzMMaqyE5SjZfBVGt9M3zdixDZVt1yh7vyR6C2G++jJxa2Jw2TosctXgmtNCxDX3Ua7lWIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ1gOwms; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ1gOwms"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-83945063f70so1936173b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778426341; x=1779031141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GROQE4nUJiLzG1VohMDL2RSnyGY3FQtfvZ4yEOrdN6I=;
        b=RQ1gOwmsywfVxdsArcD7hOiByTMbQealJTJdKKy5P8xYrRr6TQIs54aVxbeEhPMhhx
         N19VU9nGhf2aEmRkY/I5rRfUFbM/fU3vpiF+ele29fCmBagJVhBKINT1iIlDDsHKIqhv
         rFC9r3/U4AByJOMhNGEGntRAenYwbzNLIn6GSRVMwzWdl44IaabLB7ZWEJqMqDpsgeyq
         31+a3lBEtuLQfipMSLsKwXJwDeJU1vDcu1KROAacLIf9M3Kt+SYJD7M13IwwvFKDEO9S
         JgJXO8Z2pAFzj0Pri5XsWXffW0ywQO3FqtxqeKyQzNVG5fFbsi8qIYBTcZ6eJIRvpHRa
         1VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778426341; x=1779031141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GROQE4nUJiLzG1VohMDL2RSnyGY3FQtfvZ4yEOrdN6I=;
        b=eIdBOZMjqDBv3l+gG2oH3TWUnJUO5/zs1qfwQjAMBwLWzUUWW2Jf1zVRF+lBSiBxy9
         ol+LU6jW+mLV9JbB6P1SSCJun0CNbwDyRCAb/nwHLIKXpAXAXrglXVrISJ1n6vtvCuCK
         Vk6zx/Afkl1zFP9tfXhYWzlrKdKL0rNdeJp3atDi8k7Fh3SHbzvc/Y5ArflHtbpcMgKX
         sfpsqs6zIBzADgvVWglTFyGTNLu26qTOehG5wGsyeCkZKAsSCzLW7DDJlsKFun+/uPmB
         HCqAQf5ALeyAI6rDFib0TpRU+enzjdtOZMVo4kIU7K/Yn9l5TcOlOYalDOegKK5HIUvY
         vIyw==
X-Gm-Message-State: AOJu0YxuEL40Ow7jMLTTuqbIhWnj73NjLqZkiFdK5plFv3m4wSLxR7AS
	YVKfltyRwKvZWrfBh/mwPJmNijUbEZnEEdyusOXC2yI8J41A0jcbFaaQ
X-Gm-Gg: Acq92OF5JecAXlx6Em8VLpaJwKBERuSNoR/oW4pe6Lb8s12OoHnuaTzg/X4YoxHolM/
	cEMWeUi3SLUaMOwIkCeeOavLNFHp90tRWX/JpjNFpU2LTBjfoSSP4KCWD1BZhHnSfw/h7RLMB07
	H4/Nru/Lie7k3pC4UPzekozHQBIE1Urxl22+p4W2zkgrGWywn+WFsi/3eVMxkJsVmW2lyYE12KM
	5U71L2jled6CI+F6qLm6NjsQoAo/WWi56GFm2QEucUnjlyn8qyq4H3ESeB9m433KAbqQxAF17FT
	0531Gbfn7s++piCRQUpUy+bu28BfSb75101vIx3dzAUAwY6mB/xBZxAp91r7fnhNwNpoq4X+H8R
	8fuMwLdNGeZSWFUgwWmShYbqCZXFcEi893AkhOKPvy96G6qE6jgH+mnZSBi7zi+DYxegq8EDQtb
	E4D/o+Fd9jtz00okEb+YyICcAHcfxAX7fXvYalgSmf
X-Received: by 2002:a05:6a00:4219:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-83bb85919abmr14357893b3a.21.1778426341450;
        Sun, 10 May 2026 08:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f049sm20241129b3a.7.2026.05.10.08.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:19:00 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pramod.nexgen@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Fix coding style in include headers
Date: Sun, 10 May 2026 11:17:21 -0400
Message-ID: <20260510151735.520685-2-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510151735.520685-1-pramod.nexgen@gmail.com>
References: <20260510151735.520685-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple blank lines and extern keywords from function
prototypes in header files as flagged by checkpatch.pl.

Files changed:
- rtw_wifi_regd.h: remove multiple blank lines
- sdio_ops_linux.h: remove multiple blank lines
- cmd_osdep.h: remove multiple blank lines and extern prototypes
- rtw_ioctl_set.h: remove multiple blank lines
- rtl8192c_recv.h: remove multiple blank lines
- rtl8723b_dm.h: remove multiple blank lines

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/cmd_osdep.h      | 7 +++----
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h  | 1 -
 drivers/staging/rtl8723bs/include/rtl8723b_dm.h    | 1 -
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  | 1 -
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h  | 1 -
 drivers/staging/rtl8723bs/include/sdio_ops_linux.h | 1 -
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 5506f513dc01..7aaee3b480ba 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -7,12 +7,11 @@
 #ifndef __CMD_OSDEP_H_
 #define __CMD_OSDEP_H_
 
-
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
-extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
+void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
+void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
 int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
-extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
+struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index e2e9aa03ffdf..1f86654f0403 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,6 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
 void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
 void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
index 1d2da5286e7c..50ab7aed079e 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
@@ -29,5 +29,4 @@ void rtl8723b_HalDmWatchDog(struct adapter *padapter);
 void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *padapter);
 void rtl8723b_hal_dm_in_lps(struct adapter *padapter);
 
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index ab349de733c8..c3a1d1a84f78 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-
 typedef u8 NDIS_802_11_PMKID_VALUE[16];
 
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
diff --git a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
index e611651cb40b..e4d8fe9bf68d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
@@ -13,5 +13,4 @@ void rtw_regd_init(struct wiphy *wiphy,
 					struct regulatory_request *request));
 void rtw_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request);
 
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
index 18830dd18372..cd67a7201065 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
@@ -25,6 +25,5 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err);
 s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata);
 s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata);
 
-
 void rtw_sdio_set_irq_thd(struct dvobj_priv *dvobj, void *thd_hdl);
 #endif
-- 
2.52.0

