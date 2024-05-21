Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5E757F6
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261461; cv=none; b=VEWgY1oAORTWGwLFY22SNClvekK0bf/49lstNFmS95Xv8hkIeJwQnUmXiAPvy79T+roavdicKfvKL5w3EJk3IMsgaNgb5Xkf0wFSoCrZ+842SHQeGD8fzqln3nHRjz0bMTioR6IyT+j8nKpAmVAWiA2zogEz3Yii/WVRBZvBQ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261461; c=relaxed/simple;
	bh=BH5PhLOzGabd2LyORxMioicNxfmFgwW/JLD24nQfeWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DfQz4LaX1WY2snT4zYFqpHaR0eB4OHDKqEtsTn3bDPUjmeKpgSTLZ1lHUSX+eBlCG/Nr8e03z+E/f6iOmZV6FjBF1j0dPkewDnsgI30uxuhWTiIAiJ1I37ehjUnbr7vMB/vOBkU3mGR9Ne1VOXxlI9PtN/b7av0bbkbwACYDjo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=HScbwUjq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HScbwUjq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ee5235f5c9so92620295ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261459; x=1716866259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlLPLUi/5OI3lQ5UEAOn0I+EJPj8lQ3+XMJGXZAx7Bk=;
        b=HScbwUjqzgqco6EwhmJY7+X5HobHh/z10Xrt56CcXtoFzDuuMDlrKWcRY0kXvH8OlY
         1drCl4cwJYl7w2K0aXFfcyCpJPDdZdTxMegJA65uhQTlmXPVrocvmctrwdtHk/JcjXZN
         jf0sSbLKei1cVVFys1d5cP2GXbKzsFx6CBLpX8H1y5EnbfSXuhP1ZA78AjQ7WGovt3Qx
         I3E7o/kFnj4XS8LBzMTI+qPDyc9wJZiWS3/M3TzW3F8XctiPkyUPWNYK5dIr6oUCS/B2
         VTO4oN2xL89Y9+8Gzxjm6juy/z98oBHHytxLmmBskjDmtjOXGKOqzlwHewhM76I24d7h
         uTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261459; x=1716866259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlLPLUi/5OI3lQ5UEAOn0I+EJPj8lQ3+XMJGXZAx7Bk=;
        b=m5d7FajD+/tPreeHSvG2x3ueEhPs7s9uCV8bg2z9UIYFtnrYYVGOwBu7Ej8BDXtM6d
         SwUmurTQLVzstkzgxr4BLgE955v1Nv4HVc5Tpe0XZ/Apx56xN9iPaPu3LswnBFvEGNX0
         Z3LPHP6Pf6k0lJGMUGBcyJDufRg5o3rllzJgWEW/xKeUoT+nhB+PTBVLf5IPxylRLRZB
         FnB9jznXG8/0cQyTiTLqCQyCAt87cu2FZkhC38n/nQT5cSLeHN4rOzbX18NSwUsu0qDq
         wAN/6nfo0X2/yt57Zab9t+d3XVeLJHuTP+cmikDdkgfZTaF1BCj3jKzJewpAoNt/VQnx
         yq1w==
X-Forwarded-Encrypted: i=1; AJvYcCUi3j1IJWP1KbuHMDuL33pbAuQWGSu+6Txoq9qMbnux4mEeXyWRQhzwHVLLb3QOPMROVYEbKUG1vYKt7gRMRE8ac8mllQ+TRWnL2jgLgg==
X-Gm-Message-State: AOJu0Yz5u8x/yz5NIEQywJ3DRbAD9P3MA71/zp6nuGrZh9ZJhSS5p95j
	+OzZ8GpA3N6199onBaweTs38RGSvC108/TTPRGRdsfRcZGMXvXlX/ydXljAKoGQZ3t4YGf+J1NM
	x
X-Google-Smtp-Source: AGHT+IHUOS9oJ3E6Jg97TDaSZcbDD/AcLxwy5/zgEhM+cTaRxpX3PTrAhC1Svqtwfb7MaS7uMDKFvg==
X-Received: by 2002:a17:903:184:b0:1f3:704:8304 with SMTP id d9443c01a7336-1f307048b69mr32619435ad.9.1716261459338;
        Mon, 20 May 2024 20:17:39 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:39 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 23/31] Staging: rtl8192e: Rename variable bMatchWinStart
Date: Mon, 20 May 2024 20:17:10 -0700
Message-Id: <20240521031718.17852-24-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
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
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 9741d351363e..7e41519d997a 100644
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

