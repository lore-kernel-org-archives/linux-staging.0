Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F340A929
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297058; cv=none; b=HKEIquXPC+e222z3Wuxj8AJ2s6gOiHq3sUqA7y5aWPhCzFCezcsDhR9xhBsfJL/+Ahi0KZy0jHRl0GpBylPFxDcYyk5rGnGePt+Mzj3tWWx7QpqcddMYjFDUVQT1AkwVoH75kJjrg7laU3fX+4VG9ItPRUF6v23Kzuk86rNhxR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297058; c=relaxed/simple;
	bh=Fcrv3ho4a/Bdu9R2pvvayKJ+uqPF2Z6594uTAfjTQmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLKa91/ocArlEAeZpWqTKzxiSeljYpMtgXAAJrIx9Dmg5sbh7QmvJ9RAGTekn2mXJ34WexOHDofue9GsjUnENFdWIUWlmrl6BDhV92B1cHiP+vw2vsZd/DlA6SALyoXFU5G8+er8XC3yV4JASxZUTXU2ejlHmo/dNIxqNnNI1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkxDGaQq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkxDGaQq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so4042155e9.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784297055; x=1784901855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpuRFlGheVor4/ei1mKLa9SoZ5o5hzTyVqzO3edNXtc=;
        b=jkxDGaQq0VnPYYloPq6Wo5ctz5g70xzSJaYtYL53eRCAUfqraFaLjw3272AqxqAP2G
         uuYn+xlkk0wU/euIDYeGl9/v/fD5xKpJEz/QMyPAzczwSReE2Le/R5nW43vN1JJkgzhN
         wZBD4x9IZpWr6Ph/K/NCd33wLC0amL86Qj3UudGSLqG8CL6gE1+wX1reVpgoHUpIWZdu
         Fbf8TNOjV1bYKVQLjoOEk//51ZLclQwnYdHRWmZ+6n2YqpLVXbAhz50On0/NZ8FaNhuZ
         JE8Cxge/hq+f6eV+efRifgd+kJJoULbHMOpTqxusbtwr57FG/9wbVECVO9xGwnFVOqo2
         FwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297055; x=1784901855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpuRFlGheVor4/ei1mKLa9SoZ5o5hzTyVqzO3edNXtc=;
        b=KgO+JSruZn2pQFDvLiYRi0VksbWxGYDsYrNWS4qCGFdQO28GuY+Kw1TRF5MKARm6vd
         S89mX3ckquEO7GrwXzEdgYoy5Adnjaoo67G+k82x6tisBaELw1vdx33mdc1ff20Nwftt
         dETnhfAgqFdqXwMFITNKDq4mv8L1V3vZu1my7Z3ARha5I8JIy5U6Jaui3FzSi4HAE1Nq
         0tDY2byZPej8tthp6EyCz3wJooNCY4diCvztZK+w8a5QHKY23yisGyOcAXXX6R+Iv4qB
         APS/dX39Fvpb78qh2OSHAr0s7T42cHr+Ax2o5vHM8B7/9vnIlN7gxi2vloma+Vu6uCV9
         T+Rw==
X-Gm-Message-State: AOJu0YyauQLy7PwHmkPxJovVawhr6Ax03HfzDAC3woGdtsZBYP8j6Y51
	YqNFHKneyevogvBv6Hgk4oMRAtlYDJspsrMBXdHk7sEUtMfrfOYDW3dI3vzoXkLb0Bw=
X-Gm-Gg: AfdE7cnU2r0VtMtBauHMg8fzzfsuSns6iBagURYge9RO2M65R6Rtm9Go0v0l+mtsqOj
	tK4qEPyYE/YQ3PeyBzYffMhWK4zD9rQFkWS+qK4ehBRh1QoVkY69ddAlN5FUlSOFgu2x3PsL3r5
	CTakY5uQ3sXkilwTIzSrRCl8tOrxQoiHrXMMAEgGq+uu7aCY3DKjbVn7M+iCLLtC6vANqUCl454
	f+LExQSZ9XJpylTKUbqc4LxqM/g8Cm5p21EEk06mtVgYmD0ppbBO5Hu/DeihOpa/lcst08DPaSe
	A+bd+Ci5Kk264F7HKTdn8mbNxrfn3MyP0ITTDjCY4S6x1RbM4FN//TntAFJoeXUmGFRtYnlhn7K
	qBY4i77uq1MFQl54upQK+UyStWvgIx1FV2ET8/+25aV0NMbYRY+IXl3rkWVVM92NGQ+6nDFkM
X-Received: by 2002:a05:600c:524e:b0:495:40aa:d982 with SMTP id 5b1f17b1804b1-4954a3d08e1mr35953085e9.6.1784297054609;
        Fri, 17 Jul 2026 07:04:14 -0700 (PDT)
Received: from fedora ([169.224.36.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edda2sm48354915e9.13.2026.07.17.07.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:04:14 -0700 (PDT)
From: Hussien Sajjad Ali <teamakeads@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Hussien Sajjad Ali <teamakeads@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix while loop checkpatch logic in enqueue_reorder_recvframe
Date: Fri, 17 Jul 2026 17:03:44 +0300
Message-ID: <20260717140344.16131-1-teamakeads@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl tool reports a warning for using an unnecessary else
after a return statement. This patch refactors the while loop logic in
enqueue_reorder_recvframe to remove the unnecessary else block and
improve code style.

Signed-off-by: Hussien Sajjad Ali <teamakeads@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 16ec2248b083..915559f64b40 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1763,7 +1763,6 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 
 	return true;
 }
-
 static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, union recv_frame *prframe)
 {
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
@@ -1782,16 +1781,17 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		pnextrframe = (union recv_frame *)plist;
 		pnextattrib = &pnextrframe->u.hdr.attrib;
 
-		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
-			plist = get_next(plist);
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
-			/* Duplicate entry is found!! Do not insert current entry. */
-			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
-			return false;
-		else
+		if (!SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
+			if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num)) {
+				/* Duplicate entry is found!! Do not insert current entry. */
+				/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
+				return false;
+			}
 			break;
-	}
+		}
 
+		plist = get_next(plist);
+	}
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-- 
2.55.0

