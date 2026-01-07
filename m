Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09634EF09
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797006; cv=none; b=ZH/EZri1bO1AJ27NzFRoZwAWJwl/AUHvGbg+0yjLvSBIQMUZNDTysvhhYVBfMGCfBeMjvypuTifaNC07cc3gpXjHRYiSxBbDJg2fnCzp5d/Da1TU9nSQ1n1uynWzZGDdktnAbNyf+5b2DkHn3CHYKsz7Wo1Fbv+dH/0eEu5IshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797006; c=relaxed/simple;
	bh=F+gAIIyNiSdf9+OMh6aMRK9Uh/Iu6W/YK5YqgWTJwA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALlWRYuruZPQX8X3QpHzc+mFWkv5sgohfI9d2tGR/xOaNsjNaHxpXim15DJa2wWc+l693IqxOy6owSnGgFZDpKMk3hOAHsXazFbWcW+lRiaDlq6tWJh3+tfirhKWpyfSLiicHBwTtDq134BiBzIxrnP5PkMs9CIpWdrtnRw+Ss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdVRr+yD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdVRr+yD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso1866046b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767797004; x=1768401804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymGRBUBEtOEh9YhC7XXdt7L3xfVzWmbMSF9czlDoLQk=;
        b=AdVRr+yDlNcpm7rd97SA7LTDEFUvHpxbAjW/h32n6NFyzZDkXKFVdTWOsbUa1uziNR
         vd0g9yNuGpuBynHH6RKFkkl35B0RkCCHEZqatXZ9qiTdSy9mayJJFlvj2OMe5W7btmUu
         dougYUec/c2oXKcDXrhjacMD7ErJamVDPwr6GeIx6h1TFj8SxzRx5yBjDXagxdbbwo9h
         fRnb6yt8bBjD6LYaR0f1qIlwLvs5y91hEPof/VDmM/OF5GBBlbXkQQMUubbkBidV0F90
         c2w+aqZIS8CsoXsIXtEax40IdYY3VyV5hyA6LdAgzkm1AIdkjpFWguhG5hRRcr2qLf+J
         i8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797004; x=1768401804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymGRBUBEtOEh9YhC7XXdt7L3xfVzWmbMSF9czlDoLQk=;
        b=GTk0grnBk4qFH10XWGZgmXUaz25SXB4SvHUq1vEjSndqTOD3A98pWkRaLL4NZqFQZG
         6rHEs0UB80atOEmfTQB6bNpweTTwFGWI3VqZ/qc17raj+IVj9ksOhpGdT223BNmpNOqu
         2I3bSj9oa4Hc1nEQTy1p7xxFmciktKsLcjHaDk34c6PibGbpCbC2hcbseHK4eCY2T13p
         3Ur703N0KVy0s4SiJ4GThKxikhqS3lDunI4w9P5QYraGWsaKkBr50gZfILSYZN8q0y3E
         mpyiwbH6gRJupT6fCPP/3GRPQ8RP0S6BtRCl01CuIFdx1bzGePR6JXbIN6UTkrqfM1qb
         sx5g==
X-Forwarded-Encrypted: i=1; AJvYcCWOKPWddkQ2k813XE2PWy/ACu4Sh8nxnOcnrGK+68/eJx4yNb/MytqtS4NYnrXThIfrgI5pw4PVvLgfJE/b@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Y+pzG1dhbmb3Il4kcIMb7k75yaz9f4wotDC88SGhkFLDcD2c
	TG69qT6K9JIDpI0FtuFS8NI5FIoECSkK7Ro4Jb6LSOHGO2mlrbMntu8v
X-Gm-Gg: AY/fxX7xw/tV3Vl7mDYkmixOQliOPkhDxMeQFtWRlHzzLxLpgeESm5hljcXfWsCAPL7
	fP+Ub4LSAx7G+vZpbK9PiYFPf/jLFOtDrtwdCyJbit5TUbT1U3te961Z0KKPyxj4iAjztr/ORSV
	E0SKdm75gXMTwvWzOBPQxh7slwy+bsbw02fsYGw1u3OyHh3S5IWEMPaxj3SjspZLFjXudv59W5V
	cR3Lezz+9zpkr0xdj8RxEUKB+EmloVA81TQfVewQwNegB8y+7BeOq5WukTSF663AfRzQzbsi0Tf
	7vTlqsGY3BX/cISp9Tkd/DQfZwEHryb4FhHR1sAJgtw22v774i6bQ5+avJhro2PPpjTRlA7q9l0
	kDjCgW04nKpnIHBHwb3s74nOVzEnvsTW/L1dLUr+lReIBfCewugLQvGxvyWBeZ1IuVC5WzAA8hA
	CSPLLYQjQ43Zc=
X-Google-Smtp-Source: AGHT+IFsUPunjV/lY8Qb6jCnT9IV+LNp7BnjiA4+UFwp6AOzMaK/muVQLFCGpc1F7KohWjA1CTiNlg==
X-Received: by 2002:aa7:9a84:0:b0:7ef:3f4e:9182 with SMTP id d2e1a72fcca58-81b7fbc8cdemr2184402b3a.47.1767797003890;
        Wed, 07 Jan 2026 06:43:23 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm5168936b3a.46.2026.01.07.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:43:23 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Wed,  7 Jan 2026 20:12:52 +0530
Message-ID: <20260107144252.74666-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107144252.74666-1-karthikey3608@gmail.com>
References: <20260107144252.74666-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr() in

atomisp_xnr().

Also print an error message if atomisp_css_irq_enable() fails.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 58201dedf..a3dd8a5b6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +926,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1198,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
-- 
2.43.0

