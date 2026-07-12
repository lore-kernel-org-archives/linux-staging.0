Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5123C4FA
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 19:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883965; cv=none; b=H7+BafSmSoGIfEK1MZdmSkbZA5+/f2rVcNbE4IveoquLQ9pnqEcpBa+BaOvIiuTbN/YUJh45y2O4133hB444DO1+Mh/trsDG8jekHpm0GMA0qVBE3CgL0RWGH4S+USIbHgNfS8fCmToXq4nA/u/fQT1QB0bOiMSmtnme1lMBuJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883965; c=relaxed/simple;
	bh=/0CrIvbzuEFsL9l/s/X2hOSf3Oi73Do4m1QNmkOcvjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgVR59MFwuspEe0wlymwSSvKk67SPpuRXgw4dfaUh0zuPhT+nyuU++bkiqF7FsG9cVMtL7pRGFYWuIpbCev3tD1LrC21qMoJ7waFJw7MELdwPKMpDievY17/SRkGzi2TL1B/3VAHj+uqnfZv0l1Sg6niX0hgPK51uDmh8+zL/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRYsBttc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRYsBttc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47d70879764so1480260f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883962; x=1784488762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ES98A2sqLJ5x53ZR3enQehP1PUtXFzWuzHOXxFUrvYc=;
        b=KRYsBttcQnXC68NhUOd2c9iNwe3qCeJRR9Q6I8OsG9lxjHeHVmjsQxz9ncgq4QK7id
         kdsqPRJH/90HP2lLT+Z9AmEaboq06Hnm5J5IYJMzUkMx2LTuV859gGIOd9KglkNOTpka
         mdsGch6JugpFUNMaL5MGV8mT7EfdRT4XKmCvbOsmDuc1vC36ZTEDTpZj2di38NUvXUJq
         N/7BUX1niVAvs06RuUcbyggNXsBUoD5sKrwgEGozy7mLikXxTb5ug8v+oIclJrwkv3vT
         OvZGJN6qZRzAFm5digKo+QsSspNpvFCBpI5mnoRrhiqtNE5xpENLK61aSfyBXU2KL0+m
         QQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883962; x=1784488762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ES98A2sqLJ5x53ZR3enQehP1PUtXFzWuzHOXxFUrvYc=;
        b=SQKKmUPJx0D2bjB0RqIFCDtNegaVn8BuDnybr6cf7DmjlFyTACJVtIOHqXrMxb4TEQ
         QK/650odkjplb3TiiVi8nATLxIKVkDcQEmNrNzudiaYmYg4jnW6OEz+tE8Lk6TS2Us4Z
         r4TCFzjKcsNu/tpNpsXcifJPE1EqS1oL0R3gS6JY059pAMkkSmMmqj9qTlyMhuTIs+JZ
         NMSXzQkj6vZWTvFaO4iKg+p/UK5UNIe3rn9G3GrDGK17eAcbgGgs+givXqB/Nfd6UYZU
         Pl+vN31CD0e3rt9gLkcyET2Blxlcu7/0DWZaYO6x/Jp3OaT/Kj7P/fkqLd1q1XgLs1Xy
         PCJQ==
X-Gm-Message-State: AOJu0YytWmNBZL1Onv8o9Kv9wmh1sj9M1tRgtCMeGWyy3i/yMSUdmyNg
	knAUjpLktw5PPsfQbDVj0t6rZqC0g75RVtAu6la56zCFUU2/JTj1vqV6
X-Gm-Gg: AfdE7ckrhcKD4DJLOQW5TOYZb8YCJyYB2tyR2brt8KxF41E5wU1WhaHCrw95wUh3oOf
	NXEp4cJLrQSPZJomwmukhANdEDI2WC+WCrgK7Bse2T8cABXFehFog7ptX0jIkTY4cMPlzZkHCHW
	o8IUs3sqsaJT7AxDbYQQlBXKaaXvv3EQrl/89/5fKIevtQ2yPus3OXAq0vR9jFOeeDTxF+NYMmj
	00ejPwwxPZfAjhALTm6d7DsUunksywqREb76cNfuFQnIP63WlmfiRa0VWt1bA7t3dji9S00459F
	r1B43VHxidzzIYAy7WRtBlW7ak25pDdWXuqzskGwfc8OYv3oefPdC7IV6wf4508ctiLZD1hzpQh
	64AtqUJ4fMSnQH+zxFfcPcGuUCxwx1vLZcDTI6cHuuHIgUMNwYEnwPkMh72lz2cjOgH6tbfiWDw
	HhMZf9X+ls/IBUOBAE
X-Received: by 2002:a05:600c:5297:b0:492:454c:347c with SMTP id 5b1f17b1804b1-494013134aemr14915005e9.7.1783883962241;
        Sun, 12 Jul 2026 12:19:22 -0700 (PDT)
Received: from fedora ([169.224.36.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df6d9sm360899685e9.7.2026.07.12.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:19:21 -0700 (PDT)
From: Hussien Sajjad Ali <teamakeads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	hansg@kernel.org,
	Hussien Sajjad Ali <teamakeads@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix while loop checkpatch logic in enqueue_reorder_recvframe
Date: Sun, 12 Jul 2026 22:18:58 +0300
Message-ID: <20260712191858.369535-1-teamakeads@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

