Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506A22A4E9
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426330; cv=none; b=ODyi3Lda+TtCtQz8+l15U5FDflneZL8iN+PLpl0U+hSqUTOdqL1G/q/ezMfWIKDEkaq6yKT7ep8i78kuqN4WEHXTJ3emo5tbGMpMem6fKjLpJnycPm/09o53F8YEByShFfMqEFFGRMrBYTY4ZSFFOCUtrD5xOoD6w5jHGCQBMH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426330; c=relaxed/simple;
	bh=CtCZORd3mrbyaV7ScJyVA3DR3QXlc/UDiqMJ1NPhM4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E5PWplRvJY10vUsuVv3eXpQNWZf493v8FSBEhzZqEyr/qbY3j9yJs/rIMG00rFh0myozErWFpG3XNL5P8WEPNDct7FZipHEDV0VMJrMoMJrF3HIpBdNrJZxCH1wOG70ou4p8J6bB5hdJRZukrkWieHl5tmINxFAZ6XondV49eQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMne85QA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMne85QA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-834f1075805so2452195b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778426328; x=1779031128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6y7EITUsQWQqCQCKscWCFa+8q9sIbL+gUF5HsV30UKo=;
        b=rMne85QAeBNCHEgRvQpwAUj33e//6iAvBDmo88KzIaajiGmMWBMYOXLSDmfx3HFRmp
         u3kpDdFOvVPFiEO3i1pbgahPY5IfE0nTatYmCmTJ5kaI4rsjDxZGnMUWi2VLnz9Cq9F0
         YNNUKvWOLit6/WRlGwMsOKqEgixDDZtTC8lYPL01cR0a8IwsJJFTN0LUOak3XLAHNf4j
         hSuSaGbh/6KjHabLBieGIZucUnl07Khw/GXyvr5fP2ekMOrt9dgm4dhGjrjAEQjR4wgc
         2ZVBRiB1bzEVIkMl4YDfTloRZLVlB6Oid5qmN0P8lr+G1NMx1gI+hHMmq5XjIuWsJLv4
         woBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778426328; x=1779031128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y7EITUsQWQqCQCKscWCFa+8q9sIbL+gUF5HsV30UKo=;
        b=K9C+60i1jrjxPwAqfPmJ9pSNIj7rNEWxxE4ujrW6opv6BIga7ct67w9cb1s2YOaBi2
         mOxfWQPw1FH6WgB0vBwMG3DjR5KOBoAGEu7L5RWy3kUbFdlVtyofuFdxCXghCZNHWMh9
         FV+GI0UGL38MkumFAV6L1zsmc6lkPBjfGzjg9X+UlacKP3Wn0Jyy0NUs/hmZw2K4jqX6
         mVgLNAE0AUVO5wzmG3iE2hnOhaXtQnjg42bETsZTfPjLovHvyR/z/FM7f3sqt1AUuaQp
         9HF6d82RoM56i6u85RAWqaetOJmqlMuPq6SCjOHOnsF+3c7w9iBZLfu+eCcatykXsw+C
         OPHQ==
X-Gm-Message-State: AOJu0Yxep6GByMm5ZHCdMcp+XhJnUsES3m9eZatXZP7u6j7qs+dRpyzU
	zA2P0SKTdOkxj6Ug3GMnv0Y14iVAy9Ghs3HxKGapV0lvOFmoHPRtwPXk
X-Gm-Gg: Acq92OEwvCFyIoOv3IyC4TSsI1jE1cvpz4YbQ6aEl4WXyPImiRPTmijg7Y20w4fHj8G
	lKetRFxl4hYpaPmLbUCvw0C/hNRr4VLq/zxzUEfxFkjloNBatGv8idREs34JpOmdxKR/21sVwS5
	4i1sXBSGyZ998oA18RXH00TYPXj8nBfEZoT22lhyBWGfSXJcw2RtJqR+osZZ259lE/8QXJ9bS6R
	TQ9CuSHsqXlpniD/UbbzDPyf8QlOJpswYE94Cuu13eAHf+kpUg1FyxmznlMz0UQ2H4XDvOqfySu
	rMFAI6mj31ItjaFz38myw5n6UuMl2uzD0oXvBqaIiGH0frLKcyan7SP/GgYXQvh71J1bxEeuGDJ
	aTnfKipQyji4PoHzCze4yUPc7uvA2lvd0gHNitxtK+uHD/0HZFrI/QScOfflakcz+wQbaMc1Q9t
	dSIqfZskgdBj1hUwRmwEKutiAs85AQodik4bDga+qiJCeOPqqUCZU=
X-Received: by 2002:a05:6a00:198f:b0:838:1ece:9716 with SMTP id d2e1a72fcca58-83a5c5bd45cmr20642422b3a.22.1778426328079;
        Sun, 10 May 2026 08:18:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f049sm20241129b3a.7.2026.05.10.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:18:47 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pramod.nexgen@gmail.com
Subject: [PATCH 1/2] staging: rtl8723bs: Remove multiple blank lines in rtw_qos.h
Date: Sun, 10 May 2026 11:17:20 -0400
Message-ID: <20260510151735.520685-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra blank lines that violate coding style.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_qos.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_qos.h b/drivers/staging/rtl8723bs/include/rtw_qos.h
index 1f28837f6c27..733bfacef0b9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_qos.h
+++ b/drivers/staging/rtl8723bs/include/rtw_qos.h
@@ -5,15 +5,11 @@
  *
  ******************************************************************************/
 
-
 #ifndef _RTW_QOS_H_
 #define _RTW_QOS_H_
 
-
-
 struct	qos_priv {
 	unsigned int	  qos_option;	/* bit mask option: u-apsd, s-apsd, ts, block ack... */
 };
 
-
 #endif	/* _RTL871X_QOS_H_ */
-- 
2.52.0

