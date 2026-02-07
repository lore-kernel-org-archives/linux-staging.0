Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA22882B4
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 22:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501715; cv=none; b=gRVb06xNN1pWQhS98sC2lrA/cYOshzTN5ZOdOSLC48zdlPJtwh9RHYKnZ/9ZBRiLiNtJR264wNGOav80pIoIyKGJ8qaBcO+Tk/8FD5wBT6oXekD9adjTJ+RIp3Lb8XhykGRvcUApDO6soPJ661CqHqcWrXfl5kwCjSzcsrPbIgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501715; c=relaxed/simple;
	bh=5i28y3bOhvY7qUTiuP2vhHlAoptFOxVbl8rjHTYhd2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5iDD55qTcBzlktuz7yXlxyxvg3+7rwJdL+oBCnggQS/NeGR6VRpVv4XEBEMBd1Jrg4isHiBntDhwymamN15ZvJyklzJOxO/g/z0vP62zrisnlrriNtC8vJEjuw39mtr0a0sB7WzPv5ISo6ZAW3iufifFGviAgsm3oa8ViA+3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLOgGHR1; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLOgGHR1"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89473dca8aaso26219556d6.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 14:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770501714; x=1771106514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anCKl9qRpb11WqLX89rOt28JKjQak6JjoMzSr7aZOxQ=;
        b=jLOgGHR1RGZzDNnZjRSy+UpKoF3Hei2TrHek1xMPk/fZE16255sqhcEUdVQk0HiZxu
         3l6/K05Fnop8kJ7mDCo5VgxFc6GQ4TxCR8qU2hoFDunp1KP2rJ3xjpGOddBD2jpJa+BM
         KQsCRYofWvhnUS1BRxfgVRNzfdJn06TIO0Lc0c0c4oa47MemZHe3MvHzf4ADtjhfapYC
         BMuYUUUfhCsS4RRXwKV8/dtMTRmNSOMQuo0ZooJdGuLkOMqQzDcjtiiSXHT3SjIb9BBy
         CJXfL6S+uqK61hief5CEtdFwLb3ERGfXPfNDSjsbFmXsGXmyMUlInm5LKkC2DPbiNsmY
         UcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770501714; x=1771106514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anCKl9qRpb11WqLX89rOt28JKjQak6JjoMzSr7aZOxQ=;
        b=Bo4a8IBLf3EtSioncrPSRfiThioFTzBM9HWOAM2m/YRcissRhdwV9pjBGIM5ajPeK+
         d5KxuaF2w1vv9k8KjIK16OFzCgne707GlHpHjWrUcbdGcsGXQl64JiuL1GVawDVfR3l5
         p+DkB/mO9KBBJ1r7MvdeKTDVogB49zVwh2vuOnwu4iOF5wogDaCbut78ruDJTsnmNVdI
         IHIWhRNxYweUYf7VF7KbUVtT6rty14Umxn9qFjfu17L5dbwROfPuTfrkrB6k65xRIB3z
         x6Usykl+p/tDzhTp9e6/ss1+xZ3pfl4UQva3Z+WFmhHsu1yJ2ZBdiq9BNyLA7h0RobKS
         TWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/9ged7/TI727+2PIsYAlogzO3qimPFyAT7j20+9BabDK0FTA2bkCsnhfq/tgJp93eJsJlWGqX2zciIoA6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6gklWlrHUHTwefg9Swd80cjiZ/wOPtQir6XmGhbYGbsKeW1HN
	5sxNqIvwIncil5m/vJXJ8V2qRzB6SJGwREbS9JwQsNmwj7mUArbFswtm
X-Gm-Gg: AZuq6aIfPv8gPWZih84lzpBm9vmVLt7+df8a+CGrLtREwjp1sNZIh8bOs+0cSV9NyIf
	cPuxrOAFH2ZKioIr4j9E/+266jBC3sh8X1poz0W3QTGds8h3vKzdDTKIRlY5622NhIAn1gJJhg3
	TgI8xsdaFLxpWLUTfTRh3XW2xKsK7fF5H6kK0UIULWGACwSUSngJpH8M0u0XQEjMYGyi0LolgIl
	YaY32wHpJgU/RifEInEyawLMKAtvwYNLq+L3+rg1LB4rqhwv2S4mAtP8r+xJFoTmB0FnJexPGi9
	61bsOSIWvS89ZVwnBz9qyqWO6/LgVXOxP2fGbnjSi2PfELO+Ehq+O7Um8bRgLBcf+RSEIo09jao
	X7llSPoZWooNLFXxP07H2SI5l1PmF120RXxURy/KepZ689+YT/c559dzmoEJQp8C/xi4v21c1cD
	8hUyfM4EAIvvyJzrcztTNAs69s
X-Received: by 2002:a05:6214:492:b0:894:6c8e:ed1c with SMTP id 6a1803df08f44-8953c7d62e7mr102501196d6.5.1770501713932;
        Sat, 07 Feb 2026 14:01:53 -0800 (PST)
Received: from localhost ([132.216.195.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf4a97997sm452720585a.0.2026.02.07.14.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:01:53 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	david.laight.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: replace ternary min comparison with min()
Date: Sat,  7 Feb 2026 17:01:36 -0500
Message-ID: <20260207220136.67923-1-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change type of local variable wpa_ie_len from int to u8.
wpa_ie_len gets its value either from elems->wpa_ie_len or
elems->rsn_ie_len which are both u8, and thus there's no reason
to cast them to int.

This allows rewriting ternary min comparison using the min() function from
linux/minmax.h as now both sides are unsigned.

Rewrite as well wpa_ie_len + 2 to wpa_ie_len + 2u,
to keep the expression unsigned and avoid overflows.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
v4:
-Rebased changes on main tree rather than previous patches.

v3:
-Applied feedback from David Laight and Dan Carpenter
-Reorder include alphabetically
-Made wpa_ie_len unsigned
-Rewrote title and body to reflect change from min_t() to min(), as
 min_t() is now unnecessary after changes, and should be avoided.

v2:
-Drop unrelated style changes and fix style issues by running checkpatch.
-Keep min_t() to make the signedness of the comparison explicit.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..4c3a89064c3f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -8,6 +8,7 @@
 #include <rtw_wifi_regd.h>
 #include <hal_btcoex.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/unaligned.h>
 
 static struct mlme_handler mlme_sta_tbl[] = {
@@ -936,7 +937,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct sta_info *pstat;
 	unsigned char *p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
-	int		i, ie_len, wpa_ie_len, left;
+	int		i, ie_len, left;
+	u8 wpa_ie_len;
 	unsigned char supportRate[16];
 	int					supportRateNum;
 	unsigned short		status = WLAN_STATUS_SUCCESS;
@@ -1158,7 +1160,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->flags |= WLAN_STA_WPS;
 			copy_len = 0;
 		} else {
-			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
+			copy_len = min(sizeof(pstat->wpa_ie), wpa_ie_len + 2u);
 		}
 
 
-- 
2.52.0

