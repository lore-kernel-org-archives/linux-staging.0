Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D8C3A9636
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419804; cv=none; b=iFgGU7VkeAkLt83NPiHYLQMHmVdhMc4bTY9eM2f3LfpXJ+aSCkyWuAAEJJzOcK3nEO6rVMhsMFoZjK2jMdTE+KKRY1c5kjNkrnNC6GpuNUuJgF3VlNXn0fAuSvU+9yIyVo1pJ3LwcN6Lpjp/rQ+lcSeisACK2McoKzBxDPzkQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419804; c=relaxed/simple;
	bh=8j2fuJ/CobaU+zoZaxoI8vwpmOcljoawjn8zh+K7DA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Una9IAvJujIAJl91CVSMAK94l9uwrnlf9L3qBxMoxtm26kZhbXNeLL3dR07rXVthfpcU7niMmMwPJJJnMD6SAesg/rNooL6yDtgZIW5O6vC+IRl+tOsCK1ZBLDj/OEmg2ejWjqnpVSfSYWVPXIbR46DCh089anBudzPAX/p3fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e18sD7IJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e18sD7IJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe608cb92so211182f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776419802; x=1777024602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6McsDPyH8QnKBdehE+9TN+kQ+OgryRDimxxkla2LXI0=;
        b=e18sD7IJS1TuBjwrGxJ5YmJgPcB6gcKumknq0eEmYWuU6fczb3f1iYYyr7ptoWbsZL
         K3YOnXOvtoq2/RVGVk5RD2w5l1SBoZgu85F+h+pnauxV3Yn3+2aeJ4zds1zkjSJoNZLq
         gIvh56d8zwt3DhpEl0Hte7EgOnJbKiaS6nR4Glzu+PNVCgyvesSuQ4b147tx5DZeGKz/
         9hcTOlH7FmjlIjddf4zdH4VXHACL9n//+Ukny2ugIn3Ei6sNfz/Ajkbb93iiFMvakZl3
         nmjlP6HutLH0cE7Ak6Hax40O0jWPR+nSHmUH2Oj6sb5kJpNlXcX0P1chSmUo2+VmdGqz
         sxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419802; x=1777024602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6McsDPyH8QnKBdehE+9TN+kQ+OgryRDimxxkla2LXI0=;
        b=N+4ZGeYQQ8YyMhdIP6YjeEDmdsJkK1lnxS/pWqSW5GXPKBByBS0ZLkvbgIugh5xNrY
         qdK51MGxMKu+2mz1M4KmTLsbIEZ9l2PN/gztKTeKQVvbhijnmlQmJCvawDW+lcXXCi0G
         jDfACHXaD1AQeGPdlO9HI8SupiDeQJEu3jV92stj+YRkTW32mHohJlyfiyQtlysIn2zb
         8/AJ+Bb21m/uP34ORz9vkeLfH1fKeniEoWSaPlEySqXOPqPOegkbAhyZvkffaa42W7j0
         pl559n0BKlQxj91Kyw9axDuKA3slqVk2S+SCE25oGd6dk7lpXSB+z4lqxgVlf8ogLKl2
         UiEg==
X-Gm-Message-State: AOJu0Yx+ymw+Jn/WGcJIT2T4h/2rBkPMt0/5RLnpfQAtTEG1lvNY6nR3
	jom21dIYNPDBwW6WbD8CSO6ROsVY7AC+AlXg/sKX9+P+ABELrm9vPoWh
X-Gm-Gg: AeBDievc1oB8UJnT6IOECLqQn5vpYQVAwDmfoH8urK7Ucm7HoXva0SYwm5cJJJPSI6I
	vweOes95B1WwVt67ohYqaR2d445MY0fBA60K4x4Tu447uy7zzE9sqcaqCt6LO6lAv56vxXWEzZR
	Ufux2CzKCpyP33s7LeaQqk18IC6N5V4xC0/OGZRhdzhftK5EadzK0DLPfeyj4jK8+sMbn2jw+nc
	yf7GBdgehQt6JTHgJw+wDCa6OQTLooPnlSZuD8hgtVx+IvQ9s6yrJdyQ/nZ4YbxRE/p8HnahF35
	n1IozJycQlcWF9LNucPeFUtc9KlwL5zOH0SoWEFDfh91wIwHMWD716a1IVJbqj7OgagSbf6cK/Y
	YmMPfuqnEzUIVz5oaZy9P34W2JwDoXSPE2jqrCDBDbRZUgJjvLcMrYnRcr02LCohbIxyWGWRogE
	SfCGpcQrcQQegYxZnezO1RTWe5hMYNSr2iRNvZFfA=
X-Received: by 2002:a5d:64e7:0:b0:43d:50c:6f18 with SMTP id ffacd0b85a97d-43fe3dc37e6mr3243017f8f.11.1776419801590;
        Fri, 17 Apr 2026 02:56:41 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm3454917f8f.19.2026.04.17.02.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:56:41 -0700 (PDT)
From: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
To: gregkh@linuxfoundation.org,
	error27@gmail.com,
	ethantidmore06@gmail.com,
	starpt.official@gmail.com,
	straube.linux@gmail.com,
	sameekshasankpal@gmail.com,
	arthur.stupa@gmail.com,
	luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: fix stainfo check in rtw_aes_decrypt
Date: Fri, 17 Apr 2026 13:54:51 +0400
Message-ID: <20260417095452.23440-1-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
Invert the guard, so it returns _FAIL on invalid pointer.

Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo check")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-staging/E4BF62EF-C6F6-431F-8EDC-77C1E613E66B@linux.dev/
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
---
v2: rebase on staging-next. Split into a series of patches.
v3: add Reported-by, Closes and Reviewed-by tags.
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff2910..f467cb5b1dca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1212,7 +1212,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt != _AES_)
 		return _SUCCESS;
 	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-	if (stainfo)
+	if (!stainfo)
 		return _FAIL;
 	if (is_multicast_ether_addr(prxattrib->ra)) {
 		static unsigned long start;
-- 
2.51.0

