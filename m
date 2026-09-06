Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B83CAE95
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 23:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788737823; cv=none; b=B+IVjl3wXKn5Eh7r7KFeE13OEMUaYPE6Yz+jAy0IfB6Ta8mUjTt8ni2RsVsUq6/hscWYzRLSc/ba7u7oeHYKTieFjHvziAz+tmnwaIbnMPiD20OS0bmeP8zQq45kCmv4q/YpcDsf71PYdVNY6gsUsG68fGBFvAbPGRW5jwsIm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788737823; c=relaxed/simple;
	bh=VwdjkhJUERDbpTJXG5pYZi5h6l+l4qUJaG2B8hCrLIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TopaBbF/jz7E9tEREC0hMLqxeQQJNrtlmPZ8uv1rw4JU7lRtNBQJC2GruY1uQews68Bbo8yaUzoBQ6MPbpugKSiz/BHduwhUYoZ6OBoJqMY5niOxy5ki7qAt0ucQZb+Ku1uirOs1j5JTtB8LyuRJep9Zt7HwgdsrzUq13c7iUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juoevQy+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juoevQy+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e257a23aso1970639f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788737820; x=1789342620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QH268fKTutlZ+SEZl6dKiMb3/rt7eZwRApzVk64JhiM=;
        b=juoevQy+qV9qhtr5eaosbpyxllbLADqZ5IGZ6+3imZB72klBnB1NB0tQqtnrui+kmq
         QT/pau5rhxLzOxDoStmW7a+jnCMXEvlcM1Kr/+99Cw/0VcoKF7IJSMERF2Kfdob21OsM
         NUcQS2sbPvXDv4Gy9xZ51OTiJ7loj8EUgOeGFnKpPbJT0SCENgkHglSqBO2CsJfBZm4S
         nx1IxCzq/hscnx8/VjLFUFxtHNlRNOnYmCs3OrB7QFPb01SzEZ6WycvwIbJd4M7gWDW4
         KtT8XCfcCnSor4/MEpioE40KiJAm9BW8qZdlOp/Iq2PyqEcRizRZYLpfUXXyEET/yRzj
         RAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788737820; x=1789342620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QH268fKTutlZ+SEZl6dKiMb3/rt7eZwRApzVk64JhiM=;
        b=WOymIJcnw37VHU50hHFJl5SWyDj0pFN7HFZcGIkjNquNYnXqDOh5O115GWFShH5VAQ
         h+6aNqnwxKcgy75V0I7sjhTX8caQptpeVCAOlUo/03U8yeliUXEzOAWVIOFAwvCXsmkP
         saD7P9/94H2cdskkGe9R8w+Lpm2swxKusLr/lcSDt+NTuJf0IUoDO/W2s/Jcs0avzF+v
         OXRttZSTp95UDRU6YTWBxgbaxUiTGmo9kn53mblgSbVtBjFUdsA96jRV4igdXPyAt9NB
         jsWnZPKgsWrv1jQe39/MhpFlo/AGUKeLxPPTaRArZ9GTO6bW9STKO132a/rKqQEBNJhZ
         4MXA==
X-Forwarded-Encrypted: i=1; AKwUvBz9fidvf2Qc7xusbRB4ff8Vbgh8uUj6bysaqAJpXIlW1NArWEWIF055nL2UQ/TfsLCt17R22/KMV+dNFgwQ@lists.linux.dev
X-Gm-Message-State: AFuF++l3TM2JD+q2+Q09vW8VAy6aCDLDgQj133zy6rxSvoRN0glzeF7p
	cAJ+TE3Y7MHpLW+RS8lkkeK0hoFfUo2s9mUrQ/48YunCplE/fXCWX0nR
X-Gm-Gg: AYBFou0cUeOl6MPqlyJo4KJYCVG3M+Dnwev08afZywqdcuMkhQ3Re9y/AxJ+7C+Lr/S
	DPjE9EoxJTPtvJN0OYly0IdKsxqmQlj/V606YzDWwTOC6UbWJw72MWrBeKssi7NeB7tNmBlHQR2
	fDmKNwQlVzZ2DBFhanCGGAQFNU/oPiNw6+Jky/jx8jh3kCfKNdNVlxSIC/Dx2vmr0dRZb7j3Vup
	79Gjag507foBzXoDPVh3EIC3KVi8EAIoK0FcbjI9je0j1uwisst4DFVRZhfpnhpVb1iKZ+m5umH
	YmdgWNu2us9bt1yAvgG7LDJmWxjm+7Qtm81dQSt0oDnksBm6oVhxRYvmPTgs9gUuinZceXKCf+s
	F0cQVQF8I4HEkHYWjgXWa3XE9lCPYTYy7mgjudlg/6jS4eiBZTXt7UfMtfBjwTEi5GpVSTEEUsy
	zQyJbo4jD1OKZ8GulxslgCuKZFKev5gE86H8gDKmjwqesq4vAP1aHA7xz3AN5Q2z9xcxwG8RFFv
	98eD1kq1IEbsEJh4kUos6j3OpsrYfJZRBV35glexyZd
X-Received: by 2002:a05:600c:4713:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49cfa20cd4dmr179163195e9.23.1788737820043;
        Sun, 06 Sep 2026 16:37:00 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm463602345e9.1.2026.09.06.16.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 16:36:59 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unneeded else after return in enqueue_reorder_recvframe()
Date: Mon,  7 Sep 2026 01:35:43 +0200
Message-ID: <20260906233552.971860-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In enqueue_reorder_recvframe(), checkpatch warns that 'else is not
generally useful after a break or return'. The duplicate packet check
returns false, making the following else on break redundant.

Simplify the loop control flow by using continue when advancing the
list and eliminating the unneeded else statement.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514d7c..498c7273f273 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1782,14 +1782,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		pnextrframe = (union recv_frame *)plist;
 		pnextattrib = &pnextrframe->u.hdr.attrib;
 
-		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
+		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
 			plist = get_next(plist);
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
-			/* Duplicate entry is found!! Do not insert current entry. */
-			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
+			continue;
+		}
+
+		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
 			return false;
-		else
-			break;
+
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */

base-commit: df2908090cda368b01ff43709f51890076c56157
prerequisite-patch-id: c05d9c90e8d4b20dfed666f3512e0d5bc54e2f2c
-- 
2.55.0

