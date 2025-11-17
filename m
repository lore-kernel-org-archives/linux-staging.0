Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1D335076
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390434; cv=none; b=nbZIUYjQwN5uh3kZq0bQR/l+Twrip58q4R+hSU/62iVoJumQS1rTpjEdvjGoCHRx+8kPU0LSw9s592qecGRjOJdg4+V9N27zJRTsT/zPBxbZBoubTYnWBJ7bMtnV2kv0DT21/hes4RbbwFslDdsYbDAU+PtccBCXZ4BN1Gd2veM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390434; c=relaxed/simple;
	bh=r9JMpPVLznPtmHrSdt7bNv5qgNIue3TmK7buOh6dR5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8YoZjTVqMlYQJEvxtx9H4AJwcw+ateOxkbVkvx8P4kXFV0HbJ0vukR+mX6cvtwrvyhY4C7RbhABXMhcEEl3VSpfsZI86hZTxqd41Zc8P9tYNHNpFTmlhqBgSGBSE+Y0z4dWQJCOtGqBld798DvMZnbu3M7uBxtt80YLf1rSGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCPTpHhj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCPTpHhj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so2588112f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 06:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763390431; x=1763995231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPEi+OAnaxyP0YUa8fcTgwPLmAffwifnaMBooozroQM=;
        b=RCPTpHhj1brQ/E8NCOkgHUyY2+nEGMOfJObCUfyT5njILOG06qxTHLrbUEfC/gGyc+
         4oGSS0ChT1R1zyGEWJQ9eEnkGlxbs5szogv6L+sqviG5KaMZo7VyR3jtmIxV6/CPpowg
         +6TpiM1EJ7ofCAnavi/AAa5Zn2auLU0DN5IsRX2hmKMCR38KzfjK7zyE98f4zO0MALsg
         NVdDqiZMzwqedRJylbvU6jrAUlbCWyW+99FuSRKWlhi04y0kFTpilfztWWUzYC2ApChq
         pxxsoSaSA6gtlMNlE/Gy0kFE/+DPW84GaJ+k/b21x1DBuM8gu9tD+Gs0cm+8ExKRpZMl
         xDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390431; x=1763995231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vPEi+OAnaxyP0YUa8fcTgwPLmAffwifnaMBooozroQM=;
        b=e3XEbDKmtvsnoG+nE1sz8/CpebrKrOdwtiuPdmbwidCBMtl1dQlMftxrXrAVDwjHyB
         CLdYaenp04WluK3/d4y/mNIBOFK31p8cCGCOpCEXU7PbfYBZ/c9Uxcijiby9fYxAqTY1
         hkfuEzgfXOJ2ySVJP1SUzcZo5vffwt4gcq4TDRAyXwFlNxnsvQyxV7r67LZnb9cgZIrb
         n/nH3J6Mx0S3LAWxvN3Ew2JCEckFTt3v2zKw13BhRmaQaBiqVNEmE5/aBJv2DIkwrtrY
         ZvjtEk2JfUD7beFO1sb2Qi6W3FQbUdqsfd9K6bQUdBXqy5kumMXvS47UaFiQcjkZTRSE
         qHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW272wZTkTJ35jFpxfsjWFC9Em8baIKgItwd2kVf1MsjvIGjnaEQn4Ril7OHuyFTX8BuL20sIlYM0p2VqWW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3/2wUO11oreIjJ+Ywxqn8RVQIZdW2n/1gL4xKb1iyDG+e7Ffl
	kYJxlfbSsdvpEUguu7hbUHrGRkU/fgTOMdQ0qRKchXBmbwxo1kl+5ddC
X-Gm-Gg: ASbGncvq+SlN0rGQH5lzcAYONNaYKwq1n/ABbXHufenO1PIRZ+4jVx/1uG1PngLGIXT
	umnrCoie6qtXqDIs8ctJ5i9/+pQF7Qal388YKFa6nbIv182PxHD49Rpv4HAVtsmdGwAos5T/OKW
	zyd6Bs/bYptgSbfOt/c9jzQLXL5mvDE8odiLFfCCYi4WUCbezWcUiUpOjZ+4tBTar6JRNpkrlnE
	i0HC/eib8PPOU+0co5gO85R7eJ+Dz7BiUol5D8FzHFNCa2cOrjSUFQ2H+4qnEa8AelZFOgiDgvr
	8zLrPFDWxw/SKOVN0G+h6Z1dRBmZ/xLs/SlJ+zVms//UgBoF9yY/EMuXAVgCdrJHJ9sdKFKX2it
	sJaq8BkXWYBqyZwRGBDOzmyzhqt3GpUJ25hlGGIJJlDZm76qtbuIhuDbiA7/5pczM4bVs57BFsc
	mL0+H9gaUn9QVzbQE56VqjN1JFT54=
X-Google-Smtp-Source: AGHT+IEaaNt6GS6Jhr5WNjOs2UitFiM0H3PayD04c4C1r3GeZ0Otr8z0XUjjN56IxSF1NCqkQ5Ad3Q==
X-Received: by 2002:a05:6000:26cc:b0:42b:41dc:1b5d with SMTP id ffacd0b85a97d-42b593452f6mr11872408f8f.25.1763390430862;
        Mon, 17 Nov 2025 06:40:30 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm26788218f8f.41.2025.11.17.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:40:30 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V4 1/4] staging: gpib: Change // comments in uapi header file
Date: Mon, 17 Nov 2025 15:40:18 +0100
Message-ID: <20251117144021.23569-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117144021.23569-1-dpenkler@gmail.com>
References: <20251117144021.23569-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A ppc64 randconfig build complained about the // comments in the uapi
header file:
error: // comments are not allowed in this language [-Werror,-Wcomment]

Change the // comments to /* */ format.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511141203.sbp27oAR-lkp@intel.com/
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 55bf5e55507a..1cfee6b44ac3 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -40,7 +40,7 @@ struct gpib_serial_poll_ioctl {
 	__u32 pad;
 	__s32 sad;
 	__u8 status_byte;
-	__u8 padding[3];   // align to 32 bit boundary
+	__u8 padding[3];   /* align to 32 bit boundary */
 };
 
 struct gpib_eos_ioctl {
@@ -80,7 +80,7 @@ struct gpib_board_info_ioctl {
 	__u32 t1_delay;
 	unsigned ist : 1;
 	unsigned no_7_bit_eos : 1;
-	unsigned padding :30; // align to 32 bit boundary
+	unsigned padding :30; /* align to 32 bit boundary */
 };
 
 struct gpib_select_pci_ioctl {
@@ -92,7 +92,7 @@ struct gpib_ppoll_config_ioctl {
 	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
-	unsigned padding :22; // align to 32 bit boundary
+	unsigned padding :22; /* align to 32 bit boundary */
 };
 
 struct gpib_pad_ioctl {
@@ -105,15 +105,15 @@ struct gpib_sad_ioctl {
 	__s32 sad;
 };
 
-// select a piece of hardware to attach by its sysfs device path
+/* select a piece of hardware to attach by its sysfs device path */
 struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-// update status byte and request service
+/* update status byte and request service */
 struct gpib_request_service2 {
 	__u8 status_byte;
-	__u8 padding[3]; // align to 32 bit boundary
+	__u8 padding[3]; /* align to 32 bit boundary */
 	__s32 new_reason_for_service;
 };
 
@@ -160,7 +160,7 @@ enum gpib_ioctl {
 	IBPP2_SET = _IOW(GPIB_CODE, 40, __s16),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, __s16),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
-	// 44 was IBSELECT_SERIAL_NUMBER
+	/* 44 was IBSELECT_SERIAL_NUMBER */
 	IBRSV2 = _IOW(GPIB_CODE, 45, struct gpib_request_service2)
 };
 
-- 
2.51.2

