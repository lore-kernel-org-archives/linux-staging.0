Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED334FF62
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394972; cv=none; b=MfRRiFs/vgiMgXQd8hEa9tAKT+CcJnoZRlKkvRJL0s/uZYMzRmTG3xwpTbHxWWW7OG4EWXGcvt9hMUriDhz2fIRqUoeUHTJzprKlCaSJmhzxQglrxNgDxCHcevsG+n3yM8UNRo6o/lmfCELp0ae3LQtP+WiPyLv1+qGbsjMSv1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394972; c=relaxed/simple;
	bh=1RX4ZJXRy1W+znU6njTURTqBy+hEg0UjYtH5Zu8szko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYsVO4q+L4EtzaF9DkyFi5jUoZhcyUiV1DeRrgySCbNxAGtPwmy3W3OizceUmbE5huwk+aMFmjGVbTo6r6yyLSrLa+hG9oBZaAPmadPQt5bHk1/C0kPTG3F9eOBeFzZzaK8ChcHmQMSsmAJjkqqbgY2MVsrA/YxrLApmS1G6j5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLGt6Mj9; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLGt6Mj9"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a857578a8so68474e0c.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776394969; x=1776999769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n8KTIeckYp5KCeaWdljqxwsv5Ka32yuZHpdOtik6UI=;
        b=MLGt6Mj9d1Rg4JrY5FnX9V9uRwX5maTAg7TjznH+emAo3lDC8aL98OGMH8BLeu0Eyd
         6EfAkVkqtC8Uc+IPJUSDNu90rlRj1wl8g2n7OxZrO7b/fVicPbPzhsdK+EZmLTpc0gLa
         2wpTMcSKHtosuiCCBnL75a9NcOqVRG0R9iz/1FpEHX/DJ09h+aD4t9as5oDQjL1uV46p
         u4edh+hfrAhWB7BUc4OnTxw/mFfJCeIarKTOONU9ukgYKs+1N3+ttMZhAJ0CBR464Bgb
         GjwJUQejhy+X4Qr5sLOuQCD/vxtp46bvS2fRoiOvdV+hhlVjrg+1YQNjFRFUSaV5VgiQ
         Y2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776394969; x=1776999769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7n8KTIeckYp5KCeaWdljqxwsv5Ka32yuZHpdOtik6UI=;
        b=o6mfk9j7BTaF/RemCCdYHYYuTDGHSh5TydmvY26ChPUrYa/1My9fr3/jhnmSpgHocb
         yWDdgj9tQRlT4pOEhJ8KqkLgWQg6m9ZHW8nXWLhSfNlXuwZadEu2UV/k8gw4+6NQgZrX
         28QUjp6ke66SePQJolAHFyBa2X8NeALLgAY6n0pdcdKoCGzHsFjnLAnRrI7WTuvLfRKl
         7KfBOvqcR3H5y9p7oTlXNcmf+dxpPNX2WGC9I8/66/wJr+pY4REQWdtWRpTo/KXs6MMV
         n4VoHMIJTReOKl5SS3cwFUOU9PiV+kKW777QfPKSxaZPw1AHYnSlXvboV4Gbt12p9HBH
         YRcw==
X-Forwarded-Encrypted: i=1; AFNElJ/vaoXpLJQCvRtlwibogQHZunsNRiZvOS/CDzvnSi5pp4n2AH54CEyEwFMOZs0MTth5hQ5uM8y7cWPNcoeI@lists.linux.dev
X-Gm-Message-State: AOJu0YyLFStdJ+Ia0bXGWLflfxjVwSIEIh7u7NMaCkkEsLWvdHe/IWjH
	xIykb30OA/6U3Ku9b9LEbX3Yd5ZXWm2v/FHyKvQULb30KwQxW+0BnWnl
X-Gm-Gg: AeBDieuq2/j6GR7FOdQgOOeHxcg9/M39H3ZYZy1ekNMauf3FNC+UJ/qBNNi/G4ciGuj
	AxVHcRLP4nj5ixOun4bDFy+KIqidgu11xATo7xqdNVyNY27Vk1D+KuOcZlwrsi4veDiS9cVU49f
	aCIeEC2PVFw1epjqTasGZya9+7UCSl/g/zSRodxGR0OdLYU+NEz7/SckSR9HJsWzCrTAUSibQBE
	p3iAXWrVqht5DjCBLJ68n7P8k281hxD0Wlg158nqbHqg9IcpfbKmM5SCQHyk6RW3DqfyA74pLZw
	gCn6DqUnriC3iz4NprdjziQZCzLPgjM4yNhM7bQrVSxAMD8QeZMqfGDxcXmaKH1m1B930cNM545
	GulAjOpqRWLlSRv68dVPPiCjqNN2dSwFBpkyu+TJ/SC9iJd8aCZCqctfeoV85j4qzjrJZ5YzSWS
	9bYeLu7gG19PtkMoUKGbniahIMO29/GRJg3KD3GoCVc47H/9hVgjfQ
X-Received: by 2002:a05:6122:d25:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-56fa589b2f6mr601517e0c.7.1776394969182;
        Thu, 16 Apr 2026 20:02:49 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm131275e0c.13.2026.04.16.20.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:02:48 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v5 1/5] staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
Date: Fri, 17 Apr 2026 04:01:06 +0100
Message-ID: <20260417030110.42991-2-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417030110.42991-1-delenetchior1@gmail.com>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
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
buffer space before the memcpy(). Consolidate the five cleanup
paths through a single out_err label.

Found by reviewing memory operations in the driver and tracing
buffer pointer manipulation through rtw_recv.h inline helpers.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v5: collapse the five identical cleanup sites into a single
    out_err label (Dan Carpenter).
v4: check return values of recvframe_pull() and
    recvframe_pull_tail(); drop unnecessary (uint) cast; add
    Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did
    not apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 37 ++++++++++++-----------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508dfc..52d029c28ab1f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1090,14 +1090,9 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 	pfhdr = &prframe->u.hdr;
 	list_del_init(&(prframe->u.list));
 
-	if (curfragnum != pfhdr->attrib.frag_num) {
-		/* the first fragment number must be 0 */
-		/* free the whole queue */
-		rtw_free_recvframe(prframe, pfree_recv_queue);
-		rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
-
-		return NULL;
-	}
+	/* the first fragment number must be 0 */
+	if (curfragnum != pfhdr->attrib.frag_num)
+		goto out_err;
 
 	curfragnum++;
 
@@ -1112,13 +1107,9 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 
 		/* check the fragment sequence  (2nd ~n fragment frame) */
 
-		if (curfragnum != pnfhdr->attrib.frag_num) {
-			/* the fragment number must be increasing  (after decache) */
-			/* release the defrag_q & prframe */
-			rtw_free_recvframe(prframe, pfree_recv_queue);
-			rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
-			return NULL;
-		}
+		/* the fragment number must be increasing  (after decache) */
+		if (curfragnum != pnfhdr->attrib.frag_num)
+			goto out_err;
 
 		curfragnum++;
 
@@ -1127,12 +1118,17 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 
 		wlanhdr_offset = pnfhdr->attrib.hdrlen + pnfhdr->attrib.iv_len;
 
-		recvframe_pull(pnextrframe, wlanhdr_offset);
+		if (!recvframe_pull(pnextrframe, wlanhdr_offset))
+			goto out_err;
 
 		/* append  to first fragment frame's tail (if privacy frame, pull the ICV) */
-		recvframe_pull_tail(prframe, pfhdr->attrib.icv_len);
+		if (!recvframe_pull_tail(prframe, pfhdr->attrib.icv_len))
+			goto out_err;
+
+		/* Verify the receiving buffer has enough space for the fragment */
+		if (pnfhdr->len > pfhdr->rx_end - pfhdr->rx_tail)
+			goto out_err;
 
-		/* memcpy */
 		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
 
 		recvframe_put(prframe, pnfhdr->len);
@@ -1146,6 +1142,11 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 	rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
 
 	return prframe;
+
+out_err:
+	rtw_free_recvframe(prframe, pfree_recv_queue);
+	rtw_free_recvframe_queue(defrag_q, pfree_recv_queue);
+	return NULL;
 }
 
 /* check if need to defrag, if needed queue the frame to defrag_q */
-- 
2.43.0

