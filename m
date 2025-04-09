Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5F31E3DF9
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178360; cv=none; b=T+ZUR1md9oCv5e4DH0QQZ9XNdPJFKyyWV/wtWsyOVpKdRSPcRQPG9nh0qkLN1oRP/IkIxenZKiX2RCyBTNxhPR9l1CzFrj27O8FNX0ZANQxvFwpaXdeSnEVMCrOblyyZ7nfENOQfTftQKSv1GUSfd494evT0de9YZ/khsPibiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178360; c=relaxed/simple;
	bh=7aUo0KhKx/lj9hQdUFehzcFFLyGs18webMfQ6kgeJlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKxrekeqgLo6pa2xBVKPBrMY38WlCUDmfCmRtc5vm5nCUoojjMSa98oACwaNqovmiS2FGCf/kMJQsO1yVktEmSjmdbp/OMUSatozzQPk5+sIaCvxP7o09EKplpkDDQE3sRiEJcOmRD3wZQ/dWr1jm5ieyja5zJZPQJJcE127FCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HaBJLPlG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HaBJLPlG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227914acd20so2972375ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178358; x=1744783158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RareA3N57SvH7MDKApFVFMHTInpOTvcT8TY3C4zHwbU=;
        b=HaBJLPlGzioxzSbx0lzm2cyHqdKZmWDUT8L9twksW+Ylkd2V3Zj1q9VH9OZn97V0A9
         6I4/ouuL86Qpga3MblTWSqe5zQNRUQUOsNLpihZ4vJ4chhntHj6rL60XoXPiwzpsIvRp
         u6cc562XImY8Ar25yJGc0Dj11mikoiMQCMDwm5g4GRze3fhUBpZ+24nsWhNnMPATHsXK
         g9ebfJU2wrclFxlT+P3IeFzAajez4gEO+YM6za2q0GPoy/CCOdIdgb19M6PxTWCW1fdM
         vt5I16LIRb9riBebYJVVprJC+qa/eRuu8Abe77oHyP2FYXWoOXu9HEt5r4bbcOjJFmk+
         Oy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178358; x=1744783158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RareA3N57SvH7MDKApFVFMHTInpOTvcT8TY3C4zHwbU=;
        b=EufJEhNhwP10tGjlE7KmWr6NKzAEE2Sj5MvsHdrFUY/tDp44Ajzt37Blc+BslBIQdt
         vqxsvC1OLwvO2e5bWrIy5XdwomhfZxz94TgYqJv50EEw8u8pROfgqJrT9ECIx5QBZC4l
         Tw+QduJYXstDoXHC5J9MQxNSs9iJ/zxugzyZiOnN64P4oxjxSfcoiJUbReyXt89eeGkm
         SN/cbmbDM6nIg9ejaWRMoPn9nINNDHAFwr1lOxefm87swWs5nYMEZTxSSVsUYLWV4NRH
         ebo/HHnU98QMD28VBvtp5Rm+afJPwDl11jKAVLqHGaAbQlLJjN3HmBzDEoWJtAx/tdaT
         1f0w==
X-Gm-Message-State: AOJu0YzLUsZmf7N0hym3zKnumNkNiGRGkGZQJkF+6BLR3dei3c3eBXRO
	b8g3Fvix/b+JxJNBm8QRcrp3LR5Un0dec8jI/ICMvC6Qx6EyG8zVU6ncH3lmng==
X-Gm-Gg: ASbGncs7+ye9SzzcRPwSVmX25OzqapycaPgaiOiscP9aQF1sQ7nNBFtT+0duUhCdEHX
	RbQnuB0xxLXsnrWVM/XYbQ72s5mOJFlUGCTdhXb/zwWgCk3FO5YiuJd0mm/i5DQCaht5+3jZOS2
	7ST0StZfOpzhTKy4IekkmmE2Tbmwa+ejS37IauqGIRIYPt/LFrYultC2HqhWs9Fe8UDoCW3oMUx
	H44JN8rBW39fDMZx7M1bUR55NH91ZsuVgFXeeLVczrzGx/MgsfIDBDnAo791l9WOWhh43H1OehZ
	P/+WPaM5qsoFSzNzFDDaER6O1lGhaRCxL9+FsD5xgREKCuveodBgtFIUGcya2SItbhemZm59b+F
	ylD8e9w==
X-Google-Smtp-Source: AGHT+IEdhTpQH/+n1RLDXKwfyEPqdPj9JmJb0P3ZdJfY61MukXtzqaTMbOo+jvqDBDEbouUoZPu3Tw==
X-Received: by 2002:a17:903:3c6b:b0:215:44fe:163d with SMTP id d9443c01a7336-22ac32b61c6mr27344485ad.17.1744178358276;
        Tue, 08 Apr 2025 22:59:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93addsm3361865ad.152.2025.04.08.22.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 10/21] staging: gpib: Using struct gpib_board_info_ioctl
Date: Wed,  9 Apr 2025 05:58:52 +0000
Message-ID: <20250409055903.321438-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_board_info_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 79806cc51749..ce2184c5de03 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1762,7 +1762,7 @@ static int query_board_rsv_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int board_info_ioctl(const struct gpib_board *board, unsigned long arg)
 {
-	board_info_ioctl_t info;
+	struct gpib_board_info_ioctl info;
 	int retval;
 
 	info.pad = board->pad;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e3d167edfd69..041b0a1593e9 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -70,7 +70,7 @@ struct gpib_spoll_bytes_ioctl {
 	int sad;
 };
 
-typedef struct {
+struct gpib_board_info_ioctl {
 	unsigned int pad;
 	int sad;
 	int parallel_poll_configuration;
@@ -79,7 +79,7 @@ typedef struct {
 	unsigned int t1_delay;
 	unsigned ist : 1;
 	unsigned no_7_bit_eos : 1;
-} board_info_ioctl_t;
+};
 
 typedef struct {
 	int pci_bus;
@@ -148,7 +148,7 @@ enum gpib_ioctl {
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
 	IBPPC = _IOW(GPIB_CODE, 28, ppoll_config_ioctl_t),
-	IBBOARD_INFO = _IOR(GPIB_CODE, 29, board_info_ioctl_t),
+	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, select_pci_ioctl_t),
-- 
2.43.0

