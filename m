Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E1E416D0A
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544590; cv=none; b=eBmowctKZXvDhKSANvwpsu6tSgIUshM/ousDXNGSDAEm5RnJgysHstggn0dg4TUbcGbbi7AUhXPb5jXfpK8A1DLXKoWZT8OeAi6yhP+kaB+bOUY3DNi0Ky/YRMBpMHW22uWos9E7ozxzJ8P9/xRDCBKqcTAqRwhbljWGfqSCodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544590; c=relaxed/simple;
	bh=UBpkXLYHfGfP21sRIvOuvWMqtu6js0FvM4qTTeQS82w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qsf/1A5iFMgA36fT8TMSj/CZa0vDxVbYAwPiPsDv685ymk5M0ttCiiALRmmw3C++rQncvtKu4qrjKIcoOnuQwPXZK1Fa5Qc+KercmRzVTrcl9R5E3ZJvZ3s754CnFDj5fjcvpULKluEXxMSOQH/2HUiKXzI8paWVVRidFHBQIMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn8DyQEo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn8DyQEo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf13f17da8so2381245ad.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544587; x=1782149387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blqmb+amG4DpJECopbRIs77Qpd+XdY0Z9iQpAl7/TEM=;
        b=fn8DyQEoZTTS2lubWHX5FVpOC0EHgKS4v8BADwvvkZSgyZSR9hAP2VnjK60i2PdhMv
         mjqwf0YxUIec9gnve9OyhCCfT2yENH6J+v9FMh9dKKgZZLZhEbBF0jlqbX8YKnc3D5LL
         QzP/DdGzz8rl3q6uSp6++JKPb50Gb3hYOi0rhKwztgiGn8o+O2mHMDkrf06JgY3NNaq9
         /u8bEYyh9CP/wg2QLniMO90XERbj2oCkMK1iUJFosquyeIy6YQWeaHKhvTu64zlS7gHE
         tgpAGowghQAx3Fa41RoLT+G05AzcLn5KxUbIrPb4u1x+w2ISH809a5TxXGE2Nzm2xljA
         HpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544587; x=1782149387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blqmb+amG4DpJECopbRIs77Qpd+XdY0Z9iQpAl7/TEM=;
        b=lMHQCuiMrXDCkLAmSYI8O9bpIi6ZeFngNZGo1EH1JBDKu+w3AzIDPSSeWpZlc+FB1q
         sFkIPJaEcVI3mbbJ+S1Z6Ln9XTxrmYYn6GercGvLMOOlDHobWlpd8Y96eqkn4J4+4FHl
         MmP+56KelCvUgEWr3jjTV+fJmOOt5v1oXy8hQq6xuhw1Qvg59BD+M3gcXKp6boRFLfHd
         nTSc7bcDIvNICAJ0F4PLZYnlc0aS0TbCUpjh8skOYUt85c9wqf3YB+sXMZWGjsS4gPH2
         Sn9z72uCrGQw/ccKujQzFUy53WXNvbkw8buRuzh2uugxfxszHoNaZ+44xhWN9FHnQjbb
         7HLQ==
X-Gm-Message-State: AOJu0Yynp/OR1DIy4ojvfHW5S7kFI5pDdGgXvRs96yNApt2xLr78VuOj
	puXWTFKGxtOKpa6ktpqiua2IrAX4IVYWu+dA9Sr8WfDOTym5thGX7tl9
X-Gm-Gg: Acq92OETJnrTHcZ9CCwarYywWrsz6fB414ylFxUEvipvAzodAIFY6m8q/KYqkkgQaUF
	XOnxn30vu/AZ9fTjmY/YvRjY98rhu2ik8GCjH7o6yNXYhqImljV8bCyqLBFMkipSSnxJGke2MMR
	dyRt2+yRPAWETicflTXY2ZfuWDboyl0nj6S9Zpzm1G5+MbVuJmROANRFh/re5mYVWV1ecA2EMeH
	sb9nVcugLc5hEpos84UV0WycvGQThewZ1Y/JV6xIuU21A41I4fVSV4yH0LO1LYipfINnhpHJ+jL
	/W1xURYKa+bUqvc69a+5B3nimqAfAp7fykgahgQHD7Lv8RUrXQUUSM6ZPOcyNnUTZuymhJLqzPA
	DQjf8MP7ZETLugmHr4bHVGpGV+YFswdF001a5LifBo0cNRU2nw8DwJ/s4P+pvGdFIMcnbobhmWs
	YMB63qEHnLB0ClQJ7ZudVpzm+gXs/pOsFz1EN/TGe5XdJoSH7tbTxKyC2yHfY/0JNzbkgE3pzM9
	xDJQxEIgdiZgvb05YUr15YjSUs=
X-Received: by 2002:a17:902:e88f:b0:2c0:b359:99c1 with SMTP id d9443c01a7336-2c41050946cmr83596165ad.2.1781544587495;
        Mon, 15 Jun 2026 10:29:47 -0700 (PDT)
Received: from fedora ([2401:4900:7c8e:5373:4159:c5ca:b737:78a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm105001775ad.32.2026.06.15.10.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:29:47 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
Date: Mon, 15 Jun 2026 22:57:34 +0530
Message-ID: <20260615172734.42038-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615172734.42038-1-ayushmukkanwar@gmail.com>
References: <20260615172734.42038-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_rx_shutdown calls free_irq and netif_napi_del without
disabling the napi instance first. As the free_irq only waits
for completion of hard interrupt handlers, the napi poll
function could still be active. If cvm_oct_remove proceeds to
free the plat structure (which holds the NAPI instances), the
active poll function will access freed memory, resulting in a
use-after-free crash.

Fixes: 3368c784bcf7 ("Staging: Octeon Ethernet: Convert to NAPI.")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260511150931.93382-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Changes since v1:
  - Added Fixes, Reported-by and Closes tags 
  - Added compile-tested-only note

Note: This patch has only been compile tested. No runtime testing
was performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet-rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index cd36b5ba6f6c..3e9d58d32156 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -535,6 +535,8 @@ void cvm_oct_rx_shutdown(struct platform_device *pdev)
 		else
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
+		napi_disable(&plat->rx_group[i].napi);
+
 		/* Free the interrupt handler */
 		free_irq(plat->rx_group[i].irq, &plat->rx_group[i].napi);
 
-- 
2.54.0

