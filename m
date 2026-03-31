Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F1421EE5
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972426; cv=none; b=JW5fupWfDQkYeLfvwCHIu3ldaRNyaO1a33DM+WHfULlF0/1//uR6mJX4t/dT/DYh25JADHKjZbF18vvT6Yxq3hFJAnaBjd3y5R8Sj5Zx5RvVYAXXnLMn+qXonhuzOk66J65ouNBUzguGdyXOI8Z3+kJHfO3UUKy+KdAL38ldk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972426; c=relaxed/simple;
	bh=tGQ7/q40CqluPE04r6aFPIkSaSLrkP4x+DP9oGO38n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ak5cZnHKk9bUn58c4PCOV8YUC2A5lCi1FG9HxWsmTzYbM7S+HJJP9o5WUr6FJyRwaNTaAxUCp1XRCBnNSq0TsNu2X0eydXU74g5s7JpV0a4j9m5GrAB+33P84SV3qHj1LgM/08uGfwludbMIr27x+4tvwHZz3s3b4SiQP1LQIwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/VxBtBe; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/VxBtBe"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso44793371fa.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972422; x=1775577222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMEsNZsgdpgGYNjDV13uW8YwD1Nf6Wm4WojdQWc01x8=;
        b=r/VxBtBe99SyMUIHmmzhwkc5jZbj7xpNndJy5VkXDEJQaJ5G+lNgRdnPR4tTxfxECS
         T2imq2xlB9Wb6ZwHKXJcRP4hkD0xpDrXef4QUoVDzTYp0RoB0G+6rl43qze5CNy5Sms8
         0t+/+S9bfXgC7KFXYxdvIJWk9m8APUEeGUdNksqkxvcqSRYXcEVIrIqMJNOzZhq81v39
         MzCg1jH1eZOIL0HTauQ1iPkJXkFJ4IS8xRw3AhgDz2hyOKh7xpAr1bPrkldXqGr9SXc1
         Qjmz3bg7HsxjWI6XOSBUuTQf/u8F6+n8B/EmA+Vqx4vwipcL9hUyd70Tst9SDkYMrmiW
         Cj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972422; x=1775577222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMEsNZsgdpgGYNjDV13uW8YwD1Nf6Wm4WojdQWc01x8=;
        b=mo9f3NVH/yF7HFkD7HmJ5koaX5i6tzoCRK27tcs5xdBnREZCiGCTOsSk1/Pkgaakv2
         bYths+FsrIWg2TGEyssSjG1Aota7PqOua7i1gStLWoJ/cEgjlxR78EuGZgfqEAnLzkMV
         bIg+yIbrLJN4pN8yu6+rQnxm+2IoYE+r6MaIg2GAkiMm2W2PxYoHzlEXBcafbPS+b3aL
         Hv4L7RNbhEIxlg5nBxbvHrvLGPsMUExYDGd4gMQdwS7dOfkoqSmnzyvpzrSYET70Jtt0
         W/TVMRKgRDckYNlzIrIiJSDbUKQWduLs4xD2azK1jPGl4vOBv0yBPZH4IjoNyryV/fbx
         ovsg==
X-Gm-Message-State: AOJu0YyeMilVKOMUrvF5usRy1PWWCIaQHoc0dIa2/ogSOAvjylelCK9E
	VDcdYyCH4YbGlAWKjD6bA91B/Zvg7SRh5hLX40DIohOgg702ugCErz333xIrqsuP
X-Gm-Gg: ATEYQzwrjmYJL8qvWGxT2xtBbksHYYgu7JH3OuqRFI4Zs2JO4EaBuyGYGgUmJTEfbRa
	SX6fVpf08ux9JZv1fejppgIbn5reFm5Z9+uNe1iv3zvOa8TbdkjDF81mVfxAePsDAxWyAV2ruz6
	RXll5nHrYHmXarfi9aU1s739Q71S90wtz+3o76vk2HUtmLxnC2UBx870eyyqpfJoTux05ZEQdTN
	2Lfq9oRq3ckMFfdE70uPD8RnHs9K89pBlMGtvBUQ/RIXYvvGJylOUJM65ggMBAoJRZB+kOAhy11
	oI11eg1a9tYyIlr6t85eHg4gs9Le+dsaWbLOIgTRYXsk14ULtSfisuT4MOo4IxEs+k2HMLcz612
	qZ8EE55h+u5MgEA9GjdQ4SHio7E+eIm5Cwc73l+PUm5RpzEJtFoaMsFJgLNcFF/Um7uW1xj7vh/
	Nc9bdq4zUSJltoGumXNr59knebwv/yCvGeGvCSDM9dTz9/qpg69H2J3E3sz9uqnQ==
X-Received: by 2002:a05:651c:4d3:b0:38b:e048:56d with SMTP id 38308e7fff4ca-38c72c47d29mr56791721fa.0.1774972421459;
        Tue, 31 Mar 2026 08:53:41 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8373096esm21984321fa.15.2026.03.31.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:41 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 6/7] staging: rtl8723bs: remove unused global functions
Date: Tue, 31 Mar 2026 17:53:17 +0200
Message-ID: <20260331155318.185117-7-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>
References: <20260331155318.185117-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes two unused functions Rtw_Hal_ReadMACAddrFromFile and
Rtw_Hal_readPGDataFromConfigFile from rtw_efuse.h.
The functions only existed in this header. No implementation or calls
were present in the code.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 1012831c7eb5..4e8980d86965 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -74,7 +74,5 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
 #endif
-- 
2.53.0

