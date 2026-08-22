Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C31B6D1A
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787381253; cv=none; b=GLch/kr7QqX+416HExnlqEnxkXoILosGeiUj66puzfF6znQdng39p1BOWKz59z4DQx3YfJHt5zZFE0lFNkYXSbePsKPZlkHn2SmLC1/alxcPJ0UqtDmoJsg+D2c/V2M+7/gD4f0esCqFfRer/OePsdjslwUnaVDrAw882AVQCSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787381253; c=relaxed/simple;
	bh=XlLX4Knvj2BTqrMe+HQlyS+tEhciRlGtVLRhuaeeYPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MME3hJhHTCOGyuuzK8HNMV2Auv2tGxmHelc5rxkss5L1gh0TRspVlhbieztX1D02lk0KjeOU4dcF877aRyrZd79EtR9v5uF05AqUQ6rijcmlx9arG0D2z5iavcxU7lJW4sx9WHtV9rTUuQRH78iCA82Y+Gp6TjpmEjiNe0PrvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nx8yPDmw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nx8yPDmw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso14217125ad.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 23:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787381252; x=1787986052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jFEnfPPVZStEYp7TefdBoKb7DIs+ozxA2UKlg10Wzg=;
        b=nx8yPDmwKrGVOWVkrEEgeJ3vUnKveL0Ti3Kt/aC39ge/XuwHILpO1Nd4UVBd/uQNCE
         4GqgBE3ehB3U/m5Mvo4272jRHpkXGqVrM73VcZNd4Blg/Zfu0oPdCIGePYNUg6eitmX5
         wfKIIW5JqcLnPksWzi/l4lFbAzHMmoNT0UfrjLWs+TtfkX8B1zkEwPhN1d6fqh7zz1DE
         /ioGsmakMHWSPnRRJEpTkDjDjuUA6h8no9aRkpZxmRinCvB82Gg6RFatt/kfbfC/GAD+
         Wia6DQ2yUQwfOP2H0G9X3Nqa72k/P+x3jhIofbllJXFyh/XjWR7IQAq/cB2xCKelP0nx
         uCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787381252; x=1787986052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jFEnfPPVZStEYp7TefdBoKb7DIs+ozxA2UKlg10Wzg=;
        b=RyCvgJvJqncMvRRNIOohMHd/YhRjrDNqun32ldd1PqjH5JKD2GuCDAc7FTdMJoWdpr
         9zqZnhSrwdey5PjAP4gvgJQCRJP3I+kU61UA6r81qpiuAray6p56DMJhOgxaCr0giDqT
         I6BU8RB0cFpZgD/VenLlQDj7AarJA0KFLOI3Dz1kB7kQb97rMffjB39EQb97Xx7lhusY
         Oa7mc413vx1npFeUdiL0HF6fdkN65y//48eRpSV14qZ48t6LDUKDDQrz/0TIFDsm+85u
         GmP59MtRgbuIzpbbTOoTtPDQzsbObn6BfR7k5oPKSPW8JPLpaWQzY1N5oZIl0RA0tUqc
         OLAA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6zjg/ht+g6yLFIgE4Q8mrlbc0iBKUB3ROSynAMNEdmW7m4lBdGjeXlLcRccuNEXBUL1+Mo8vwJjXzA0ue@lists.linux.dev
X-Gm-Message-State: AFuF++npXROR6Dyc3UJjz7hbtDSAbehPRAKub1LySMthIYRv+84YwkCs
	WqIxt8yDRjF8WC8EQdEXRnoqOuVXj1maUqLOADdMTTYDXIgf24TaH4vi
X-Gm-Gg: AR+sD10XoidyMVSwuTr7A8ZwF9t9imwyNnAkYMs+ocP1kyWvTOB13wK8FL1SWDfx3z8
	RhEOoT6WDqqLSHlLEv4vgFMdoLuUNxcI3Wz7nAOxVyydbbdtwnnC8uzzFNDTIoIDN6ccyKb/9Nf
	9rP5JdvownmeBwZcb8vycvpE4/gWsQQV8KgaSDdvr/GNs74f9wf6nRJCjpIsGPaUzRtS9MhqLlb
	fk76y/nJ9EIVWRJPYSEmWSfW1sjJL/i0QwLtCuPtSpQ0i/NYlo6ZuMLt6twlOZXId4rS4vp3ggx
	S8VgNQC4di60vam+zA/1HHQ4vdu/4EfuPaHr9YCeWIOBvTtDctvgu2eonW3RyES0xjqPSHJnHKw
	xcGyg5hu62CKpiMvSBSh+1vYIEzr4+n6AF+88KQo7+YLmFE6fFjo9gUoy0FmlgOn3hA/NLqjgym
	OOclFrHM1k6F4meGbeOQf8NgkOmGl62kthS+P2QddFbnz2B32e157ZymC2sul/
X-Received: by 2002:a17:903:3546:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d64ad7db62mr229114545ad.1.1787381251788;
        Fri, 21 Aug 2026 23:47:31 -0700 (PDT)
Received: from archterra ([123.201.213.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909adc8sm3615518eec.2.2026.08.21.23.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 23:47:31 -0700 (PDT)
From: Arihan Bhor <dogestad24@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva210@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arihan Bhor <dogestad24@gmail.com>
Subject: [PATCH] drivers/staging/axis-fifo: fix formatting issue
Date: Sat, 22 Aug 2026 12:16:27 +0530
Message-ID: <20260822064627.79029-1-dogestad24@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue as reported by checkpatch -

	CHECK: Alignment should match open parenthesis

	#249: FILE: drivers/staging/axis-fifo/axis-fifo.c:249:
	+		ret = wait_event_interruptible(fifo->write_queue,
	+			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);

Signed-off-by: Arihan Bhor <dogestad24@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..13a4f329a2e3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr +
+							XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}

base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
-- 
2.55.0

