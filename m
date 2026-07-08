Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED44D2EDB
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520561; cv=none; b=MwdhHNCd+v1nO53WRYUopPEeYqMJEA/OYuJqbTGFUzItcYamnEPc57oFWe8VsGcSTxocAjY55pm5iZYGq16a0irZfmLSdi3M2xgTrK8yiPNnod+8AyMric1QTRcfCibXpitR+w3REQ7aQmvQmxDRhQp72/DNwAedtVFVt7+A1gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520561; c=relaxed/simple;
	bh=GEBDe6ygDcVdJteyu4gyRuM5eEswx+/2CS7imYWGJ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/LjJl5C1AbKKAlaI50SRLjnhyQEcsDer/x6ZRDMY2CGb+tPFliyIaYmmHMaRpVv4jMb4Ebc3EALXTex5Qv7xGYuTyWFjTgMZIl6d7avlKrb2RAFwnG9P25TIrOg/PG/L4WTcKXZpWN8FpESDF6FeGt5ZDPhuyl5MHXcqPs+Xzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kT7baTzZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kT7baTzZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c12614b81c9so139624966b.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520559; x=1784125359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLauvXHH5E0COUIrOF7SHhwlYNqylVZEHhXKw/C274w=;
        b=kT7baTzZYJQByBEuZkP5OWNCTxrQLvuwZm1sdSYueqSzWhw1WeSrvma9GKp0BUTCqk
         PCnczi5kufxKisXsNT+e9WTAocdKFo2TZuz7K6R33H0XXEsINt84MGXjSwA5DrcAWnud
         YDcthKWhyx3C758ixUA8hM5uDpaJxZqG4BvlLJMDMzVlnzgiw+JleR2GlSYI6HiW6Kkh
         jwTCRoqwjI3ni9IpFupT/KgtkJRcjG2wRNn8QGsNIMVdhTn65wcbihWVOvHQ4sRrWxIp
         HlS8Hf8R/RrvaVVBUoQGHh+a6OY3Qx5OUawQwu59DC9DY+BaTKeQi3zOzHfsBoNp4M38
         QnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520559; x=1784125359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLauvXHH5E0COUIrOF7SHhwlYNqylVZEHhXKw/C274w=;
        b=HBTRRkuNUktTQUJrvO1r2QpwvYtDni51a4RymLeJB0r1VyzrfCKsFREMI5oRaUPdoe
         mPNCf0ybisR/5qs+NfDYrLb6nzYS2tcTtS/Y4FGjE2JxvpoNMz2wU+pSGgSVKLcz1GhU
         glGQGmZ6h4vWUD9A4OdYW5tcS+YcqkCI7Gy+gvqBk9A2saOcIv9cXRF2dxMK6gR2Z/DR
         zvZRhD2KFLJsUESMINTaWeZc+029pAe/5m9ORl3uQsbK9aXWyMEZ09lvnkwkTi/5TAkk
         dJS6D4vliY6CXhLQryNEO4Do95gps9peJtAcU3oiKFvHggPu+aWOTQdTsySnrE2OiXSp
         KNIw==
X-Gm-Message-State: AOJu0YxmduGKrXWYG1yCFcW6utGOLMFiUtGKs3GKT8etfeY8v43kqGCv
	2trmeOE6baUjLOmyN/V2RlvyM9FQACeRSqOZxJUfacpCmWq+4FYy5g1I
X-Gm-Gg: AfdE7cn0/0T24uj5kk79AP5tAf/lgLKnbzcK12SJA2fasNg1y4ptDFhA1i8Rt4N2SVX
	n81gYCIP5f+Ff7uzU2Jo31PrckKUputeIO3RH4U2O/0HSxE6NKq96M7Rd0IvWt4SNq2sxmwexi4
	ZOWgllkNOWUmN/2Lyc1QfcXVanWujYuLhgJi8RzPjwevnJ7WTryL2xGFzuXpmpg1JhEgI65jQIv
	uNztM/x2SzV9qz6v7T7MgSC7eQfGMt3chRQBKNGSr2ZPor6qpqeyl7T1jq/3PH5MKH1A9Au9fwO
	yrUqxVhmT3juonxSgM6BncrkKzcF5t9ve0Beu11q6jewGFdg1cc0qGhT8aRn/i6AhX/gtwU5A+4
	SfczWrsvy87daryGJK70iq2vYDnAcNdWbPSjTYDjl2v334wCNv8VCHOpThGcKQSzGPuyaixdvqS
	bjI/Cmo9epkpTJw1of8uMlFZWVhsc1m+r1gCiiB4T4l72GGqIm77A0vzdE1QNngi/VE4e+OvvOL
	gxR
X-Received: by 2002:a17:907:a286:b0:c12:222a:9864 with SMTP id a640c23a62f3a-c15ce1f1595mr133041666b.51.1783520558568;
        Wed, 08 Jul 2026 07:22:38 -0700 (PDT)
Received: from fedora ([102.78.186.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d76e9dbfsm73438466b.57.2026.07.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:38 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Wed,  8 Jul 2026 15:22:27 +0100
Message-ID: <20260708142227.1774949-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
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
v2: Added changelog below the --- line

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
2.55.0

