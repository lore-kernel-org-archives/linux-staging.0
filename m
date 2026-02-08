Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15C5346E47
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548505; cv=none; b=hYlNCGF0FHTTA8keOHoJDQMRUUTS7XkgtYGR2P9+6dJldqmIs4M0WfHs3tZuGSq9M4VeR9kcLttCwVoPntoZYq+tLa9QrDIE4HFI19C02kra7gJHEPNJgzDp+hyDi5S2UHc1wsEzUMDZwI2z5/G/VNfazyBWiyfODat+KXoy870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548505; c=relaxed/simple;
	bh=U6tXGsDMaiPPT0EpneUhvBXryd5XFjQuo9OfzZS7qk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAGtmmKCdERjZ0JbCztfO3zCwb671i3MY0hdeCsRnyXEZt9wr7ECDekPItxacvA0747/NsAqE20nBBjbMbN9BTwIy7U6pyKxCbtG5U7MGHh0+2mAEuLFEMAQdsTpebVvPM8JaiBKJ7r9V8HmPGwI8o6hWyueBVg4kgxO0M9rg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bCqH+Bv0; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bCqH+Bv0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCKgyqzsp726x5p7+fnyesGWngCXQiLyokgJQ8o2qiA=;
	b=bCqH+Bv0eBO/6AOLSnaUD8KGEigdV5wgCiLtJ3+Uq2RXpRlAqfrwLt01PslxlPzpnQzkud
	r7aQ3kHChuGQVTAsOHRwYU3pe+j5xsoGME7BFgZzFmTcfOMuVbAxAVctQEkSBuKM0xy4g3
	dCt6QcXryuxcnPUlkKjFxqbv0TJuyyY=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 07/22] staging: rtl8723bs: remove redundant MAC_ARG macro
Date: Sun,  8 Feb 2026 12:00:56 +0100
Message-ID: <20260208110111.46642-8-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

The driver already uses the kernel's %pM format specifier for printing
MAC addresses. The MAC_ARG() macro was a no-op that simply returned its
argument, making it redundant when used with %pM.
This addresses TODO item: find codes that can use %pM formatting.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 0f28c904a714..8ae6fa6dd63e 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -506,7 +506,6 @@ Total: 28-2340 bytes
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
-#define IP_ARG(x) (x)
 
 static inline int is_multicast_mac_addr(const u8 *addr)
 {
-- 
2.52.0

