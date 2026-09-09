Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915AB471246
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942645; cv=none; b=A2/1lggz0FUp9wo/munmej3+4Qu11lLqjNyVVuSPVLal3NYpooZE2MlrFe7wuzFPJZSMqcggPuNN8zzqVsl/8JsN40q7g5lbZHiuALY2lcL7PLhHaXTZKYK+4dNzSm7nUzkjiMRuYAloddMUY7jUxBDrn3vxuQ5l26Xb9PePhlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942645; c=relaxed/simple;
	bh=83UV4H5oW9GOVXeVr5VHR3mV8RREjaWoBNG1Uyn41Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7Ixgj09nBJrPM+Da6EwStphS0t5vODq+tMvlVIgBeWKnVPpmbeikyW4IZ2qdPlTB29c3PGo+hkkiGAuJiDgCCk/cmE9rRSUhILMUTCGjMkU80qwnkB+LRHpyGtHMJUa/VKnNxfTuG2AmYE75ynsdSEcJTSMRdcT+4P59JRxOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1ECGomc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1ECGomc"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so5934583a91.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942639; x=1789547439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHN/SN9hwaOzGl3hreMqIt0mqEZ3PQOgvVl19lBg7Nw=;
        b=X1ECGomcthQTeCfmmohbMaxmEm//Pw3f1L+v8E759QdX7LbdHhUHDqsx/Bo5CEgiZ5
         ukKqsB2ZbqTpfTVR5snEkBtVFpLys3XPYhr13CBXGd/JFp3JxKmHKosciF/3FduiSp/F
         zO/8By4+gBPozh54aJOFJ8XAHRPiIRITQwpUK+HEqy7+GyqCWiYSdGY2ikQv/VqqyT/1
         Jn+M+G54MneBlT1SYS+TLanZhasFw7WII3u93LTPgdd5IFhqZxqemesifSp9VR6FDhwg
         b/1paFTxLe4Zk7u4Lz8jkHag7Oft3IV52L4hnw4xrVwMv+EAe+HM5oiCmsFLfAFTvD4o
         RKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942639; x=1789547439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHN/SN9hwaOzGl3hreMqIt0mqEZ3PQOgvVl19lBg7Nw=;
        b=gZo+LN2Ih3wSvEL9ZOZzqzvxA8KxhyYuI3VevT9PKjjGXBIlAYlDDPMQOiMJGMmzRj
         qEncH27WsaYlBUWDYLYy3InhsL+c5GXfTF+fJmBmr5yc1P0DKZsJ0IveAIrZI6milN9H
         +xzMKjWw11m5JxPjU4iNQkIaMKB8tLGRaLSHhoEXfITv69FhgQYhf5p4aa8R94p5/fMx
         flG4qePiue5cxZHRECYkHYZk23JRTHdu6Dr2ObBfxXo18GM0DmSptLMtsg/6zJw7i7TF
         tvObm51xHFjiyDyDr7/HVXTEqJM4jMM0uxl5rlCBd6LhHc4cL+DaNrg+MAzl0nur/sQ4
         Fmsw==
X-Forwarded-Encrypted: i=1; AKwUvBwK7iEy+n9K2I0rGxjIykn4yv1xqyx5EWE0T0DB6HF5zygEO5Rj0Ajgd5GOouaIOhFSmjcRX8NvAmNWrvtV@lists.linux.dev
X-Gm-Message-State: AFuF++mQmpjJ7v5BJT4+rSCvUhUo2hO8j2RKVmO8rlmXrtH9c+OID1mo
	uz89YsEAZoYjL/K2qeuxzJCjDIA3RWL0PMZNe8CC3YEqcG+UAxGe98wh
X-Gm-Gg: AYBFou3geSzcllrSOO2VBT3gkAByQDj5PF76jvPXTB4kjkTNhy9uiFVHGeZ/YwzZJx8
	vPodKD/6y0+Szb+/qo0Ug2mMPXKrivUDb9IpNgtipaevTg0b27P3D5yK4JAPNiSYIC3E92Hi0Di
	ZW3yGN/1nQZS6OBLNAwUidIiI36pbFPCWXVBo5e7VTMPcjBvgsW6zj6Y5/VMdWlzB1G3Ff7q3zf
	W8sp8QU5bWlu7wAzuJRPGHIB0tyuWIPYfNfA1WWD150YTmXyWUjTeXRpX+frqk5ZEsK/IprTWgY
	vKhZWJJleB4x50Im4ztjOHx+3tx9VF2+3LG4L+YCsp8l8/TwuTAEyeFurVUPDu05maGvPM4WPdk
	hIm2e1k8I2ukxGSML9YLXmkEAAJZ2EVYTCxPrmQ/tmAByDBVDG685Kx4b/TRmq6q16HVDpI8RYd
	OWjybi1RMgOVYMq/Nf6HtNSrBGznd8VD8Hb+1rkch1acGAHELh6XZ6oHczvYFT+tu8ht/ZdVGEa
	3BVav3S0DuHpRs=
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr54300617a91.24.1788942638681;
        Wed, 09 Sep 2026 01:30:38 -0700 (PDT)
Received: from isaac-aneek-MS-7C52 ([103.74.86.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm1439095eec.20.2026.09.09.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:38 -0700 (PDT)
From: Isaac Aneek Sarker <alvasarker2004@gmail.com>
To: 
Cc: alvasarker2004@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Anirban Bose <boses156@gmail.com>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix unnecessary else block with only a break statement
Date: Wed,  9 Sep 2026 14:29:38 +0600
Message-ID: <20260909083010.13064-1-alvasarker2004@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl : else is not generally useful after a
break or return. The function would reach the break statement after
if-elseif block even if the else block is not used.

Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fdc6c..a203ef8bd6f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1789,8 +1789,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-- 
2.53.0

