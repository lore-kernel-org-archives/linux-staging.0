Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CC3D4137
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954222; cv=none; b=qgjGJ4b7IOnEP42tKTDxDUwtQ7ILr7b1G1kFljUrwAD8tuBzr5RUEPrG4GS2EFgY3GBbMa5LGJNKzaGYLyZtATL6RJjq/MloEch8/mHkQcYzC85xD6mdWglKEtQCKc8rkN8budCL41SEIJZbBEMgoJkb/N9vdQj1UiX2m5/cpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954222; c=relaxed/simple;
	bh=b54ks5RNORzdzaeeeOGGQzaGcigoOryJQNXEuvkvRQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWzw98/C3UDLDRa8DN3DM7J9gVlz0gcJr+xiPovZ2AU/jVzjvMTq3EB+AaG4FNsupqsikpHVMp3IVSji80Eyw69z0J5NsjY9ShYsObtPHXE5Fa57agzr0QlbobiHMsL7C7Z+XuUjV20qswjgala9YJ6ZEhh9kU9C4TF2yuMe8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0nm8l9K; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0nm8l9K"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so11570121fa.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954219; x=1786559019; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/etY9O7l1mJNeqKFZj30VOo1bjana+xUrE/MK1RUdyE=;
        b=A0nm8l9KIsWbRUhGJSjrE183P2gQtUOF+A++a6JkSBocvQFqTDV6LJRwoz6JOWYGu0
         ZBf15BEVczjiUnW2ENbrIP9hBlL+jAgOS5JAsaiqxJ+2+aHp3aN8CJ6ss2skyQdhDyNO
         MeQsndo93MFxhHaNc4EntE//Vlfjyak/Z0iQ4aZAca/f3NK3N6383BiMtZEPHVooS7VF
         Sfix4Eo6x2RqSP7mv4/tsIfeyT/e1iYw2f6DkIo13DOJjz1UOsLywdCz4hC67XXD9LwX
         XCsiCKemaaM76mVhlKTmk6QCMyATEUc2/voGf+ah0SzzpIgql11sC9U3IBt/RjI+Ccah
         a2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954219; x=1786559019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/etY9O7l1mJNeqKFZj30VOo1bjana+xUrE/MK1RUdyE=;
        b=YcWcgtsRruY3NXmyHL0Nm5JTSraEz9crgH7kQ+GpuPgyKIjmak7Lw+ChgAcQZJpRNB
         xZzvqFZwyvboJcbNInyMTob4BFB8Byiah18xnJ4SGL6SXxRN4gwfy0/kSsSz3eUDl4ZI
         7ZKZS8HMVzlemoPgShGkeoCTuhsLqOGzcOzY/Oj73TFx2p8hDAObKjk/xYKT4E0VNTXn
         YftR4n7T2hVpZVqF8yJDr/kZJgpEihgaHdl6ZrEbEqLI2E61YE6LHycRI1UB1l0lB6G+
         KCYHL/Nn0n5Kx1CH1921p/6kD8qPBeDqqlGpcdo9zycJr+vZF4ewWWUzy30BYvARYWvl
         olbg==
X-Forwarded-Encrypted: i=1; AHgh+RoqQ2VI0/Ek2qFxTRulF3sDr7NsP1BZesnNExTIlHqEzxdmxjM8WmLad/UyqkxGMJDfDlE+/GJvRc6Yl8Yq@lists.linux.dev
X-Gm-Message-State: AOJu0YxNfeQML8xbeksNjPWh0rszLbiNss/TT0IMeT1Yc+OtAwZG3BaJ
	wTlKwhP3YQBcR2nr5UypvZaY4WPfB90V8oKBa3vhIfGaEysgQSx/VriMd8YVGg==
X-Gm-Gg: AR+sD10qB5ExR1Ao9WxfttK2LPes9mqtwk2h07vxZJi8jIKOTOSFYdqAPeiZ7EWQXAG
	PBexL0LDhLg64wpiG4i6OR2Ke2AnACgpB9o+bIxJzAMrMRySvUpn5r587j4vxchzwAOJuCAyLF3
	hSeH9NHKTdOfZ6oi9wTxjFKtttON+XKmv0l5GgbLnn1KbjTsfdxiElxWbxvnuw4qn4s1X12ikLc
	b8IbBnqAIEyWRX6VkvV9E6pxIZU/3QUxcuX8w/7iXpn6GQtFmPPEYTPcoBF6BO3OqECkAEzREpX
	/9wFUZxt7ckgTrovsF1qo0Q85mbT2cWu3HM00SSdTRsF55ol2PGuyz5UZlzoH+ZT2XEMXfeP9U1
	8RxQ9k84WuaPSWc16wTNyEtE3OMzK8/nOxziD/mKg/YWur+mXhd9oSU+35fwCRf4WtuMGQF1I6r
	fjTRHHLl4zPoSWHD6ZuY6SJHUrnbvja1WZiD8dznWErro4uyjAjyqAZSP6Aehe5S31AtKQqw==
X-Received: by 2002:a05:651c:1993:b0:39b:2757:c1d3 with SMTP id 38308e7fff4ca-39fbae29cffmr10788271fa.9.1785954218658;
        Wed, 05 Aug 2026 11:23:38 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a32bb7sm11954811fa.29.2026.08.05.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:23:38 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Wed, 05 Aug 2026 21:23:08 +0300
Subject: [PATCH 4/4] staging: media: ipu7: remove unnecessary "#pragma
 pack()" directives
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ipu7_abi-v1-4-46d420cef267@gmail.com>
References: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
In-Reply-To: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785954209; l=2463;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=b54ks5RNORzdzaeeeOGGQzaGcigoOryJQNXEuvkvRQ8=;
 b=4eo1I39brWWCs0IUeATVCS5ndG8QZkYOSCVi//iFbniZQwQWN+4W9556F5oQikt39mz3Gypcr
 YpXAbp0+zAUDYx7GmRBr7/Lp1blbWYuBtoGv/jTFXb5folTRXWsXue9
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

After the removeal of unused structures, these directives have no effect
and can be removed.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h |  6 ------
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h    | 20 --------------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
index b85dcc519a31..40c7843ad7a7 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
@@ -29,9 +29,6 @@ struct ia_gofo_msg_version_list {
 
 #pragma pack(pop)
 
-#pragma pack(push, 1)
-#pragma pack(pop)
-
 #define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
 #define IA_GOFO_MSG_ERR_OK			(0U)
 #define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
@@ -49,14 +46,11 @@ struct ia_gofo_msg_err {
 #define IA_GOFO_MSG_ERR_GROUP_RESERVED	IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED
 #define IA_GOFO_MSG_ERR_GROUP_GENERAL		1
 
-#pragma pack(push, 1)
 #define IA_GOFO_MSG_TYPE_RESERVED	0
 #define IA_GOFO_MSG_TYPE_INDIRECT	1
 #define IA_GOFO_MSG_TYPE_LOG		2
 #define IA_GOFO_MSG_TYPE_GENERAL_ERR	3
 
-#pragma pack(pop)
-
 #pragma pack(push, 1)
 enum ia_gofo_msg_link_streaming_mode {
 	IA_GOFO_MSG_LINK_STREAMING_MODE_SOFF = 0,
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
index b2e6bd9159f2..01f4ce857238 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
@@ -8,8 +8,6 @@
 
 #include "ipu7_fw_common_abi.h"
 
-#pragma pack(push, 1)
-
 #define IPU_MSG_NODE_MAX_DEVICES	(128U)
 #define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8U))
 
@@ -21,28 +19,10 @@ typedef u32 ipu7_msg_deb_t[DEB_NUM_UINT32];
 
 typedef u32 ipu7_msg_rbm_t[RBM_NUM_UINT32];
 
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-
 #define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
 #define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
 #define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
 
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-#pragma pack(pop)
 
 #define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60U)
 #define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2U)

-- 
2.55.0

