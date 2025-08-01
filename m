Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777792222BB
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037165; cv=none; b=soc+MNfX0qcm9pYbQAQt9bXA/jM6NI+kVXbmykudsEw38wQTkjRekzrsWVoPsZJshYTHY3xDkHhNmmU4ArFgcuMH0J1tB4gXqem+7rJu1VDh8nYreGXMaJXzEF5mo+kSdDMfKVcspgfu6vLVcxvurYmFhABIU7ZSDBBCKwudHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037165; c=relaxed/simple;
	bh=6LAp/b/lldOK3zVDh6jZuxdHhcUanuF5F6aqTdw7jeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbomr2vGsoKdMXh0JdVydlG/NGkhOl+HQJjdebhK/rI+HVIdvYM60g0WWD77qq8J1QgadtRiuNr+OQZxYmokYTi4GQ1juRrqlUrEyGHFIfZaQzHo8CIjMo/ASShS6CFJMWu6+9LCXJv4zUW0kCh+6baMS5FpnT4hOLjc2C6V+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRjM3CvY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRjM3CvY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so2371517a12.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037162; x=1754641962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQd4r+QBAQ7livBvDF2Cnl00jX0+lsRk4nu46EPRFUo=;
        b=PRjM3CvY8ARlPR2CDbLFx2wlxb4Ejk9hIZ69ljIRkug0hiECGUJ4iAdc1I6DfWCvct
         WYkG+jiqmRRLy3uPg+cRxTdewsGvkylARyVqQ8fvH7RbXYwj/PO+b4Eomk4oPXSt5GoJ
         CRXsmUQvvvzaudWOkC6monasrTeEJGEBcIb9I6lWVnWXlpwcT7CVVn0gDH04bMwQnBS8
         UQRg7PAzsh1wbwgUHaTWoU2KwBym21ynQsN2cEIHQf/CFR4CIka5ljYXuxqrXZ2/78ak
         9NPlMHuaIxib90L6JFLOHmuRRZrnAp0HoUfLjIH6QWR3RG4W3kybioBF8sbd3ECuQwnv
         cQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037162; x=1754641962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQd4r+QBAQ7livBvDF2Cnl00jX0+lsRk4nu46EPRFUo=;
        b=bBgT8OyG03sL63bmD+ggPbd24yvl2QxHx9Pg3bXvsgwe8Ovw2jM7dXh8OQ1FPQ9qZk
         G45xO79/E9sMeesyfs0WlRIT9Ou6CIav/GbeqhXqj7VLIC9zSziJNbwjWmyepCHGWZMq
         8w95X271BVCC5e3qIsQOfPzWctRBzXrgDCgDbv6qo/l//pDyQEzpAHPUn46xpsS+iOFl
         IJ4JQxyNLzd5WAYdwxxXnbGhPdDOFJ9RkOUFQM/Tn/6bo8HR8yymwOGDGRxsQVKpZZRU
         lr++c2HNodN6OPgUyzhVwN3/LejMG4KwdbnNktUvqMjpWyQEzvzHnieKH/JbzX3aeFPu
         k7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUfIbdby8v+4Vl3Nh/eoGvAg4rnM/zZaef3nPgYHSLSd4ln49rh0mD4Z1kItlVpH9M2hAU0xDRlONplj5pP@lists.linux.dev
X-Gm-Message-State: AOJu0YwvpI8rdBCl9/mrECOv0QK2UU/breK/PpRUdsHgNj70jjKD762i
	3rsWT4YmIPUfiatpWFsRkcUusjSVAxX52j04g86QyC/dl6TMUjWfTYZ6
X-Gm-Gg: ASbGncsbDrO0vTsI9qpqAa9/kuARCh6xsazdCLBz+Oiy9cm4iwDxqs3rvaIZxtZ8ltN
	OUKdQdj9Qg8rhSSeS/ddhg3xcN2y9IFBjWmGB4uw05vYr+5bROE2YOj3jTz5Kh9A8lrQof8Lkbr
	kJzXaUBcMlLqMi9mPYWEQzAQVtPaieX6SvUxQTyflHVL2S2kEmSPdO1XzoLWmW6foUTb/x74k/M
	ofKxbSEL83C+eWM2mEtV+V2UrA2tiSHV2ybVFbYFkWZMcDm3F0zJn61YFA8Wapm4son09heDLwM
	jhhqQKlwUiABB+NLZu/6OzlWfBt10R1zk0tSXXDKQdnPPkWVmJ//GpRqvOKgc2qLWcHqfDVnQ+a
	K5KJ/FIstj5HIKM4dR+kThjP3JueQkVARSFYvvoj/F8sQxv6oJVE=
X-Google-Smtp-Source: AGHT+IFdiZMkESDQvAHlWboTh1xfX8SBJwb5SyD9HTM8E4Akk3n6TQRRiQnVUbtrqMJEogjKUM/rrA==
X-Received: by 2002:a05:6402:2802:b0:615:f76:9408 with SMTP id 4fb4d7f45d1cf-6158727399bmr11228509a12.32.1754037161545;
        Fri, 01 Aug 2025 01:32:41 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 7/8] staging: rtl8723bs: move rtw_report_sec_ie to core/rtw_mlme.c
Date: Fri,  1 Aug 2025 10:31:30 +0200
Message-ID: <20250801083131.82915-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801083131.82915-1-straube.linux@gmail.com>
References: <20250801083131.82915-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_report_sec_ie from os_dep/mlme_linux.c to
core/rtw_mlme.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 34 +++++++++++++++++++
 .../staging/rtl8723bs/include/mlme_osdep.h    |  2 --
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 34 -------------------
 3 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 839496aef933..4c816fb2500b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2033,6 +2033,40 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 	return ie_len;
 }
 
+static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
+{
+	uint	len;
+	u8 *buff, *p, i;
+	union iwreq_data wrqu;
+
+	buff = NULL;
+	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
+		buff = rtw_zmalloc(IW_CUSTOM_MAX);
+		if (!buff)
+			return;
+
+		p = buff;
+
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "ASSOCINFO(ReqIEs =");
+
+		len = sec_ie[1] + 2;
+		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
+
+		for (i = 0; i < len; i++)
+			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
+
+		memset(&wrqu, 0, sizeof(wrqu));
+
+		wrqu.data.length = p - buff;
+
+		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
+
+		kfree(buff);
+	}
+}
+
 signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
 {
 	u8 authmode = 0x0;
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index 8e8b5de285dc..3930d9e6dab7 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -8,8 +8,6 @@
 #define __MLME_OSDEP_H_
 
 
-extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
-
 void rtw_reset_securitypriv(struct adapter *adapter);
 
 #endif	/* _MLME_OSDEP_H_ */
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index d2f4855e9d9d..918d9496d7cc 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -65,37 +65,3 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
-
-void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
-{
-	uint	len;
-	u8 *buff, *p, i;
-	union iwreq_data wrqu;
-
-	buff = NULL;
-	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
-		buff = rtw_zmalloc(IW_CUSTOM_MAX);
-		if (!buff)
-			return;
-
-		p = buff;
-
-		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "ASSOCINFO(ReqIEs =");
-
-		len = sec_ie[1] + 2;
-		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
-
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
-
-		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
-
-		memset(&wrqu, 0, sizeof(wrqu));
-
-		wrqu.data.length = p - buff;
-
-		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
-
-		kfree(buff);
-	}
-}
-- 
2.50.1

