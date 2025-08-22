Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52E3043C1
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870916; cv=none; b=LNeR50TvtuDQI/X7bJAbbCyruYBfwvGzx6hHo24Go/5aM4oZOX4a+JLHkZGYZH8ASs+R9tyd+7Tj20eHDObSXSvfAL++KPmHPT1XIqUVu09zMCOuU0ACohtw6aRlNuNyzozwriOFfVnj9ozgyW+cJElHurywK7ubjaRxOLZiCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870916; c=relaxed/simple;
	bh=LgyzdqVMiPain+lRHmnaeW/GX+zvtW8BC1gxXQa0LDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqn9HlfxEld46+TOZFCckflaC5xDDm7ioOpH5YP07wHKKnngAUZsSWzgPAechJBXYOo6h6ANgtmoxiok1h7oslLqTa7p913y7/Ri/9utLgVpMJ7yMhYvf1jyqyAVjjDJhmzJUU2CEWoHe9qFoQzlDNWyIiUmKp6fJGMc9YBtN6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cgeb+Lch; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cgeb+Lch"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78c77ebso317596666b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870913; x=1756475713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keZ3iPRec1zkTLjJm0DtrD1sLvqDfm5pAV2OYD4EfmQ=;
        b=Cgeb+LchjFDPFDgiELBdXbDJ/Z5ObkIGawgs9n6PBLDe/gi5ssH0COMbzblj0UvcI4
         pCetGnUT6GZ2m7Hhg4MZQiTZbSOdJYA91aFYmZahJRRJdd0MaAHMQYL0tsbsjCTFFCyi
         EUHNNlXtAnqSNNmZXZa/LlNRzM07yck7wzrx9xo/FuUupfbwH4JyVgBEmaGEnfOHyGbq
         tQ2QYYaCv/J6eepUd1PCM3qr8tPG3gMztnsZXdST9AIRNSKAp0Z/chmWF2J9I3rbBhxH
         FjXxD4S/25MgA4cD39ENqgVuBbeaAX+ur6U76LApy1yXvmw6IMdnv2NGgBCQmGg3s7lv
         BjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870913; x=1756475713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keZ3iPRec1zkTLjJm0DtrD1sLvqDfm5pAV2OYD4EfmQ=;
        b=JeHP/wFqZtO7xSf/2BkNKOJpklINTxZZCAaRiABJMPlqpSM+KaGZqWFqb4CTV2TMDu
         r7QLf6MJ8tlGU6R0dqlrygLzb5PNkCCYDLEMVFcmLV129qH8OCj0at1gpepjnabLSHAV
         eDYekg0+cMLk9ASlWsAs+aOXu6puzBNFxcFdK1WxgkFOrg4poZINg8bs0siQV1w29+ic
         F0nhV9RCn4SF7jwdAyvblAG1bF4vl9GpzCY7WDBfKZfA4JSDdrXvX1gevDj8BGIUvNeJ
         4zE08eCYyIfgvEkVSsYypxdhVP4WLnexOHgqhNXLmYnCmbN1p/LX3Cyd/2M2W1iP399z
         7b+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRI5L+l1e8wTuuVVRdcuvc9FixNr7hivMNjQb5nkbq0cTIR+S+d/KVmp6C3eN78BJK2KasB9eqq/onItuC@lists.linux.dev
X-Gm-Message-State: AOJu0YxUCi1ie+RudlD80+dvcVLRnjlj6zP7DCMi1zM2rjZJqBCi/Hvh
	OEq2KUcm+fASg+CJB4LHOKDsCX1uvWVyuuVv0EUJpSampXNqyhfhxJjy
X-Gm-Gg: ASbGncuEAED2Bn1BnnTAFI1Tx/3WtG+hFzxW4GNCy3mHKjymQHWDzEybEYaJzLhtYti
	ZkEtm3biDQIh8X5Ewr7W46NDZ8YGFh/n5EOfqfsyBIw7rvCJiqRuj+l/a4PhtifnHdNOrP9elDt
	pV6RZDaJavUkHFKG3tGpUZi+/h7nZqdYT+yTtFWayFmHttnEdOuoYKOMVI36wT8LV5vEyxximaQ
	K6XntKAGtANJ0o1cd7DCwaPVm1d22RlWfz8zs2Rj/8U1LFiGINe3F17b1NPrxglZmf2SBe8vF9E
	WT8iv/y0nfLrGYZhr7QHVBerOvqCvYhIjUQEVlzyIjSYeHda/LrLEcXF9t5wDIGnZZ+qA+xnLL8
	26UPNh1pvjiQ9WASwbCeY6m/FUvtk25Qwga2O
X-Google-Smtp-Source: AGHT+IGB2VS+d9R1FFVE/nvqPFuJR/VwUkKA+SKXnX9+VIHXQ1bWk1msBk5yankb9e4zYgiA/XxgCw==
X-Received: by 2002:a17:907:c10:b0:af9:a486:412e with SMTP id a640c23a62f3a-afe29031f48mr278634166b.26.1755870912854;
        Fri, 22 Aug 2025 06:55:12 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/13] staging: rtl8723bs: merge rtw_os_free_recvframe into rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:09 +0200
Message-ID: <20250822135418.118115-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the functionality of rtw_os_free_recvframe in os_dep/recv_linux.c
into rtw_free_recvframe in core/rtw_recv.c to reduce code in the os_dep
directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 6 ++++--
 drivers/staging/rtl8723bs/include/recv_osdep.h | 4 ----
 drivers/staging/rtl8723bs/os_dep/recv_linux.c  | 9 ---------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index b043e3d1cd82..2b054525b3fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -147,8 +147,10 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
-	rtw_os_free_recvframe(precvframe);
-
+	if (precvframe->u.hdr.pkt) {
+		dev_kfree_skb_any(precvframe->u.hdr.pkt);/* free skb by driver */
+		precvframe->u.hdr.pkt = NULL;
+	}
 
 	spin_lock_bh(&pfree_recv_queue->lock);
 
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 91fb275cbcaf..51b52d6b0367 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -22,10 +22,6 @@ void rtw_free_recv_priv(struct recv_priv *precvpriv);
 void rtw_os_recv_resource_alloc(struct adapter *padapter, union recv_frame *precvframe);
 void rtw_os_recv_resource_free(struct recv_priv *precvpriv);
 
-
-void rtw_os_free_recvframe(union recv_frame *precvframe);
-
-
 void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf);
 
 struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata);
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index 72fd86e03b5c..c5819c3c59d8 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -9,15 +9,6 @@
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
 
-void rtw_os_free_recvframe(union recv_frame *precvframe)
-{
-	if (precvframe->u.hdr.pkt) {
-		dev_kfree_skb_any(precvframe->u.hdr.pkt);/* free skb by driver */
-
-		precvframe->u.hdr.pkt = NULL;
-	}
-}
-
 /* alloc os related resource in union recv_frame */
 void rtw_os_recv_resource_alloc(struct adapter *padapter, union recv_frame *precvframe)
 {
-- 
2.51.0

