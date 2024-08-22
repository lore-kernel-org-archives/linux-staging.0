Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B61CCEF8
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344265; cv=none; b=QmN7IgAxTpbBDcjfB1NLennyHvNoT4PKWiKPnsDZuCpseLAR+QXMZN2LhBocdoTRpdFEkmxfZ7VfccNeDPGYI59E/TFjRAILNE4x6Lb05YIrcugBUkP7G6XKixGqeYL5z0f5kk59+4LBym4E4xphtYlyqKaqFSFoNcCPjK28Rks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344265; c=relaxed/simple;
	bh=L24VTJWehq7n35SdssG5EI5FVmJPtbNKUxwuU96OtUM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=LKKq9OVCnNGxt9KLL/+joqqAE9Gy7fowCmdrYBF1twhLShg/gsKMu+n3+TMQejXJ+NOUPulbdVaHu6BPHUksv3eD09Tm7AYhbOjTQ1sUey8BzsBa+/5HOWVVz4WZu+H5TjZJfpkuNUqHz3lApNGR1EBzlReEHtfljQXtcTLKOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX6s1QqH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX6s1QqH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201e64607a5so7715665ad.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724344263; x=1724949063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=51BB2dJoLtPN4L6oCxZATSFDdvc4kXBltpR8Z3f09pg=;
        b=UX6s1QqHmHmEpNf+L2OHyTxPsuUA8UfpZ21VM5rnWkEn24ER9ycCX89ZIkk3OJ40L8
         nA+TocdAT5fLDDaxUTLL4lFmKENJjAndtGOIcL8BT0PsDOCiTPCy1m1GqIixfTYDagdL
         snPHbSaqXtaPEf+yVa3wB9q0cmv7nNlr75rXkUczDkOrc+MfwipkUQ1pI+II4NhnLMYz
         I5wsct/4LKZhixy+sWM7uVRpyBbiUbzxeLGTQIWhtmwZJr42lrwIIobE2s+redZwLOyc
         kNJ6E3Q5Q9sC2PJe8MfF0tLvoSSTI+5zPp2vYiR1jgfH6q7cJfr6fBE191RlqLhdqX+y
         EnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724344263; x=1724949063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51BB2dJoLtPN4L6oCxZATSFDdvc4kXBltpR8Z3f09pg=;
        b=TcqL1FojaOSu0GXsz2aGwdorM+f+YHHSVhbBLFSOwQbrVug6LN64PEhdSq6vflqxVl
         7qLeWMsEgf4avAZ7In5ELy1oXaajjF8zmDWcAXhNGvxEE2+vUFPugb25/4fmPVG+EcJ/
         7eHRmN8Qzjq52Oq5HuV+hvHCZAx4C1R6ZBU/99W6CxDEuzP2DVxkfq4V0qrPG5q+RH3B
         K6bBBK8pNBJdui/5FaDk2faDf3dq5eZur2KD4+E8NxacY5XUpvlskDvULM3/GJNzFotJ
         wP5tHDM3ooH3j0HIdQsABvzs3WX5qsToCISP7g8KWvRQmVBfydsVnNSqD62EtBfQyFSL
         jXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9VVTN5ChxNNdCbjrU1kii5moUjXJHrLZkERAjNI0guuVvSv3NJdWmR+hSCAYredb8/vCqwr7oEF7y2opl@lists.linux.dev
X-Gm-Message-State: AOJu0YybsfVTm3xgE6a2uVYyW9zj/SFVDcpOgUp29AqbEsHFvv1EORR7
	Y7jKf6BAIBM3I12bdHKO0qEl5o+cHAHHmnqRunA17fkE2Aw3QocXEHNS8Q==
X-Google-Smtp-Source: AGHT+IFfeNhr3PHpe5oNd8MbjpQIV7g7fdN+4/1M64+JppkvnVSnk184PcHB2uvtTf+ZHCt227Dg3A==
X-Received: by 2002:a17:902:e848:b0:202:cf5:1014 with SMTP id d9443c01a7336-2038820e999mr28673245ad.4.1724344263007;
        Thu, 22 Aug 2024 09:31:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:868:d047:6251:55a1:af12:b907:522])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385ae4f62sm14535935ad.256.2024.08.22.09.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:31:02 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix Assignment operator '=' in rtl_dm.c:1488
Date: Thu, 22 Aug 2024 13:30:57 -0300
Message-Id: <20240822163057.14114-1-alienwesley51@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed enter before operator '=' in rtl_dm.c:1488 in order to silence the
following checkpatch warning.

CHECK: Assignment operator '=' should be on the previous line

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 0c7f38a4a7db..e9ca5a8768ad 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1484,8 +1484,7 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 					rtl92e_set_bb_reg(dev,
 							  rOFDM1_TRxPathEnable,
 							  0x1 << i, 0x1);
-					dm_rx_path_sel_table.rf_enable_rssi_th[i]
-						 = 100;
+					dm_rx_path_sel_table.rf_enable_rssi_th[i] = 100;
 					disabled_rf_cnt--;
 				}
 			}
-- 
2.34.1

