Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B7D345ED9
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836738; cv=none; b=hW/eVeW29cFWcIidFh0hw/xHZ4XAnbhN6qyoEFz9tw+yq6TmcmGWR3g+RWKtIBslQsEBBYLjKbGqUAUk175SOXjqiM/oQJAxqyddrRdIlaZ0Pb9kiXE70smVYEcL88Y7uVAI13ZmqsUiA4fONTgaEWNG2aYFdvf0gq6mrJog8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836738; c=relaxed/simple;
	bh=FKmT0sInzGZ8xglTcpDpC+2cWv5nRkUqMW5XaUUWFgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzYVldQv2Ve8DbDhIxXnjLkx0YEawld5eJ36iGDQy82/gZuJWRYoVVIIdlbj9jCX6o9gAiDDAr6Ig0UX7qV0F3OGxE1vYrrYKW89y+bQxoWmxo0m0SEs0gpDXddu/kcblccCZTwDYbxJ340L0yAZdmoy3KLcK1pdZxfWFB/DqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GodlwpL1; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GodlwpL1"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso1879710a91.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789836737; x=1790441537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=efPfDfh6WJd7P8cYHSc3/SVG8GD/7sjcKyH8NOMuMCc=;
        b=GodlwpL17A6Aq6RkCaXtYpRyjf7hCp03iubTwuWD8rorc48QqsuopvVz+18LpVwrpH
         VCVizIYL+ZmKpqLSFjD8u5Tg8ve1P6MhsuZojgGlo0V8WODleAKd9dKWA5mcjB4M9Ey3
         MBCU4MGxqwHjwRlpCsw784frLD+LuZN77K0fwRaFPVdXisMfsw/09GEUWAQf6eX915jY
         RJNMYH6H0FFZBT8Qf9P8auLMCu2DC21FiuKZ7EPJtpYa/r4HSAIHeu0ckGgTCHaUd0E6
         2wGFnalDftt0iTyL4alJBukBSLPdRmYJE3Ng1QDNM2T1XcFCAnNouVQWSb82HhWwIud8
         pAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836737; x=1790441537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efPfDfh6WJd7P8cYHSc3/SVG8GD/7sjcKyH8NOMuMCc=;
        b=dx/umcdOGFmd4amFMZ6rU/JOuboSuFp25OImeiWpLF5P4OuJfDVlyGn2UHmS+nQMxv
         aClcrf8M1Y3R4SWMA0aqGxXOt1Udo9EjG0xtMj2mcZtVMmSMqVSP/euqquvo2ZuUuOnw
         YDAmc5x3R1d5MMwg+Z3g8WrkW8Dtun3QWUAtCXDnC/+I1saMwIayFei5mJ/CXmqKLQ/b
         amZYenrnKZ9CAJYU9D1vcmYui1T+ji6Y2Y9zC0EkkvL8kQBa7IytGcKQPDqZ2hd9CpWf
         60V58BcdtJG7WufhrXUUTJkWITRlTOFj9PM/6ALrMCaaJ+64VesDRZw8rLxGKGULiCmF
         8EwQ==
X-Gm-Message-State: AFuF++lhEUjoWVj3p7ZjZ82iQK9j6OSXeq0+gyRAXPbXXbxekmgt7HVr
	Cy/JTS9+h6175GyUYpexQDepFsyUIpwsQkF556bN2Och3EBSGsZWzAap
X-Gm-Gg: AYBFou1A00P5FQ1JA+3RqvyueQw4SlU933bY3uKYz29lvdSqj2fdZv2hUQofOxjTKDC
	EXBbz6PuMqH5XbLePeptt1AltQCzD/dMgFAaY2YSnSNQvvOluP+GkR/ejCnuNMiDCtKsQ09jgJ0
	A7E38NsEp3n0jpnr8jMhCIBOb1mHN4IbGb3nwn7/IXOy8ymJ1ohNcJo+C2KgLDs9TQjV1s2Taxm
	yIMnVVORZFostL7p4TWC4kmQDVjlFVo2CAFw/1lTKv3izZeSBAql7XE7aeD0s+CbOLiI1HWRNat
	A0UtyHSQSeRh5K9wjZ192bCTC6mczXQ48bGikvFBb7RhMV6I8vXyI86fQcAhP0GhRL/kBCMoOl5
	FxTk5FgOGMwR5yOPIIK9WSAsrR0NVOT0B4CgSZP+XiQ1L5jzufFvwhA6jaj9gMfkOYqJY1zbgvc
	wbmAgrqmpePkaHZRpeJXMTQhGIC6Fb8DJL3ua0/5K1SF3jJv5XZ3ZmJpEMWm0rkJgZIAKHLns4V
	G+J8kWIHyYlwBYXyMzUtg==
X-Received: by 2002:a17:90a:d40f:b0:39e:6c69:9b8c with SMTP id 98e67ed59e1d1-39e6c69b291mr4591077a91.49.1789836736571;
        Sat, 19 Sep 2026 09:52:16 -0700 (PDT)
Received: from shaym ([223.181.116.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e8954sm13966859c88.14.2026.09.19.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:52:16 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove redundant else block
Date: Sat, 19 Sep 2026 16:52:04 +0000
Message-ID: <20260919165205.9896-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the if branch returns directly, the following else block is
unnecessary. Remove the redundant else block to improve readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index d18df407e365..cd178ddfbd00 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -552,10 +552,9 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 
 		pDM_Odm->RFCalibrateInfo.TM_Trigger = 1;
 		return;
-	} else {
-		ODM_TXPowerTrackingCallback_ThermalMeter(Adapter);
-		pDM_Odm->RFCalibrateInfo.TM_Trigger = 0;
 	}
+	ODM_TXPowerTrackingCallback_ThermalMeter(Adapter);
+	pDM_Odm->RFCalibrateInfo.TM_Trigger = 0;
 }
 
 /*  */
-- 
2.53.0

