Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C6296BCB
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384250; cv=none; b=cHkD5LB7ZW1fI0U0UrMrc5zzJIpJ0VgPJa7tNE2WvcS7L0Tvf1o+a3RKXPYFW7ziztcx25+A0/XmpNKxdUpOwVUlIy8IxHUibuPUONRaiwwUDCqh1XkOLh55tJEMp2wr6Ti4YRlLS/k8UpPZJpcEYEgsC6Mr020zsksKQmr2G+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384250; c=relaxed/simple;
	bh=B8QYfDSeOgxGEDorbedsncUkQOeOjsJbGsULmtil6w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkmagKnS+L7/mdJ64/Tr6xrLpgNcAxOwccg9oVaA/9dFpE6QqEEJ6qk1xUo7MLybCsqksaICB4vwd8iCSed3KDS9PvaO2H/z+8+PvEUgDO1DH8CDwA8wwX1E0wvvD5nrb9ocN/Z4+Lhh9PX6/FeezZ+eHQYtI/7emx9u3J35nTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKVtG2nd; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKVtG2nd"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so2747360241.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384248; x=1775989048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSy6ct2enUeFQArxBAW1+GtdbKYWzb2RBJip/SzgHBQ=;
        b=dKVtG2ndmJUyTN3q/nnvySBUmhKqDDaIKEolf3Dz4EkYjBzR89upeTQdFwBLVXh9Q8
         wMm9XL+Jzbx/KOJwsl3lFu9pz4qYsUSGXfsCCHSpicoCrksw8rHhWr6livJQh1/65OU5
         XFKYQP+2A37jK6Wkwsl0uz2CXp+JXyS/HhVICWJNiZJTYLKzAn0x0MEWSddRYXsojK2g
         vRypa0Cx59G30wz/dbsiImnU60wFwNrLKQFLdqgfbqfCzdxEpx5u0bJC6VxULma+o5Rb
         4tyLsVFvqMmM/OUU5Q+JcsVJjs5yrm1mZXt+yB0pa3f7KqoJZFBB3zNU8S4w1rz9awSA
         gUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384248; x=1775989048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSy6ct2enUeFQArxBAW1+GtdbKYWzb2RBJip/SzgHBQ=;
        b=q7yXOAJ81l73jP2D3Q5gCeHEUeoVvElJCxCC9ziunXZ/TorQgdoMOkvZjh8m4SUjPv
         J3Qjf673F1apSmkPHXXOk0qwQU/Vvst+bCE4r+0iyTVHcsGhg0o4eTzfa/kwDBXrjLPD
         QSIgjRnFvKm0BVlXdYMZ07sB2enaiOLY1/mdJ9xKZvF1HmLMWMJYiR1DV7B69C9xSzQP
         4ELkfiwTNaPfrjRcPt/BB/jxCzJKGOJW+E8Ua85oqSWRgUC+wzx8QsRn1AARl5udncjR
         mhGiovl8TVcYK+2Lp9peXYlLmLeXReQtAGpfFx6ybtusFpC/O3D6p/TRGk83GaHQNocr
         pHQg==
X-Forwarded-Encrypted: i=1; AJvYcCXdEbOScpQPlltO9b2guwojsGaCL0eF87748ps1krrpJsMqZRg+MMkSz35Chh3YpDXyngTXj1V1UmaAu6/W@lists.linux.dev
X-Gm-Message-State: AOJu0YxnvtKmbajtL5NIoyuQ78Wi2jmMqHuLl+FnLF9wq0kt+tOflaGi
	SfJ54+oIgxLlB+h3t7qFn5NYGcZh+c0e/cgCcWrVSSDKi0uB7mXn1Is/
X-Gm-Gg: AeBDiesYn4ghhO+GiHlx0yKfEQbrJU6uPn+RKcZI40dKNKRg1S+8GO3NouwDwMjNicc
	MHk1jWDJSIrpJqtvlMXMJ5rAEPvAczeMny7zARDRSX1nMbWqaKRyvfFgxV1y79fhCCdVsEOA1Wr
	9D3AVHZAkMFnbBu1hKYZ0rSAI7ABvWx19Ru2qwxSyRBDorDSQQmSOekHhluJn+OVLG09l1WxIk9
	8+mCwRzdNifndUbYmO4GtDP/L36DBFKicGG2T/bIjxbl53v0R2fEQRZpL55qeVQBxqdgttsYO3D
	AnTXr4WBvgqdDIIsTYKtEBMosP1NbR4a4tGuKySd7B5WI+s7EsAKdJvG+pnGrNeH3Ip4agsZ51U
	7Voo2tb9k+JrwjHZQYy2ckGipa3Ga8hZupplKiOVshLfj6wugxXqiadPZ1zr0XjvnqtKGcU5fjU
	b+nw9b2vmHz8OHE/ddtfnYHBf7uyu7iIHrRGIOY1/0
X-Received: by 2002:a05:6102:508a:b0:600:d0f:bacf with SMTP id ada2fe7eead31-6058a87bddamr3874571137.11.1775384248563;
        Sun, 05 Apr 2026 03:17:28 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm10473385241.7.2026.04.05.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 03:17:28 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v3 1/5] staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
Date: Sun,  5 Apr 2026 11:15:44 +0100
Message-ID: <20260405101548.124829-2-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405101548.124829-1-delenetchior1@gmail.com>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In recvframe_defrag(), a memcpy() copies fragment data into the
reassembly buffer before recvframe_put() validates that the buffer
has sufficient space. If the total reassembled payload exceeds the
receive buffer capacity, this results in a heap buffer overflow.

An attacker within WiFi radio range can exploit this by sending
crafted 802.11 fragmented frames. No authentication is required.

Add a bounds check before the memcpy() to verify that the fragment
payload fits within the remaining buffer space, using the same error
handling pattern already present in the function.

Found by reviewing memory operations in the driver and tracing
buffer pointer manipulation through rtw_recv.h inline helpers.
Not tested on hardware.

Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v3:
 - Rebased on staging-next
 - Sent as numbered series with proper Cc from get_maintainer.pl
v2:
 - Rebased on staging-next (v1 was based on v7.0-rc6 and did not apply)
 - Removed Cc: stable (will be added by maintainer)

 drivers/staging/rtl8723bs/core/rtw_recv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508dfc..717e0594d983a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1132,7 +1132,13 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 		/* append  to first fragment frame's tail (if privacy frame, pull the ICV) */
 		recvframe_pull_tail(prframe, pfhdr->attrib.icv_len);
 
-		/* memcpy */
+		/* Verify the receiving buffer has enough space for the fragment */
+		if (pnfhdr->len > (uint)(pfhdr->rx_end - pfhdr->rx_tail)) {
+			rtw_free_recvframe(prframe, pfree_recv_queue);
+			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
+			return NULL;
+		}
+
 		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
 
 		recvframe_put(prframe, pnfhdr->len);
-- 
2.43.0

