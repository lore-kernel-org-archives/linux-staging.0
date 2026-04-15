Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD221CC4F
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279336; cv=none; b=k+8/tzpdl1liYdqhJb/0jnSBN4QrjqyKeQFaG0vGyUhvwD3NrSyViP62/RWM8pk0yOd6GrKveZ8g8yY3BIEHW9rcW3o/nMrsfxklJTjenqA0xV09dKDjKTpSbjjUUtJrX3+24CA3atp+zj2nfDsBpD7+kxAsNf0uInskTxtkkpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279336; c=relaxed/simple;
	bh=AMAk3cxwsNhyA2MXfiMcckkHbXFD6bfBWxE14QBYKWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbQL7IqiZyvZoe/BCIzqpfM6DSWvfVe3z6pA61C/ddjKpATDzJUCPDJzvItNWcYxDaWsFFbkREc1RN0TwY9HDR8Nl2Pl79xESuM8E29lj4Du27jmvAe0GWiI92rEmnZ/LeR7rrkAuBlnERcrmL408tYT/7bnVSwuz9dpYUkzpME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Erd6Fj7U; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Erd6Fj7U"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5673804da95so2953102e0c.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279334; x=1776884134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktjLVczqk0oTNjxVLTAvpBd6V50DhQU6m2AdSOXWKC8=;
        b=Erd6Fj7U06S4g242GPRNw2zszbphHdlTJbVl6scic8MFIAuWl6pP7iZnAry73gFFvk
         88xcdgj7zYO9xNNwTceiYzzPFR1hHqHL5s3JzoK04fBf8DET1RMaW8J0pLcKH01t41Bn
         eN1xmMYf8kUzdr9ASMJVozzF0GxMSKNtBy2IJBca0ttULQdXocqda35MNDbN8V1gCbuN
         iY+40VU40oKIAfeu1tPD9whdIYJtYLDS23FJ/SlTdyl1X+ekhz0TAXa77Q/3n4u8OYX5
         logumjWVY7zqlfvWYwVVZFFKlQrcYkMgnq0zMBNw0DxsOumrtPE0lanf+Gc/sYwOKxoX
         2ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279334; x=1776884134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ktjLVczqk0oTNjxVLTAvpBd6V50DhQU6m2AdSOXWKC8=;
        b=sG17H9poY5nPNouu4FnIXNUFPeYocGRzwJSWHJ/H7r4N3S2HJrBrW9LFXx8KNi1lgk
         bJvfuKllh9mlg/12AAyqpkCFGFuV/1PaIij5jrT6L8HMW4ikS/WfDjmSTkmEMTGptFtY
         39DzJrWAJcD2YkeoMaAqSbhC8SJ3pKf58YY+ZndGprnb5U4SNMtR7Ged9n6yVlmuA3do
         mN8DL32bZ/EXzQCoLnlSD2UIq8JWdXRu//UjHH27s9eRkrNmMA2Li3O8yELEUkN2DEv6
         0MwFsQxiZ8maznw1VV5MHHyySUKhjb2tRX2A194qZ/BMkrrsQF+bSQRNPZRbrmYAUzQh
         ntHA==
X-Forwarded-Encrypted: i=1; AFNElJ9Nq++ZyqRPJPas28H0Xd+O7+1UlVd/4/VyE4ARsaZxOCctimSqZT9sqcy+KCuoSSktLZiEiWXprejsPgZ2@lists.linux.dev
X-Gm-Message-State: AOJu0YwdX5lnorR5MjvsVId3rVe95Xmk4MDgHP4gBKhrltSb7qjbiqSr
	VWlqhECu3VV52Lg4X86xQ1MPz3d6VUasgYGnUrQitvGb++x/Y8jcTN6h
X-Gm-Gg: AeBDies3I2mN1tDfEB3ie04IKJHkgoQEQFaiTU6fwg1Hm2910SyzU5ixGi6GKi2UaBG
	qQN50fmyU/KVhQXjX4KG5m5QMyvWgHEjmRQnhk6e3hsYGQiyCZ+txN2qnPPAzIuTHa1zcdDgHIS
	oQfh2zQHWJSDfRyNR65rIDkuVFvA7Pbs3Y7l3cLN5WR9SCG+xPpqDOZeRox2B1khNKwl5Vwdn/O
	5N/HYei/AWDQZt3USlc4b647fvZentbwCTQMiBuBPrhOkIUyc91a9TK5sstYI29fKqKB9N/pADV
	BX9VIP1YDPiQp1+hLrXIJ6yN/ZXhYBfrtkb4+GnQMmNb9BHNnBHOShsGLr958V0RCRTMzrBwnl+
	wVhZcOjvZQ5gsY1ygNJG2dzf/WCGkojkfoiY6cmrS/JLjj0gGo35dhb2WM2v0/+s7EPO6WzCZcZ
	i9cDgNrme+T3ocjwKrM0noYhyR8I/JPEIRWWVWKhvjFrwqZrjpZ3HFOy6wKjScX48=
X-Received: by 2002:a05:6122:2887:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-56f3bbd2603mr10605366e0c.7.1776279333765;
        Wed, 15 Apr 2026 11:55:33 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89feb56esm1647484e0c.15.2026.04.15.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:55:33 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v4 1/5] staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
Date: Wed, 15 Apr 2026 19:54:57 +0100
Message-ID: <20260415185501.440492-2-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415185501.440492-1-delenetchior1@gmail.com>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In recvframe_defrag(), a memcpy() copies fragment data into the
reassembly buffer before validating that the buffer has sufficient
space. If the total reassembled payload exceeds the receive buffer
capacity, this results in a heap buffer overflow.

Additionally, the return values of recvframe_pull() and
recvframe_pull_tail() were ignored. On failure those helpers revert
their pointer updates and return NULL; continuing past such a
failure would leave pfhdr->rx_tail at its pre-strip value, so the
subsequent bounds check against rx_end - rx_tail would operate on
stale pointers.

An attacker within WiFi radio range can exploit this by sending
crafted 802.11 fragmented frames. No authentication is required.

Check the return values of recvframe_pull() and recvframe_pull_tail(),
then verify that the fragment payload fits within the remaining
buffer space before the memcpy().

Found by reviewing memory operations in the driver and tracing
buffer pointer manipulation through rtw_recv.h inline helpers.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v4: check return values of recvframe_pull() and recvframe_pull_tail();
    drop unnecessary (uint) cast; add Fixes: tag and Cc: stable
    (Dan Carpenter). Luka Gejak's Reviewed-by dropped because the
    code changed.
v3: rebased on staging-next; sent as numbered series with proper
    Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
    apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508dfc..a739c2bada2a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1127,12 +1127,26 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 
 		wlanhdr_offset = pnfhdr->attrib.hdrlen + pnfhdr->attrib.iv_len;
 
-		recvframe_pull(pnextrframe, wlanhdr_offset);
+		if (!recvframe_pull(pnextrframe, wlanhdr_offset)) {
+			rtw_free_recvframe(prframe, pfree_recv_queue);
+			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
+			return NULL;
+		}
 
 		/* append  to first fragment frame's tail (if privacy frame, pull the ICV) */
-		recvframe_pull_tail(prframe, pfhdr->attrib.icv_len);
+		if (!recvframe_pull_tail(prframe, pfhdr->attrib.icv_len)) {
+			rtw_free_recvframe(prframe, pfree_recv_queue);
+			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
+			return NULL;
+		}
+
+		/* Verify the receiving buffer has enough space for the fragment */
+		if (pnfhdr->len > pfhdr->rx_end - pfhdr->rx_tail) {
+			rtw_free_recvframe(prframe, pfree_recv_queue);
+			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
+			return NULL;
+		}
 
-		/* memcpy */
 		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
 
 		recvframe_put(prframe, pnfhdr->len);
-- 
2.43.0

