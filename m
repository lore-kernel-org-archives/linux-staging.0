Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74821EF090
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178366; cv=none; b=O4THrUHR1m9/42b1747hk8NhKp5JFIZy0zd5NW3PvwW+gkNy21i8mqpmwvmLFw/4abHubyqa4Do50x1GDRuxYiWszK8JSU/NPZtQeX2w3fnxs1rYWcctws9MV1PWfUFUWzI0hl0+4/p/szFc2kIoBMxIrCZ3YEcozQrZ7piW8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178366; c=relaxed/simple;
	bh=VInhgwSIIXvZJ1g/htalPQyTH0iq5W6bLI7iHQ9bc7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXbAOQcq5Xp2SjT4LhKSxBIRnjPMxBtx92XRmTqMsmJKlEzFLnAAGpRTQYLBG6ALogeFWNhdmKZLJpJ4EyA5rpPhYoxF/2cniayOoIMmY28U8FDj5qlXGmAgzbXlyu7pMoPOmRYf31SuhwbT+VfEPkz254cVFWoTAp2XeFFrLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=TNEwEAnt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="TNEwEAnt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224341bbc1dso56350915ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178364; x=1744783164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U6T7r+NCcsX4bcxp+7IePUhvD/0xAqz8Z5Y+CnNL0s=;
        b=TNEwEAntr3R2ahlnjsDQLJT+sc2BqKAYFeBMZ+8rOc6SON8Eby/bC0WZXNtX/8kNyi
         ImCPaRSmT6goQkmHFcCYaMRYus5ElbQBcKY9bEVGNezPnTOn/VK1sm3Afahf0MD0QRjU
         BCb5DfymloZr/2CObXjAI6+sXPBEp1kmzmcjaQE/od1QA3TC65EWAZCV6POCDmBcVedj
         FP681rmXe17q174fNrkqOgGySXDRptIVSHrPMKQi+i2Ni2z0LH0sR4d0xWvmzVDqq3x2
         CXNBXOEQ8SjlE2/+hikZPm8648HQITBw14dY9QefqkqRSktxP0r+q6pD66PLIg7QOtbD
         UQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178364; x=1744783164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U6T7r+NCcsX4bcxp+7IePUhvD/0xAqz8Z5Y+CnNL0s=;
        b=AuCNE20Z3eYo32CNewW9+3b71+KWb4O1zVmYb1/1uJ6Z3stwS2FSC3G2v+Yvxo3kfD
         Kp8bEZus4Uw1UkCLwJLZ1oYtxkkETIfItcWLjUZTag/DpGltefd/0uzngNlJl87CQ4rt
         fUGEVLvGeAWjzQ/Aoyt8vbo+Y4oWYxyrKEu0PKcbdxrTn/lZxRqwYpJtafEA8eISIxXJ
         Hr0oIat/Lmo9Zef2NOfMOxicwv5AsVkeqXnjaft4H5pzuluRl1y1IT1zTI/hOQGQP0Or
         UcT+ssVRplKbI7nAQ9Zg2OWXQZCTYouBJj6m0ZHithJh4dQPCxVX2cr6Z3Nw/FO68iwF
         09WQ==
X-Gm-Message-State: AOJu0YzPErIYAq+BO0YkK2aGlG2ElIiY9SOuDuEGiMqQJ3Obk5e38tHO
	P307hgiZLTYYoY6krtlbfTG/MoOhjqVML55wJ5n6mGhiERjHDhAmCTkz2DVZUA==
X-Gm-Gg: ASbGnctR2tklwTeoujaDUnUBxZvORY3DPr0ojKxNMMD/Os7MgZhDPgrvDE/HzbJx/DK
	3ZVdQpSYMQqnahUqjs97zzMCeGw9wiephog4IgHECxplNsckL60159mGOTcgr9uE3i3dsA1g3h0
	IkLyUYDBV6w0YKli6V4HcP7foJ9Vj61f3tOQMA0kJUolFe4yfQokUs+W8FAWcITauvrbGdUourZ
	JaG70juP5iKZycmM8wVQcNIGaefJnfUbpiowhRGAR57kNiwXZceZt9DgbqSG1cAEyf6wInVFxuK
	HWg6JVcqZkc5qtK0BMGxjmXjN88MyS+TqQF98+V2ca0gYu12OQZShYmTI55Qq5IUDwYUbybg8qd
	ksh9RTw==
X-Google-Smtp-Source: AGHT+IH93XidxFXNNSKdlUql5hI1Si+EXEyliC+5Rxu0PP/O+JUUJzvGhlEACOHeIGCrXW2hJjfzHw==
X-Received: by 2002:a17:902:e80f:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22ac2a1df0bmr28550885ad.38.1744178364315;
        Tue, 08 Apr 2025 22:59:24 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b642besm3481435ad.46.2025.04.08.22.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:24 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 15/21] staging: gpib: Using gpib_select_device_path_ioctl
Date: Wed,  9 Apr 2025 05:58:57 +0000
Message-ID: <20250409055903.321438-16-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_select_device_path_ioctl' to
remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 7 ++++---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8febd683fe0b..71c379c22be0 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1815,17 +1815,18 @@ static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg)
 
 static int select_device_path_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
-	select_device_path_ioctl_t *selection;
+	struct gpib_select_device_path_ioctl *selection;
 	int retval;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	selection = vmalloc(sizeof(select_device_path_ioctl_t));
+	selection = vmalloc(sizeof(struct gpib_select_device_path_ioctl));
 	if (!selection)
 		return -ENOMEM;
 
-	retval = copy_from_user(selection, (void __user *)arg, sizeof(select_device_path_ioctl_t));
+	retval = copy_from_user(selection, (void __user *)arg,
+				sizeof(struct gpib_select_device_path_ioctl));
 	if (retval) {
 		vfree(selection);
 		return -EFAULT;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index a0fbc660ab99..473b09d4efaa 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -103,9 +103,9 @@ struct gpib_sad_ioctl {
 };
 
 // select a piece of hardware to attach by its sysfs device path
-typedef struct {
+struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
-} select_device_path_ioctl_t;
+};
 
 typedef short event_ioctl_t;
 typedef int rsc_ioctl_t;
@@ -161,7 +161,7 @@ enum gpib_ioctl {
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
 	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
-	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, select_device_path_ioctl_t),
+	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
 	IBRSV2 = _IOW(GPIB_CODE, 45, request_service2_t)
 };
-- 
2.43.0

