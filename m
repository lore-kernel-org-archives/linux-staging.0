Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DB305066
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625111; cv=none; b=ANQrqC/iRWW9aQH4lPOQYIal2cnn5UURn7MUZDltL1HvMYfXJxYrQ9PYDsrZTQsqdzwVH69p040TX+JQdU0WhStbjlFkFk7G4ZUXz5Dsbu4SAmxoII6ZtzNa4UnKr3lhDlCCxDPrkPTLEWmztcwn99XGPuOAdiAcYVRKkaVRWsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625111; c=relaxed/simple;
	bh=VcJC7sCWJodERaoTS9t7XlGBxL7hprZHiIDPn09Ne7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgoM1Ni5FD2bmXJOl2NBV4dQXKjQEodhMcZ+meF9QbgaQHvDKqKAYRBpgccvqVr2heNTsL9kYLE8QwzB5c8BJjDToYFaFB+WdsTMO9vAePhag6d9LcNzIHRFZ+9RgJWzs3gbqZuffELcebjnmw2t3QAkohkO7fkn5cz6KzhLzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmC3afPm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmC3afPm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7ba55660769so28514b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 06:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625110; x=1768229910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=SmC3afPmdhH9b7QmvdchHtXYTHbUcpM0FUWjZDzX2VtM6zsR/6vOznpTb/MWWteHOo
         LM97Qv8XVWhyUtKRu/+s/l/wojnIu+pUDc1Esh0/4wcuru2yOPoRoXV9gY6+A1xlcRgo
         +96i9GqnYIajerpVMSVOF3CPXNh4nT4q8Jq2n8q/NITIIyQHdqABmFzzgHcmUByqh6jC
         LS2b3EkEKdTfnNnf1fPdD+1n6fapm23KE4ReMpaWBx1jbNwdtFcIOSNPKfYBZsqGy76o
         5oXNv1YkIBFq0plP2cQ5fPed2L1PwV+0HPRu0m7EmsG0qILhxJiwOY57wtuNPHP5OjfW
         0nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625110; x=1768229910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=pqU5PXjE+W2GIzncNq7k358TGhcBpQObQ/rI9URe+UMyg1lSZz/fYPwBurjnxYjMFx
         BBy+qSW8/me8O1+owsfXhp8lqIE3vsJMHDTS/2xSyPmDJL9bI/4gbKy6bN6fGNQWFUEB
         yhLcljd1RVS+2GJrxYft3Pzj5cIvtMmOvoCdJg3hiDrHNSmQJVGSnRtyUSykETYQ2K1Q
         HKl7FVrZfgotIe0flxrK8vjdHLnGMY3Pbsc/bE2UfO8yPj52m4FJBMtbySUA3f2Fr/gk
         lKLp6wxUUElFkn08ML5HcCAqS/Nnx2pO3SDmwTKQIU29PHnTVuJhbCGaEDA80d9aCkSO
         WYDg==
X-Forwarded-Encrypted: i=1; AJvYcCUkflmaaLRs0f1D8j+6N0eLyKPLIEjOgNMRNFtUxQ84pcoTEChaRVtGc6A4RrHWVm7hD//dukiEbloNIevc@lists.linux.dev
X-Gm-Message-State: AOJu0YxoHVdHbVUuuL6FV9r2gFsEtaT7uKGDxGwkzI6/urcFw+QPQ3SN
	pH88oFPXOwQUAWhBAeQWsj8Y6JriMCgHXgE38dqIIn7JVhiQE41F6Cow
X-Gm-Gg: AY/fxX5eaEw60TjBEX4fEBY0ACkCgODsjig3m77GE53noc7l+KrxR+LxFUiMhYNQEpj
	KcGhNVpjd+FB/MYngaJaKSxkna2tv150koU0rY/MB105900X9bYvgx8IPXjjKNXo7UGIywZpXNo
	rU0zz75Lkiwtla/RhYxuhA44tMAuK6xXuiA/UU7O5bAftK/OOeIleZizHNBFw87XWpsygSuGRKS
	Bous3XoiY7+IPwJRxnx39QzTDc8EUQ0fGPj0X1RQ5JkUNgspBthnXEaC2EZJwWgQ69h0zm//xRc
	aJ5L3S6Vz8Hc2LQlF6seLZmDfjLgPG6YeEhggB60Vy7ePHv/eHWb5a6zhOpPVZB/n8eyhcmgdvp
	DNSCIkl38y2oq7C5c9jyjROcLTPINZ/AozdtdaYcoBH3YNuAxsQVw5SBW+UjjI9of1+n9pI7ZqN
	9uGD+3Cx4kyCU=
X-Google-Smtp-Source: AGHT+IHd0J7CYDZvoLfOcn3yuW4Bcd7pC34RjnYz8x8yPWpwNDXN3La7THKi3GPsSVNRoAdXAZJ7RQ==
X-Received: by 2002:a05:6a20:6a08:b0:342:1f0:9af3 with SMTP id adf61e73a8af0-376a81dcc3dmr42857702637.29.1767625109526;
        Mon, 05 Jan 2026 06:58:29 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:58:29 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Mon,  5 Jan 2026 20:27:24 +0530
Message-ID: <20260105145724.37305-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105145724.37305-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260105145724.37305-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr() in

atomisp_xnr().

Also check the return value of atomisp_css_irq_enable() and log an

error once using dev_err_once() to avoid flooding dmesg.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4ed6b8aea..da2481af2 100644
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

