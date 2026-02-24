Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D29239E18E
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939698; cv=none; b=LMFhEyRvssMC+ZyCehc6iJ5iprPqnlLa7KsggkdGBADHwG84qErYkDv5SGRwAD9VtCg2QvIIRmrZEuIK9QOPCxhpxjvJJB9NYg3XF3hBSp/sWyopsc4+ftBf+H92EOxmHPQKXylvGigcWR4x+n1BN297d65x2S37KXck0xyV+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939698; c=relaxed/simple;
	bh=odrEuV9ntFAO7s+AJe7Uc+vYr+VMbAab80rx3FY8o18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJ4Surve/Mwlz0fqvGhwyOvorf163iiOtla/0BUN4DCS+4wZMAy6UjV5x0gvKQXjCaZvCtlkRpwf4ZlnEQ6jZC4KNk6/sonhHzTtqnVbJquTFZbGxxi9Pcoq8BENqiJ2WiOTEulHXXSq5to1fXfkgzgstpugOG/KrqEFZOxF8Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m8K8dV0M; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m8K8dV0M"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uieidqa/F9v/WbqVP+1HZe6zUlLnu0e/B2YNTmyFs7U=;
	b=m8K8dV0M77dADJlJZUPWLgimHscN0zd4CbwXfzXnyKW4tPhkJpVFe2DjESQPfLaoWJFfI6
	+LmzNBoisdxEVPn22/3fxgWFjGWziRHAp5HjA/19RQmXme0rN0t9kzsMLB6/jp4A7pph58
	5LOfqhy+kisSMggwDx9utGIxWwoQJoI=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 06/21] staging: rtl8723bs: remove redundant MAC_ARG macro
Date: Tue, 24 Feb 2026 14:27:33 +0100
Message-ID: <20260224132748.12336-7-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
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
2.53.0

