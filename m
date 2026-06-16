Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569B9361DCB
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613351; cv=none; b=lE5Rjwc6ULJibjc8TzzfZfuhs+M+u5/lX+yxWhANncrovIEiN1HGa6nr60q0M9DzdO0GuoWHYSoUeUmFDIGhJlqm76+9hWSGG70cApBV9pPozeQHu9zyR9w39UoR37Xf0WHij9bl1sTuKwXLIfMnPjOofkVj9k1puRU3AZR6+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613351; c=relaxed/simple;
	bh=/mmH6npz4AxufBt7XC2xb6b0PYgx//uQNM2MxYf1Luo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SjYHRcXor9GJn/fJ3Ad4L6ttJeV4JTEgonC9fh4z1Y22cygpUQAjKWvZ7xOZyDrrJB3FUP831w9v0jQzM3XuoLHtvPdE5kW5wYa391sAqsMCSyGIohvfLbYeqlJfaEHUr3bwStcfy4kgGzbyUmACW4JQwrLDkJVMNLHURfMPHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKyIWXeR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKyIWXeR"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c35980fdso45676525ad.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781613350; x=1782218150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcaZaLpVNVoBd9KHF0IvuQGd/Ly3szz/z8XxvZ4OmWw=;
        b=GKyIWXeREcDzfM+LFDrU/rEdRhF9aZKgm/EOAjTyu1ntVyVvi6wnwmczfP5RYdZbXV
         5lfVT5Cl2SJ4OJRlWXXZKCEqbon6w/rjQLsqb0qsV90Uy4Cg3+4hdnkXJEJSFFbnrQwk
         z6Ncm7ofjX5foNkXh7LqEy9tvxGWud1LvjSAk8KblcG1xCFVfcg9/UaoryNuTD2sFGxe
         nO47i3n0RDYRasF0FfZDPYZS0BYjiu4J1MFADr+zbBYhuJQpqgfusRvd40En4JLlJlCF
         GZH4IKIEOrdVlanLcMOOkgwYdqSSQGpTaPCSxLNSLHDNlb55UZTYm5sGiQZ0QIBBPJqX
         t/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613350; x=1782218150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcaZaLpVNVoBd9KHF0IvuQGd/Ly3szz/z8XxvZ4OmWw=;
        b=TNgMfkR5tVPmmXZhlgIVoGhAq2KhDWqL1Dtj0yssn0lq80ERLW8+aBC1ZtUsFcqUjk
         RgwUTRXPIjkXAKZw7k0fSV3+YSkkyUUQo4eoEXw3wC02PIsTW5mLrLU1Tut0lErTuVIR
         cjKLaXhwq9gJ7SGrtYpwsCVQTenmV8S9I2pge56VyntbJYAE2F2zvX2ziLuMYYSXuJs7
         h3RAzhn+8ouUW605ysI2iYf4lKZ4pjUC8J+HWt1naEf8WLiWkbz2vzxEP4Gxu5RE88sA
         RrjiQj+thkrrjYYuDWHQ8SdvzEE42yympxuA/N0Jeq17PxQUH3cQtbXIathAfUnwrAOg
         +UYw==
X-Gm-Message-State: AOJu0YyCnOvgAPxvvJnNk8aQXQ4u5bw30kypV04vKGhKToMfRYQ9LieW
	dSzeFHwGT6BC83TZKEnjXxM39D3fBZbOgx5XP3j8Q7PtR4/UkYoNVddl
X-Gm-Gg: Acq92OFiu+hSLXiP4eiczYu2ZKDgBSmukl7qcLb2vuPoU5nPa29Z7n+COQlH4z/6Ny6
	UKF+pXQjPYscFpxZSxdJFxC7N8M2sfgCilXlzpVG/4rrvDqL8eYN99AMDr2hJNh2XeDBwcHOnX+
	VwKSoDofAAnfExuxo3G9+QSLB3AStKqXDjuerAChO/j5DG2K5WecHdE2C13o+lbyoErfLoauOH8
	RFvMnnekEW5Wx4YcFbdXRppxdftBINBdbU8WZUL9kuXl1cP2vjijNTd8xIQXxuiNGcCsL0MmdEP
	zQvMnpDxHMcUJmwmzugNm+jBvapzGHvu1Uacm2/9eu2W3MgsvgODXBBbXX0FgHpkcTtPNGtmzt2
	WPAPSpmO3Y25mGy7Ne+CVKGyePZiGrjPQ1GjlQZTg/bTGBONRkkFNqcOr9FlBgLIQTKf876RO0f
	LWiAHSmur0OIEHfJghlJSHwcVFn1EpKcmHvUE/8ydZFLNmAEa2hXP11B+L8IQX5A==
X-Received: by 2002:a17:903:2f44:b0:2be:bcae:f6b0 with SMTP id d9443c01a7336-2c69a17a8eamr37121035ad.22.1781613349654;
        Tue, 16 Jun 2026 05:35:49 -0700 (PDT)
Received: from localhost.localdomain ([103.87.58.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca9dsm130789505ad.50.2026.06.16.05.35.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 05:35:49 -0700 (PDT)
From: Devansh Soni <devanshsoni874@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Devansh Soni <devanshsoni874@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: use PTR_ALIGN() for rsp_buf
Date: Tue, 16 Jun 2026 18:05:28 +0530
Message-ID: <20260616123528.44278-1-devanshsoni874@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original code was using manual bitwise calculation for the
alignment of rsp_buf.

Replace this with the standard PTR_ALIGN() macro. The manual math
((SIZE_PTR)ptr & 3) always returns 0 and is completely unnecessary
because kzalloc() already returns 8-byte aligned memory.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
---
Changes in v3:
- Replaced manual bitwise math with PTR_ALIGN() macro based on feedback
  by Dan.
- Updated commit message to detail kzalloc() 8-byte alignment guarantees.

Changes in v2:
- Wrapped commit log text to resolve line length issue noted by Greg.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..38ce3156c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -184,7 +184,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
-- 
2.54.0
