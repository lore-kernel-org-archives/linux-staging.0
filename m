Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F247DD59
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 15:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772293221; cv=none; b=BoUSt55x8lNJXVynGPDYEPYn5O9AtP+eAaoISUJkIWHp8Iyp3O3miSKi65E/astnRhyfyvjzES95DP34tLjd6DkcyYpTK+G6rX0axkNz+kfiO7dgkvW3JZwSRoc4MdR2/LKqMJf2Nk2s7Ucu0Tj/TFgNbI814RsaK2yMmR//r+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772293221; c=relaxed/simple;
	bh=Ul0UJP7AxOwUN/zdemCuQkBISFvOKXjUJLAIxZBiTnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ML2REfgsky9JURc8fVAbH5NsI3S7UsPQv2zbMhCvhBkLMULYhszch0jKmnWRru1ApKxiFTgnXe2YS+FbEelD48JKeuO0BDjFG+7SyoiVGI2H4QpUmuAyexZMm4GHY8G6ICqCZQUfqJqwhfpvKfsUVioQE3CGtoitwpW7k4f1Iu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCxCr2a7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCxCr2a7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a9296b3926so23757975ad.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772293217; x=1772898017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ4aABDbVQybzDwFKK7AfhMdmU3BGBX5KXsLEGhf6tw=;
        b=JCxCr2a7KMDKKXCrwTr9HgEwW6oXH/43CUDlpFt2J0rAvtOh3sk3AXMmRzgfQ7siaa
         J0tOgukY4wqA49gb9e0ug39On9lyakpfF4RIyLSNgVwV0cWwYDFM0u0RzGIyhPXP+TFS
         jo65A8ksHbL564YB5nSXyPr8MDq7V6G5KeXTjj9qGg5ZIeW4jRce/F7BPVgoAIouDtGL
         7Nxk/m6L7LEuWKNho50eaKtb0MjLeMoBs3cjs90PuaNS7+H5Br7dX9IyZQjDvqmtpRpB
         MkGvngqHJRqunSjRXoZTz2DwpABCi9TbkLFMv97Cz+vh8z4nz8v2udAOyL1PRQhC8qZq
         K7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772293217; x=1772898017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ4aABDbVQybzDwFKK7AfhMdmU3BGBX5KXsLEGhf6tw=;
        b=MYZR0aD/c1/QVALvsNQFiyGKs+8XL7i+L7ylGDpn/wmDNs6uwzlYB/LJCeILpARxAf
         68j+2ozo3ba01YT0E8IAEjoR5O9fHSGGCfDa4SRv6m055v7KyjsKKQJ4EQn3g6rv94Oj
         QmcND0x+L+i32dQPY6uEatr+riid0JRrkixFUmOLMueP4oWyu2fApa+Z2r+QMl21fkGs
         +v1b11fYjV9M13BvxAHUZeJ75fSLdGcijExa5hWmz2Byhlz8nlmJHomHCHrDMZfDP+F+
         X0KR+Xba8rGkuamBHTSQ8neMJqzuURfTTj4CLAPeuuJMnOzM17K1Dk/O9IuJPqiQmM8v
         4LQA==
X-Gm-Message-State: AOJu0YwShK9YL7WVFaRrTjBV7aeZvgSPLTQq82MLRawvBAxc2xZAzVSm
	TKVRpL+UlcpCVUFh07U5b7oShaBMDCImuG4nkd7674mJ+rZMaR4ppc6nstrYceA0
X-Gm-Gg: ATEYQzzJnlr5dyWEA5FjTTT7gyFHPwUW0xRziq1EDHHU5lcBbYJ3wRQBkoA6Oa1ZNhC
	/Rml20GcRasH2/U/hQlP5o5vKX1/TnYYxfFApY7nJ8N7sbYDNnEkjrb96jRSlKYsbAPY20zO/fS
	t6XjUjX3/RzC6pyF55Ybec4JqXgIrsnFAtFl5u2rhRQyAwb0hckcWsAqmF7Ph5yqeulg5vPRe3F
	qMsu7vtwtSZOfC1LDF9dMvTu20eEvmN84xP67szDj55kNDwwkXbYaehlhvrjVFmgNXJFFVAZgJA
	2I/qopA12RYtKp7NuwpES48c0Tc/5vnbRiPw95d29evGNil+emGTWvGcCCnKe7MyU3U7i4i1Yx6
	M9Yf7kqPlKT+DPV/OwALfGlaKW4jtE+uN8AXEphXTRDu/Uu8HCyHBmgBu+DpYx7L+nje04NLflK
	PO10/GC6Xhl1PD3U7hCIh8xOEpXzjZbIXZYyNUSu94nIUdj6T1gz8ye8+yUJdWxsNE9QDg46vi
X-Received: by 2002:a17:903:1a43:b0:2a0:d05c:7de3 with SMTP id d9443c01a7336-2ae2e26a36bmr82317455ad.15.1772293217366;
        Sat, 28 Feb 2026 07:40:17 -0800 (PST)
Received: from Albab.localdomain ([114.130.187.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34e6sm21554505ad.30.2026.02.28.07.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:40:16 -0800 (PST)
From: Albab Hasan <albabhasan276@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Albab Hasan <albabhasan276@gmail.com>
Subject: [PATCH] staging: vme_user: remove unimplemented #if 0 code blocks
Date: Sat, 28 Feb 2026 21:38:09 +0600
Message-ID: <20260228153809.15398-1-albabhasan276@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead code in #if 0 blocks from struct vme_master
and struct vme_slave. these were never implemented or
compiled in.

checkpatch.pl reports:

WARNING: Consider removing the code enclosed by this #if 0 and its #endif

No functional changes.

Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
---
 drivers/staging/vme_user/vme_user.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
index 19ecb05781cc..9e010974351d 100644
--- a/drivers/staging/vme_user/vme_user.h
+++ b/drivers/staging/vme_user/vme_user.h
@@ -14,11 +14,6 @@ struct vme_master {
 	__u32 aspace;		/* Address Space */
 	__u32 cycle;		/* Cycle properties */
 	__u32 dwidth;		/* Maximum Data Width */
-#if 0
-	char prefetchenable;		/* Prefetch Read Enable State */
-	int prefetchsize;		/* Prefetch Read Size (Cache Lines) */
-	char wrpostenable;		/* Write Post State */
-#endif
 } __packed;
 
 /*
@@ -35,11 +30,6 @@ struct vme_slave {
 	__u64 size;		/* Window Size */
 	__u32 aspace;		/* Address Space */
 	__u32 cycle;		/* Cycle properties */
-#if 0
-	char wrpostenable;		/* Write Post State */
-	char rmwlock;			/* Lock PCI during RMW Cycles */
-	char data64bitcapable;		/* non-VMEbus capable of 64-bit Data */
-#endif
 } __packed;
 
 struct vme_irq_id {
-- 
2.43.0

