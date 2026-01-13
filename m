Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B42FDC35
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338894; cv=none; b=bhogk/Jd70cwxKIkI6QqT52g4UXPUnFDavxRkK/nybqRpHK8ShMt9LqxAC6OBwLUq7sMBydn8x+XvZp4jcaCGu8j4d3WU7fD1DCTl/l5LzmU5TphMOODqoyLsXABbgGHsxqhrpsvnVZv/DqGhBpfiSIW8Y+e5qQK3VNTu/i/eKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338894; c=relaxed/simple;
	bh=lAFQ4cjclz+FBZQ/H9cSzFhDS/3VGgND9xpcwjTR3m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2C3tIML5PngKfc6Qp5+rsC2ysdqRUgYpjk1/MgFxQsKZu5fSmgzubAIG3vXYd30YlQNMInEVxvCCWnG07ULwAraQnNCAKv4jrc5gUWPEwd506tI+xng07evEj1DkYnLoFqJKg7DlYibypVaT0XY6AKmNYo4bTVpFYbHfMxFFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ityNszvX; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ityNszvX"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8b2ea2b9631so923431585a.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338892; x=1768943692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWtqfEivecHDI5yuAWKVCsH+keTo7LlgFYh4MWGjuBQ=;
        b=ityNszvX40U5LQr4wQNQ+Md7RQXUbFkf55hHwSJSZihpT2WMve0OrmhfIsBC0g80VR
         A/WbQ8MCm6bZHEiLz1IsXwiaw1mS1gitxvgiDf6i6uip6vRzkfak6gpZ1fJDI2hsfI7P
         hf6KB7BtgPkbS/hE/XAZJhEyRKZvNovnnw6U1B+NrcZX5kMtUa0NvAafRh4e6njyWBPd
         QrZUERGVVRTreXDwc9x++uNJXKDKlyDgRRzTnuXcW9+6Q9m/HZ5Uk0C/JyTmFZMK5WbY
         OdOmVlFZM0XbvnyG0KjfksMF0rRHQoE4AsQE0GzlmvPQEQ5L4jhbYuQRR4yape+ZEyPi
         HPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338892; x=1768943692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWtqfEivecHDI5yuAWKVCsH+keTo7LlgFYh4MWGjuBQ=;
        b=wR9Aw1bZYzLLq/kQD00HIwkepDjoKmoo0O1dZcM8VkYbWb5SDrwjPtK6oXgBsQdkhf
         0IT6SVd+vPDiouqliGhcc+cT3DVs8ljSEgmvkryoXsTQDHD0pibWIIWi0kMCrpFOvVhD
         +bAR7hppF8MYtcKa1ZZu9bQzQt7cxev1y0WWVPhH5htnbVeOhGsfbQrnXdbzj96VsVfj
         wH0gumv+mg75v3NSTDHcx4WdrAkayNItXKVir9TpZYduuB02Ewfmgshs5DZ01IvEYHto
         wSuABLKY6AnoS33DZ25HrfYP0+oZ81Ynh47dPEfCo9lsn/oxV70Ccie4dQ6+kOZgCaLa
         0tVQ==
X-Gm-Message-State: AOJu0Yx8lxFR3eHguXnWhYvao/r/O6TKiY0g775/2BYFF81H/Hmxb5AD
	Tf+khifxa4wrqlmOde3Z1N4zOnR4Roue5Kd1uygE+WbtqYToz2b7Mxrz
X-Gm-Gg: AY/fxX5Fhm41JeMrO8SWqCCeT9P8tGpTZC1sYwXHaRG2V6EJskUe/+4BfpwpxdQHEhd
	OJjwsjg7IvPK1+ijnQ5/OfxwBbvyjHyCwFefJem6xM2dp0hxafNx+VvXLuBD/2Y97Ro0fgMBYC4
	skiUwyPl+aELleqCvDMkJVhvKuhkVr6+oxBoJfxHvN5nBbFO5CDxKHDLndfDThgghoxSd+q08xB
	kvWE4kIEmCGd3ZPtwss90NBOYGHc6iZD5362dpvn6PRjq9VZ1CeZKmHMZKWYVmG+ZsFycYB1+0l
	aNV63zF8GOpHTJUo/Kr0L4UB0j6J6l/HDube9yFLMPunuhR8L9Bpm98nWVZMKmjYAiFdmqI4O3k
	EMqWXuOjJjdFnwMFe2B3C3WkVfcsjnUA48rkUxD8QokXoVbcz8Rlh0Q1bY6fwhjxy8xBv+fZUqJ
	dkxSBYFW0jDHT6S/5pyXK43A==
X-Received: by 2002:a05:620a:1a13:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c52fbffa77mr85335385a.83.1768338892548;
        Tue, 13 Jan 2026 13:14:52 -0800 (PST)
Received: from localhost ([198.1.209.214])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b74bc4sm12449285a.32.2026.01.13.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:14:51 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: core/rtw_mlme_ext.c: flatten control flow in OnAssocReq()
Date: Tue, 13 Jan 2026 16:14:32 -0500
Message-ID: <20260113211433.89512-1-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrite if-else construct with an early exit to reduce indentation,
and make the execution clearer.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 59 +++++++++----------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..d3b395894d4b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1181,47 +1181,46 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
 		for (;;) {
 			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
-			if (p) {
-				if (!memcmp(p+2, WMM_IE, 6)) {
+			if (!p)
+				break;
 
-					pstat->flags |= WLAN_STA_WME;
+			if (!memcmp(p+2, WMM_IE, 6)) {
 
-					pstat->qos_option = 1;
-					pstat->qos_info = *(p+8);
+				pstat->flags |= WLAN_STA_WME;
 
-					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+				pstat->qos_option = 1;
+				pstat->qos_info = *(p+8);
 
-					if ((pstat->qos_info&0xf) != 0xf)
-						pstat->has_legacy_ac = true;
-					else
-						pstat->has_legacy_ac = false;
+				pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
 
-					if (pstat->qos_info&0xf) {
-						if (pstat->qos_info&BIT(0))
-							pstat->uapsd_vo = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_vo = 0;
+				if ((pstat->qos_info&0xf) != 0xf)
+					pstat->has_legacy_ac = true;
+				else
+					pstat->has_legacy_ac = false;
 
-						if (pstat->qos_info&BIT(1))
-							pstat->uapsd_vi = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_vi = 0;
+				if (pstat->qos_info&0xf) {
+					if (pstat->qos_info&BIT(0))
+						pstat->uapsd_vo = BIT(0)|BIT(1);
+					else
+						pstat->uapsd_vo = 0;
 
-						if (pstat->qos_info&BIT(2))
-							pstat->uapsd_bk = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_bk = 0;
+					if (pstat->qos_info&BIT(1))
+						pstat->uapsd_vi = BIT(0)|BIT(1);
+					else
+						pstat->uapsd_vi = 0;
 
-						if (pstat->qos_info&BIT(3))
-							pstat->uapsd_be = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_be = 0;
+					if (pstat->qos_info&BIT(2))
+						pstat->uapsd_bk = BIT(0)|BIT(1);
+					else
+						pstat->uapsd_bk = 0;
 
-					}
+					if (pstat->qos_info&BIT(3))
+						pstat->uapsd_be = BIT(0)|BIT(1);
+					else
+						pstat->uapsd_be = 0;
 
-					break;
 				}
-			} else {
+
 				break;
 			}
 			p = p + ie_len + 2;
-- 
2.52.0

