Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD490336885
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720827; cv=none; b=P/hduazFchlPW8Ycu9OmXvSzmOH4FagQ20l9e9HNpo7pw4LjD6gguw8uTntniOp/sEsy1bGrFPSSdlNBz/rNfM0YaSdb7BX7G3KpxAxmO35C+q6FoeG4dffTiBeBKCx7PEub9e/X16/HcsAHqC6ifiTzumCTGGdXKECexdcX+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720827; c=relaxed/simple;
	bh=ZCHCY1XZ3fIFCmvmaXnjnM3ntXv+z3BpYXCny314GFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vFH1Pw9fzi2g/Wvd2ANcNs5BA6jOMvaLmQCPUROfhADkqH/G7nM/PkgEVUFVAbMpPhpskivLwKwfy/WkIH+kX5uVNo2+28TfCUf5EJS9OE1Qjs3GlL+V/f4nhnXqInVkygrtKawT+DCiOr1Pw/hwrZ5WWHu9xJHycQhHhVKFby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh4ayy6u; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh4ayy6u"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso1835943b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777720825; x=1778325625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idjMMBAHFLgCsNcgv7mU7sCGkwbCErilRMFciMKTWy0=;
        b=Kh4ayy6uWoWE2TFbmK4rF4TrTJjQQMV6MlJ4IPAE55bXN5X0Qfc+6l0Mwn99f425T5
         PNYJaaLFWfl0A0HT1YZVTZ1BLQgVjmkOTRC3/dI4VlBXvGswZwxkaACjR0mMT8Agl34L
         /i6g2FoQ07KgKI6PyUOnrhiysEmckkbr1FQwp78cGvYWxFkSqrFEYvcFGUg0M4JNMCwf
         8ahP1Xqc6pIEBpT1eqMPVbKXQ02SGGEdgstdhRkXv/ChmsOQA2QFi+cQd50cvloun0mT
         xG0wyaqw8n88sFK8cUefprVcUjnFDdGejB6XbgAIDpt9SMy0B2wqi6ORorrKH0uLTAX5
         4Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777720825; x=1778325625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idjMMBAHFLgCsNcgv7mU7sCGkwbCErilRMFciMKTWy0=;
        b=MAqQTpzKFik6a4aYs4RtkRlTHc9ANN2K1iRFxUWoR2v9twcAUmhTu93LVEI+56MP6m
         dVu8LBthz14EQSfhPERWYA6ASYgGIP4YULROqIT5/k3cV1JRgAroMMO4zsqodINKfcZT
         dc+PoCgkiDVS9h7LzOeaE2AVt1Fv4iv1SqIhHp5jYJd+Ejo//AzQYtNcsrYs21y8hKD0
         8WmVpfu2bkIIN67b2SPcNFhGtJFYeWhQFaGjsJVFQiceHDqx446Teof+rl62FFFE9SnU
         ScgXKfhW8D5RijI7HZ7MxMcfaKbP7wxQyt0pm4f1aUKLQ+hQQrnYulXoDwEMZO3IK7Tk
         fp3Q==
X-Gm-Message-State: AOJu0Yw7DhDmJAzv8gfyIMc+YRf7u/pZNGC1cLREKYTfK2soUCbOy36T
	iaj6pNBijqz1/UKVNiwgaMwDgJbldWi7EC+Nzi779TbM/kT0ih++PPt4r19KTsoiRi4=
X-Gm-Gg: AeBDies+3mX4BvQ+d3k4WOuCDyRQpx7xyt66cx0GpRthLnviG93dPhKbIPxKwNuuPZ6
	DZE8uiFvvIkntQ/RY/xpjgMatsEe9uTGDnFnLhPzbYIJheu0Hunea3b5Q91Jqe3XLrJqJi6JmK6
	hMwQL+y+zVw+txP2au0iWBRkNROeat5dOi97kVy5MUl//TD6xtWtsf4PVJSCRuqRNfG9sK1pvqO
	brMml1vZW0BfJTldkKVDjHDQ+4Xm+QVxrG/Q5qp0nK2sXCMHCLl7/BrcYHcvk4FnLze/uZ/VSoW
	0Ij1vBg5eNI5dzX3kz9gNphxU0VFraZ/bw/tJYNnaEkezRgSAzlSPGgcrO45iWAtYW3Qn1SI6Fu
	dE9A6YnUpaukSoZAhKbPZHRPNtphBClrkdt2UVhXnKGXYJ8SZJKeW1by8sjgBh2wwSdfZalUvt6
	RvMgGZcSFRGv2oNPwfFHOXD/9wk8erDWbMlMg2b5CN
X-Received: by 2002:a05:6a00:198a:b0:82f:7076:cf2b with SMTP id d2e1a72fcca58-8352d27b400mr2756282b3a.40.1777720825055;
        Sat, 02 May 2026 04:20:25 -0700 (PDT)
Received: from sohail.. ([2401:4900:88f6:182:9ae4:cd32:8905:2421])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0176sm5258504b3a.39.2026.05.02.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 04:20:24 -0700 (PDT)
From: msohail22 <mohd.sohail.biz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	msohail22 <mohd.sohail.biz@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify NULL pointer checks
Date: Sat,  2 May 2026 16:50:17 +0530
Message-ID: <20260502112017.234436-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: msohail22 <mohd.sohail.biz@gmail.com>
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

