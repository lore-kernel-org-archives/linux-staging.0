Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711631B4255
	for <linux-staging@lists.linux.dev>; Sat, 11 Jan 2025 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736612114; cv=none; b=pgmLKFpr3/WM+1dTTEIT1tw10hHGEUSdSlBYzEw3MmeA7okmturGNQEfEO7I61ENaLxtmnDhtnm5hKm8tzLGM4Zj2K6Eh6JPHWg4QIF0+DqWwukBeZlUQoxU9/QoFVUhhWHfJv7tqZEkZjyJCfuqal6gA2sILTh75CTokkEsViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736612114; c=relaxed/simple;
	bh=tvW7XjkscpqMn4ljBfxShf2fRy7UlSc1GHf6W2xCKm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlURRtjGF9Scex7bq2TdIMiLvhncc5Vv4KIdlNOlJUa9Vcn6oPyJssEMnTvtdEBxnmOi+dQoUT+A4WYVPOxDQ6Xi5i/zwQh19Nhv71kvUH42At0XuSlOaFCgU/oPK7mFn3YE5jIf9jSWjIFRoECa/9A8BPpPktMJrPWVzPHxDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECAjEM2m; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECAjEM2m"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso2399833f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Jan 2025 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736612111; x=1737216911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcSfewpLUtlDikVw3/XrxgvLaw/gAi3tPSMGU/8/Y98=;
        b=ECAjEM2mdzWA87B45m0TLQ46U7UMXxnIsD6KwqVd4gkamWS5t/50F+9DCLlPHa+uhl
         IOl/FJH1HOC94psL40mHOWK5Egz6jaYKL4MkqG2kpTmnd+8ScpkIz09/zecFMZVFvnKk
         iMsf3G3J66IusjhpvJAaj69J/vYReXrqnd7YEGOnzcMGIfk4jP6qLFEcariS2gL40QAm
         1aUYFIVA1whxFrUFXXuSUxhvze3MVrCciC/sC854vLQ/Jz1DPXKyKEGr0wJAd+2Gc9r4
         8m5FaLkbYuWwdfI2cqsx2K238jRLicKyxoFF6wlVYv9hWqHBgZqkzNxlf/JyTMRC2ff+
         KW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736612111; x=1737216911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcSfewpLUtlDikVw3/XrxgvLaw/gAi3tPSMGU/8/Y98=;
        b=gyrV3zd96G5dyCi0QHlgWNN/YAhEtAexYsee45pUdLNVrm0zAF7JFrgREDL2X5RU5M
         Y7rRRCQIQrYIhfQiUpPmE/NrIXOvlQgDcCoP6EjlGHI3hc+FTcJnqpqZnE1qX71SOtBW
         0wDDiva4B3X+oNH5h9qAADxEvXYoT2yPP1SLn+RODzOM7g95e2pxwXyKKRvmRsTGMgBi
         uYEgJa0TbD+tSqvqPx2JkGZE/Hcni9JJfCSCnhLAErvacgG18YBEZDDhgW1Aizsl5v13
         2WhycGqlEQK0ndBSE/fStlOaWT8HqUiGCVLL4V+S6qPEVN3/U+XVAGhg8ULZOKKi/6Gf
         tFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlaPWlSmjzTmzi+XnIWAMum+M+yXxq78K4mXjo5clkA0lPHwr/9tMMIsj9JQ6r3oGsxV+guVoBPi3Dvr/f@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Lc5yFubkMHgVnhJDzbC4+T4M2flo3KAIA7xodMDOgIQQU2cE
	muxNMrXuKigfaRffz/odH3cKuRABjf3ZTh0Qc1bnxxAYCBjb54ed
X-Gm-Gg: ASbGnctmTjA4FSmlrz7MeSoOKbkjssE/JTwBilRpGioKMZrJVwOk7zJ/699Cx2CvLTs
	U/pyDUPh391mGfzt+ShjMVhrC6llO4XT7Gs2w6yH6641q1kW2JBOSOP5mL7DLWM7K3j1WMs8HgK
	KFFEiBKzjoG/MFuYrCBIxaJsQIipvDyt3/iTs92Ky2bIaarXFGDEI3QgGz6bDwZr2j5HwPySa8N
	nXZDW7acBT2M0r8aao1rhLm1EIr7Z/4M7T9lfDPVb8IYsSA8OsnXreC2Rij7/ydoVI2xs1ulvhN
	qWuU/VG7PWlIhlXI
X-Google-Smtp-Source: AGHT+IEoTUDTs0hqT96h4+axrgiIa0IsKHr1yklhu5o95WfvIKeoOld9Tv8uwZQ8VVhZUon8H7AgnQ==
X-Received: by 2002:a5d:6da2:0:b0:386:256c:8e59 with SMTP id ffacd0b85a97d-38a872fbd0dmr13978472f8f.3.1736612110460;
        Sat, 11 Jan 2025 08:15:10 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80c9sm7510565f8f.84.2025.01.11.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 08:15:09 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3] staging: gpib: Add missing mutex unlock in agilent usb driver
Date: Sat, 11 Jan 2025 17:14:57 +0100
Message-ID: <20250111161457.27556-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no matching product id was found in the attach function the driver
returned without unlocking the agilent_82357a_hotplug_lock mutex.

Add the unlock call.

This was detected by smatch:
smatch warnings:
drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns 'global &agilent_82357a_hotplug_lock'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202412210143.WJhYzXfD-lkp@intel.com/
Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2 Add subsystem prefix in subject

drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index b21eadabc466..c22c6bb30776 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1365,6 +1365,7 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
 		break;
 	default:
 		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
+		mutex_unlock(&agilent_82357a_hotplug_lock);
 		return -EIO;
 	}
 #ifdef RESET_USB_CONFIG
-- 
2.47.1

