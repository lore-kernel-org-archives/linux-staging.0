Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C11331EA5
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781366303; cv=none; b=P9NuFX27s73xpI25jivau0mrI58oli1MU9//Lovp7Wm9YXuo5QF1E5Y0TlWuAlhGWSHG6iGWzGQHhbhOWi1aeyl31d4lC5xSqNprkAApRkgC5aPCeZmji3TI9PVDOl3nNS21y1sW1q9NaXglBwwzvSDBex3FotpkJtmXS/OmorU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781366303; c=relaxed/simple;
	bh=9+Ou08ya/EIgsRHxThJiDirDItH2ZegTIojPtclO47E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y422+jIeZB0KZEzGMdQrESsQEtQulQsTQce8bDahuxmfbz1SqBX1ZJf5VwLA57lgZFsk5mHKAtoTPODe1WDyAplsm+Y7xvocoyWbsgW/vXlQdCtNt9ug2YbGx72WprZk2z3eBZdDamCwteHBlaBQmJNmFHC77CFLJgXoXHOqK5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWDxIFBb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWDxIFBb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf125989f2so14784785ad.3
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781366299; x=1781971099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKipWgHUtmHSGe9NlsV5we6jYGi0UF3OsZVbkNb4DI8=;
        b=sWDxIFBbRTb/N4EWcI9XsTUdQ+LIxIUs03Syql3qBbRQZbcTIJZ7m2ERGSvy41Bzcb
         qbaW3xY+VKbkg9wyVYfky4/cE9pYysKo2Of4ZqjSL6VpQ/bfSiplrFKgUnXafc8veJvF
         LBJXEX3n0Ry8epWns6e1Suq2iQti8Hlq8Rxtw8KMfx/6d1IWPQLmGc2kEtnxnINwsqY3
         VXKHmFZifAbNRoMOwMv72uWtfhzEqTqLMbqaXQvtQRC8qd70SksnLK2KnfzWBIeq+ahE
         axiLosLVfxCysCv6uDM2YUCQx+DK/GQ3O+yy6hgqJ5Kh55iNLN014aBMkn6s7hi52bA7
         AaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781366299; x=1781971099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKipWgHUtmHSGe9NlsV5we6jYGi0UF3OsZVbkNb4DI8=;
        b=eocUbmwTwiMmIdlVNm18fGoFBbmteXZTLavx3NdEtlxRj69R2DLFMsdLXT1pMjIabz
         e5Q87J4JlTBBZ61rOo3Mubi3AXfV+0qZ6Bily9hqmrZVO69QVO8hepj4n7Acq8gJAhzM
         SlRkiQFjaL35jyXkSaJ1RyJFn2o+jmjJ8S+nDUozdCEE0WUObqGBLyKknC49rUktXIXO
         y28hC0Fmua9kYWE1F9f68s8gSIigWB1Dshp9UUsfkV8o5vKI/gcPgP/DxEM2X3Tm8vxa
         yrtPjkxR6WUqYdplS9A+IQPZcApEV6IVfP/K5Ei3NM6V5z3206fOEwTaq3IW48cjeQLn
         T8Cg==
X-Gm-Message-State: AOJu0YypXdlWkpX469HhRhmzZjOgcYCOobLRPVf8aKH9Q1K1nhRgG7uf
	+qb3HU7AMrTpdjUW77XVRnNUHYsZhpJjVKXXSoOXzyYbg4cXIK6ImtPD
X-Gm-Gg: Acq92OHqrbe7nxiOtV/nFMocc4i9wlpZDyHwLcb9jRdC9yAQu4YMbyHGIPBlBNGDerS
	iwrv1MetPB/8qZWpj4MaIecm+8vBDDBfA5sZnd7dPSZunuVU1pp0UWq6V8+jJehfsCd/QopDjHe
	S7Kf3GoXQvMUT+61Eo0dNyihCPdE5P5+RqhQQDucyisSyFxBbVkDCo8oYvMhN+uOorKgMDTuYwq
	qEKeUO5+btbZCf63J1sz1bKcge4VaV/TZ0+bcT/WKtVF2zX78JVpXvpyYYInTyqzqdUXWsDWuUb
	zPEOCRs8DkNIWEQl09N4mbIlwqAi4HheJDAx1BepZxxwVKtSa5WPR3k+KvyiQJE4wchrA7FrzvE
	jHiTTAIQ9drORWVJFqcNn1Wa5obvxCrkiP4ZmOzMLOPuJGN7JXTm24bpOWewJTzNsJlgTvFOdnj
	T+igDxCXA0ye2/WGbEgOC32BuV+g==
X-Received: by 2002:a17:903:acf:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c41206ffc7mr86878745ad.16.1781366299493;
        Sat, 13 Jun 2026 08:58:19 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:2474:4800::857b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4134sm47154115ad.30.2026.06.13.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 08:58:18 -0700 (PDT)
From: Brock Haftner <brockhaftner@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brock Haftner <brockhaftner@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake in rtw_recv.c
Date: Sat, 13 Jun 2026 08:58:07 -0700
Message-ID: <20260613155807.18623-1-brockhaftner@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of the word "temporily" to "temporarily"
in the comments within rtw_recv.c to improve code readability.

Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..0ffa69c38bca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -815,7 +815,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 
 		if (GetFrameSubType(ptr) & BIT(6)) {
-			/* No data, will not indicate to upper layer, temporily count it here */
+			/* No data, will not indicate to upper layer, temporarily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
 			goto exit;
@@ -895,7 +895,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 			process_wmmps_data(adapter, precv_frame);
 
 		if (GetFrameSubType(ptr) & BIT(6)) {
-			/* No data, will not indicate to upper layer, temporily count it here */
+			/* No data, will not indicate to upper layer, temporarily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
 			goto exit;
-- 
2.54.0

