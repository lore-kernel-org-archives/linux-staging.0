Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893F37D137
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646855; cv=none; b=U6P6xGRxute8qyzjFUeBFpr4V6oa/pHqyImHumKlVODPxk2Y3wNEkSwT5foEjl/OppyUgU51V2DOHgudYDZj+Jf0QV4lbMtgEIA3yW2j5WM0oXW8dAt6VIZ5IOst/k+Jk1GcrM6nQ2MbJGfvatdIXbd0wJAGtRPAEUJ0JZ9m2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646855; c=relaxed/simple;
	bh=f0PR34TdvdOJrt1uwL6aSTlLoYOFX2Kguotwc5bcPbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Og9I5JZjwLG1Hq2GQbCBUzWJC9HEYZW5qOCYjgYVyF+Yd8q7sO1vP51RuZEYFqT/ah6CFi9/ETmE9fPVxKA0hl72rTWVYze0CfkAK77AMxueEr2jYC8RBVLIxc66sTrMkMWMJdmMZ3EM/xepsexAw18XlCWpSZxfddyGU39w/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnpYhllk; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnpYhllk"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2c156c4a9efso8040463eec.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646852; x=1776251652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp4VWnoRlBF1ISs3ZdJ3il8z4bzscVAuNmEdfs/zcNI=;
        b=cnpYhllkUgmmtuPCUDPo3QGi/jiUFweoq+IK2HSNViicG2btLkpcN/Mi6PiIXtSpov
         AfsS1/s9yumMHfk9R6aS6G2C3ww/CTo9MxQKedTlfTgWR7Aq8Pj2WR186eTP4SGqfgwG
         bKsktVAaEbP3W4k1XhPyE6C7AwLCVSlBa8DanO0KNPfoUc8hP0xbqC13DD2/s/IdryTU
         NK2j7akY3Q/Tdo92M7wackajdfFZftEnVD4gzzDlA/XsWr7g6O9W+6PusQvl3syitc78
         oIb9nf510mNF3mOigP5Lxr6tRcOBYOwy1yasGM3aWuc45KcW0hOm1v1HwZdzLdJ4SWEf
         qd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646852; x=1776251652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wp4VWnoRlBF1ISs3ZdJ3il8z4bzscVAuNmEdfs/zcNI=;
        b=pXQuAu6gvUZcglYPUX0opNkT6MgnpvvQhp7VSSHfuCl7IdwMcff+7S5/E+X8Evzuon
         CiGPKi2wovEXhkvBtQ1gLc1rQBImNzB6d8/TsEyd74EKW8eaYn88LJpTf2+S2lJW/8Ss
         f4bf7jgNzJvq8mMQq1zkfMxTokXm7qVuH82Uegl+MCDuccmEcjrRyWnHDj0Rdd8IHxWx
         OzSk+hxU1HCAwvKTmTAVZdeqzWRyVRwlXGjDl3GFJ/KhdjiY2/SLXnzn46XX9m+ez5lM
         e9geEMtDc68oJFzRLiJnSUAqVnjNQs04/O+34bFNncufeSMpTUJ+4jS1dQ/rUPzoUwkO
         7XLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgyzqoiVQRG2mHKr6g9NVizN/RwuPDWYe7fDY4CrNYEA1g2wfkDHck48xMq5YCbkRZUBgp5RAoiAfUOyD/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9GEda591LLtXhi29+2xB4gbjUSK4M8Rp6XTQ5znUjY9kcm+MY
	A6vAp+d+o61oI3dT9/D+kge+xm+01ZNEDPlsYioJSi+zlP3eu2K33ldU
X-Gm-Gg: AeBDiev5PV9e5QHor2k1repkxeKU4/2+XcYWab9VpT155z9N3VMqcbTYSOSy01ZKDpI
	g/yvG6MqjVDpqno1leDjexQ5ivv4QHItcnlpwpBsdl1F3hwDcZYVYejhrxzXknIG5kfoSaDLASR
	CG81MX3JqAOcIpu0aY+opMu7WG7vY2TKBOPsprYlUqxnLoT4vr6oSaMBckVpbtmYWHqM0VmEt3G
	aVdcD8qi2hiRrBNzInV0EH9ipd6Zho764Ie9mHdLB/sCl9BuqTI4/VCXR8x8WUG5aqgysBnQ9lA
	xpK6kCF0jtbLrAGN8ybmkJZOwzQiFXPRWHnMy7rsje83vyKofnYdkR68vyltJPclY7E28kmf37e
	yEPsrRskX1fE2tnqwPyLra2paSX9gWsWFtA/TKP2znYc/VzApSeqH9z7tkabCDpZEXGQJ0Jvy0Q
	8VZdyrNqtDc2ziAjvYAMqfwHiIAhXaw7c4+aZ7uikbVSAWuwXTa2v5Y70=
X-Received: by 2002:a05:7300:2315:b0:2c8:b5e1:6b03 with SMTP id 5a478bee46e88-2cbfbf77d16mr9903942eec.23.1775646851590;
        Wed, 08 Apr 2026 04:14:11 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:10 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 4/6] staging: rtl8723bs: move rtw_os_xmit_resource_alloc to rtw_xmit.c
Date: Wed,  8 Apr 2026 11:13:12 +0000
Message-Id: <20260408111314.19329-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408111314.19329-1-dennylin0707@gmail.com>
References: <20260408111314.19329-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rtw_os_xmit_resource_alloc() into core/rtw_xmit.c and make
it static so the xmit init helpers live together.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 13 +++++++++++++
 drivers/staging/rtl8723bs/include/xmit_osdep.h |  1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 13 -------------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index befe74a1bc4c..249947a7d910 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -73,6 +73,19 @@ static s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	return 0;
 }
 
+static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
+{
+	if (alloc_sz > 0) {
+		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
+		if (!pxmitbuf->pallocated_buf)
+			return _FAIL;
+
+		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
+	}
+
+	return _SUCCESS;
+}
+
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 {
 	int i;
diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 880344bffe2f..5b351652e31b 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -30,7 +30,6 @@ extern netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetde
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag);
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag);
 
 extern uint rtw_remainder_len(struct pkt_file *pfile);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38b1a..54a6d54400e2 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -46,19 +46,6 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
-{
-	if (alloc_sz > 0) {
-		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
-		if (!pxmitbuf->pallocated_buf)
-			return _FAIL;
-
-		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
-	}
-
-	return _SUCCESS;
-}
-
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
-- 
2.34.1

