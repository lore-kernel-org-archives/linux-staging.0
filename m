Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7735B124
	for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643230; cv=none; b=AD8vTTpqQx72RYS0IOk0HWSM4ZulhykDl4QyDCH32ESQpiyQjNgnHly4uqA2MqcwWJ/rToJiMPdFCjhK/2YWa+hJQIs1yWsykZGtnb8Q1I2HpbuRg80ErHEAiXHcG/WX4lJCY/kj65BTlPdnOUuImWcETUCUJcB37cQ27ikeUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643230; c=relaxed/simple;
	bh=T7vc8fBSsaCXuLEcScuPWNjcN2dPgBKZTUWWhxrAXDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kd5pjgl3tU15peIUMOrfJPWAPFj8n3SRp5Fa0wAsyPXjfcXMUgwAJ9I7rd93eC9BQQ01ZZWgR2QiVby8dwMokhImowFULYAQ5D4Nxj+Y7koxk+XVQa/RIrAq9vH9SHHSfZbKpUMlu9V33paWoE8wyK8rrajsw/m5aBOMScWcVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8eRtiR2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8eRtiR2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b4539dddd99so54634766b.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761643227; x=1762248027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+wFTnkf9dCxwSD/TcKQG7ubiRnRlCXjSJjeQaj9CrRc=;
        b=V8eRtiR2hs+pTm4Q2/MTJpEUybghlTJItq0d+zxRkHQoGVh83WObSL2/HM6ArW7TXp
         PpIw+J4wrm6/b4h5WFY7A/9dhR0PcY4P0IJrLXEwn/Ybr17Puev0sC078JaNQNmSOgIA
         x7PTgVTuODxTCPekFoE1t8cNN6TpoNbz7FbqdQdr6mQkoELNzIbAm/XlqRPml262EVb0
         ajI45mMoB3M0Yz+2pMumolQD6I7CCv3j4FSem5qodEAeE72fLVQy0XXyY8OYP/Pp2Q9t
         AhcX7fZtuX1IbZDMAXDgZ1aFHoITw8aL3ZSG+wMRddOL/td4G1Bi+97GbZHFfOWH2vel
         3t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643227; x=1762248027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wFTnkf9dCxwSD/TcKQG7ubiRnRlCXjSJjeQaj9CrRc=;
        b=O+G7+0xW26EucjpURuwpRymsXGwEaMI01xL7dDVWD4ovKvG2c7ZJutabDHDu0ymdvU
         +3reeq4BUaEh++q4f585ZSlwvrdNSwy28xMGRMFzmPoHduSmQ+T8i/2iKFMfA23VmSMH
         5Gtonbwl55cSLZIK06Kx9WXbuHXr4zLVOKlWcQdRzuBJPxwMp0PESoXXTPIpbSPZ5gFL
         n7152PEjLsnSF1c3F121AlJ8f2B8EO29nVD2Lg7MwYyUzEaJw0gat08h0fYt0KR6hW7p
         K+ZvIEHyZAS7AtqFLn940YuOLItvvIp9BcSTKaqgctW+hwzSEKbf1tPQdxg0RUYJQqxs
         4d4g==
X-Gm-Message-State: AOJu0YxUGSSZOMBUlL5yJ5NsIuJE+0xSwQPoyMwj1ipY+0d33TlEBwYq
	rqkg1xw+Bofq+qZLEsbNRShYy9yKdQ1H7tq3GJnk79Hg7yHy4OKh89vM0iWfUQ==
X-Gm-Gg: ASbGncsWUXqoOPsi9zyeggALj58up91T4072YeZO2RlVlAEIUv1mI3yO0qqsjdkrcEd
	TgWudnMJx5lcIoFX+3LqsBYxsEu87vz4szbCUYP2d0ndBKYKW1VQdVrN0YVSihYmZ9NqUTx4ymb
	tgOImXMYayx85fPJcqQHuB8Z8IyIUZ1jOB6eNRQbdS1JuU9A7iiNkRAKhLyqCQLVw7elUjIz7J5
	J7iXc+0fYCBg3FNBn3tm2+dambnjOuus04opsL1bkEa50ZB1F01SS2x1VtvXfBgoSo1oSuTu5zU
	lpwkvRUzAYzVU3Isf90vs4emrJ+Bs1lUUqIdjmK5BGECqdMjS/4mpfbd2Q+VIRvbHyPanmYXP9m
	D9xrHht7tm4W68XiKA5p2gaLTNSvCPXR636CYJ5dXfN2U6ZQvN8TEu5+FWtkZRcVms6yL8Dl17R
	TfwOqV2FpbLGpB0IGr/ft61WjOdTVa8yMg3gymxMflJ4++
X-Google-Smtp-Source: AGHT+IELdya6rFdcMswOde66VSf0DcPEemYkz+vUbYaP6gdO1+ID9o2Sz/k/USJl7Sh9QC4LO4blJg==
X-Received: by 2002:a17:907:3c89:b0:b04:32ff:5d3a with SMTP id a640c23a62f3a-b6dba1d92fbmr274034066b.0.1761643226903;
        Tue, 28 Oct 2025 02:20:26 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:f6aa:c117:a67d:9aaa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077bcsm1045222966b.13.2025.10.28.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:20:26 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Tue, 28 Oct 2025 10:20:22 +0100
Message-Id: <20251028092022.80186-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

The rtw_sprintf macro is defined in osdep_service.h but has no callers in
the driver. Remove the dead code.

Changes since v2:
- Addressed review feedback to delete the macro instead of replacing it

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..12369ee2ce1d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.34.1

