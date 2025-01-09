Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0892063DD
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736464522; cv=none; b=Ym7TRxvUcu0c9hnjTks3Ua/j7qPLezZ/8bgFEC8AG5g2g2MM7ntOgA3C0+wSxqIqg317Gx7/YObyyWzhX1IRgxDqBLqOUyc///2mNdgqr47k57OUVIiB89zwa0woJnGM/5uTrM7l/MN6ZHOFbf+ZF4l+3M7PzIgX9niCJIlD2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736464522; c=relaxed/simple;
	bh=GntAsuQDHmsWftO6YHKhmbGjDH1zyHSudJ+QQjk4Bec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Stqe0MwYldVLnmx+TRte5hItR5lrdMYL4tdkTOQwRetwyEIhRZQ2cYih8viIp+s1mwYg/clz8bcoP9fjylSMr8R4qu+ARn8TRh85wdwyD5gEhjpjH/vSuxMpjOprR/9CoeLNSscV8L9ydpakm9LRer1QIaJ5CzR+FoDOsJ4/5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf0JMaJ2; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf0JMaJ2"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467838e75ffso16856981cf.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Jan 2025 15:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736464520; x=1737069320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pv0NGeNwZKhFRgGjyWSpgP4ysEE2XhRvF/3to1xVEY0=;
        b=Gf0JMaJ22YV3aEF7V0UWRGyqMZw7i7f1CuYbooyJtzCfjFfIkSjW603qZXje95ZHX0
         tVxfitdsrOcsQvymZ0JJJ+J3EV3EKWax26yTgKpRU9v52TbWabI/ZBcglqh/CCbXy+ng
         6sPauweMMqmaFy/qA/v9vyUnK1KhniBTbvW6qCAhGTFTPAwpSnqMRVJNYPV9huAOEcDn
         PCE2hRfsCabNfVnVbJN8j1mAuA/uDDKQP+EranpPfd+r5IKNj98j8jagDZAoMIQucu1B
         JAAih2a0U8NrOGgtsnhRqEoVGMXkImZg+gn6qEs4NwliKGUwNjh1yZbdcr49fW4ZHt54
         1rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736464520; x=1737069320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv0NGeNwZKhFRgGjyWSpgP4ysEE2XhRvF/3to1xVEY0=;
        b=AbjJvghqENbliPYXn4JvEfl/t0Rb3fkErMgHRh9imBdUvnsYsGkMYRgZ9TyoZ2JjiP
         IzlbGTV9D8REyDPBPIKWZIhG89ZkKnKPeAXnsmDGw17ToWP2bMK+rK4Ufvd6lLPIDFGs
         Lsau8nC6RAMRn4pUokKzJ6ud5oBuEw5qpAG6eYZQtNIRlxeCoxYj9MgCtdhrVOglZJZg
         nad+S6OUl6tenhJOVge+sZsWSqsLkySoFgNSkf0dgvSYX0JendRoUbmLc9JsiMcbCCcg
         ydGdiewvGKqG8oTk6LfcCJ9mEG5JSkNLXbdtUDQ4oJVmhU3KAOSGXzlP6jCSgpZyK/He
         wgzw==
X-Gm-Message-State: AOJu0YxKI1X8v2uXWBZXFwkLbSRdEIbgjOCIGDlCuhRZ98l8C05T+rGW
	yI6yR0SrWIKidv0SIRCYyrJnQSweK7WtXEvoWls4WVQTRfsi1Kl3
X-Gm-Gg: ASbGncujeXQWqGtD9mRPDiiMimLVHymviGcsjiRJyjhm5lYSSjog+LKi23MtcUnC8iM
	3306F8ZQkXqr+MsJCJvPGYCANVP9nLVQd7iK3XdKMeXJDA9n1EDdoTJjwPHVlwvMq65FVNrC2+c
	Sk/doDrjbTjo18akqiOy2XfuJMFhrr625FIO6HpXrW0F0mV7l9cZ1ABpCGXYQM8HI2ZAgryMMuN
	xIEDb3zgulBkNF1yc0qQ4P2Yl39FUA8tJ1ZuF5F1j+y3ndoSio9IAoc7dip
X-Google-Smtp-Source: AGHT+IESkxF39gckc/+ieWmV10jk4RZKfdYrLAYxJJKvACYK09DQW16sMU4Twknn5QeeNPTRpC6RZw==
X-Received: by 2002:a05:6214:e8b:b0:6d8:81cd:a0ce with SMTP id 6a1803df08f44-6df9b327016mr160369146d6.43.1736464519931;
        Thu, 09 Jan 2025 15:15:19 -0800 (PST)
Received: from localhost ([104.28.203.246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3237e46sm115186185a.24.2025.01.09.15.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:15:18 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH] staging: gpib: Remove commented-out debug code (v4)
Date: Thu,  9 Jan 2025 18:15:09 -0500
Message-ID: <20250109231509.32810-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code cleanup. This code has some debug code which is commented out.
Delete it.

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
v4: fix title description
v3: remove leftover braces, re-write commit message
v2: removed commented-out code only
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..fd05f15a683e 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -30,11 +30,8 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 	unsigned short event_status;
 	int i, num_fifo_bytes;
 	//hardware doesn't support checking for end-of-string character when using fifo
-	if (tms_priv->eos_flags & REOS) {
-		//pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
-		// tms_priv->eos);
+	if (tms_priv->eos_flags & REOS)
 		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
-	}
 
 	clear_bit(DEV_CLEAR_BN, &tms_priv->state);
 
-- 
2.47.1

