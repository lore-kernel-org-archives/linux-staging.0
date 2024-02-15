Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696213A868
	for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708026221; cv=none; b=dM4VA5oITjQhuUA3wTqEggfJeG5N1QhQIIbZpJdmyWXPL1pe9vDTJU5DDRNQgl6sD9soCyYr25BXs3DaJXKOpmqFOHyQT/LtjtBnaD8OZcbx5Wwn+/7JQxryieLuiZXJhvEDO4Nl9E9cV2wYPJws5XYpiatsQCu0jQwSqgjtAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708026221; c=relaxed/simple;
	bh=HDDFchT229HxwZ+4S2Oyhh6QwaUnpPOF1xD3S5Yhof8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XVvhXHBptJQJkuxjQecdWv2NKJJ8WE2vg4HCFRpLNxFPaRJzm6VFxN68n3Lr2OWmDOLU1+t5fhhWzp+1CXafWUTrt8EREiMQaraer/46VqxcMCf412E13QEnlu7Ym9kUgwtTm0jR5QCkiLZUPF71PdodQKdPMiKlzmRD4K2R5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5TG94PD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5TG94PD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33cddf4b4b5so923929f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708026218; x=1708631018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7D3Hve9+ECAggWL+Tt6SbntilYeA7K9pgcMz0v6dHa4=;
        b=J5TG94PDGO4DMLXR9hj6I3eH90uf1Q4bTyDW7L5G5SEHh6KtodwuvKMexOxlTWDg6S
         IC47XOOb00bG9tA8f6RbqhTlQlbqG2NHYo0iEOXNq/Qo5fLLoMbDxe4MHVIB3nb9svJL
         ZmbPURsUE3XEZNDVm4wMfjOp6D6EB9BGc4NSOvmqHFqsNy5PGbcciDsCDfvkSGObdXae
         mG35Nz7uu+E6SQrdk4J3Iyh1/ujfx3Kz2+lKpSZi3pH7x6boUAjgrbtxf1r3u0139RCC
         ierFwcBvW3jRfb1USqldG/EDWWsnbo56xlYXVapG7eHjozcSbaG8oG5AqP7/w0WIeF12
         OaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708026218; x=1708631018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D3Hve9+ECAggWL+Tt6SbntilYeA7K9pgcMz0v6dHa4=;
        b=HdnUf7yOwovavF/POs3q+mnH/KrOFH+gJVdlkpaWFJ0L1jB6lp+w0Y42qTVzTP70MM
         okvwpvDuPS9gmAIB1U2Ab4ZCIK0OPt4MucqooDRi/ywX9/IwSObAHMQFJWHcy+8Lzl2F
         P5FgjpHeiXb4aCQBJA8PkGqFxgzSPA5rWPmfIaJir5wVF3HGpybaX5FPl3ecYKLlyfaf
         bkxMQJuSuMui7yIt0Mqz+Jh/155e/YPURiaXoxOVNrTQ6IXkWvLqIRoK/FkerY5UV3gH
         AkOxexzCb1xp+9KdgSNhwkKZ36CvKj2U7vJ3mnBfGzEYfnkI7Y69Ems2mzSwjwwl4cbV
         fVGg==
X-Gm-Message-State: AOJu0Yzb0qLIYk7Lsl3fkDq5f/8MtY4YiKU60NJ6uv4NdfjeaOS8ZMNR
	3S8s8nA6b4vo1BZBMD/W8zP9KSshvyO6SK6nwTIv8IhsqX5SAqsj
X-Google-Smtp-Source: AGHT+IE4y+314+eegQYovl6v69vxT7kokVg98vDhwNONtKWxXDw7xVMWeBJpuZ/HTGCVKOJ71i2H4Q==
X-Received: by 2002:a05:6000:2cc:b0:33d:1665:b2b0 with SMTP id o12-20020a05600002cc00b0033d1665b2b0mr463406wry.53.1708026218325;
        Thu, 15 Feb 2024 11:43:38 -0800 (PST)
Received: from aaron-macbookpro.. (host-92-14-37-217.as13285.net. [92.14.37.217])
        by smtp.gmail.com with ESMTPSA id bu23-20020a056000079700b0033b7d9c14desm85706wrb.5.2024.02.15.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 11:43:37 -0800 (PST)
From: Aaron Parfitt <aaronparfitt123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	philipp.g.hortmann@gmail.com,
	Aaron Parfitt <aaronparfitt123@gmail.com>
Subject: [PATCH v2] Staging: rtl8192e: rtl819x_HTProc: Removed braces from single statement block in ht_on_assoc_rsp
Date: Thu, 15 Feb 2024 19:40:47 +0000
Message-ID: <20240215194045.37205-3-aaronparfitt123@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single statement blocks in the rtl8192e staging
driver to clear checkpatch.pl warnings, improving code readability
and adhering to coding style guidelines.

Changelog since v1:
- Updated the subject line to make it more unique and descriptive.
- Refined the patch description for clarity and conciseness.
- Incorporated feedback from Philipp to improve code style compliance.

Signed-off-by: Aaron Parfitt <aaronparfitt123@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6d0912f90198..49b882c363bf 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -480,9 +480,9 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	}
 
 	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
-	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
+	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K)
 		ht_info->current_ampdu_enable = false;
-	}
+
 	ht_info->cur_rx_reorder_enable = 1;
 
 	if (pPeerHTCap->MCS[0] == 0)
-- 
2.43.0

