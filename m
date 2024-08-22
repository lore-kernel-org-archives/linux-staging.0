Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093401BC43
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286310; cv=none; b=J4j9H4cV+L5LbuaEhEaaOsN9PkaKUiMahfQ4KFRw+Eb8fGzMvKJ+qZlWDYknnX9ISO6Qn9Bo9xgzci1WbcaQ8F3ZgvLBPTmPrSlbQwgjoQzC/FGILVzNRwhdO+QQ+nElrFsUYBe9t4zGfLcQJRH3FGSTCa+DWjEikwa0aTqf86w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286310; c=relaxed/simple;
	bh=aYWcy9/YcGAD0L5BqcJlxyeMVuh8DstfX11wptGrTBI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oJG4vgAEfRSORMWWih+SIh0h+9KuB3GibJqNDynHF7UXAkNJ0YUQIDhlfdWMOT97uxLxn+8hJx+ZuVR+QYWNPp4O7Q7+Kg4+PK6fpDxzlQ+3WOUGdSkNt9+8HzbjNvUOHT4pbdoP6ZsYRPUfh6/yiu4Y3+/wxKEMpf5KlfTXqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2+B+X3d; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2+B+X3d"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-714262f1bb4so237372b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286308; x=1724891108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGSlWgR2YHI06x+1roFY5gCQ/Tq2p/PLpW4gKEXuQY=;
        b=T2+B+X3driZ3FveNcNMlCz19iUIh2eP4bByLLKy3lBAym+JWHe/x/9kgvg3/roqIul
         0KMRIAZOuYNQECKmX329dnIksT54EsPl+rt4IMS+xIrL+TZQCPDvYt72HM3XmfhA4Eow
         8Ng4z3XbtSWx15RbUJU9wYKxToUkiUBcDOkHUIbSu4r9ROEw3PKGoyLwxqC/1AVKkOcG
         2OwSbfxovW0OAWHqXSHK7WsFRbiYwpFGlU6qy5xnA4Hm+H7XZ5aZpOAI5IF19rwjlSDE
         2hHsxeqRIXkGVc8xeBBdunh6Xopwf/JEs1UTz1RZvWOw1CvSxENkf8+Pc1e2TJJ8zHKL
         PQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286308; x=1724891108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGSlWgR2YHI06x+1roFY5gCQ/Tq2p/PLpW4gKEXuQY=;
        b=qDaxwv5WGIMwnu9FNrXV8N5VU9zKPvqDIRRPnB8a9sST/MW3yNQK28C166WlRvsNcD
         XOLNCCTvUiuzQuvJJhOT2fK3uFhfFyqF0VscyAc2HqV4wGNdera7VWXf/i46j7hYQTQg
         KkmKwf/tL5FFuPk+3anJz60rKsUqR2/WHsA7n0HV4vaDa5pF7J6adzDUPGEVg7nKKIMt
         aGEO2Hgw+kVYsa+CUDgXxT9ufxNId3ftIk1EX63x1S30LMJFL7xBbBUBV5dogC8xZrGG
         MIsBFj0hIy3ZEoCjcQNEtl0lO0tEStdg92nmukQhB4UMjdIJW1rGfxuXgKjFd//C3B8n
         3cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnG+gQQfL2e8Jdhdc/Gof1s1C01wPaIHcHcZk3zD/MT23arMpaqmF/vucixJgy0It5moF4Q2B4H0u2zVBk@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj2Dt8dm5Kqq2jFg7AdY2IA0/Kp++05pktFWZXY3KLbo6nqjCC
	sK0IzmfdI7UJmw6SuULvCrvQ/tUdY63aox+ammMqQuuXoQbjlSS8
X-Google-Smtp-Source: AGHT+IEH6iDa2lnrMavByxDDh1AHFBz+yklxGqZZiLR9qrjuSM7XznYXjztVOEEDvK8I12B8CbExJQ==
X-Received: by 2002:a05:6a00:4fc9:b0:714:20a8:d79f with SMTP id d2e1a72fcca58-714364d3b95mr264426b3a.14.1724286308204;
        Wed, 21 Aug 2024 17:25:08 -0700 (PDT)
Received: from reitoria-Aspire-A515-54.unicamp.br ([2801:8a:c811:1:4f42:fbc7:16d8:e311])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143433ac53sm229206b3a.212.2024.08.21.17.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:25:07 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Pedro=20Le=C3=B4ncio?= <aljpleoncio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix line ended with '('
Date: Wed, 21 Aug 2024 21:24:58 -0300
Message-ID: <20240822002502.92583-1-aljpleoncio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix line ended with '(' in _rtl92e_update_received_rate_histogram_stats
in order to silence the following checkpat warning:

CHECK: Lines should not end with a '('

Signed-off-by: João Pedro Leôncio <aljpleoncio@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..1e765a1fee11 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1521,9 +1521,8 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 	rtl92e_copy_mpdu_stats(pstats, &previous_stats);
 }
 
-static void _rtl92e_update_received_rate_histogram_stats(
-					   struct net_device *dev,
-					   struct rtllib_rx_stats *pstats)
+static void _rtl92e_update_received_rate_histogram_stats(struct net_device *dev,
+							 struct rtllib_rx_stats *pstats)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 	u32 rcvType = 1;
-- 
2.43.0

