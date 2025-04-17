Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A835948
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850740; cv=none; b=qcZ86d0eq0GZdDCfXzur/gF4yIRhr4Z1O0eQjcgCsMrNpWRLAsGybwX+80zpaIQRQlRIPpw/eZan/VE2KUhhscttmnw0NykQ+FiLxs0bnlIH09TRY01JIDP/ArBW6IwnNECNNdqtWVMcacz919nxyLfgxmn+MaAkATLOGzd3MvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850740; c=relaxed/simple;
	bh=3aL+YmiC+SS2Eb9QJHfwgiTSyIEZCDR+E6UJpe0GC8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv4vx6CItlVWtx2MaSroMGlr1ybQeGQPM4RbYBB27Tz+431j4N/0t5YLjTCWAh4cS7tUeJ2w+qv+wy42w+YnZXTT5Ow0QxbxpVso36Ek/Utb3OUJrLsPlP75sf2Iphzgzh2m/QgWL91OhlLLX3O8ScHqBLThYffYZ0kdHceJlpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JOWq1gjy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JOWq1gjy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73972a54919so144710b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850738; x=1745455538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=JOWq1gjyzfktSDWcRorQ9+T9MFt/lTFSDEl8lIMji1UmpgHMoyqbRHA1vL1bfNtoLq
         iFCKXu8jg5gVRnhtkpeP1JEJObhkfYzIhZ1PT207pzBSOtU3S2sLnhcI74tTCZRWJ44y
         hNGNad2kSo33JGYlZR3QKw+zML+94IwGVq9lFreG8wHNk+5SUT7IXPIWq1V3gs8cw6MD
         w1O/8zhcxSquQiQDsKMQT1kA5bFKgJ12yikG+n6yRcvDFeFrSvLyRiarHE6sDJJ5/dwU
         7350v6bigPotLnROMFTkXx83PRPMJAAW6HMSITquDlTnSqCRCaV1PuAtNh2ODntM8Bpe
         0EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850738; x=1745455538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=n44SUicMi/i5PcjXmU5I4J8WWpGUKvnOwdDeQCZ0gCMSV/xWeuQcnMg+jUzk40x/Wn
         J4UcZ2JCYNC2ibloI5BZ3jPljV4/snC/QgvCeZKUvxciDQiwxYH/U4he2WnwGL7kivLO
         yw9og80UtvX1SsFjauan/CKJWzKNz0l+CxN3DaCe12/AJPJkry2bFXD7cQZ2pM/VHyfl
         hogxzAYbbSJ97IaBggd/PRHo5lw4mvVTUKhO6v5QbyP81t84ST5C4kaSvOQv73B9oKEY
         r/EF/bTogZMrpzZbLydbenWYTlt3eWQn/4JB3h7U8ewpKILPKLHFvS1oGg9HbR/uigpF
         Di6g==
X-Gm-Message-State: AOJu0YzkB8+6OuqjvI2YFJOva1Ymib6dLU4w0lw9ZXEKyS8A0aaRVWvB
	osYRvnQyyNqm+I4AtgNDpraDXBzmPaA8/kB0OUkPHA1vbvPthur/G3iSrs+GTQ==
X-Gm-Gg: ASbGnctk9cE7Mxp/NSoevOlH1qCss6m9vV//A/9S/ZS5P5RfGyCBBMq8Gh2Y6qei6iY
	uXKeH1PpeREBAb/oSGYo71Qjr+zb+unaSNGFKyh2hWP2PX2uM+N7sUqRljvm8lv5BACL57DRB2z
	wzv6M3kFfV7bW7MLf/X+HjlV2o9Pn4FPSkladFFCND8810jjnpFp7j7q0tdjx4BzYfgSL/G3npi
	vPXctUcHoylhE1tbvnBel63gLOX7KbqDhDi5NyctK7d3Ezh4J70ttcCnH+BVKD6FrVHSLXQG4f8
	Bzm9r3A9ThOVOWLc/fO1OE/3djiT/XERVnZguRdqC7NhufXQx3yFD5JlxBPDO0OHkQ3s88B3lsw
	BYJcBdw==
X-Google-Smtp-Source: AGHT+IG5VFKI1/oUFDSbQtBRp63712CBVsmMPFE97cVbpHoI0iyWGDIaBksLAgKcyTM2pnFkSyJsFQ==
X-Received: by 2002:a05:6a21:3513:b0:1f5:67c2:e3e9 with SMTP id adf61e73a8af0-203b3fbba0bmr5886084637.29.1744850738494;
        Wed, 16 Apr 2025 17:45:38 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm11126118b3a.38.2025.04.16.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:38 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 01/14] staging: gpib: gpib_ioctl: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:20 +0000
Message-ID: <20250417004533.86765-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e903ec1fe274..2d2a268d8573 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -39,7 +39,7 @@ struct gpib_close_dev_ioctl {
 struct gpib_serial_poll_ioctl {
 	unsigned int pad;
 	int sad;
-	uint8_t status_byte;
+	__u8 status_byte;
 };
 
 struct gpib_eos_ioctl {
@@ -87,7 +87,7 @@ struct gpib_select_pci_ioctl {
 };
 
 struct gpib_ppoll_config_ioctl {
-	uint8_t config;
+	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
 };
@@ -109,7 +109,7 @@ struct gpib_select_device_path_ioctl {
 
 // update status byte and request service
 struct gpib_request_service2 {
-	uint8_t status_byte;
+	__u8 status_byte;
 	int new_reason_for_service;
 };
 
@@ -121,7 +121,7 @@ enum gpib_ioctl {
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
 	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
-	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
+	IBRPP = _IOWR(GPIB_CODE, 6, __u8),
 
 	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
 	IBSRE = _IOW(GPIB_CODE, 10, int),
@@ -133,7 +133,7 @@ enum gpib_ioctl {
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
-	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
+	IBRSV = _IOW(GPIB_CODE, 20, __u8),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
-- 
2.43.0

