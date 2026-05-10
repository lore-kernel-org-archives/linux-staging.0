Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693FF24E4B4
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435501; cv=none; b=Chtcsq84cH+G3dFpl13LtvPrLI2Hyq6gpoivMRzQ6LSLpNn4beQQa78rGvkEoQBp+MCCdXu6v1lRCgv2tdN7hSvUmDHa/lHHc1Zdd+kuSr1/OdsnjYf5RtqrQmM1Cxg2HgM9l8xFjutWtUA2jDXLoHxq88xXCBEVfE9NU0jTKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435501; c=relaxed/simple;
	bh=77mNz4MR7pxKusLC2YkTW/dqYJ1sBGCBitxLl8hlAx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9UB6X8Agr6b24NUGR7UfgJVelFsMBm0iqhlMohbAooTMCoYsDFkBwjUAG11BjTZZsOjilLVxMNNN9wSn7FRehqQoKmONWyBmjQwv5NCKwOzkARsaaiX3A40flA9eNWa3P5ONzWXY5swbKnijtw3qhNBiMMXUpbMldGexJ+hvGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVdu2P61; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVdu2P61"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82748257f5fso2643539b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435500; x=1779040300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNZx/9j3QuEHLooHgTcnnRSfoPOIzx6FaoULIxaC4Qo=;
        b=bVdu2P61rXt6ZxMYC9me8PO26vd+TMLJ0FppRQGV55C66snrMbjW0snMrbUbDc8dmA
         xLX/PLZrdF14vKxDK2G7gzcvsbRGlBIcJmgm9773goBtimFN1Rtq0gRIgJWNzS4cxu0q
         Uit+Ujsx62tWBxv2QW4+iex4VhAYFTiiQTGaD/7zK69Nnig3dDN4T7u8gsRzvnU9dHRL
         s0rp5Ic3lOGeR8OqLD742vGJp+65/qoIKB3zvRDukcgze47CQx9Xtka/VYZGvLpTkhB+
         xWJuntZV4Y4cbMgFK3pDFjGSqc/OdrOBuXyB1DjhJRGF009Rsl//rKshahzmMaQIlWJD
         Ql9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435500; x=1779040300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNZx/9j3QuEHLooHgTcnnRSfoPOIzx6FaoULIxaC4Qo=;
        b=j/oMu9x/tIkqg4fZ64uNB8QD/Z8olCbVIoDHibqzz3fRv4P3DGgBMx9HTwYx42lZo+
         gUezSgiAHeHMLzc/K9xuuXPcBRnYYMOp7I7BJBkXKGZwgxDwluh4dsFUc/rUHP6wyiFO
         +5TTjNjhRYgNkGF1xQmlbhZUy74ry8Wiin1iSYL1G9oztclCVv/v+UGxKgBTR+DosLYJ
         5wTx0v7q3rCu82Buw7uOksPeh4o9Sv10aR6Zf0GqRVFT4m6hd0+GqWYgQoopHkXRL0+h
         TlfJlvXfU/RQPoFgYOlyZbBvWoN0AjDalaVcc7vRYFIP9BPGqBkuLsnO3Yn12JEVEVDe
         gZsQ==
X-Gm-Message-State: AOJu0YwmObJ8ABtN7frDy9vrhBH99SIL/OKxuma3G0oVqqO+ZVjX8mcj
	vLUV9fxIv0JDocY51+m5VISmTPs3PcYGriLFSC5EH/5YRICMNNUIPvUa
X-Gm-Gg: Acq92OEqxItMHkwrRMjjzVy1WeT8tIAmqM/Yin9uCYuIcZmwgJER/2EBgjNXYfrFXZl
	N9ExxWhi/gAnhunOWW6fR8uM5xv7FrWl1OQsUGKxOodsfu5fn/h3RdmFDfZhIV7gxMljVgLOdj+
	Xfjthw0LhlnKl8RB7IgolFw+N93enH+lKYE+E4zQj4vHRdABFT76QbWYth4hRPIumn5OqXS2gF0
	E8X82Ed2nQp7EjleqrjO49m9NOXvw4AwZL3X5JkFPXOo3TXLx+BpYXRStMzffOQLp4YjB/8mgCE
	FN7ZQhvsHV/of3YFe/EXWE0j0Ffra+oEaZNVR6q3S8PlYrDaDNnHdZ+I3LIzIa4W8PBKhCJLiyK
	ximv3qJqqA9DTZB+HI/iqI4SHwNjNp3gk8eWeOmSus2hJvh7tk+l9Uwl7kaxkILACJy50iE2xmX
	qhCu26TeH3RmikM4/IEkiFlFnBRGpANaQ7qtjOqAJx
X-Received: by 2002:a05:6a20:2447:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3aa8c16e020mr13886608637.22.1778435499663;
        Sun, 10 May 2026 10:51:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm17964762b3a.59.2026.05.10.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:51:39 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: Remove extern from function prototypes in cmd_osdep.h
Date: Sun, 10 May 2026 13:51:03 -0400
Message-ID: <20260510175103.562518-3-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510175103.562518-1-pramod.nexgen@gmail.com>
References: <20260510175103.562518-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extern keyword is redundant on function declarations in header files.
Remove it from all prototypes in cmd_osdep.h and fix extra whitespace
in the struct parameter types while at it.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/cmd_osdep.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 41daa3c339a8..4e52e7240058 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -7,11 +7,11 @@
 #ifndef __CMD_OSDEP_H_
 #define __CMD_OSDEP_H_
 
-int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
+int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
-extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
+void _rtw_free_evt_priv(struct evt_priv *pevtpriv);
+void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
-extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
+struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue);
 
 #endif
-- 
2.52.0

