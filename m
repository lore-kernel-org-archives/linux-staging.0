Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529FD2765DF
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406335; cv=none; b=c3bXnI5fHC02jstQSssKgeyTaTAf7tXgrClZLd3fsJEIwQujbCuF6ZhK5RdlEKi3vYtXqDVJGdEDODdwTRtgnrz8SPdD4JF6rRIEM9Hk1eltuE1Xj4FROAieg/jLfM/+htlBo20sGaIV4jF60UVzxfrx2OxyjmJZqbvh+O3caco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406335; c=relaxed/simple;
	bh=hAE7G4N9Ya6db2lFHzOOzat8Ysmrwdz8cUZo69vB634=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhnUMMqcLYx8Je73xdHMN8wSkjJx3zlNFG4m0WNn9yEXfH/HS/es9vmiaawH2Gl5tBRUynMgrM8WkYpn6InIdb9EgtpYp8H0XE3UleBCJ2LQoGse7uYTYnP8vG6EHVYok+20ud/OJSqrJLYIJnXODYleXYSMZYV9FTQyl5lW0mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL0aGgIb; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL0aGgIb"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so198954241.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406333; x=1777011133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es+n8UsduHXyp24gV37gSZyOHkapEOeq0C7l32e5LWs=;
        b=HL0aGgIb7ivjW3gioCwK870SIMA3Uq80ROfLJK7sHIGLzzLyHc0xqza5kzNp57y55Z
         HmiQujARwfv0l+0c1b7rBfS9aMEEmuaU8IUDBwLcnOCvnAIk7++wY3QPycmmP5wHHHvQ
         TNh+75clFUxmUReH01E1LuajXOvPWoc07HZ24azaq4smLkxNbtS5RJ39KOVU4CXgXRTb
         A3bP2QxRYJRKnARW6kgnZT6ZVYNqAasrJiqaZVayeVxfcqjtNt4N+ACJxvbph+BYJH5+
         ckNXSr0EzdyfJSZ7XLttrxM+GNjb9qbv0UzxSEz1eAXR1grMuQxrbI/cdtXOq4PRpLkR
         kIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406333; x=1777011133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=es+n8UsduHXyp24gV37gSZyOHkapEOeq0C7l32e5LWs=;
        b=pbxHF1c4Ba7DiRa40M3c1UZivF+mPe5d5rsQEsZ7WHvz8twmbw7xmMlKqL9NL9cc9t
         gi4G01uvMJ2r/Su17qlnZRDzwuEC516MDMVCvXEcWVJ9ep6Ebj/46eWWVDWtE07Od5pZ
         m1ICXVESr2ODWUdeI1okDRXXMQ8HQNltECi8UcLFShXHY7FZLeeP2HIeka9hVgFr26ok
         zScEcEdsIVjLJ7cygwD4KLE1fT7zS9QFlHzaCFwYrFZ8XJMcg6E4srEL/ITRL+Arz0hd
         h3ZaVJasbRoV5qC7XY9dCyYw15yPF/XZI14d5m41OhS4d+gBW+NRcHvi85GcbBuaeQUi
         CcNA==
X-Forwarded-Encrypted: i=1; AFNElJ+AhRCVdXw+BqNykPFg9JtuNbjjypPQTw4nSj5Zn4SeILLWGgpw25l5YVqCI/3cupUidBRs5eEHWpiKsE0M@lists.linux.dev
X-Gm-Message-State: AOJu0YxyIogir04Tf17POaPArOdWcFcRErFXh0ob42MG+kEPcuNs0iRC
	gOTqluJNTt5ClW7BecqdIx6+SJIhfonD8TmVmwicyx2R+psOERLbRfZ8
X-Gm-Gg: AeBDievpjL+n8A5m6hnYeF3FQO3OIKjIxdPgmEAZ74NAkxZ6viFi50TjAp/2iKZsYSW
	NJFx2JOeBMWZyNcLsAycN5O5+7wj5Cgt1VBtpUsgG6dEmyt23wJ4Zmu7/WAQ94xPsRy2FlWg/Zf
	ommZChXjgrajs/NJyrjCA4OZ4SNAlhfhzciX+BrNt/vSflyuHeUESX0yfKCfDz0BJaCPlg/E4oV
	N81gIopm35FMHYj5+/9f5ts5I/oAfJmxllEjmvCJg2+A4+2l7pCPqNUhsZchsp0UgMKOtAqEoU7
	z4MrzwBz5PP8GsrhVDUZWxzhcmHU/EYu0UAGw/R6lIPD3w59rpAEKsUA2oFl5RfWFOzfWtygBi2
	+cKBd79SXxtngoqj0pPCHwW1HlIeVODD7TBVF92+CVfkJUI2GKPIQPclA0UpzlNfCjbR7MtaJv1
	HZ+Fu+9S5YARS0JEXv5PdnLYhdokCHOHlbpnxnNoGslYA3Z5TAnt8F
X-Received: by 2002:a05:6102:6cd:b0:607:5cd7:cbbe with SMTP id ada2fe7eead31-616f58a6866mr649466137.13.1776406333287;
        Thu, 16 Apr 2026 23:12:13 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm297947241.3.2026.04.16.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:12:12 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v6 1/5] staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
Date: Fri, 17 Apr 2026 07:10:44 +0100
Message-ID: <20260417061048.62484-2-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
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
v6: restore the '/* memcpy */' comment that v5 had removed
    as drive-by cleanup (Dan Carpenter).
v5: collapse the identical cleanup sites into a single
    out_err label (Dan Carpenter).
v4: check return values of recvframe_pull() and
    recvframe_pull_tail(); drop unnecessary (uint) cast;
    add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and
    did not apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 36 ++++++++++++-----------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508dfc..8d5d9a6dc4db0 100644
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
 
@@ -1127,10 +1118,16 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 
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
 
 		/* memcpy */
 		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
@@ -1146,6 +1143,11 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
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

