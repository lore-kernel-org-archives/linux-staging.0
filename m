Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50122E11B9
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 04:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784350632; cv=none; b=aMUXcUKrwbtXdNMwVPNfb2V2Moj2U2L2pk2jUycHw6WcJvh7CNaBF+7rmzwx5Cwl8mL/G9k+LEXvmh+y277WZsmjrIp4UldOMTHCpIOGvmzvT3Y28IIs+UZis+9hdXdbg0ckvsCqLZPyl7cSfBTP1GvmK3IS8woaYYn0gLATeHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784350632; c=relaxed/simple;
	bh=TJUsfjnTqW01BqA4c2SrNKyLpzODeEISYa0BR5PUda0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCvr8bUVcpbWYUF2D6sy+LAaegCLBPaHSf1HAU9mVhMlWWpw71M3IPCBE5T79bP09oyB2V1myaSORzC/CX0ff/xDBcq4Q0GPfGdnvDt2kYbOdvD2+jxo6ZspxLqMX7maqB7Fcocod2/R/UScAR0bNkhUKUmdG/fC95kvMmlEGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBIyNYbc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBIyNYbc"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15d5468673so547054066b.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 21:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784350629; x=1784955429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aF4697Uf41KJkQZyxlwdYFjyI6ttMNVshCuVIWwkfKI=;
        b=YBIyNYbcOuaDhMiDw+zUHpDbzH0i4az5TyoN5D0iAOQTGBSDSzLVQcgsFjKWYR9vF/
         CL7o8YtafkQQ5TIFDC7bARbzdwbpSvK2ML49DF5D1+AhSwv5qqAHmwbRaMnwQMMS+HNv
         R06YHLUBwVNU2htJg+14wx6tngYuLmlpAiZjqXCLvxcPuT3pkTtQYxqtyyoOGZAfH/CV
         CympKzkaW7FYuxcxIAauCIK0UbZT8+dJ3wQlYDm8+/tfymwVIYwdxc7IlJePx2B6EuW9
         vFpiUt/jLJ2vuKrk/vsCVsKOzSonVjcba4nsWR7gd58NTur5kg74Yuh4wcs58Ub9UFkD
         dlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784350629; x=1784955429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aF4697Uf41KJkQZyxlwdYFjyI6ttMNVshCuVIWwkfKI=;
        b=CfaqVomqgYGykBxDjVDtLj1so0U2cQl1vTOzdx4F7UEGRHGJ3nOupq4L3eane3SO5E
         CvwliSa5W7ERKdy66fXpI93Sz+/l7LxRgkwgN9gshZeNhZK//tiT6JK708fZzNHGtfAp
         qyjuc4gS4jQAbP+rDdHnsFszhSK25exbfpm/a8sI2E078ykhWLDnNIkQz9Zri4Ap80wB
         vVyEiIOMErX9kVR50MmQY2ysigrP5zo2QKsNJDPdmjog9FLeM6dEM9to2KAEx/e9gb6d
         TNgwfR7avySaBDaYU0ND1e1LFfZhJ/krUcUc3hs4lECChsYrC7g6oFboOInfR2Jz1Z6V
         lfTA==
X-Forwarded-Encrypted: i=1; AHgh+RpWhyCtnXGDzbKMxt9PzQwj2v7WTwiToVE3FLrF8P/U3n53Hz4cF+tGAwcrHSxnFNVAuCnnV16POborJFqf@lists.linux.dev
X-Gm-Message-State: AOJu0YyF8VhKRY8qriubewmWv6irxtkqsruUOZtplpVfZnH7jJ4n/AOM
	cEltdb1RW+IqZ/k6PwWNf+lo503VX5svGFubDQZ+lkf7v3X1Qpzolmwa
X-Gm-Gg: AfdE7cnugs+OfENWXXDSI1PapN2jII1VZcZv1E59mdS4bbcElG3L4KkURZYxlIPHJMU
	RmbQU43dH34hMEWhyeaDh6UygQ9AywxAFgBcooNMZ0Ni7b+7++cwZoRXkLC7swWV+GJ+h9r/lkO
	RGv8BYvisTYy+sUbAjcFbGOg01QykdqunJ7Nrab0LDWYTyEmKa3RFIleKZHPR9Z6RhGGrrjuA1d
	bW31M8FKSVie5bfZSUfgcRiMfx+aPL7ghHo6Li5AEk5L8+XxLB1RmLY5wo7te10lSd62e1H8tXS
	JfEnr9yV7Ob1Is2+fg9gESMdms9KPL1Q8ZUNFexADs6q3Nxuu2fEWqFZ7XZ+Sc2H9giURE0uaNT
	wbykNsbP9Dlbk0IfXDhLV0HVkP2yO0tUfrRAnHs6nLB3zIHglgNPK3vCTXxqKMNRTA581uebjkG
	eRokDEuVSB2Oe4GJxKoYi8LmHyfl0MaAzlQcwB0BqoZzkuMbWVqgETQWk=
X-Received: by 2002:a17:907:6d09:b0:c15:fc9d:cf3c with SMTP id a640c23a62f3a-c16b48c1139mr259395066b.42.1784350628774;
        Fri, 17 Jul 2026 21:57:08 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae102sm168303166b.13.2026.07.17.21.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:57:08 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()
Date: Sat, 18 Jul 2026 09:56:41 +0500
Message-ID: <20260718045641.468640-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw_imageblit() advances its monochrome source pointer by
src_delta per scanline, and computes the correct rounded-up stride
internally as:

	bytes_per_scan = (width + start_bit + 7) / 8;

Its only caller, lynxfb_ops_imageblit(), instead passes src_delta as
image->width >> 3. For widths not a multiple of 8 this under-counts
the stride, so the source pointer falls further behind the real
per-scanline layout on every line, corrupting the rendered image.

Use DIV_ROUND_UP() so the stride passed in matches what
sm750_hw_imageblit() already assumes.

Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..69e803f4f175 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -261,7 +261,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	spin_lock(&sm750_dev->slock);
 
 	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
-				      image->data, image->width >> 3, 0,
+				      image->data, DIV_ROUND_UP(image->width, 8), 0,
 				      base, pitch, bpp,
 				      image->dx, image->dy,
 				      image->width, image->height,
-- 
2.55.0

