Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4CF2E11C7
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273242; cv=none; b=OOav0TPQ9JRPaHBjqvv1dBum1UU3ZthmzSzUUtUq3zDxxEEjI+O+ZFXYE9GICR24VimYoXVHUvkUgaKtyhNomZpX3wvhm1+ux6itb09TFcK4m1uD212uY3FsvAGnWWJIQF7PQR/HwVUTh8BMP0KJv0ym77WxI83I7UAYw1SKiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273242; c=relaxed/simple;
	bh=BRGrLzxa99hc7MTho+QIoxXhA4vsCiW32jOrt2sHIxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2U0DQleEg1CMylZjf6TVcZgdnCgDAvZuI8MQ5eCnk2d2tA2EzUalJKUfUs2jDbd8AD0Poj7fS/WH6sjEmgLxWbfcbWJbSwG3kHaSbtaPkQeCpIYL28nvZlXUzfy1VMdMjPyWR1dDJQpzcUnNAnPejQKZD/qaPoLrVfMaHyROXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdFLFqmK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdFLFqmK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f9b5240a2so504186866b.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 12:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273239; x=1771878039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=unrY69CU7KeFJol5SFNINgosAWZeimEWByegibZitl8=;
        b=EdFLFqmKG3Z8Gx8vb4Q40IUrifASfVC6f0DbuzJULoDXVIwAj665mROI3oku/MzV1i
         bL96Da1UWbf1SUWLw1X0xo6MH8TgZEOPvDPmFLFHrO+6Y8WAEq9NrB3t7+SlTwgk/XM7
         qMbIAYtIWpKzWACPasVdXTPPBifPngQzNzv5I1vJ7MXd36u31FB8E+unaFiyMEYJEsNl
         VuEW/15DUBrYmLBSH/49ZhTrlL33jTZO8uBjUKac8W+Wvyo5B97zPdw7pBZZ8toOER6q
         a8bmTai4fvX2Mo9f+iZknTXO8hDk1rBv0Ihj9meBLBMEHt8pznKm0HZJDZ3FNxyyW+Wn
         h3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273239; x=1771878039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unrY69CU7KeFJol5SFNINgosAWZeimEWByegibZitl8=;
        b=LxZ/2ucY1LArsNBGCxqHDgCzp7WPsPv6hvYxg2f2//xUp7m7NTsKlikfjSYSI4Rz3c
         SdH/HmYyReIRpqSMWUfsocDs+fkmTpFV4KfjoHPmEp6vzNtXi3le+Wa2Rspv1OvRDrJe
         uNKACFz8IsC6mzzRmLZJNyVzyT0aagNvgQCCTDxBU0rziDVgJaa1PyhgPiHe23NRE9eZ
         V32Hm9fzIdGBx4Oqkx01OPlrl8N1RKYqoQCv8Cfthua53N+eS7OPaYxDMFnCTOkQdC9f
         eDeTpWk6QBQNXcy/KGvJ7ZQ+u19FYxJOYDa4uH4hThme0pL4ZCnlHAjCdQRhERAAdah7
         WtWw==
X-Forwarded-Encrypted: i=1; AJvYcCUgVms3RjY9bSQysNSSI5qLts1rhjscMlTeELDTmPBNDOv59hZO79Vmpz+7o3gpWg9yyi0GCjhmEXfFrJ9i@lists.linux.dev
X-Gm-Message-State: AOJu0YzPPDmnQD6s904ExAiSCyR4VvISJPF7Rwqvagh69cRzycnoOImE
	wCeMUV9D+6WuMsktAxMgW93LmLyDyafOFMuWk21wLi6nvC0+6X8Vv21GKoHz5BVy3aZBQw==
X-Gm-Gg: AZuq6aLge43TsazbT/mMmfiy1whIKb82vXjLMMxN9RPTm691fAawKZAv1KacsA4dtfs
	01WTXqt/LhC4i5CQM11rR0fP+bEstimYrQw183SYTiW6EWOqgPA4qGIwcrrwHBDOgx+TCFKXlev
	Ylyhuh56dkses8TTPI9noHQcE8hGbkYrBYBJVOSCF0RYtzG6ro4vG5s7SMuNLsTdC8H/tbrDEkH
	WPiWq64XmSFq+FNlnyuaya+umYrLHc13QdKct3aZ8QBUEYyHyo5MaB64WFkA//LDaXYFpaInqKM
	Shpgz0gwaeUgamIo1QIQ4GEXMYGMYdxeOSwNlFXyGbOj7aiaHCcGBKaUmtGmz/+g3qbuVRWZsTS
	bCoy4wZO9RE1EmdOrGrVtLsjNDNASmQ1VYpmJ4YLGZFsmjIBZAl9FjnJA56RSJDNlqiaSlbL6o/
	5t5rWM8e7L6K3Bz3MyryCRiHcmk5KE0dgWoaEBLf+jCWiOUixgSd3BBlw8OfGijRDBNH9OvNiyj
	XLx/fjkP847cqMSPNpmUYsqBuuhpynhBBPPiFbxOgFf6xqqiKUwhuMfhdzARzKxzvqR/uwkTZZP
	GQ==
X-Received: by 2002:a17:907:2686:b0:b8e:7dcb:7f1b with SMTP id a640c23a62f3a-b8fb42200eemr635735366b.21.1771273239032;
        Mon, 16 Feb 2026 12:20:39 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73a0039sm284309766b.25.2026.02.16.12.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:20:38 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: sm750fb: add missing pci_release_region on error and removal
Date: Mon, 16 Feb 2026 20:20:38 +0000
Message-ID: <20260216202038.1828-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hw_sm750_map() calls pci_request_region() but never releases the
region on error paths or in lynxfb_pci_remove(). This causes a
resource leak that prevents the PCI region from being mapped again
after driver removal or a failed probe. A TODO comment in the code
acknowledges this missing cleanup.

Restructure the error handling in hw_sm750_map() to properly release
the PCI region on ioremap failures, and add pci_release_region() to
lynxfb_pci_remove().

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  1 +
 drivers/staging/sm750fb/sm750_hw.c | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..2d54d52ba 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1123,6 +1123,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 
 	iounmap(sm750_dev->pvReg);
 	iounmap(sm750_dev->pvMem);
+	pci_release_region(pdev, 1);
 	kfree(g_settings);
 }
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..b3a16b223 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -36,16 +36,11 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 
 	pr_info("mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
 
-	/*
-	 * reserve the vidreg space of smi adaptor
-	 * if you do this, you need to add release region code
-	 * in lynxfb_remove, or memory will not be mapped again
-	 * successfully
-	 */
+	/* reserve the vidreg space of smi adaptor */
 	ret = pci_request_region(pdev, 1, "sm750fb");
 	if (ret) {
 		pr_err("Can not request PCI regions.\n");
-		goto exit;
+		return ret;
 	}
 
 	/* now map mmio and vidmem */
@@ -54,7 +49,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	if (!sm750_dev->pvReg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
-		goto exit;
+		goto err_release_region;
 	}
 	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
@@ -79,13 +74,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvMem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
-		iounmap(sm750_dev->pvReg);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
-		goto exit;
+		goto err_unmap_reg;
 	}
 	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
-exit:
+
+	return 0;
+
+err_unmap_reg:
+	iounmap(sm750_dev->pvReg);
+err_release_region:
+	pci_release_region(pdev, 1);
 	return ret;
 }
 
-- 
2.43.0

