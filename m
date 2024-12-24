Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7993115B102
	for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025288; cv=none; b=XgIoD8KZZmPuaoBV9WuJl7/C0StQpNhRnJpmKh3kL49T0DyLY5VSSpsRxVosEyOdE56NOO4IBGyTut3zP0jBm/GDgLPVlm48P7AyYurQ/N8ez1+zpPuxEej8zpkSZXQue9xyRXpfA8okZ/tuehH43pRBA1JTIQ1HGGn3OGZ4Se8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025288; c=relaxed/simple;
	bh=/aEL8Nn8HnHRWhCO5Ux6tm/CvJvS/brGDzmIzjpuKe4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=au7IP3Q2j/IZMSKcGrwOadDybwWbmqYyi7Zw3VGEHK78JqG+qbZ5xb9UZlbk9n7hZsPpAdiS5yuYBiB/iWkJ4p0liHPUncHTZHS3HV0+AKKNQla9Ccyxg78eWn6O2f/Qqz7uDS3/XYayIfIN6NNWIubGpzpT0RBPd0POJN5xHzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5KOBX63; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5KOBX63"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163bd70069so47821655ad.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Dec 2024 23:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735025286; x=1735630086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYXbjyhxcBs4jzu92Mcp/+bq0RMMP2K3YtyWaDhFcc0=;
        b=G5KOBX63tFodu0rxUAoXb2w2R1LwIj+pgNuGFNU83s8MjBphwJFYS9voa4NvNdhBsN
         ynE1srGbBYTqQ36bI72tfARX2r02hy5t4GQNoHPXveYb5ORZ7A1AG8sAzQjCngiqCMWv
         FqRfi37W9c03OtMqpZpmreBNAHQ+eaLaHd4xyjukRMkvjnzB2t06iIK5LHMbavaHJvCr
         gPddQA1AUno/uemoROvOYXYn0u0H8ErJi+z2VFvAFkHcfYF/LUbG7OMrxz1rnaqNjZmw
         QuYtGW4Q4tzM3ZBNBTVGNmY9rMZS0S/MpX06eQ+ck/YPpDJ00PJKNf3kERCAfw5T0pVp
         f4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735025286; x=1735630086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYXbjyhxcBs4jzu92Mcp/+bq0RMMP2K3YtyWaDhFcc0=;
        b=ozRwQz+iuz6APCPYxMu+C7rwgQ2sNmIbXnOFivqUZTkTgXjgljlfJPq/KLhIs/QW7p
         QqKzFbSFM+BeYf4wnTxQEB6/1FLAqbaTAjYpj5AH5kGIf3vo8H9Lo/rDETa1Cx9kLKf5
         tNy6bAlcvedQrEn3kNKLuZPHqJNWOGu9wLj5EKfOw65IQOrUBPGbRZHVSjZMVig0UyCo
         r6f7RAwGyMCe2iTfRiQzclkgpa2ruIcKTSPyOy703mMf8uGadYKCGG2PjdN34J29xzug
         C7G83UfF2N1QU6x+MeTa0KSFFOoZs2MU3AQgrv88ggkVgv+Vx4Q8dXQ/qA8vig/TeZVs
         mOww==
X-Forwarded-Encrypted: i=1; AJvYcCUpAmbMr8hg66k61WcP/aj7yaWXhL2bR1oU/pF8tez7iua9WzFUvk73p/zpmjdXTUfkGAJwANxQXuHVBI0k@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3arRr8okKH/u6A4W31QXVAqSd4ULBqnpSnZ1kJLnNwHbtEIEU
	Qw7ZhSy3LmgWIwEVq3/B9C9G7fjrEKA/oesHQBsuqCsbZNg8kal8
X-Gm-Gg: ASbGnctghWlqvC72TqFS/5cMI365vlVVjQbL5RDqL+mWmWq8xRD/FIr+tdM7ypDc9Jl
	V0zIsFluthBlDEyle0AjR3VFo5zjt2GcBTiQRXEKfmC33RFzuoSRkzbaiF8NE83pl67UQnSNfAR
	LZFtrN6fqJpRyHny4wvfdEwAIVaSuhjs6mOYQUNjNFCcRH3OTMKUiUX0OCjWbatNElbOjgR5Pao
	zvaYXhIOQSPPHc/40ZA5vbe4S3fTiIrgj6FuTP5uZfNXaju8jkFZBMAskB+VreUY2mJ00N3Gg==
X-Google-Smtp-Source: AGHT+IG4Ivsa2J6N+uf87Klj+KSvPFj1OOetQQ4eND4Pmku1nRL/5IzXAjA+QMFTeqcfhv7ur2U/vg==
X-Received: by 2002:a05:6a00:8d8d:b0:725:e05a:c975 with SMTP id d2e1a72fcca58-72abdebc11dmr23370212b3a.19.1735025285608;
        Mon, 23 Dec 2024 23:28:05 -0800 (PST)
Received: from localhost.localdomain ([106.208.149.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8344desm9057643b3a.54.2024.12.23.23.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 23:28:05 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix network selection and A-MPDU reordering in rtw_mlme.c
Date: Tue, 24 Dec 2024 12:57:52 +0530
Message-Id: <20241224072754.2352-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the network selection logic to avoid selecting a network with the same ESSID as the oldest scanned network
if it was scanned within the last second. it also improves A-MPDU reordering bu enabling it only if the AP supports it,and disabling it otherwise

and also i have a question what does "new enough" mean on line 481?

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 +++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..b33846f88680 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -481,7 +481,9 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
+			if (is_same_ess(&pnetwork->network, &oldest->network) &&
+				time_after(pnetwork->last_scanned, (unsigned long)msecs_to_jiffies(1000)))
+				continue;
 		}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
@@ -1000,15 +1002,23 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
 		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indicate_seq) to default value = 0xffff */
-		/* todo: check if AP can send A-MPDU packets */
-		for (i = 0; i < 16 ; i++) {
-			preorder_ctrl = &psta->recvreorder_ctrl[i];
-			preorder_ctrl->enable = false;
-			preorder_ctrl->indicate_seq = 0xffff;
-			preorder_ctrl->wend_b = 0xffff;
-			preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+		if (rtw_check_ap_supports_ampdu(pnetwork)) {
+			for (i = 0; i < 16 ; i++) {
+				preorder_ctrl = &psta->recvreorder_ctrl[i];
+				preorder_ctrl->enable = true; /* Enable A-MPDU reordering */
+				preorder_ctrl->indicate_seq = 0; /* Starting sequence number */
+				preorder_ctrl->wend_b = 0xffff;
+				preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+			}
+		} else {
+			for (i = 0; i < 16; i++) {
+				preorder_ctrl = &psta->recvreorder_ctrl[i];
+				preorder_ctrl->enable = false;
+				preorder_ctrl->indicate_seq = 0xffff;
+				preorder_ctrl->wend_b = 0xffff;
+				preorder_ctrl->wsize_b = 64;  /* max_ampdu_sz; adjust as needed */
+			}
 		}
-
 		bmc_sta = rtw_get_bcmc_stainfo(padapter);
 		if (bmc_sta) {
 			for (i = 0; i < 16 ; i++) {
-- 
2.39.5

