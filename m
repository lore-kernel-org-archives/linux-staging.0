Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E532ECD1D
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 04:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780452; cv=none; b=mnabXJjIKKtyoboLj41GZsuEQ7NBsFev2RP2AA1cRBpM/i2fOYEVzN3HgZ8ypl6f0M5dxTQKKlIroTQjYEE2qA70eK8I3gnsG31H0jrQ8LWULZBYB6AxKdScBOliuxtZs8Qd2HRxdeXJ4V/c5qeKP2do/9VPT6BbuTnQy51+ahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780452; c=relaxed/simple;
	bh=rHZ3blwmnCwtQE8g8vuh+GnhZEPjJ38mSCnJsVHGq0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGVPK7NeSQIsQhU/Hozq7dUvMGCgKmH8vkuo1df16A2ZB+4yIihkUA2IckTBCY/A2/ZAVNCo788EchmYylSJYEq0AA/8V4Ud6q/WkQ7Cu+gB3RQWjXCXIedczRrNhEMp4IFlBGRb9WTrUVDqTyN0ErqCFqjCgNGOtotm+i2z5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3aNth60; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3aNth60"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917bab38b14so23392076d6.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Oct 2026 21:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780450; x=1792385250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwHcr7X/ONR4Ul02KZqQ9Bn6G0VNj5fx1pck5G2EhHI=;
        b=s3aNth60maI6uphqbmowC95VgWIaex7lYKzS33cemqFbAPPAmBZxevubql5lnZpP3s
         Ymbsxj2hr5BE3f50pqCsD05d6A4M8SVik1hAJ5Gr1EKw0wswnYD+sgzdycsLO9VDA2EC
         RQ/g+cK2E+V9AcW6usk/j4n6ttnDyy5RZTpiGAk28hbI0z6JaiFcardGZvFA6NErsuig
         PMRtJr30bb6At6Q73ZuCR1JN5YdIi+B4NyMs5AzpiuY/+omGR8m1Vfip7t3L6aks/AY/
         PcEoEjG4IF8G3UhJzdNLRm8oxjTAdS/dOxF7mmYAM3T/AU1lHFeW08X2mvgMwevplHHO
         KS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780450; x=1792385250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHcr7X/ONR4Ul02KZqQ9Bn6G0VNj5fx1pck5G2EhHI=;
        b=sL1BsGWhuhcDgRd0K8H/woWHQ1Vw25tsq5Sne2J4u8gDLZ5xkc5P65djxjykgbXcak
         akQmBBWSZ+AOQYeQGtgQSyI35oZPhdO9JpvGDE3UAQRqnUzIStWp7kulWK+0UJzZGSQo
         3EO7+Q2MLCwrtkuTt57idV+H+9rvDAZ9NqhWmErXgQE3+ygJC3wH85nqGsF/Kv8EvuxA
         rDl9leG4tymxEIsY9K+JhoO2HoEaT62bPcTGzUBVwjkGC+Tl8PQCX+El5p6+EGX+VIz/
         815M/oQ+ypdkGx/VjrvFm63jLriMkecOplcLRbmcv3u8ELEf0oep90i5TePPhNFWAW0W
         1wpw==
X-Forwarded-Encrypted: i=1; AKwUvBxS3x5fhZ36hjR88jqmTgY1YeUPRx6R8u678m8thsvUkPUcCFcT8u+uhd1gTAaZ9QBPiksEAzTCe2p3M58J@lists.linux.dev
X-Gm-Message-State: AFq9FYKTBnxNLSECyxZgChWb2iNEndMVukfUPEKiGbyZZajkS0QqGOHl
	p5NbAJ/LmUq2zUm4Aqcv8b40Uwb+iPf5WM8gXuWJc4+x69heEhTuIKw=
X-Gm-Gg: AYBFou3sber03X8WEMe3bcfn+S8QKD8kibFIoTyvXihr2PbO9sZdfZCCmPl1XcSw6AR
	dOmss429ZlzB/OopnyuY0StTgy0/QndlkyCxbYdcBWgH+AlW6x84Y0oUjPbLDnocDJNB+Op9t8n
	E8cQs5SwfdY3gvkC1bbrlhJYrYPCRpTTO4kGUdn/nzZJHmcdIdXCiAR9wGNmupBTbDMKSMBYuGl
	18gG1q4A4a9K5D+Ky92ozmlkBMRZ6dqWaZee9CUUtQbaSEqoKYnSPsuIPuzj7huEt0oZuBr94gK
	qZwurnZ4pYwAAATAUXIIz0GdPQ5w803Yo9j7fFNwMF7vHGX8wsYWIAFN8m1yAlyOazjU42ae3XJ
	IXMaOcZ20t/biLC4vPjrPpJjQuc+Kq26OPIhRgalwYmMEpRBTA2eMIOUI+tC1rjWp7vT66UPISc
	wG7z2yCrUITSm/J672kJUAhiy/me2MPDpbOA3PeE4osQegpoqFNKPV+ora8cRJFu+iyIbxYpdoA
	vLxhjMLN3PTxmMYgb6NPivn5gagIEOEcYznhgBbSR6rPf0Qd1TjTVkS683ZThaD8d1xnr1t0u4Y
	30xmMvpxE1jzCn9kFP35GBrImcFvSQ==
X-Received: by 2002:a05:6214:85d2:20b0:91b:5e33:9858 with SMTP id 6a1803df08f44-91b5e3399d7mr99215696d6.54.1791780450035;
        Sun, 11 Oct 2026 21:47:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b812ba8c7sm17513956d6.38.2026.10.11.21.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:47:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: atomisp: drain assert recovery before tearing down resources
Date: Mon, 12 Oct 2026 00:47:24 -0400
Message-ID: <20261012044724.160902-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ queues assert_recovery_work, which can stop, reset and
restart CSS. Removal currently tears down CSS and the CPU latency QoS
request while recovery can still be running.

Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
available until recovery finishes. Then release the IRQ before CSS and
firmware teardown. Apply the same ordering on probe failure, and skip
the uninitialized recovery work in PM-only mode.

This issue was found by static analysis.

Fixes: 93d3fb35aa10 ("media: atomisp: Remove watchdog timer")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..768b35468380 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1443,9 +1443,13 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return 0;
 
 error_unload_firmware:
+	disable_work_sync(&isp->assert_recovery_work);
 	atomisp_pm_uninit(isp);
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	ia_css_unload_firmware();
+	goto error_unregister_entities;
 error_free_irq:
+	disable_work_sync(&isp->assert_recovery_work);
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
@@ -1464,15 +1468,19 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 {
 	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
+	if (!isp->pm_only)
+		disable_work_sync(&isp->assert_recovery_work);
+
 	atomisp_pm_uninit(isp);
 
 	if (isp->pm_only)
 		return;
 
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
+
 	/* Undo ia_css_init() from atomisp_power_on() */
 	atomisp_css_uninit(isp);
 	ia_css_unload_firmware();
-	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
 	atomisp_unregister_entities(isp);
