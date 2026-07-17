Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC23112C1
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304219; cv=none; b=uT4tDwBaAGnZJVKnwncEnz6u/SsMNnYPCVta8g2Rl111J5lT4VqnwDaqTTfEJgCzoUtaEc8WuENYHZzXs/Qc/j7gPy2xQJJ8SPcsDLF+rXqUlT8MQXiLkEWA7fGyOWbaO6xHh1dSNwn1j/e6/kha2cbbdPZPocqSRfGHR1KpjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304219; c=relaxed/simple;
	bh=J+3ik39CT9ccG75oOE86hYqDgiR/NdiVUcLFwlc3AsU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lcQUV+WQeaYhEIIji5Gy/2kCUtvKfv3eE5kJU5GDske9PXgsy4KfG4DyGDaua2kPxUnKmiTtADeUiBxQZAVeGRilQalgYAnSTHga4dU9ZyU7WbJ57U52FmLUo/cpyVzpmBr9Z2ulD7IIkRm3Xm5zC2/ha7LL0ApmOR3hn/Mrno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoCvZdQK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoCvZdQK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so7529492a91.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304218; x=1784909018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGKfioXzR0djomODYX4sT0XCa/QyAIHiMmgkZjK12bw=;
        b=PoCvZdQKPBs5VoBFdcm5Wia8Jg2q7P/FS3XcahFGE/m3/I7kezCM69RXNzuK7yvzXY
         NlWCk1MGslw5SkLWFMmrEsfXyrC9YrZQm8HAs4JuCIwr1VMBXN/+LXRgtQSCMvKwjM3c
         Y0AkysturDW9SwQq5aiBfHQJY3jUkauzOmKOElX3UDzeG7L/YibNMdy3TaEUADBDi54M
         JCcoKYlnNfyiB3DZz8xJRwqvLF9Q568nziRskgoTVC3tkFw1j312zy6RHidQBWSbvRAI
         SsH9H7GejkPqu2PsqKR/fwW0UipoAG0XQzPzN52NspIwaPrt1INvSx9CG1GykhnqJT1e
         txag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304218; x=1784909018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGKfioXzR0djomODYX4sT0XCa/QyAIHiMmgkZjK12bw=;
        b=YCFYyg4+VSJinMwJEAg4keQqaE64z1Ch69Vx/vI5+IZXIopvonyyekaEVLIEj7Dmhm
         7E/O77kxYcqqpWay/jMitPOYGX0Iu5O6MTXELMV3zQwoRVzGMPzg2BOX3MolW2rMl76j
         IQIVntWUl1IB2Oxnck0Qje1MHj7xkxmh416aA+MlZsuPj7ra8jabpDhX3x2uJeG+io0J
         ftV6aubZGnv02hOWUmKuDdABO8omU8U/i4maRBCI9Dg292GDXIamo5yUlvsCuPmSPPP9
         EgHxFF3SXeDMLnfs0BKXth4Hxbw0yMeU5e07B/S4RDLSpy6NizH67VY9yvF4klNQHiPe
         N+dg==
X-Gm-Message-State: AOJu0YwT4NdJH6lA9HBsirCiDCxaOc+rgEcbbMn4gCjHSmRaoqhDYYug
	8nXgNjE5S9/JRn6d5WiWcTQcw8M8l0pR3/Tm9U/N4Ib4cpKHPdKk8tEo
X-Gm-Gg: AfdE7ckIL5aba5cdvX4QYKPvOzejjoI6OlbO4QejAfR80EaPEnL3XVgRE9rH3zomhXk
	aNcAg3WOfmlr1OLcvOw4h5VU5mtxsYAYLZ2a1aA0MLEeMSC+ODiNx1Oz12PQMJ9OPffc+tLLH7P
	ctEQFBZa0a+qnxS493BpdVkHixgMv71FlymussJaR1TmRFH6pdOUTxviiM0X5htJVXcbeUTKpnn
	jKlMO9rNtOIRQbLUyugJzzwKEDYKOivePUDiwneEF595kqtU4uoAzDegWu+3rJuvP2FmrPNcea4
	98ibo3amGWlYR85d8lZOrQKvnocq4//L01W9GrLpXd/Cpmc8lS6foAk9rxz2ApyTjE1km5B02lz
	xz1ZoyymMv4JEPxOEWZC+PjY3Jg0peXG2OzbTyTIE1T6hrzKb1YuAs2ToNPGxdY17Q6ikjEslm6
	oEhb8Ztwb+cF46GliQD4D6YQct8MWhfWNivn+oxuOiMjIcogsJf8I9U/4=
X-Received: by 2002:a17:90b:53c7:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38e4b56eabfmr3646445a91.23.1784304218019;
        Fri, 17 Jul 2026 09:03:38 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.192.239.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm9082437eec.18.2026.07.17.09.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:03:36 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v8] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Fri, 17 Jul 2026 16:03:28 +0000
Message-Id: <20260717160328.8739-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat the multi-line function signature to a single line to fix
the following checkpatch.pl warning:

WARNING: function definition argument 'struct adapter *Adapter'
should also have an identifier name

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
Changes in v8:
 - Add changelog below --- line as required

Changes in v7:
 - Rebased against current staging-next tree; v6 did not apply

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a0f5b4b7ab39..168ecb7a998f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
-- 
2.34.1

