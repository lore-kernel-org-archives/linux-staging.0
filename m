Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE64302E8
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225572; cv=none; b=irjx6Dy/CBRM4RfzLL/f17Ib5kkkAqvSi2DKnaOGgEvHqQCro7bxOZQxegcOf/wtL+SbT1+IdfzRu33mWRhDM9ndNsBSpmnBSgj6TM/rRYscgcAU80suoT7sgG14gJW5LOJmLXq8omoWYL0vd9MD0PJy+dMeGcCnuTbdAZo2U7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225572; c=relaxed/simple;
	bh=uP/UTsy8kwYisSv/QmRJoBJoAc0HcQ69Td3V7W4PJvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvtbEVrPCkf/Vjhh3rx8hTRuJPYgcZTe1xOeFDoCp6bpskCDzqNmNmFoyY8tC20JK+8ah6lrzxonBEXXY94hUtJWSvL8PWijEtktlmCsAbD6GGPYuGyE+8SJlTM61idfXG8ycOf0nA8IbEyMt6dQuSt1d56Dd9KzfpVBzwCoT5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzsZ8YNE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzsZ8YNE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1225709f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787225569; x=1787830369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6yXEIzBRPpjoZFSbIo25T90zBhHhHVIBv06Zg70CmTk=;
        b=nzsZ8YNECsHFqgt+FDXnzl2znZPHqVbPNxsSTPCMPUeSAQ2QsIkfijs8Xo46zizj8D
         VqQDo5PG8Dc9ebxffmBkLjCy9xlm9oGkutXae9tJHVaphc2qpn00BTTCsS0EGMvFYllf
         4iD3AG/r7OkLZSEY2jDLfSKBCGxTWNkuWGDMfL+MsdGmQ85LxxD8HGe/YmqnvtxMyoYp
         QQRyq8WsQAio4Jgq1g1dtfKUk9D0qRTzmQbRu2PEqAM3OthRnPb2SRwY6l5TJhwNLBlr
         y14EjYVjp0zHzv/ETKuhCVuX1z1B3Ci0ErQ8GH1ZjM50aXPeurPZ6MzQkYO5OvEwgSvo
         KloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225569; x=1787830369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yXEIzBRPpjoZFSbIo25T90zBhHhHVIBv06Zg70CmTk=;
        b=Sjr/2vb4erPFYBSolqvm6yiw2gqF7ogB1Gf9BsSeEiYM9zy0OvF/E4qFwxzdMrUng8
         j7evbqAPU/GkYnR8Yza9fsd9xJmXyNYO8oigKl3rfx7vVGSpdGhWcu6SFL5f9ocOko6q
         6PzT48egYA0sWozVVFf1A4e3F3KAMvUsDPG0gBuRWQJDLLrFAOlcvaAwkhuzd78uySaw
         v83Sz8OArc8wD9ZwPJ1UKP/jwynmxzLj4AZKs4eLfY24PBSJ+5NRAmmR2QMZXlCLEz8I
         CcRRQzBRtkZIcNTiuxnWLy5YcSUnzxSI9pxVQF4jY95OoBdTCgNiIA1vtuVrC/75T3sg
         FSQQ==
X-Gm-Message-State: AFuF++mL/diweVBCBVcuAyo4vQnnznRgmZMjXVQVVoApWnAbvRs4nZuM
	dyQyEHJUhnt+K0v8VpS5UlK0AqmDPqO4CevE/BPX6REebmZCmAzjLndm
X-Gm-Gg: AR+sD13klglsDRlJ2W+VSLKYtNbLg37RSiP/hkNHbU4E3Vr8zyPLzN7cFR3CvJR8aQF
	nL2LTWFgmLzSuWyn04ggirXPwonuIuu/ODzGK99J8KrHRZQYxQ0GpeTy/ux9WIa23i5/xyNikk3
	IU+qKVBbS7Wtmg3xKpDegfv74okjtYP6ZiWoRGObKt2Th5VjfFODMMNsBc21Sh0ydifD3aQosRp
	+Nutaxyuuq27nZpUjL5C9Hp9AlEmhohRr85r3WJ4NfJXJ6ECMxDO/jCe6uwHgxqD9KTsi4vT70+
	Ivfg1o+HD5AaEBThLCxpBbp87EoV0jK5XIKOMbghMRcP9pt1/7gzrKL/jhydxCnzzCIQ2q6NCiF
	HIwi80YpOCF3I7JGrFZa5milm3fmvoOkPq2JowLfAEBLTNrtdX4X6REzXADY74d76gIXwQbvD+t
	9tBZxbcJ3X/kmLAcK6qbjcLDvMX6cBUvIJXhxUvh6dZFGIB0kZ5PzYbpuh6u72J43tsuoRgO2PZ
	omF5kFQewtDi64ySpdBmIflPSOQp4m3vhoxLbuvtRa7bQ==
X-Received: by 2002:a05:6000:41eb:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-482b1e8460dmr21869188f8f.1.1787225568843;
        Thu, 20 Aug 2026 04:32:48 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441753sm14183262f8f.5.2026.08.20.04.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:32:48 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH] staging: octeon: schedule the TX cleanup tasklet every 1024th packet
Date: Thu, 20 Aug 2026 14:32:39 +0300
Message-ID: <20260820113239.8169-1-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_xmit() means to schedule the cleanup tasklet once every 1024
packets, as its comment says, to cover the pathological case of heavy
traffic on one port delaying the cleanup of another port blocked
waiting for it.

The test is inverted: total_to_clean & 0x3ff is true for 1023 of every
1024 values, and false only on the multiples of 1024. So the tasklet is
scheduled on nearly every packet, and skipped on exactly the packet the
comment wants. That costs one TASKLET softirq per transmitted packet,
each walking every port and doing an FAU fetch-and-add per non-empty
queue, and it buys nothing for this port, which already frees its
completed skbs inline from the skb_to_free value it reads out of the
FAU.

Test the mask against zero. On a CN50XX board (2 cores at 300MHz)
carrying ~6.9k transmitted packets/s, TASKLET softirqs drop from 7133/s
to 597/s with no throughput change; the freeing work is conserved, so
this removes softirq entries, not work.

Fixes: 4898c560103f ("Staging: Octeon: Free transmit SKBs in a timely manner")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index cc20c1e6791..5e536827f87 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -481,7 +481,7 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 			cvmx_fau_fetch_and_add32(FAU_TOTAL_TX_TO_CLEAN, 1);
 	}
 
-	if (total_to_clean & 0x3ff) {
+	if ((total_to_clean & 0x3ff) == 0) {
 		/*
 		 * Schedule the cleanup tasklet every 1024 packets for
 		 * the pathological case of high traffic on one port
-- 
2.53.0

