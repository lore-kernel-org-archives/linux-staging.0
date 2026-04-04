Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7A346766
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775343497; cv=none; b=M5sNlq6cXYuywAfEG0S+cpOUOcKSeaFIY0hS5gti+NgRjUXv4jcpMMk6bdKxs3aOKwL95GzRYLdTNj83C0yCedSRqirXKu3W3Qu9LL3gzgbKqc/x26kc8D5MaeFqZjEMx7PLZDp7qnKHCoegA8epNM83RwNyq6+2vf7FMeaUCvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775343497; c=relaxed/simple;
	bh=jGjQZBs0WdJOuCBt0m7HdHT/tOJU/5J/G4uFScR5Owg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwQe4l1e0YoN1vj1jWdbT2S4XQyNzeNq3S6aY33cfaLxBc+YyrAEPhwrgXxebZ3fOx5DSzKMWLrNMIYOIeoG0izBfxq1NBIqoWHYjCKf4rdCAjNxt7syBdWicEBpyW4862RWqlKeWuYcpoX34fXZGt+Zlvm5ZsWWGDSZyFr3vQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Of6dKbLB; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of6dKbLB"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56d8d479149so1000509e0c.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775343495; x=1775948295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCgSx5WdM/i+Hg88DXCQUL/vgC4TdcSzM3NNt+8nb8Q=;
        b=Of6dKbLB5wJ1ze3e1L599PkAyrInERsOqZLxiyUj7ewek0Hf07eu9dscNVcMU2eULX
         R9hYjTKEdkeeHMCVUHlpk2j0RdQavaYjSS/hboNO4ThRyjipghQK8KJjxFjrDAGHWYb7
         DRh3Elm33PF8tskjjJExRN94UZAKzhju1w7ruV6C9u6RoofKCfIDBQZa6TFVv5bnz6nV
         P+XzwNMEN4l7eCQY2M9wdh/PrLOm7ym/DAPI3fhWsRoRjIqKPDVoX3dC5ugdpSbOzJEA
         xwNb6O6gHy+fzyjwWMir0Bus00G+5vEXkj8nZiNWu/DFVaOsMdncDaEnu/l6A5Ck1KuF
         8/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775343495; x=1775948295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCgSx5WdM/i+Hg88DXCQUL/vgC4TdcSzM3NNt+8nb8Q=;
        b=DLeKpUnFLnK5a/CeM9DDRQeFjb5j9xZsZd+CUjhhjwoi+pK4lx0LdYWe1zi8w/Ng2R
         xuHY8cvdryXK/1u+nRJmszXXdVj9Fim64WrWonUZYlsDQyUJIHoOKPGviExfVQ/PKYnH
         isZ4r+/LJe9vdrshcXC963gkoq+xG5ONTouBUr5Y3RVzjRK66+0om0K0C24SrlOg0sbR
         0zi8Uf6VKxnpHQVBA7MABdS/fL4p02cjAQnNl5cSHre5EfFToLZz9X9X8ti4aphbLyfv
         MKfOkKDP2bCBhbwO0YBg73GsgTcdJtR/obhd6CZT2D0iv8vGrGrpi9YE3Zg3hYvM3x3E
         spEQ==
X-Gm-Message-State: AOJu0YzNfJdOd5Hd5rL0/6HWcGCYDLXSsOGh7Aay9ysVcAQHhn9LyoeH
	Yw50ITaLEg81PANp8i6tM1bqr50mgzUeJqOVgk9JegPGkhyK7TsWiHsI
X-Gm-Gg: AeBDietgCld+sStlPjMurNO/ikjkioUikNG4JNaBUNa36XC3QTsvebtDg1sem/aAT8F
	AlBGY3N8a8WnLSRbMRJNlc5+kUFQKCzE/+Eb+rBhrEjvsdGMOWw0HNTrFNxneS/liCHaeBe7QHN
	poRWCHxF3QdNnjSysNjbjcBCar+z0HaSKjsRtT87Gct/UQnnE0I+7FniUNq7SiaMsUSWL3HX9cg
	IN7tv2uWC+kyZmLXm6hrX2GY3BJpGbnzXkLJ0Y7uKSOLHyZQhyjtuxbsvmSSicXPfN97gocoV7J
	ftpVxhUAaqTwoTiVNaJSDpfgoQaBstLc/HDHoSwOfkkGAodDMOOcOeYa/gXPIrDV2lGV866yCLc
	B/ni6HgxaktylXHb9/wNkG/Dol35vqlBt1HWcB6BH4Qv7aVD+HWtn6DvSgxvazv1RwICarSWtO4
	dpbSFyZ2NJ95s0HDQaDpFWwwkJ47Wp6wty7jhlCYWN
X-Received: by 2002:a05:6102:5093:b0:605:4ff8:fc21 with SMTP id ada2fe7eead31-605a4e92bc8mr2314437137.8.1775343494660;
        Sat, 04 Apr 2026 15:58:14 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm11692040137.1.2026.04.04.15.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:58:14 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix integer underflow in TKIP MIC verification
Date: Sat,  4 Apr 2026 23:57:52 +0100
Message-ID: <20260404225752.61297-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In recvframe_chkmic(), datalen is computed as:

  datalen = len - hdrlen - iv_len - icv_len - 8;

All operands are unsigned, so if the frame is shorter than the sum of
header, IV, ICV, and MIC lengths, the subtraction wraps to a very
large value. This corrupted datalen is then passed to
rtw_seccalctkipmic() and used as a pointer offset, leading to
out-of-bounds reads on kernel heap memory.

Add a minimum frame length check before the subtraction to prevent
the unsigned integer underflow.

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b12..8d3c6761a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -390,6 +390,13 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				mickey = &stainfo->dot11tkiprxmickey.skey[0];
 			}
 
+			/* Ensure the frame is large enough for TKIP MIC verification */
+			if (precvframe->u.hdr.len <= prxattrib->hdrlen +
+			    prxattrib->iv_len + prxattrib->icv_len + 8) {
+				res = _FAIL;
+				goto exit;
+			}
+
 			datalen = precvframe->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len-prxattrib->icv_len-8;/* icv_len included the mic code */
 			pframe = precvframe->u.hdr.rx_data;
 			payload = pframe+prxattrib->hdrlen+prxattrib->iv_len;
-- 
2.43.0

