Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3B346E50
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548503; cv=none; b=I6gXuobUMdxhhI53NIXXhXOY3Lefv+vFanBIGZyGtuCleZ7DBKGlZMKKxZeL66jjtuTpV2HXPWZvXLrMeVbNKyCJZVf/srkGb/P8C+8lRTGZ2NmbVu2bgcw092HgC+ClOdCsHRB7NdnWz5fwYoQGDMObZd2k6kF+WaCCgzoFpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548503; c=relaxed/simple;
	bh=gjz8v5ZY0HbL/KoCVNbCH0V1XI6Gj6X/JcPsgHXWFmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qg6MyRP4GwwH433yzOgZPDjwH082tNSvnG0rtkZ4bq1QNnNH9ydMxQE0VelcGN+iTp0ihsrxC3Oot7QyCOJyRKbCANw8blZ6mt6BX7cjEpXGEH78uXLDr/QBwtdu+CMo5IPLr1lkj0sa8IpaCbMyx2rrWwx+FS2Kp7x+SLKveH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dMsKZfna; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dMsKZfna"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hxIC7touXtNw7AoeIXY1HoE08ravNX7m9QTPbmfjlA=;
	b=dMsKZfnaHIQfxgTTH2dPehTo5ksuxC7NTRJPJIbTwRWRrZvD/3LZYaUn1IYOSqrzqTQVRv
	tp9RuuVpPnRYIjUBGHHsLWqWfT+Pvf7drfVD/as6fCirBD2E6ttVW+0NucZhLipN01TqDe
	NEbIrESoC21uDUnNvzVdYpwr4iCSbow=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 03/22] staging: rtl8723bs: remove unused RECV_BLK defines
Date: Sun,  8 Feb 2026 12:00:52 +0100
Message-ID: <20260208110111.46642-4-luka.gejak@linux.dev>
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

Remove unused RECV_BLK_SZ, RECV_BLK_CNT, and RECV_BLK_TH defines from
rtl8192c_recv.h. These are not referenced anywhere in the driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index ac3e08ad53cd..b63625ab4e45 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -7,10 +7,6 @@
 #ifndef _RTL8192C_RECV_H_
 #define _RTL8192C_RECV_H_
 
-#define RECV_BLK_SZ 512
-#define RECV_BLK_CNT 16
-#define RECV_BLK_TH RECV_BLK_CNT
-
 #define MAX_RECVBUF_SZ (10240)
 
 struct phy_stat {
-- 
2.52.0

