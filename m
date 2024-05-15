Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE99605BB
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748773; cv=none; b=Mj1LbK+pV6sADTml5bqCqYofSba4rOZj5ZIeyogmQ713GNMWQ8auJXydm3jrj1o7SS1P6w5a8jy/1rE4uwAe+h3Yv+WKveLzff1rT/XbG14osOhOTCAMv+VICSA4lWIQle2+aD8wr9TDgln6O+w9V4lofLmmpTfWNA3aP0cUZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748773; c=relaxed/simple;
	bh=GixOz/jvSyY1xGeu+wIuKGXcSU1AOkbQd0Sx22xBEsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RdLfMNsxx/V6+r249qkz/rm2X85m0zCubpNmk1XlbMwKp1cyaA6MSW0RI0otQkOuQASuoRWMgX5J3yv9Og3nWx7a64pkzoxXL0Bg7L55K2gkMVMpMZkIoSB2FPmImzsKZLCWQTGam5mHBto3Vd7s2595GsZaFhOBm+14aLoGQlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=O/jDd7r/; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="O/jDd7r/"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c96fef64b3so3869433b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748770; x=1716353570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uDJtT8U3aIB/5/8PG05/CwnNng1VTLjEW2PdQdEd1g=;
        b=O/jDd7r/m780WlAclybeCGXNFPN7M5dviMhbwdHMHuLGOxZ7d5KATF+hsrsfn/fJd0
         Ef/YCPLo7NOYHGpB+wm8F2DseME0CT67egEON9avZI5zD1uVupCq0AoEVfFSSoUns7j7
         6qKTWtc7HhwDIuI2VH8uBBN88e/7ZoQfYMf3ikNgUai4zOe03aHH6zPYjgNhCdFEjM2U
         0DcurlErMEncvIL4Pk1qLz+Njv7vRRPxOoTgYCVtZrmKPzhncndUmAQgF0NakZO1NTU/
         rD2hCXcXYCy3K2CVfeXfT0sRqYSm8A6TlWkaT9Aebv6iBfMXY32A9uD0v67I2peSIFge
         Xzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748770; x=1716353570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uDJtT8U3aIB/5/8PG05/CwnNng1VTLjEW2PdQdEd1g=;
        b=dMGSBZcuxdOO0rRKGW/tsGv0rugnwuuk8MUr/SgeyZcgZ2/og4VMf8AocoO/Al6cBt
         zcXSw3M7yD3+smPGu7R/0PraHorE3vn7zgEJ02sHLGyXeju9GEYIuGtytkDU/GkHxm3I
         kY45LG+bgg0NC0lTYqq5pa3v+fGyQ3yP54mrAdKLXYVX8svOIY/HD4p6kGRYE9VxOB8f
         3USeVMxAevvAtqoqM5qsSc6pygYPMvASG+zVQnuYIblNsV7hQPNqBACScdng+/G+vmjk
         e2VpRvw7yVCQ/mZCJC8RRqQfSlZXFDvXXwgREBJ4qyQPk+Mlnh+geLhxy8p2fECkjvKK
         G8gg==
X-Gm-Message-State: AOJu0YzOUvXokxfe3c2mJeUU1u8O6grGiD34xVfXjaUpw7qwoj4Fg9i1
	cx0qmXD/c96MYSzHj+Nv3itY5FQGl7eMl4C/xaEcdJmx2VEDOVHJhJg/2GcrlW8=
X-Google-Smtp-Source: AGHT+IGfgfDCeXzcG8iJkutFsBwkZ0a/02CQos8BCVqID1u3eOEBZBqu8PGwzUeaNpNc6ZT3IgA9ew==
X-Received: by 2002:aca:230d:0:b0:3c9:6ef4:346d with SMTP id 5614622812f47-3c9971d531emr16043643b6e.49.1715748770502;
        Tue, 14 May 2024 21:52:50 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:50 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 23/31] Staging: rtl8192e: Rename variable bMatchWinStart
Date: Tue, 14 May 2024 21:52:20 -0700
Message-Id: <20240515045228.35928-24-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bMatchWinStart to match_win_start
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d4714e193df4..ffb1bbc01bc6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -529,7 +529,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 	u8 win_size = ht_info->rx_reorder_win_size;
 	u16 win_end = 0;
 	u8 index = 0;
-	bool bMatchWinStart = false, bPktInBuf = false;
+	bool match_win_start = false, bPktInBuf = false;
 	unsigned long flags;
 
 	netdev_dbg(ieee->dev,
@@ -567,7 +567,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 	 */
 	if (SN_EQUAL(SeqNum, ts->rx_indicate_seq)) {
 		ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) % 4096;
-		bMatchWinStart = true;
+		match_win_start = true;
 	} else if (SN_LESS(win_end, SeqNum)) {
 		if (SeqNum >= (win_size - 1))
 			ts->rx_indicate_seq = SeqNum + 1 - win_size;
@@ -589,7 +589,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 	 * 2. All packets with SeqNum larger than or equal to
 	 *	 WinStart => Buffer it.
 	 */
-	if (bMatchWinStart) {
+	if (match_win_start) {
 		/* Current packet is going to be indicated.*/
 		netdev_dbg(ieee->dev,
 			   "Packets indication! IndicateSeq: %d, NewSeq: %d\n",
-- 
2.30.2

