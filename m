Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C846B4177B
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 22:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709417708; cv=none; b=AgZFEBfDLmuits12oaRTQm53M8kCJP9svbGkoT+5qBpI3O58wx2lIcVd+10FbbLzwN51qpT59G1roZ6J5dLW1CXTbPFDxdbYHG5FPiOC65ibrt13VqN2mw8A7X0uW+FoX3FlDU5s2gi7mbmZoes9pEy0vDGePOFsm7FdtOO2Wr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709417708; c=relaxed/simple;
	bh=hPV1W9NNCdPmUe/gre4zixpiDH0DuSLGUPz541ul5bA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kS6AAfOcOxf4WsOtYADT0+0rUGzpW+kai/UdK/9g5nxfsvnKz2tQKlMJ6j//xWCjYvpLEAqSMveu4AcA8PPew5qeS6TAvn7wgNX1K59o6VoMlLa3ROHbEht2r2QXANJt6bvfUsIkCsWXX13tJ5BE+fB0ehEaYWwiF65ZT2vNZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT34rUmu; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT34rUmu"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d228a132acso40227211fa.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 14:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709417705; x=1710022505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJIX0deRA6RFRMpGp+Bsyln5k9lSvt9jo763ilTvMpc=;
        b=VT34rUmu+o38jqaa+mn82iGrN7eJgBNfRDnO3okO8OK9xIrR83uIDspdTf5PHHhUv8
         8gQkwGjbI0aaVCb6cguMuVf7PN7sXTwYJhOUs18e2NVbRkAoDqSTIZpZ6O3ec/tnXkZd
         02VBdG8JwzCh4XPCG9qAqOzUqyohCiwW/z5UKhRvjk6pmPxm6hv0Cqt/DsLNf2A40zd5
         2pymqFcIWsV4b0rj6gNt1rESaf4drFVoWO3StjfKXQY+D/eE9RtTuuW0PmfjJD1m9ufG
         M4GZLeMdH5v+tJ9avY9pC/540mZbct2l80/nTtZfk/2FieCwElM1VpGCCqFWU329DTL0
         BO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709417705; x=1710022505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJIX0deRA6RFRMpGp+Bsyln5k9lSvt9jo763ilTvMpc=;
        b=ggDsGHZyTjMQWbkW2idcCd6asNNUEenqfKsMUR64e5suAlJaRMZLlW2vC49RK7p5eo
         fuuQRwER6HlCAahpMuQ5rLZHZRKbBxvIlhkOtE16hoBzzfqBTKF8IyUTfl5AbRJDdVGH
         AhyuX6QuksTVEhz2gjbr8aS68KvwOfu/zrblJLLM8oeFdaEuv7iXaWYBhGYsGqisOp9k
         ltSsjT9WhdoDN4XJMr58laQGnZ+1bCCbbX6qmaZ7TIlhxlaoJR3DjGVGG9SkcusqRr/y
         BWH2k4zVkzc4vE+0foAZkk4GOXN3CT67Y8lIr3EmAmze4qi7JSgcZP2e/vMHAGoyIOkl
         neJg==
X-Forwarded-Encrypted: i=1; AJvYcCUGcHdFX2K2wYqKst51j3Zm1y3+Pjd7uW7A+qnCxDwSLDsJpUDt0qokZLiwQDAVwZBcH/pgUsYr9dHLVyPv69MwdWV21PDXrX2jkDWtmw==
X-Gm-Message-State: AOJu0YyIOqnC/Z3L8YKuwe3wJUPsHCU+x6+bTC33AC1NyATh0V2d/u8R
	Cg0J9tGQ6SQMxhke/AhEeL30IsvTPArr2M2LUimp1sFrkrA/rVVB
X-Google-Smtp-Source: AGHT+IGX1rOU+9w1Eo79CHkqn1XHgAtvHUGw0KG5VmcYkiGwpH2Z5E/Hmi8gIMo7SU+eNx9sZ/RJ1g==
X-Received: by 2002:a05:6512:1599:b0:513:17a4:c8c1 with SMTP id bp25-20020a056512159900b0051317a4c8c1mr4803546lfb.49.1709417704690;
        Sat, 02 Mar 2024 14:15:04 -0800 (PST)
Received: from localhost.localdomain (c83-255-24-248.bredband.tele2.se. [83.255.24.248])
        by smtp.googlemail.com with ESMTPSA id a23-20020a195f57000000b0051333e2f55dsm648975lfj.159.2024.03.02.14.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 14:15:04 -0800 (PST)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH] staging: vme_user: Ensure blank lines after variable declarations and fix misaligned */ comment formatting issues
Date: Sat,  2 Mar 2024 23:14:54 +0100
Message-Id: <20240302221454.141649-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following issues:
 * Ensures a blank line after declarations
 * Ensures */ is aligned with its correct opening /*

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 4dd224d0b86e..674d83325e42 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -34,6 +34,7 @@ struct tsi148_driver {
 	void __iomem *base;	/* Base Address of device registers */
 	wait_queue_head_t dma_queue[2];
 	wait_queue_head_t iack_queue;
+
 	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
 	void *lm_data[4];
 	void *crcsr_kernel;
@@ -691,8 +692,7 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 
 #define TSI148_LCSR_VMCTRL_RMWEN       BIT(20)	/* RMW Enable */
 
-#define TSI148_LCSR_VMCTRL_ATO_M       (7 << 16)	/* Master Access Time-out Mask
-						 */
+#define TSI148_LCSR_VMCTRL_ATO_M       (7 << 16)	/* Master Access Time-out Mask*/
 #define TSI148_LCSR_VMCTRL_ATO_32      (0 << 16)	/* 32 us */
 #define TSI148_LCSR_VMCTRL_ATO_128     BIT(16)	/* 128 us */
 #define TSI148_LCSR_VMCTRL_ATO_512     (2 << 16)	/* 512 us */
@@ -753,8 +753,7 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 #define TSI148_LCSR_VCTRL_DLT_16384    (0xB << 24)	/* 16384 VCLKS */
 #define TSI148_LCSR_VCTRL_DLT_32768    (0xC << 24)	/* 32768 VCLKS */
 
-#define TSI148_LCSR_VCTRL_NERBB        BIT(20)	/* No Early Release of Bus Busy
-						 */
+#define TSI148_LCSR_VCTRL_NERBB        BIT(20)	/* No Early Release of Bus Busy*/
 
 #define TSI148_LCSR_VCTRL_SRESET       BIT(17)	/* System Reset */
 #define TSI148_LCSR_VCTRL_LRESET       BIT(16)	/* Local Reset */
-- 
2.40.1

