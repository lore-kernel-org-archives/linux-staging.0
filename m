Received: from geovh.egeo.net.eu.org (geovh.egeo.net.eu.org [37.187.0.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111BF4315F
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.0.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500459; cv=none; b=FVJQgkhEfWgEwxebSY+mGRYufOqIyPEFfhlh5d73fh/k7DojVrZKzvkdIv/bACStMBRpifZi070+LxsbsegUEU9FvhPe9od1cEzszfqx7nR3zgRUDA1FahQ6I+4ozzq/NXoFMQN68tmL5Tqzpu/0dKB0mORr6zlS7Gsu8223SXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500459; c=relaxed/simple;
	bh=Av4sZlAnaXxNH+OG5H4W3D7HSIb+S9k6Olf8ZLnd3JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/FuhqbKFpBs2SC2RjaLrFKoiO/1Cj4NUjp2UL9L/RVwVFzGbVGRskWvXM3Ge85pWfxLw+MrsHF3c6rT4rUla3kCYkNYl/k8jk5Mmm5bGCXcC4QCleXs/MengH5HHfJz1Q6QpvsY2gQroyo1mSFW5jLPhPxvOl3INLE/y/h2nJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=viard.dev; spf=pass smtp.mailfrom=viard.dev; dkim=pass (2048-bit key) header.d=viard.dev header.i=@viard.dev header.b=qa0XMd+r; arc=none smtp.client-ip=37.187.0.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=viard.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=viard.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=viard.dev header.i=@viard.dev header.b="qa0XMd+r"
DKIM-Filter: OpenDKIM Filter v2.11.0 geovh.egeo.net.eu.org CCB598006B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=viard.dev; s=201812;
	t=1752499988; bh=Av4sZlAnaXxNH+OG5H4W3D7HSIb+S9k6Olf8ZLnd3JQ=;
	h=From:To:Cc:Subject:Date:From;
	b=qa0XMd+rgnvSKSyhF6cVM2/2pESa6YV3QWT231wU1BZlJOa+pLCXGfFZlkmQFQrtm
	 bHbnaUD7w/3i1DWDdC0vqGTX9dok2x4UdDDB1uE10QnkhEa6C6TyJWd7U97bqYzh36
	 vorRyrUf11k59VfLBCP4DDedqf3881bjLg5kWtxj6CpV8lGaoAo63/KzJVSRudA5mr
	 /WgH/KvYzgn5v3mehE6Yu2OBgNPbG3aXLb5TS4qFLyLv46ifq/eXtOv/kkY5USYmZT
	 H4QoZeuVY2k4xAuTNZodSJQFetaM9Xx0V696K+LTEEu+/AKcSL84kSojHuSP2KcFnj
	 rkxi1zts5uAdg==
Received: from slimgeo (unknown [IPv6:2a00:5881:3041:2700:399c:b271:5bcd:1c08])
	by geovh.egeo.net.eu.org (Postfix) with ESMTPSA id CCB598006B;
	Mon, 14 Jul 2025 13:33:07 +0000 (UTC)
From: Alexandre Viard <xela@viard.dev>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Alexandre Viard <xela@viard.dev>
Subject: [PATCH] staging: rtl8723bs: os_dep: remove whitespace after cast.
Date: Mon, 14 Jul 2025 15:32:30 +0200
Message-ID: <20250714133238.67997-1-xela@viard.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "CHECK: No space is necessary after a cast"
in sdio_intf.c:292

Signed-off-by: Alexandre Viard <xela@viard.dev>
---

Hello, this is my first patch on the kernel, I appreciate any feedback, thanks!
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 5a7238e661ff..e735747f2000 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -289,7 +289,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	rtw_hal_chip_configure(padapter);
 
-	hal_btcoex_Initialize((void *) padapter);
+	hal_btcoex_Initialize((void *)padapter);
 
 	/* 3 6. read efuse/eeprom data */
 	rtw_hal_read_chip_info(padapter);
-- 
2.50.0

