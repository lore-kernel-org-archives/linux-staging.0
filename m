Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211471B3B19
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917301; cv=none; b=ozNQglf8MReFhSXBmEPK/mzANO4dsXVZtcBswXWpEFc4uz4njGG6eiBix+IMxlRgZC2usXZl04TUwifPWA7Deu2h8evquOmIj9yVMBMjDOxieOpBwPHiSXsZGaYxmPB/VTw057eTTmBT1O25m8DFgTVU/NKbQeUwAc6IXbWunkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917301; c=relaxed/simple;
	bh=LA6ukE5S3RtQ4YsmxBrTI3N+zSuFyjACVdQbNtsgfIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dilPfsntayH2rlvva9TAGqJTAsgPrpRYELhvFJl8lIAMuEA98RCeu1/pNbU/09UgRBNqnYupM+ApN7+gKQMbdWVRMYoexmYKnZfdAN1taZxGFfewW15yR2M18zIVyu30jTJWKmHbYLoZvInjTNMMQJXmjEp6xlLOZllHf9rO9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6yImray; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6yImray"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1769971a91.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 21:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783917298; x=1784522098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKDhgr1CWylHW/qEeMfxLsqL16h/oQk5sCJy2TGbNGU=;
        b=h6yImray7PT4157umkXxPHz9gbw/MQYWvSLprs5Pl6hC/po/fq5h2HUCXnk4tyY5jf
         CPBABjGOtVFRn2oLshNpiwU9xTG82JuPl+6/bJJOf0ZF5YEokb0DMrZqD9IHtbPJj1dt
         hzKeRfidDdmlYflSNnXVl2qCVmgdujrL6J0IVml3DPU+NXkJeBB0DlSFz9vMRwpCZco6
         AcLqlGHdRdzN3XqLChdoZ6G18VB50ZavlntdxPtoKnVMvug4vfEFoBsf3bYM0MxnvEoQ
         ISdBi1CdS9oy6IkIbTmly36zE9h0oB2gc47zUVf6FppU0FaQHaJrSzoAAHv3KO26vcnj
         VklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783917298; x=1784522098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKDhgr1CWylHW/qEeMfxLsqL16h/oQk5sCJy2TGbNGU=;
        b=DkWmz/stOL+YbYM4CRLl8rgaHQH13IPnPorr5LBYMC2pf7NmMaAmybvyF+PAjHVhNu
         QoEG2761zWTmOZ0kESXX5XoCIYDVox+ZfAtm4Ngm72JKaDF1cnwtNBUrpzy920e2Cych
         0P0AYJtypffLpyepg84Aog/AjUEHsHyHXZpVPo2CaOf1VJ1CS0NYC9wlwtYICV45+YHd
         /+Bh/9JY9fxjaN6b3nMeAkc8wyVsDSFfxKoHxhzVwrD18vY4vrLM4S9nyhI/sG1IhsBC
         YniWtYWzKhNz+r8oCzOnEydIhiSaABQZCjL02vlej5s2TDmDCklhS/7j16qpWrTjw1Fs
         eYgQ==
X-Gm-Message-State: AOJu0Yyt0Q7zHIJcrb20mEnCfD5EitnDLL00FSEQ1Agh9PQXAIzaR1mw
	JarAkJetsXenLRXgEh+iUEnfLGtNm+Kwqz3LdNZDzINkckYgJUIqGXRX
X-Gm-Gg: AfdE7ckPr0POexyepYzP/rQhuWL5EJ+Bnj0sKHsv25gJ9HZUUoSbs/8UQQok763GrAx
	URGtys015A4opt3/mf49misiaq4Gg7vac2u9fk/0zsxwxMlvYWdhzS+2Iu7pAi0IAeJadWA3gGR
	jpq5PvGq27LC6BFG5CYhLQD+NxYIS6iyJhfISZ1EENoagntY2VPqr87mkQwI7zr4dmaTcgBxJ37
	rJGhVX1Zvd8I7GB3bb30M5oogDbw3ZojgH7tK8FiPyfZklwlQC+qkGgQrbsPYrBaNTvRBiVF0xN
	H+rtqytzzTrAmKxS0+XAXV6B1bRhKpZep04MLWxF4GPOtmOiBLTaLJpKI+23XiEeClOBkY2WV0Q
	Q7ZpkdN3YH2Kya8XyZLW5g7FEww+VVu3jNrsNquhj45oRJL8SYvUIBEcteYLncPA88sOwuJ2anF
	GlJZj9Uu4Jqky2r2wA7YGtMfsC7dz79Jef3POxwTD7JLdoShgBeQTlt7y/icJWatG4Fw==
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr7766598a91.13.1783917298551;
        Sun, 12 Jul 2026 21:34:58 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([59.152.121.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm57888409eec.9.2026.07.12.21.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:34:58 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v7] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Mon, 13 Jul 2026 04:34:48 +0000
Message-Id: <20260713043448.27132-1-mokshpanicker.7@gmail.com>
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

