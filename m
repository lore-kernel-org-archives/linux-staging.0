Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3B3451DA
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522799; cv=none; b=psB/9b4tzzVXbSp4V/OdTWCYjA+aw8NBd5V9czjuzvM1xAw5L9REaxtt5sF9Xo2N2xTOO/S7FzvruDDSnojeLAAhxu6VFXpZ1i257VBL1zl6I4od6lVDBIqeYj25SiSdkHOp7lSC8wAPllvkf5aokJaIdVv0SMarNPjeO8dBbxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522799; c=relaxed/simple;
	bh=ABftk9hLe54BICyrcj4hPg7c7Z/MTbAJ3wv25k2zezQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyXEhkrafGOoVaUC7LQiYS9L72VJojiyEOm+lG+Flw9xzQUryLSIJrerAm6EKuPyJwrdpbnS3kt6VZ9QXSjkHMZa9Ncj+2IXeFw9lVj6asthPI3aOTASl09wdcYvp4BD+8XdfkMB/MjylA+qLWsmnx5ixWRy6Wa5Nx8TZPDMgo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGuSO1aN; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGuSO1aN"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso3713183eec.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773522798; x=1774127598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZlL4s5Lh6towhAsIZpSrCop8AvJjgsBiWS66i2Bzqc=;
        b=nGuSO1aNvuhBVCnNl/eDimOBAjNPhR8bGQW9eYL7QcHf3RH0OdkzXjPeY9VUbEchCc
         XtUvM5FGl4qX+t/7V+Mf4CZayHUM9KxfKZ58kHvLQkJ9yhiYDbWz2n0zW5ilv6Kg6WQq
         ztH2/8jslvBDkj70zCQllKIqE489yGFu71hRWY3B5yNNSyihgKvL5VXrvyaqLBfdOHSl
         YJfE7pkkXYeKwF6AoNi9zOnTYzmv5+7DU8OTlAbqedNPL2ptLNr7Yd2arSyuW8G8TdQd
         QE65w5B7WubbYCqHztIOOunSSf9waJoZ0USEII+koCOOL6EAozhJfOQmucZASYOTaC+j
         8Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522798; x=1774127598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZlL4s5Lh6towhAsIZpSrCop8AvJjgsBiWS66i2Bzqc=;
        b=mj1eFxvRF9OWfk/mm+nBuSB6IeG91JxRkSM8sW7p+6bUhp+ioIGsKZG1Lnqb2+HW0V
         E0ZHkaiUNviojUP2v4U2Rriux0buHVCdql2CFoofQtf1CedFh3qYuR2IP++QQvYikU3o
         /2UO5JiM+VYt6gRc4TbNSApH9DiXlsZz9fDwg1uPFzVWOFfyQqCbmDIXC0TPa2nlAy0g
         J6rQTDDhRZ+ZJlRkmLUkTKlvdQT9bQh40T1MJKr3KoIno+eCn2tbsH1mem7kID5WZI26
         MR6J/VY7jIGfO/mEtzPUJ3J4X+DZTWlfMj1BSEm4jQYNsNBIFiFZIm5M8VsFwlMRyUOq
         LO4Q==
X-Gm-Message-State: AOJu0Yw+WMz/CG8VdrhvvdEeBbp1O2GXo9KdbRiOY8D6xR5vB7PPPrta
	BWgcMe6KrM3EmVbH+u0dggFQXpJwvoCYIw41ZyLppMMFcL7zASqiLbjQ
X-Gm-Gg: ATEYQzyRLV7wNS49acfzEcurmlyE+T6JnYAJvjNI1zPHuWJpWdjE58F4Xfq2VgsL7Sn
	phZxtTnuOVLBxxDsEAq15yRrACacBust/bJehFDeBQLz3ZsMRN427FG9dKKPgjomlyo+C3Nf1Tz
	pkg1nNKLyzc8PHymPeEVgjn79ya2JUQAHuidWaVJO6cGP80hoYXjaFwviRhiBqty7uIFRKZuJ86
	ZbtFIYl3g++cOqkjeNhvNSgko3tePMBbdKxSWVw5ZqZ6esMHwcUEyWCCQgn9n8ElZ553OsQkHUL
	+OdmnWOGEBDSZFQB2B64w2FSipoJtP9BI+NL7WwulcXn0g6kg29RLA52rn/imMDGfa9lPCaya3U
	TUEd6dt0mqtbXUVwRbairuStzQIw1VP0ahWReySqwBCGrvCRnHuJv0o9gcdlflPShNYC9zC/LWO
	aNdRtsdLDVJhekyaDiqoMJlxnyI4KKdgyWXSEI6AVff2H2eqE=
X-Received: by 2002:a05:7301:128a:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2bea5450477mr3390931eec.8.1773522797584;
        Sat, 14 Mar 2026 14:13:17 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3eec8fsm7912820eec.13.2026.03.14.14.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:13:17 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: remove unnecessary braces for single statement
Date: Sat, 14 Mar 2026 18:13:03 -0300
Message-ID: <20260314211303.43030-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces for a single statement block in an if
condition to comply with the Linux kernel coding style.
This resolves a checkpatch.pl warning.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v3:
- Add missing change log as requested by GKH.

Changes in v2:
- Remove unnecessary braces in os_dep/sdio_intf.c to comply with 
  the Linux kernel coding style.

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e2549..a86252cca 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.53.0

