Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745B3AE6FB
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969511; cv=none; b=MIX5Bqo3IPQNJqBYXPW8TjJ2AZMsW/wt3vm7zMFVgFGXcSJrH5AhBHEYwxCYZO2tDLKN3/9UcWSzNLtgCpFaRb/OQ8QdamGMO+eJJwHXAsbz3ibD8XUofLTrlTi5qayQP0HDNON3j9KPRnJat8HvTGLm/WzCk+34WCcvF0mrMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969511; c=relaxed/simple;
	bh=+SOrMVVHB5qOMDbPRIZTXf906cveuoXyVwOSqdhGY7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HNqFEE1sh6zTL3nATPsVuMq+cH2bIqNqxVlX72yHZwwkf1K0nQyppkUc1BRq+CEVYie6CTgTGSpGy2h7kEsR2CBUi8AJNxwcASCdezQXm2mP0S0DZA34SfodaD+q7DcJlkFQNC6TFWEtzmtmsQPE9p8giZyAWajAFSBsissc6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+NuFEWR; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+NuFEWR"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6102bac3752so4993697137.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776969509; x=1777574309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L22PrPyxffGp1s35EdIqfhlvwug5UudCDFqaIR/CCpM=;
        b=o+NuFEWR5E9/De2/g8ynTk3Jp4LprHWJcR+WjG/fYS6cgFMRLuy3FVMzfoB3iRtyiN
         tee2dXzIyD1GpeHGqnMFzZYfGUbgL/FdZQCo6NBJp/9nEkjyawJEq+V6c1TcMHAUjtWP
         YcKo8+qlFdDeRxZ5mYdd7RsFdAgC6O+Lzh3bZg6MvxIQIS0Y7azu/kwFr8YyZiT15Ea/
         +inmwtRoeRMS3cJSMs65OyM5gTven+ztGL+gnqs6v6UiE0ruSDJJBjO7IGyI0TcMnbFO
         Gs2J0L96or+xLpbkUtmtIaoxkksCY3k35Q3c+Ql4lmTN7Mq5/hykfIFBnuYbfjCQo3RM
         V/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969509; x=1777574309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L22PrPyxffGp1s35EdIqfhlvwug5UudCDFqaIR/CCpM=;
        b=iA3EnUb/68ON8apjKxvkXIDUVF6KkPllChCBNUw7TQau+1xka4rDOEgfxVYgZzrFva
         aGrzMbnoc5tcda84rVDM8hmzPxr/Vd2c3u2Y1PG4GYZ057ubOv86Qhi8ZnOlk5gVyiam
         rppTtuVjIHiK4ovArQ3PdNESp2Ht5ZuM8LGgD6YNJ3RchwD2H4tV2+gZ/CaT/Y1HYtDR
         Ww1HZ3ANVh4zv+5hB/+HpN3MQV+xIP0fldmhN+oxFYHKCvvBSdSBqS/2/OvvAdra38FI
         LrilSP6kh6q5VYHXYFXcoURQpy8Zv5XpRQ6caEcw9IOkjpdYrmx5A3XE+e12fAu3ph3G
         FxUw==
X-Gm-Message-State: AOJu0YzWozYn751y5U4M17w+aAlwgKhmRQoGTkQ2EGFD8dbARoX7HXLH
	m5xi0h54FCjtR4FxLmJtoScdXYqoEqsElYn8JDCUk/Gn3cp1cN1/XSomoeWHZtIiBtw=
X-Gm-Gg: AeBDietmeY3i3UrD3yEALA8V5VUN0SCWkmz8L9xaB/xC4+Me864CLumnQDj3tthXZ6D
	TbW4sFU+mp8r7d2jsUM4twCw9A1odmT5tk0dQiVJm3pLoIKPUNr7VAhSTjQwVG4cxYEDyb5VTPx
	f7WtTDLf8d7YtzgwsOhpz9zlpV6PGRLZJj4N57/oOFU8HwVj4+c6enuMWj4lnggk+4G6OCCOyP1
	y5LrWegqHq48jjpesUOeydxAr7CGoQ3f3QujY2hjfdN+PHLWYx8CbOB7L/SsNsroaw3vyhuNpdW
	2zPs6GxPusfzMTPRsy/VP6MeRs8QOMIQdPFCP2WMsvsIo1p1hBJudidmcXAeggcrdq0F/K/Jspa
	Bc560g1U4acooQKnFpWewJ8YefbTVgsxpYeb0WY5cSj5o7qZg3sNrCc4Jhj6Gr11vmfu/Fge4n8
	sWi37/BYAHavivNmgmNXTPzGfVisa11eE3BJTE7UANolg8eNbPT7niwetfQX5flKpz+d/I
X-Received: by 2002:a05:6102:b08:b0:610:1c78:9531 with SMTP id ada2fe7eead31-616f71fa1a9mr14232960137.24.1776969508715;
        Thu, 23 Apr 2026 11:38:28 -0700 (PDT)
Received: from localhost.localdomain (recod-gw.ic.unicamp.br. [143.106.7.151])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e51bsm10788224137.4.2026.04.23.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:38:28 -0700 (PDT)
From: Everton Colombo <e.rcolombo2@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Everton Colombo <e.rcolombo2@gmail.com>
Subject: [PATCH] media: atomisp: Remove unnecessary function return
Date: Thu, 23 Apr 2026 15:38:14 -0300
Message-Id: <20260423183814.84729-1-e.rcolombo2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adressed the following checkpath error:
WARNING: void function return statements are not generally useful.

Signed-off-by: Everton Colombo <e.rcolombo2@gmail.com>

---
Hey, this is my first patch! Any feedback would be appreciated!
---
 .../atomisp/pci/hive_isp_css_common/host/sp_private.h     | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
index c69778411f2f..b03ae6658df3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
@@ -21,7 +21,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_store(
 	assert(ID < N_SP_ID);
 	assert(SP_CTRL_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(SP_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_SP_C hrt_data sp_ctrl_load(
@@ -51,7 +50,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_setbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data | (1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
@@ -62,7 +60,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data & ~(1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store(
@@ -74,7 +71,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_load(
@@ -86,7 +82,6 @@ STORAGE_CLASS_SP_C void sp_dmem_load(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_load(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
@@ -98,7 +93,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint8(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
@@ -110,7 +104,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint16(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
@@ -122,7 +115,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint32(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C uint8_t sp_dmem_load_uint8(
-- 
2.34.1

