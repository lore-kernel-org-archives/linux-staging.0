Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369520127B
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958671; cv=none; b=EF5DTiy2qSZTABWBg0aL4idPK/SirFAKpPCVvVgGDLy1MLe495kMbHki5LD+UAfg6uC7eaWyUUfi5O56mBbfK18Mfj5g7Fob+Cpe+KLAKtdPqwY8Lsc6v9ytAiscRSAc78BDzSB8+KhTsjNgBgAOrzWzkuoa3TJ57G+y/NRSexs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958671; c=relaxed/simple;
	bh=KdQnwApMJiZhnf712Xc+Slm3O5Udnt89NCUlEf/erRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkzJdASTt78+HfoBuDXcYxpwyQIrfudrNodFYFRictQtkkX71/U/WfNE8k0tGASu/emnsN6RFXW6YhoEFWbh+GT3UzbMIuJ7l1XQimXzlRSYC6MijciCgn+AcFKnSMe4sNGzJfZso08U+r+PQjkjsLG7VsI+jBW9b4rtp/dquBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgBRsWnd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgBRsWnd"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748d982e92cso1019317b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750958669; x=1751563469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GKksa35feXB36GHTT9Qp1/4Jr24P78lzzDtaWWGcnqU=;
        b=kgBRsWndAC7kovvstmvjDFxRMbWQUzV9qSEO7t3OoDz0OltY5haiclaELBx5bC/235
         26cGSelwaAIDbX/uzLINiHIx2GgfPiz0nFoxpymnRSnwj4UtYwjKpAMgqHnZbl66+YbH
         7ns+dbZF2LtIDOKXTwYwBGkiEpO5zlhw9w0yIENnEDSgCEoXq3FnAL3VfM7dzMHCvVig
         KwUBgvMYFejqnNwCuVQbPnZz+MykLO7h6dLIMaRveRasQdrZccShIiFpuaVmFEKuJq8L
         EY95k4DetPiJeVBIvj+oIeKFh44XUY29Pl+gjDICMGZLEcSejKQoiHK0MBbwZOdkMLU9
         qPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958669; x=1751563469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKksa35feXB36GHTT9Qp1/4Jr24P78lzzDtaWWGcnqU=;
        b=bbeNjXqRNpJL9NJ7eYPDnBmCCjGkOcvJl9beyrRFwC2T7Q22jSxEujxC4yUunhvKjq
         FZ7EJkhaPJaB/KgvF0DZ4KjHKhg6FSmMNliE14H9LRexCTlmVeN61NblKFJKty1qQLGR
         2/A6PIunyMn0SNemCq/iBVLtAdf6pv/Y2CKK2iwz892TlpkaD+jRzNtt1ltR9o5HYDXW
         jUUEj54kk21CleE2fiOJHiAIVIEzVmeov9d8zsdCzhLLXvueDq7mvu9DtMwhH9c0dcQh
         tt+I7q9PYTDAE+I3ukJrERM7+ywZbdeImIOTPFwlJr2wrLOkOeA6/BmQycUxTVU5kNh2
         n34Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6Cpl71B9ffIH/2vc5TZnbDNAY3pidj7rSqTmQluFyvwi5OqDuDFYhMU0JkuyLkOmF1rf552ES5ADOVjzX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9cnhVHW7c/4GzcfCvdttV4KUkpHNvHrF9wXBHYnp3EgrZ9uC1
	9ZkBOFUTQAKPYFv+ADXIHS2dkWIhBuycOeNRKkLaUAgFPbUvtHgex4Ap
X-Gm-Gg: ASbGncsBN8PXrc7mUtqK/0KpeOZpfBj4II+KiH6JOGHBT9GK0Ptz2V0OaDWatZ69sW8
	ZSKaBU21A009i/m/ZXnSlsJGyYrhzc2MkS9aSEVaWQIKD1S7BDPRlm5cMCkUPtZuIX8kkXoDPAQ
	dUPfgGx6Qg1dEWdpCGVZ7ft140CUls4XmsJFPD2TNB8IrnHzDzzCYbMWaX1kgFRozG6eqj168m3
	GjlVmXo1RoedxVJFIByGCteSK0rhIRoLuNGTzWgPsEWu2bKnuRFbTYahMqgIgSvlTjgOB67zX+I
	CZOLAn4gEWeFoKRVPah2B8kt7OTqbtqne1UiBZEtiPU0sFh/Htjibhlx+TIgXG9WHa9Hum8wWwP
	+FQ==
X-Google-Smtp-Source: AGHT+IGpNrxWVlvz9yO0sPnp3SvG03DYr98IGTzu1iXn9pp/JkN8N+6B43mNyV1Djnpa3TrKJLV9Eg==
X-Received: by 2002:a05:6a00:846:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74af6e66354mr59436b3a.5.1750958669114;
        Thu, 26 Jun 2025 10:24:29 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af541be9fsm229670b3a.50.2025.06.26.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:24:28 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	gregkh@linuxfoundation.org,
	lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de,
	riyandhiman14@gmail.com,
	willy@infradead.org,
	notro@tronnes.org,
	thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
Date: Thu, 26 Jun 2025 22:54:10 +0530
Message-ID: <20250626172412.18355-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the error paths after fb_info structure is successfully allocated,
the memory allocated in fb_deferred_io_init() for info->pagerefs is not
freed. Fix that by adding the cleanup function on the error path.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
This patch is compile tested only. Not tested on real hardware.
Bug was found using our prototype static analysis tool.

 drivers/staging/fbtft/fbtft-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..39bced400065 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -692,6 +692,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	return info;
 
 release_framebuf:
+	fb_deferred_io_cleanup(info);
 	framebuffer_release(info);
 
 alloc_fail:
-- 
2.43.0

