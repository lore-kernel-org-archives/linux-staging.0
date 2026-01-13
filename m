Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F622301
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338915; cv=none; b=BA2R2XkwrmZxZRZ9+xguXQ/JTLyC/HJVhZXTgGCo32+il5dMeww+HbdA9oKt8O1Hqa5C+UWHQ4fCnIJgTp1HBvXPmJArw05Bj+ZV+q4UZjsc1QDNDJ6YGGqcjCxD06ar8Yqwc4ygUhM3wmLtNM30k+eyLGcXONlxXB4Ie6eDecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338915; c=relaxed/simple;
	bh=EfLrzLC0GykOXRwa0xUCIb8wli+cLPcOMloOsbkFbkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVNYBICc77TJrNIoMjQOANR5zbiy8DYZ0xDr8COYA0TfUxS0Bdt55q3od71qOajMdMNpM6cS7ISWzZ1GeqCtvk1bzbKnEc/ha1p9ud/K8f0gHMYXXIuq0ub8W6kd0qTiuJrVvFH0U/16aYTfF/89i3r+JHPIfXOgAqNdPqezUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWk/24IU; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWk/24IU"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso88672721cf.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338913; x=1768943713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En4tsTwJ9KEmAT6Sn1zGr/9C+1i+036hoKR7PvcWC28=;
        b=NWk/24IUrRPmoYLsjQtR9X1Hmo7ajUjtBJVjitkr088IXV08TA5BUd+uLmCWCK8mDg
         8w5NYwMqv9PIjKrbMIVIh66Xmft5fdILFjOOVnWMfOxU7l8DUGdq7T2SuiSrM3/VplQw
         kGlC93kGwqmQItc09Rl7qkJxi4wDzy9JZpjXX87DxruZV0InxXFx5e+jxUHXJdKbZ6gk
         4UwM5H8N9voLRkcwJ6DtusFo/b3LFaHZY0VdjIbyfzPhD4DsQPN9vmf8VHMIcTQtmHlm
         tSWRQ/bLx1PqSX0SVk1ueBE0/kFWwbf3uBTDId62+51St5NOeh0x/peabxHpZQWJ814b
         kr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338913; x=1768943713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=En4tsTwJ9KEmAT6Sn1zGr/9C+1i+036hoKR7PvcWC28=;
        b=rgpeAWTpZwAQf1utUahAK8EqYoXKSOT/UfynY+4LK4FHvpMFFbpQ7SUPodXaE62hSR
         QRQSQ87s0Z+Kdt1spWfxMZuKPLFEcyUfk2AgZIEPtK3rGh7aXZDoOAVgnCCaRpwVTSex
         8mCBqNgyCB9BZynHR7K0YfdgnQXBhN6P9XUqIkCtHcq8Aw8YLTSS8w5L1gFssbGXT43a
         3Om6xlCoxTRo9+vHbjnDMdQbj8VpCACFfgKPS0s/DSWPjwFpPVdgAMkRG28iim+0zVdA
         KGJ8Uex8vQoBxMXGKgtZB1++FJsWiKInLpM25awpNl2hlQVWuhFIbUsQZfKIjoYB4vHa
         Zyrg==
X-Gm-Message-State: AOJu0Ywt5h4JWF9i7PPocrrcz052apOijVg6TS6evhiB1wIeCa3nPcKg
	0uAC0J5L662uCez8ZH4F88lUPpStveQ8piLQRLJ+haI8oDlHuAD17M7u
X-Gm-Gg: AY/fxX4+mENzxuXx0tsJigVPeqgsfmy6J2PlHP/JcTjqHV29Dt09TFtlWjjaqQ93lJG
	S9Wr3e5Dr1ecwt1V+sxs3cvs1QhGYTae4Ad2UtUTYvI27C6dlEA0LKhXRi3UjVummUbraCjITQA
	DuJSe/f6kKmOwsDy16lZgQqHd0sI1FwRG/yf+8CdKoFDfNCyJGzXnFLhI8Q3X/FbCOV8msokkBh
	mliKLS0RLKaIMN3qsxKOWlemHXn2uW6mCpdHdO4joLZvP1QblQTwukefx8+0NQMpKdUFYS9Cr8B
	HBqQVTFItaP8un59monGahWkeH8orYeylpN/B3bXX97eczcEH3vKLHPlUCQQAS1kUgJcOxBFJ4y
	/tB2i9bNgm2YbYmkmkKyMbq9zxBzRlC0Ku0UV9KFgYdQn2q3+RBju0x2oYJkIqiuAg6UvG7t+6G
	WQXp/8q5btMCD16dG7aM/SxQ==
X-Received: by 2002:a05:622a:13cb:b0:4ff:c61a:d8fa with SMTP id d75a77b69052e-501484a635dmr7226971cf.65.1768338912616;
        Tue, 13 Jan 2026 13:15:12 -0800 (PST)
Received: from localhost ([198.1.209.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148eccd7fsm882041cf.25.2026.01.13.13.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:15:11 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: core/rtw_mlme_ext.c: flatten indentation with early loop continue in OnAssocReq()
Date: Tue, 13 Jan 2026 16:14:33 -0500
Message-ID: <20260113211433.89512-2-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113211433.89512-1-william.hansen.baird@gmail.com>
References: <20260113211433.89512-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace large if (memcmp(p+2, WMM_IE, 6)) inside the for (;;) loop,
which ends with a break, with an early continue.
This reduces deep nesting and is purely stylistic.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 61 ++++++++++---------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d3b395894d4b..4eb28577fb6a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1184,46 +1184,47 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			if (!p)
 				break;
 
-			if (!memcmp(p+2, WMM_IE, 6)) {
+			if (memcmp(p+2, WMM_IE, 6)) {
+				p = p + ie_len + 2;
+				continue;
+			}
 
-				pstat->flags |= WLAN_STA_WME;
+			pstat->flags |= WLAN_STA_WME;
 
-				pstat->qos_option = 1;
-				pstat->qos_info = *(p+8);
+			pstat->qos_option = 1;
+			pstat->qos_info = *(p+8);
 
-				pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+			pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
 
-				if ((pstat->qos_info&0xf) != 0xf)
-					pstat->has_legacy_ac = true;
-				else
-					pstat->has_legacy_ac = false;
-
-				if (pstat->qos_info&0xf) {
-					if (pstat->qos_info&BIT(0))
-						pstat->uapsd_vo = BIT(0)|BIT(1);
-					else
-						pstat->uapsd_vo = 0;
+			if ((pstat->qos_info&0xf) != 0xf)
+				pstat->has_legacy_ac = true;
+			else
+				pstat->has_legacy_ac = false;
 
-					if (pstat->qos_info&BIT(1))
-						pstat->uapsd_vi = BIT(0)|BIT(1);
-					else
-						pstat->uapsd_vi = 0;
+			if (pstat->qos_info&0xf) {
+				if (pstat->qos_info&BIT(0))
+					pstat->uapsd_vo = BIT(0)|BIT(1);
+				else
+					pstat->uapsd_vo = 0;
 
-					if (pstat->qos_info&BIT(2))
-						pstat->uapsd_bk = BIT(0)|BIT(1);
-					else
-						pstat->uapsd_bk = 0;
+				if (pstat->qos_info&BIT(1))
+					pstat->uapsd_vi = BIT(0)|BIT(1);
+				else
+					pstat->uapsd_vi = 0;
 
-					if (pstat->qos_info&BIT(3))
-						pstat->uapsd_be = BIT(0)|BIT(1);
-					else
-						pstat->uapsd_be = 0;
+				if (pstat->qos_info&BIT(2))
+					pstat->uapsd_bk = BIT(0)|BIT(1);
+				else
+					pstat->uapsd_bk = 0;
 
-				}
+				if (pstat->qos_info&BIT(3))
+					pstat->uapsd_be = BIT(0)|BIT(1);
+				else
+					pstat->uapsd_be = 0;
 
-				break;
 			}
-			p = p + ie_len + 2;
+
+			break;
 		}
 	}
 
-- 
2.52.0

