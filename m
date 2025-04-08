Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C0257438
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150858; cv=none; b=hJZV5oQYBKKK/d81U78EXb1iwQvSrxcPc7JrMpQc4eeTp4a9DOnPPIwA8Se1K1c/DN8jgZfqYUeqZcVhlA3KnRsuGgnG0MXfJi0wc8Y2ZXatWtXEDiip8jxvGVBX1H4yTg2KbbLCYKyUzw5uuAlaYGY84HhWADba5zX563dCwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150858; c=relaxed/simple;
	bh=9MoYSy+i6KAZhpILjMy1L1BRjlM996c5bRCz4EBRL14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTKJnsSAHrjEZWv8fO4b+76pfWj+4cN0UBOwWTQRCspY9OMkl0r+63XdnexX8BY8bZjzELzg9DV85OzyfMKb138VoU+dLxdRgxDz323J8LBUPOMXWAWHWxnkl02OxIfpT/X2PdYIlqtBJWnfdGAFsh140kv2il7pE7HYbxXpKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZygY4JIy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZygY4JIy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224019ad9edso79058555ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150856; x=1744755656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj7aeiZmrkJPreyeHTYcjpGxFgUS2pxAs3IkhIasNDc=;
        b=ZygY4JIy1P6W3CEBS/+FmmdW+Ed+3mpoAl3sQ7r5YFJNIzdX7d6y06NI1ZiBWxYvGh
         CtHNbfSSERfiyh0f5sZbtwHyKRQcpWYpFtE5Uac1+8RX++algOQe6DxuGupFd5kGrwr4
         GXZEhFKpOVkJWqCt3+vbtYET1Tw/yeTHWsshMRtHlqCPcrbkZfgPdSFsWDQwehLOYOGq
         wTRVEU8188sOTehk/eH4LZ2KyflW9Ovu4CnDQWBxbhQSDVDH5CUBsMLDP6jtzZSGBp/J
         XFSn/o2YCV8WjWuS1tHC/1crcvNkg+t/8SQLo5PZsv55/BsqFj+3QLzY/xVQT+d/lgzv
         gLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150856; x=1744755656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj7aeiZmrkJPreyeHTYcjpGxFgUS2pxAs3IkhIasNDc=;
        b=XoqN79NaAYV5eW0oBg5ZTkuZSmlutOV7d+IEsfjUyZaSzLQPKBrjDtzXTKHPdexhjX
         ViYEyW5PZKEPKNukgWSAFa6XAKnUbvQxGdIGBLbIfNxvOj+rYIyfSm5Rbf9onDmbrgAI
         Lm3SwrH++iYvPiezglTR4JAlHgXx2VZdqwwmsKxG/SeYCkwLNYu8ZL45dxoCjrzoSD0N
         nzikcGt9DuJtZWnh+W7+dOONgMdD4tw8UqsYvitpViakyUlicg/4S5U1DKPLceX+OZLy
         NyPVtNLgf1dX/hzQQKy9uuDY5k5pxNzlY6iqvTC+A/H76Q+BBHXGKmsA41VFB3WMexue
         fa1A==
X-Forwarded-Encrypted: i=1; AJvYcCVe0aTogk7/paxbZQExWVV/N/NZfmlI9rIkG9n7wZCgF5yQBZ5jny7m7+EMlKGSraNxE5HBG9R9vliQ2Kx0@lists.linux.dev
X-Gm-Message-State: AOJu0YzINUfr+ITzTaDNrme9kAR3JLV04PQIcPiu/uf5BZeapjjVn4pA
	Yj1pv+cRzFeB2id+X9fKP03u68nFoNEOLnQ7qI0e4I61grgZ/dXor5D1T/lkSQ==
X-Gm-Gg: ASbGncvL9z0a51zatW334exW5UznzhCmY7QKv7/nSLUvoPsU0y0nwwL1Z7z9rYmtvn1
	8E/bXo+FNS6wcb1wH2b2dXo906OAEOnW4O7uRgI4g3CzNc2/XU6wS9E4YYcE684+fcjqpHevvOr
	LiVjUTr1zN71shMlvwdUcBgwpfknutVkxCQZyZ5qyafMC2kGxbgzjOpTsDITlj+pJgE+eS7ObV+
	u1lUwZw4WjAcM32hTyslYO+TSNMfvOqNtfpkXVoE60eTYyPewf3NPOGjjYOi5J+0B0BPFGaDijq
	15ECY6QexyasJkmqOFFSXDMnPMmbL90TJ/LIjYq3qspLrnhAiGcbxT9Cd2R1ZFxpIodsF+JYWwA
	xgtbWlPQp+A==
X-Google-Smtp-Source: AGHT+IHJQsYnkDlPjG+SnVvIKi+ZRS5hRzX9ZAJr0r8knqb7BsSR2a7FOCMN8XF9PE0LXQx/O9k7+g==
X-Received: by 2002:a17:903:32cb:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22ac2a1df5cmr11766275ad.32.1744150856306;
        Tue, 08 Apr 2025 15:20:56 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787780b6sm106086545ad.258.2025.04.08.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:56 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/14] staging: gpib: uapi: Fix CamelCase and IBA Dup
Date: Tue,  8 Apr 2025 22:20:36 +0000
Message-ID: <20250408222040.186881-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolved duplicate entry for IbaSPollBit vs IbaSpollBit.
Correct CamelCase for IBA enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 65 +++++++++++++--------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index ff5a257f9a01..e02323508245 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -253,40 +253,39 @@ static inline int gpib_address_equal(unsigned int pad1, int sad1, unsigned int p
 }
 
 enum ibask_option {
-	IbaPAD = 0x1,
-	IbaSAD = 0x2,
-	IbaTMO = 0x3,
-	IbaEOT = 0x4,
-	IbaPPC = 0x5,	/* board only */
-	IbaREADDR = 0x6,	/* device only */
-	IbaAUTOPOLL = 0x7,	/* board only */
-	IbaCICPROT = 0x8,	/* board only */
-	IbaIRQ = 0x9,	/* board only */
-	IbaSC = 0xa,	/* board only */
-	IbaSRE = 0xb,	/* board only */
-	IbaEOSrd = 0xc,
-	IbaEOSwrt = 0xd,
-	IbaEOScmp = 0xe,
-	IbaEOSchar = 0xf,
-	IbaPP2 = 0x10,	/* board only */
-	IbaTIMING = 0x11,	/* board only */
-	IbaDMA = 0x12,	/* board only */
-	IbaReadAdjust = 0x13,
-	IbaWriteAdjust = 0x14,
-	IbaEventQueue = 0x15,	/* board only */
-	IbaSPollBit = 0x16,	/* board only */
-	IbaSpollBit = 0x16,	/* board only */
-	IbaSendLLO = 0x17,	/* board only */
-	IbaSPollTime = 0x18,	/* device only */
-	IbaPPollTime = 0x19,	/* board only */
-	IbaEndBitIsNormal = 0x1a,
-	IbaUnAddr = 0x1b,	/* device only */
-	IbaHSCableLength = 0x1f,	/* board only */
-	IbaIst = 0x20,	/* board only */
-	IbaRsv = 0x21,	/* board only */
-	IbaBNA = 0x200,	/* device only */
+	IBA_PAD = 0x1,
+	IBA_SAD = 0x2,
+	IBA_TMO = 0x3,
+	IBA_EOT = 0x4,
+	IBA_PPC = 0x5,	/* board only */
+	IBA_READ_DR = 0x6,	/* device only */
+	IBA_AUTOPOLL = 0x7,	/* board only */
+	IBA_CICPROT = 0x8,	/* board only */
+	IBA_IRQ = 0x9,	/* board only */
+	IBA_SC = 0xa,	/* board only */
+	IBA_SRE = 0xb,	/* board only */
+	IBA_EOS_RD = 0xc,
+	IBA_EOS_WRT = 0xd,
+	IBA_EOS_CMP = 0xe,
+	IBA_EOS_CHAR = 0xf,
+	IBA_PP2 = 0x10,	/* board only */
+	IBA_TIMING = 0x11,	/* board only */
+	IBA_DMA = 0x12,	/* board only */
+	IBA_READ_ADJUST = 0x13,
+	IBA_WRITE_ADJUST = 0x14,
+	IBA_EVENT_QUEUE = 0x15,	/* board only */
+	IBA_SPOLL_BIT = 0x16,	/* board only */
+	IBA_SEND_LLO = 0x17,	/* board only */
+	IBA_SPOLL_TIME = 0x18,	/* device only */
+	IBA_PPOLL_TIME = 0x19,	/* board only */
+	IBA_END_BIT_IS_NORMAL = 0x1a,
+	IBA_UN_ADDR = 0x1b,	/* device only */
+	IBA_HS_CABLE_LENGTH = 0x1f,	/* board only */
+	IBA_IST = 0x20,	/* board only */
+	IBA_RSV = 0x21,	/* board only */
+	IBA_BNA = 0x200,	/* device only */
 	/* linux-gpib extensions */
-	Iba7BitEOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
+	IBA_7BitEOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
 };
 
 enum ibconfig_option {
-- 
2.43.0

