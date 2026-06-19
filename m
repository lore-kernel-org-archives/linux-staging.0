Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBA3603E9
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858269; cv=none; b=aYjJjcGkjDJRgVzUuGszdwaD696gO7anDIsAODPcs9pMXviv+ThrqwW58vTJFc4BYtLlSAScYBAgUQA3FqNafn9391zDIY+IYaVVxJyrN7cV9ZtrqZu5+ZLf4aV49RpAi4WuToUK+k5EBUA3i/n5fb7v5gEMIOKM7iMCYGtP1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858269; c=relaxed/simple;
	bh=gnxi1TVwoMW4mOG71jz8XKFs8Qi+YqJEUJ61YjUZqNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3835SpZLZrzUI92Ft/mNoLI/rLcxUaUlTq4oTk9z2Pe0As7GSrsv8xZk0CFIIgJ3YfoAgyUEATpfZ7pkZIVYB6mUlwyrhrWXOJjb7jr2zxthZasw/rLYDcXugammzUiGNh0iezUOjA6Gb/upvDNuzb2reUNN8PMroH4ERFSMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDesJot/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDesJot/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4629051c946so1481735f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781858266; x=1782463066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkoSLPA43c+LOm9ukRQEoZB0AMkYy0GMf5o0xUZvzzs=;
        b=HDesJot/puJTXOIWeh+NiJ8fhFyNehHhWvbQA7UBU1n5jRRzUq6YLa+xO5YIQqfMgX
         u+4/97U2Zjwn3fnnigLuLbJ7N5Ga8Fgi7x5W8YxVex9Z006BiHudwU1fOvbL60c18GVY
         kGpWS4BQFRBloS+aJzBfmC6CBrVgmd+5vzn58tW37SwqbPgTK/VNAHxAbC2D5W3cOjQk
         22XoSxCSwBVXMSzdTM63Rqfb0o59kXl0CNyB3lBviFAQMRe1IPwmKeyTJ2zIFKT+uQTY
         f0KUL0hibijwG6N7oagwRJ1h6qZpKiKIwo6mgOP45DeJekb3ZGdG7t3gNOGG7joQtj5m
         Cziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858266; x=1782463066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkoSLPA43c+LOm9ukRQEoZB0AMkYy0GMf5o0xUZvzzs=;
        b=DfLccNnwusM/yxokL2YPKOkWqSehxfXqGSEyZpAmIyA12dDQDopzqLewi1rPpmMzJ+
         q6dqYyWeo+VA+UEXw8PkzQksqDqGkOhhgrfPR1MdoPTemskdfLK5r8f6iUu9uZFZfq2+
         kDtLJMnRgJ7dQWDPfO7oCKHOmC1/0rwwEr4uy0OTncLJx5K3wIzIRkaqAzY4TlY5rEHD
         yRjhrISN+/pfLodUEfWi+lCSyO4kA2Sdv4UsFmRPtT0G6runpzpBupJ1dVIw7uT3hMnD
         obJsPKpT/ib3WdALAW2KPFIfRdx0Tu7CELZTx3c+WQNkoo/jQExjBrRdoWFMwSoNXP24
         ge1w==
X-Gm-Message-State: AOJu0YwLlidj0uFgpY40IVopZButODTng8OV8h9Ku+8SpWHco/Z9arNp
	wIlqm5x1x8eWInYlmZabL30eDEdsL4nYE0reZtASHdx0Em59Y6aNq69b
X-Gm-Gg: AfdE7cnnwttWz8RFjcUSNc94W7JhKDeLVx96HWu/VJW0G3YDCeXiyTP26VoBkKY2Fk0
	bAmQFiTQOxtTqmQtSDftWsNmEY7xIs6IFSXeazlEcNWQtTSTFaTJbJjHFTCKps+NbYwZ5wNj4lb
	n4Uge2MxfHD59cXt66UjF2y8+ZcAfRJTh04ZyUtSH8TG53hWXJmfkVuSNsk6yDwTBb1skchkeLD
	oIsxRcahpZJTVqJR3iCgx/q7OlfuQjyP+P4br7mQHMFXGK/3/Wluh9kFcXhHkBAUC10zeUdgPnk
	xy1QGYOo/GIGYxKtTWLV1ql9yeyQ4OP+6FpuUCd8vRoV3TgsAUFxx5ZAblY1UizZDWJFEW5Q8Sg
	6F2KUVL7F4Q5LLugetG//C5rkCJcU+lq8mc/RKa80qlcn5dPhOcJgERXXoWlnCUtGSjfQA7Zt8N
	yZ5ndJkuYeOBCMIe+OCmyoCdKOaUJfZ4EZwsGXNIRfwIUnhKccidQ0Scignq2uPuuzLWM=
X-Received: by 2002:adf:e005:0:20b0:465:4305:6460 with SMTP id ffacd0b85a97d-46543056618mr1894095f8f.9.1781858266130;
        Fri, 19 Jun 2026 01:37:46 -0700 (PDT)
Received: from fedora ([196.112.134.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c115fd8sm6062477f8f.35.2026.06.19.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:37:45 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Fri, 19 Jun 2026 09:37:34 +0100
Message-ID: <20260619083736.577096-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two function declarations from rtl8192c_recv.h that have no
implementation and are never called in the rtl8723bs driver:

  - rtl8192c_translate_rx_signal_stuff()
  - rtl8192c_query_rx_desc_status()

These are leftovers from the original Realtek multi-chip codebase
and relate to the RTL8192C family, not the RTL8723B.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 1f86654f0403..b63625ab4e45 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.54.0

