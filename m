Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DA27EC7C
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778032209; cv=none; b=KCy7dkcWd5UJJdA5Q7KH6CTvq9f9QjmxXfaKc1HXmfjE7KmWdHTU1xCD6RpOdJqNGS1q/DeN9bo6rc0G9dicGVXnm/JfV/2GX3xAYTkdn6IOEqCnKJ/lFMHZf3Ppm8I7VRp4vti/ruE7TsJHu5Thsya/XkuTfKkVhqfZEzmb2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778032209; c=relaxed/simple;
	bh=/sQTdGRfqC5IRP7ZGJ/IqMlqJT5YNInLlYrF1c8AyxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0iRKiIj07S9ZfsnhDHJu1GmCmhbDDhdDPMwp4IQAvC2bM/4ooW8rGcrZFWfKnfWRPMUUC5glrhCeoxdmbdsmrN9tH8172l5OMPuaZJcmtc3ZaWJnBBvfInA1I9AiY5SNv37SKDtEwdLE4yfDjYdaYncdw/tlS0Yvp61v/uKDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9nKBFTT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9nKBFTT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8367df48711so1373130b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 18:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778032208; x=1778637008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRXhR5xbabbrNdeC717C8VFaXt7k2cnxkkkIoH0BHJQ=;
        b=q9nKBFTTajPX80mVZqqcQuQLftW6Ibb72IhwA6V3rBvUsVswALVXXjPdJCu+119imw
         zViHb9ZmmqvaZwO1wge5h2gOoofxUJH9vcXwxDhLB+GfK2iUBTF3z5AQi1F/JmmXNSgc
         Uaqxl7tlTS0euk98TQEw4Stt5ihJCZUSz8jCjoOixqFZL+/dlmFA0si/tI4fyU7VhtLL
         ZTHe77n2GAbVW7QZxWVSF760V/2HrX5ymyrhH1ac0skd62nCPeztnpZRtHNoGz2ccFwP
         rh4hw2U/euYmU5ikR1af97EFEisl9Rj2XwLmeE44EhUgfyudLb2BT5j6MSuWPNF810b9
         n0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778032208; x=1778637008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRXhR5xbabbrNdeC717C8VFaXt7k2cnxkkkIoH0BHJQ=;
        b=TrqhRPoVjmSx06qMbm+hP5913C2DMqjIZhfpzl7mJxdm/YXxd1aCfknYfu1Boo2ESI
         64BH5ky3SrspCvN0sZNEdPpIa9uvQB90AgvEI5UCzmwq6QdWGmcQpDKBrNBrRPE+POuI
         zNeVzeKHDHF2dmFegH7Y4Se29aJHHcy47NHePuRfjKK38pqw0iQdwZyp7+rDmsPqltSK
         HCxTq6ddcJNX9mhG5zER9AfH2YLqQxGTBE/XeLKOsPxgOGrq483PdnImxdhxdfk34c8Z
         NIeE9Sk3oClYy3k0wsBn805CuJJZYaHLSDq9fArMtJijANJNfLZfg+h7I/O6s2siilo4
         6yxw==
X-Gm-Message-State: AOJu0Yx1BqnvH1e5DLRlZZjl6p6P2IuP1p7Iyd4F0sAH167RXNar9JAG
	1B8v0sUsfzmqwY3KIB+fl5C5//i4jBHxaFw53gKxpvFcfeWp6V6wfET3uP98/hg5
X-Gm-Gg: AeBDietRkChUZcJnc8jmEXfgVjMZTfsHuLX02TGrrMhJ9xIW2Q9dG7NCZ3B89MiEnYH
	WO6NlHT8zbf5FV3jGtkeyOsAR1njR8earnwoM80b1cKMmPxMyUD5RaD+4sQZYcAk5hNlzwCC/fB
	LpHbsAAlzIMF8OsMCDUag+N4RcdMVxXQnV7C7jPPCVaQogvek0Orq5eS3QeMCceDE4d/Y/mul+l
	hNeIhToj8avT/WyK4zwkeyYGADuMZ8bWgvdnOcNCNiD/tSbqaapiYc+kTwlIPaPOikSUre7PLj1
	XxX7ElXCAGxP8/UnsqOuL0l6U4BRv20DeF8yRy6lKb3+tXWCFY/Wy3RD/oP0hB7Hhj2zSxCkZXQ
	vhMQjte/sx/IzVdkTR3Vh8BCgtCOTYlmh/iyLGZuE82Nx64iOKIRo+f/6tzr24c665b3Ww3DtvD
	EhnQwbWUyt4tScvepFyiKcrH9W75z5b+y8T1LtwxQ=
X-Received: by 2002:a05:6a00:3e14:b0:835:6bdf:c87f with SMTP id d2e1a72fcca58-83a5b6c48e7mr1145885b3a.9.1778032207744;
        Tue, 05 May 2026 18:50:07 -0700 (PDT)
Received: from sohail.. ([2401:4900:88f7:997:7983:cac8:7758:758])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm4482548b3a.49.2026.05.05.18.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 18:50:07 -0700 (PDT)
From: Mohammed Sohail <mohd.sohail.biz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Mohammed Sohail <mohd.sohail.biz@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: simplify NULL pointer checks
Date: Wed,  6 May 2026 07:19:59 +0530
Message-ID: <20260506014959.7966-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <afcUjiVlxZIj3Ma0@archlinux>
References: <afcUjiVlxZIj3Ma0@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ptr == NULL with !ptr in rtw_recv.h and ioctl_cfg80211.c.

Improves readability and follows kernel coding style.
No functional changes.

Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h      | 8 ++++----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 8e45871f07f0..9c32d480a20a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
 static inline u8 *get_rxmem(union recv_frame *precvframe)
 {
 	/* always return rx_head... */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	return precvframe->u.hdr.rx_head;
@@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
 	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
 
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 
@@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
 	/* after putting, rx_tail must be still larger than rx_end. */
 	unsigned char *prev_rx_tail;
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	prev_rx_tail = precvframe->u.hdr.rx_tail;
@@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
 	/* used for extract sz bytes from rx_end, update rx_end and return the updated rx_end to the caller */
 	/* after pulling, rx_end must be still larger than rx_data. */
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	precvframe->u.hdr.rx_tail -= sz;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..8ae3adecafd9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
-	if (psta == NULL) {
+	if (!psta) {
 		ret = -ENOENT;
 		goto exit;
 	}
-- 
2.43.0

