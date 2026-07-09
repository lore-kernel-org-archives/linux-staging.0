Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0830D3E8
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 04:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569940; cv=none; b=KrA6sdSXLGceBlZJLocx3qnIUUh8gQKUkqcxsLKf4sco+B75ZSMCc7KOOrpeR03KO0SSp7GaG34gb7T0/P+Ggo59ENcAVMeyZBMufVKh2av4Xga0AXKggCwSFgrWyvpXtWjojCdj+CG6+C/1Fbr0Y7oiNBoUNdpZcgGasweFt2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569940; c=relaxed/simple;
	bh=NUkT6/ShlhXQfW6C+ENmEC2nVNz5PjvePWYznkM82FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqRNRvq7DF1Ay51xw0Cqua1NjZ0ti4oLH8eNc2oGfELpGuKHpdgdnbGElzdOmEHx6RLFwtBQOqSdU9z407LsG+jj/NpTlONStE69CJVFB+ZovqifynxTdeOuDGcWljGfUNUqo5LIWq/6TovmsvpeLwIIXv9pRGbww0J9jE+tMj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBxF268r; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBxF268r"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfb91795eso3303101cf.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 21:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569938; x=1784174738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZFkyFq2h98y9zFF3PAgNEsTvcMZMCQphOX1Zg5eGwc=;
        b=sBxF268rUBQ1Rro9N4cYpfxjQ/8JvQsmstUuuqhqQ47hCym1bLvi7Aw06DJK42Cpbo
         jMFXU8WwdOpAqdXCn4rsvu0xxHb9FPv94BvJRpiLHiHacDhdhB29XHlIi4GjrAiMAG/R
         2CQUro07n8jI7tCHi3ioQ1ZqX/twTFwj2iy1scY+S4Y4n2Iiw5N2ueyfN6gHCxKar7aR
         UVA5Ld+3EQM6E66hEchjz7+pNyIEgl3Vh9rq1dcB5iGg00LbDIHobrNoUvrSqDa2d+i9
         Q3XeK0W5KDXKWIng0T6BcLGVmKeDdILGBIzEA8EJzi4HZzL0/ESLhlA2U4w25aKoONEr
         tUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569938; x=1784174738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZFkyFq2h98y9zFF3PAgNEsTvcMZMCQphOX1Zg5eGwc=;
        b=r/kL/8E4qFk5W5x30iXX4zY7ck35yXoMy0c7Np5jPTp1fHtYh8YR4eajR7K1fzo8oy
         Zc8HMPDp/hyBFkEAL9GXb+ugVW/A3jRgVftywW/bUu0a/+f3Tz8FgFr5m3l0HvBKYYgZ
         X3NKu9z85FryhVJ/4cv5pNqzCmS0Ci1ei4UrpCS4vZO88xmtAogGap2j8xQkZdWjY7zP
         WU1Ig/362KSBFo++j67+mGFpaBIejPz+luuGo1D/zX8d6RbBi/ta1F8vI3PpKq5I5x51
         On5V2bckcSYNt45kz/gLLmUF6xZA6W9qtjppc5p5xtje0XoLYYe9aXi5/LGKJlBsa/OL
         j0mg==
X-Gm-Message-State: AOJu0YwO9ClKlIUzdyMgRfam4b9rod75aToG336jEEnBDh/oBJJGa1Hy
	egreCaFQOTDeDE1YB49Qx4QI9iXK2MjdDThQlBin4xWXfsn+mRIvyIzC2oSByXby
X-Gm-Gg: AfdE7cnYyT4aSIzs85kDNVt3eSgRq8a2yKDflKTRlcL0ra7SpbGA7QkXKct3t3huRXt
	bmUqk3p+BSUcTBaixYDubg5+LZYxQzH+f6bRg1cx1NWuDJfVtdMt0mIPtU38aAK6PLwMixiuOqu
	YhvW0EvvLWi9hTAvuJQAd4gs17Wv39aVTdztH7/gKFJT7zj1P9dKBcNc97bLo4NAo+Z5w15AbaG
	GUjj3TDyiTnj+l1RNu1taB/i5Z3/PXNMMzOaaKxNktONKBsmW3G44q94kW/Zji2TQm2AptEOpwT
	XXTiXdkEfMgF8arKWkHxW9YZVeCxEIkNGwtXyb7W/wfvClMAKfTU13hNrkc8SnpGqgiCBtBe+ly
	5eqVbMSrf0KWDtbILqMYJ4xq+IilylGpkYfDxZQ3xzVs59pYxtx0VUc0l8b51QHxcslo6irdl3K
	6GnGMAGPPK59cgIEWa0Ne5H9vgizqJ20qY3vKCb/P7zwY=
X-Received: by 2002:ac8:59c6:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51c8b4fd27emr53968021cf.65.1783569938404;
        Wed, 08 Jul 2026 21:05:38 -0700 (PDT)
Received: from fedora (c-69-141-67-19.hsd1.nj.comcast.net. [69.141.67.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41abb484sm160848081cf.4.2026.07.08.21.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:05:37 -0700 (PDT)
From: Aditya Tipre <tipreaditya@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Tipre <tipreaditya@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove else after return in enqueue_reorder_recvframe
Date: Thu,  9 Jul 2026 00:03:48 -0400
Message-ID: <20260709040419.216324-1-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The duplicate-frame path returns immediately, so the following else is
unnecessary. Use continue while walking the reorder queue and fall through
to break once the insertion point is found.

Signed-off-by: Aditya Tipre <tipreaditya@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..c97c5fb73bb7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1783,14 +1783,17 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		pnextrframe = (union recv_frame *)plist;
 		pnextattrib = &pnextrframe->u.hdr.attrib;
 
-		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
+		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
 			plist = get_next(plist);
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
+			continue;
+		}
+
+		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-- 
2.54.0

