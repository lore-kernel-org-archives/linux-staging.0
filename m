Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AB1632C4
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621699; cv=none; b=YsTQPUQ9IsXQmTwB00JVz/mebRhAAESD+uoJ5+lFrau9hc/2k9ZyAcP7rAfq8pR/p0uX0UWNAXYggb0gLawW21gjRdPxwHDb6HZHtCfrEeNamuBMwJZCCJU57w7zb37ekRlQyCDiKlgr2nU67+5XcgH1kCSY8Q5kI7zbHPzAMQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621699; c=relaxed/simple;
	bh=TXNUYX1G4d7X/z31PaSM8Wlw23ty1yqTqroUAgdDSDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8A7cawaDxDeqILBDGv69W4rupqAZ41o4xv5Nur82ThiZL4E6vLokq4wQu4uoiAzH3ebB2eA9Wni1XfB+Xc+5ecAX1v11LYoeqLRqSx2nGyb2g59afbyTrAqGyF9DmFdiy4teZyZnBffCoChG/ZSwk/VC6ln6ueSFxEZdsjAL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9ed0qqD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9ed0qqD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso5741937a12.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621695; x=1731226495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhludfnkOdE6Bkm5V0G70lBT/zEk61Bs7bh9/fZXf1g=;
        b=O9ed0qqDPl34Vc+xaY+mCvpgr3KhibVmqV1Ml9ifBO9nYM82BxVusSKFeJwpPARcMW
         83s3S4/ZqGg0Xi5mY6CY6tguK/5wlG61mkX2MtbUkHCim421SWQMz02mWpCSawoTMYwF
         K0eZvDTckLuzKsGHcfAnjp5vpf6kGXibokfoGYszSFoH1OzSla5qg8KFsQbfT7ozSKYZ
         j16BqH6ux7+i1lLYJp7cqp2B4FQKX+DIIvMzv1jXn5SWdoBlieUsoMf8zgC3YkCPsWn2
         94hdbRFpisiq22iK1Ly4Rjk7fuJBMk+EX0rnNcsarqTfW9DB30EJHvkBsK8o77H4R840
         9xRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621695; x=1731226495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhludfnkOdE6Bkm5V0G70lBT/zEk61Bs7bh9/fZXf1g=;
        b=W+bJgwl2iiy+oxTBv5umcCgkkFNxK0UmfnojK497w06UZhVa+X1wawf804LWPRMVdH
         azm1tFouEYkA6q0EcKGLiKLnw8DQU5g7LsxOkW325/nAvTT4Wh6UszV8Vyo2VRhT7UEf
         T554ZFQwL9+2YBvonAKUbvHHrnjI6bVEesdBHNKvbz//xipNKIBq1dx1RJO7/CpqhSP6
         9RIfbv5A9n/8By19jWLB7sx1/PO0j6qMpT01wdWAidKKV6vGCj7xgZWjgOuFkxUnYAy1
         YzsoPKVIprfBSXssBe7rsolF3kL8M5Nc8a5PLjMajmFMjNYA2XbSMK9k/diOjslrX70d
         o/4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaezqLoLlJ0qkFIteIdZ2EJL1YL1HPFtxbRF2El1rXL8e9JkhGe5LdTumSR+IKcSfRGOTv2L6x06LZk/eG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6L+kwvi4d4Zi7cyEYtdCMKQUX8feJGw5VhzttwgPcK7T6cS3H
	oOOuSOhDfXVL3YPBRMxiF+ZHUcN+BEhNtmsRXzbWl8QgE1FVIsDJ
X-Google-Smtp-Source: AGHT+IF8rnO8fnO6ZDQKo2UpprEIvwcqWdLz4SsAM0c0LR/KMS1faKOQaWR/OqQWTObMB70VSR/+qA==
X-Received: by 2002:a05:6402:5109:b0:5ce:d264:3b75 with SMTP id 4fb4d7f45d1cf-5ced2643bbcmr1666147a12.1.1730621694716;
        Sun, 03 Nov 2024 01:14:54 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:54 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 05/13] staging: rtl8723bs: Remove function pointer check_ips_status
Date: Sun,  3 Nov 2024 09:14:26 +0100
Message-ID: <afcfbc2381d02a9f63a6ccc7acf4f31a24547488.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer check_ips_status and use CheckIPSStatus directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 7 +------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 11d75b1b1ea9..44fab4eecb5e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -156,12 +156,7 @@ void rtw_hal_disable_interrupt(struct adapter *padapter)
 
 u8 rtw_hal_check_ips_status(struct adapter *padapter)
 {
-	u8 val = false;
-
-	if (padapter->HalFunc.check_ips_status)
-		val = padapter->HalFunc.check_ips_status(padapter);
-
-	return val;
+	return CheckIPSStatus(padapter);
 }
 
 s32	rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index a64b28bee019..1211b7b440cf 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->check_ips_status = &CheckIPSStatus;
 	pHalFunc->SetHwRegHandler = &SetHwReg8723BS;
 	pHalFunc->GetHwRegHandler = &GetHwReg8723BS;
 	pHalFunc->SetHwRegHandlerWithBuf = &SetHwRegWithBuf8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 5b52b0fd95f0..e6f4c398f35f 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	u8 (*check_ips_status)(struct adapter *padapter);
 	void (*set_channel_handler)(struct adapter *padapter, u8 channel);
 	void (*set_chnl_bw_handler)(struct adapter *padapter, u8 channel, enum channel_width Bandwidth, u8 Offset40, u8 Offset80);
 
-- 
2.43.0

