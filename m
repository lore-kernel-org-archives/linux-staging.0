Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED0C44683B
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458268; cv=none; b=ZfsxCKXJ5GT7AmyV5yFMDIy28ATt5VQU6E7NrSMZFUmf8Tz/+CWq0W9hQKc/ujsJTzxT6XuNiWXlysObMQ7XpEMNxOLzANhFscPNrTXek14vAN0CsIyUAkN4c6cFqj7/F9r1g8KNUt6WZrQJeL8TSo94g8OrIdxrvS+J3UoOYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458268; c=relaxed/simple;
	bh=TKQPNOwMALcbn3eChds5G9qCfMCLq6ap/qcKZA3cJaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1FmV8eHBUnyMPjeSZaFUJUSf38lprRJvZSBPpKLD6PHDfgQxsRNdx4qbY+wvEVQn7xpDURqxqLsAhAfFocnl746bQE0uZ9ufiMj0Ruk+QgvEbqXSUIwjWLjxSFEcOl4M1+GnNE0SwycqfT1nrfx/E99s7FB2exhLsW6+djJzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJKnro+v; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJKnro+v"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d049069377so27696045ad.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458266; x=1787063066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qB7HSFU4xetEvBKhpyBTF66SHKgn7Vz7/oDFEG5U+U=;
        b=mJKnro+v8PN1yZPNZlAzou5uZnpFlaR+sgvFAb9hhYeYlYyuqkbYmmyg++CwJ8AkTM
         65RsyMsrAIlMJ7ysWoyxvmPZgCbJwFXGu9kAhf5j1b6FVksBGGukZWdHzUU0681GA7HK
         RUtH5KplVWy7NIHmdF7fuQJYLphawKRrbZrTmfyoihv1Yd9BGgDe538aWRl9fvRMxtty
         TuVEPG1jxDlZlgXb/AOGkqg80DvPlhrMCGHPN8sCgHFf6UkICHTDVsk6LE2eBFVtNwAm
         xUDZJLGmsAcpjv0fuDtDfoEVLzU1pxMvCv76+0oBD4+mfmdM/FFgxDa77IZhlW4s7XJU
         yT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458266; x=1787063066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qB7HSFU4xetEvBKhpyBTF66SHKgn7Vz7/oDFEG5U+U=;
        b=Jm7KVjXd2RklHw8tIdd5LwMlX3eELedO3TSK2xu6Gdr//TNEdt1BNfFm7Y9A9h5ovb
         6M+tJ/fCdgRjy8jbA2LmWgxV8n4Qu5p2vDi8HlUhxbObDBAus4Eu46RVXW8kFMPmzlKo
         A0CiZaA4SGYwf6bBCNBAgeb6JbMUsnVct+KpAujp5iUiAR9WaaCO/Bg+WWRfSH6uXhmD
         oln8Bfd7dbprRc60ysNvDuHb1lNpptZyi+xR8YNyvDnqS+wwR/PmaCkK8eaH75L/PMy2
         zc7uqkKMbzMXrY1GXT7k5Bjtg0TeR6aYiTqPMkzTmhu6dWjlKx8ZLNSvSMeNM3+TqdWK
         9oyA==
X-Gm-Message-State: AOJu0YyONSJRUgxJlkhzcAtPzhITvu61zT5bH1tKVQBb8sRAfYeY8qoi
	APx69rYqCi6VpLpa0VXfXEAoLgQfPp1uLJjOXDLirOD/wqVVuxl3M63T
X-Gm-Gg: AR+sD11AB2BVC0c2qlYEYhiJZdyqwiuFMOwcPx1ThG6BPSXSOEq8qB1g2EqNLE4aGqw
	0BCpKRM3CPoqwHvbDeDwTqK23Gr/hT35y32GHX0lyJjH+GVeDG5AgeOcHycMEFPEc5AiPislh6L
	Op5qR0rQToT1rx0goTqHi5Y1SO959nqrWTdGb5jtlbhMKrt7QPeIKNtLtGTDSjEFC7Zq6NkIXN1
	CzClZm3lpgTcErKu7qxoAgTd3zdId7Z0N+83byUTej7a3oKqAGSyhGiEKDJ+IO0GvwsoepLzfpm
	/aOLd1sxswBmTkA6jWCp8YD77YtsbT138T6vuO0TrtKEQGWdMjio12HbyWgZhEq7zt6fye+Q68e
	UDV6r/+y7ox9YRzG6CknAUddoFxXrbdXmlUQm6Mtq6CP7uJVwoEzWmLvJjjTV4ImGPtfv63/HdB
	a0IzlGfq/qTdAkJgCi1sjjNtywRsKLSzdsiH46OewBFUvrBgUGcjl1Jm7cv6qvzla/27prrpncI
	Zr49gsR3l/4D3UjFKUFHNSwRsDRdtjJfn+tnG9iO2Y=
X-Received: by 2002:a17:903:2cd:b0:2ca:660:b1d with SMTP id d9443c01a7336-2d31788ea75mr45505915ad.11.1786458265659;
        Tue, 11 Aug 2026 07:24:25 -0700 (PDT)
Received: from DESKTOP-M1337NB.localdomain ([211.241.115.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0e37sm9531395ad.7.2026.08.11.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:24:25 -0700 (PDT)
From: Jonggeun Park <ndamin221@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonggeun Park <ndamin221@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix stale file name references in comments
Date: Tue, 11 Aug 2026 23:23:54 +0900
Message-ID: <20260811142355.60533-2-ndamin221@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811142355.60533-1-ndamin221@gmail.com>
References: <20260811142355.60533-1-ndamin221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct two comments whose referenced file names do not match the
files currently present in the driver:

  - include/rtl8723b_hal.h:  "rtl8723a_hal_init.c" -> "rtl8723b_hal_init.c"
  - hal/rtl8723b_rf6052.c:   "rtl8192c_rf6052.c"   -> "rtl8723b_rf6052.c"

No functional change.

Signed-off-by: Jonggeun Park <ndamin221@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c  | 2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index da4cb2827..6d8f70df0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -7,7 +7,7 @@
 /******************************************************************************
  *
  *
- * Module:	rtl8192c_rf6052.c	(Source C File)
+ * Module:	rtl8723b_rf6052.c	(Source C File)
  *
  * Note:	Provide RF 6052 series relative API.
  *
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index b6006110a..6b0fcb09d 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -185,7 +185,7 @@ enum { /* tag_Package_Definition */
 #define INCLUDE_MULTI_FUNC_GPS(_Adapter) \
 	(GET_HAL_DATA(_Adapter)->MultiFunc & RT_MULTI_FUNC_GPS)
 
-/*  rtl8723a_hal_init.c */
+/*  rtl8723b_hal_init.c */
 s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw);
 void rtl8723b_FirmwareSelfReset(struct adapter *padapter);
 void rtl8723b_InitializeFirmwareVars(struct adapter *padapter);
-- 
2.43.0

