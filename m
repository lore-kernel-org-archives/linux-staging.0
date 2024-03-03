Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F2A94B
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709460356; cv=none; b=qgfe9uVeYzlPBcoCL7KXc23GtJ40mZb9BGpKgjzW4WFAOU7oRVQYUeLsBWP68t92NZ2zYLsCOARLhvxYftFP3aEhNigk9QcC95SbxijAgUT0MiQvcCIZeOfq6CFTyXQN9tRwb+styrhJ6f0eCgN3+YTANeE0uHsJTrdiCvx2OKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709460356; c=relaxed/simple;
	bh=tSobmWen73fv9nPU7r7xbyASdzEXsh6NI0D5+8vjLR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yqu8p9IOVgVNZPnN1cncp0dRaXFZz4bCdEKlWNYtcy++CxvfsSilkGDNeBuQsBF/B17bkNPgm4fRfe3Outs1wSIiL7hjd81AcRkmLJt0hWm2BfX8MQKHbREhdzgX9c8IHnEkCva6Vv/yKHBFrhVjw+nR9ry9juJGPsys+MY7m5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvBPNRmr; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvBPNRmr"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d1094b5568so41961281fa.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 02:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709460353; x=1710065153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8iW5FUb6Ai9/iyJ+EPFHL8GpePG+BU8Uo9Ut8WfDZE=;
        b=QvBPNRmrwTjLVMaeUy/et5wPmkOn6Aw+vML0/7BTUW1aGBr2zXMgWq7LDSPnjgG+kK
         Pox9G7b2V1o0xd5WLUP0BNRpWAu1CYtoLFuJsYJvnDRTa2t0zt54RskFYiiRqAqlpv08
         w2U/CFRUkklMdqLr3yw/rO7Z1w5LTrGuwxiOr4yiNyf5gNEK4lQK7/2Rx4tcqMULr6Og
         FMgHXcsWF7TTzSiTOy7Hegzaq9r+r2B3RL3Jxck3kiJryfuR7ZhqTeBe/QRyKPgVTzDK
         zOB2nEsyo30AmtLExISbxZzbE13q2vi5xHCxqzUP8X8Eg1mgG6NU65Ni7Cn+0NnxaJzE
         Fa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709460353; x=1710065153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8iW5FUb6Ai9/iyJ+EPFHL8GpePG+BU8Uo9Ut8WfDZE=;
        b=whOCOpD96qeoNC02YMheFyS4cVB5dWFNykmvMRpXdYoZQzhCvNIScLN8BHctrXwaw8
         YLfFB6qIAx4uQhQhEfJy/Iv0P/HAvD1ZjA/lL6laHef0nCmnPBQ4nV+O/FVQQGxkvGcc
         HbNt9Ojk2+Kkeguqopm814ybffH8h8/1QXPI2WAAswK6VwwKB67I1u7P7muGqXORJCw9
         98JV6fhR4YjpBJ3k8QrdZYKFu7LFKL0Z1bhPYaGE3q3wQEACiE06RcuwAP80ifBogkl2
         1LNSzKESClJyDOic9TuNQJQPzeoITw6vh9gNbThn+nC4jcSAL24rKypmrPI0RSUcVOxh
         Z2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVkeyKKX9Se51FcRvGQXuzMFHpo12jfKWDIT6vUtyDvAoz5EDvZbaVLwdca76nstMgjQlCBkoh+sMUmxA/OjmORtPjV01iJJBtEGscPYQ==
X-Gm-Message-State: AOJu0YxPQgGpe8bDDhPDIIgdWfnKYBhgE6JsnZFOTL/aa6r6Dl6g1iK0
	R5ddfzuyOUEDvFktX3GCAFHB7buW6UBUCSesbrGcNZydh0V/beuZ
X-Google-Smtp-Source: AGHT+IGdvgKm2MhCmmOaXXHkFFtt/k8NV+hwFxoNtCcO+7XEAbDrKUH+xlmE515EW/FbQOoYfPmRUw==
X-Received: by 2002:a2e:a688:0:b0:2d2:a9d6:c435 with SMTP id q8-20020a2ea688000000b002d2a9d6c435mr3697205lje.34.1709460352548;
        Sun, 03 Mar 2024 02:05:52 -0800 (PST)
Received: from localhost.localdomain (c83-255-24-248.bredband.tele2.se. [83.255.24.248])
        by smtp.googlemail.com with ESMTPSA id n5-20020a2e9045000000b002d24306ada3sm1264523ljg.120.2024.03.03.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 02:05:52 -0800 (PST)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 1/2] staging: vme_user: Fix misaligned closing comment */
Date: Sun,  3 Mar 2024 11:05:46 +0100
Message-Id: <20240303100547.153636-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch makes the following change:
 * Ensures the trailing */ for comments is on the same line as the opening
   /*

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 4dd224d0b86e..2a92497c5570 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -691,8 +691,7 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 
 #define TSI148_LCSR_VMCTRL_RMWEN       BIT(20)	/* RMW Enable */
 
-#define TSI148_LCSR_VMCTRL_ATO_M       (7 << 16)	/* Master Access Time-out Mask
-						 */
+#define TSI148_LCSR_VMCTRL_ATO_M       (7 << 16)	/* Master Access Time-out Mask */
 #define TSI148_LCSR_VMCTRL_ATO_32      (0 << 16)	/* 32 us */
 #define TSI148_LCSR_VMCTRL_ATO_128     BIT(16)	/* 128 us */
 #define TSI148_LCSR_VMCTRL_ATO_512     (2 << 16)	/* 512 us */
@@ -753,8 +752,7 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 #define TSI148_LCSR_VCTRL_DLT_16384    (0xB << 24)	/* 16384 VCLKS */
 #define TSI148_LCSR_VCTRL_DLT_32768    (0xC << 24)	/* 32768 VCLKS */
 
-#define TSI148_LCSR_VCTRL_NERBB        BIT(20)	/* No Early Release of Bus Busy
-						 */
+#define TSI148_LCSR_VCTRL_NERBB        BIT(20)	/* No Early Release of Bus Busy */
 
 #define TSI148_LCSR_VCTRL_SRESET       BIT(17)	/* System Reset */
 #define TSI148_LCSR_VCTRL_LRESET       BIT(16)	/* Local Reset */
-- 
2.40.1

