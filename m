Received: from mail-lr2-f0.google.com (mail-lr2-f0.google.com [74.125.230.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B142314A
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826003; cv=none; b=dg8v3MihSX6X5dUrqJZgPp2iRKd7Qh2r+rEcmbxS19ClCCqbJg62MXLztiFUmpXPg9T9Wa6gTyOoK8NdmClQqZ4Be0L8YAPlB8dXcOuVZhcQwKUMSpjdiY7rd47AAg6Oq/85gD3c3uT44JYzqkIinzt+XFD4Dcj3X95wyT+W2RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826003; c=relaxed/simple;
	bh=z8wxs+UliPE0bE9EvjH8ommNq4Q9+859qLoxJePls20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/uIS8NzGEOouTtHaBOeiwCzur7IQICdl5vDQ8MLPV6djA2sOTO5BaVH/oJsfZQLRz6GUJsRu/Lsy6QpY+E49mVvwQw5D9i5D3A+Jq9RaQC54JqUpBAz+iCAhvxIp57z3zVqx2/QkwixTMCQpBZ5AUeyHAn0XJ5sWicotFeAIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnTv56Db; arc=none smtp.client-ip=74.125.230.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnTv56Db"
Received: by mail-lr2-f0.google.com with SMTP id 38308e7fff4ca-39b1c6b6f69so5110821fa.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826000; x=1783430800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sCtbIud45S7nTe5FjLzz2DOhp5efRAJQqbB7c988YWQ=;
        b=GnTv56DbyX03xa3RNgGWWsW/mXrDuke880cy5lc+4jjyD/PSw/mEtnLVuT47SdrBDa
         NQk/l7e7mo3TPkz/Fl9d6iZ9EU4KSlAMrpNsz5gP8Z9oohYGh/vX66Y49J3+pyayYMHh
         L+nhnVfCdt2oBqRhq9m4e7JNUulU9qzG8v0faBVV6keHt2YWBV8dIAxdkBo27zimixQD
         B9clDTS+YuKdotSdx0pCDC5PQMxXo3F3N3nZV3S0ojs0igy4RTKShs68iPfabtz+2C9m
         yt9qP/GnHZ8pX9Fgy5BQy+zapTguMQF2WVu6gBH10b2qZUOZFOVihVupZLwNHNYutXVf
         m6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826000; x=1783430800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCtbIud45S7nTe5FjLzz2DOhp5efRAJQqbB7c988YWQ=;
        b=Z13Xq1BxuopWF+HcnT5aHKKxSeIDf+KHPgZf3Jhx56BngCSWOtzxfYKHDxqjVjKAlh
         RBAQQrBBdZ9jK2xPVcijW9lare5ygT0VNBIdV/y0qJrtwmJl9vAP4OKgssz29aAnpPkA
         SrKvOcERLqZ+rhvqXT1RTbu9W1o6eYDx83ID0D8BTlvOWXwESJVBrYTCMPEebhSjR+q3
         uDTdwsIU/tr3ssFJMWK7bFoG0i6TjVJJSmi56q1FPNmTrszek4cPchCZ7fAKWr5vPxJu
         5vmdn/CAbvfyuQT/mionRApZYc5Q5bRDR5A6jLdongyHJ22fY6OcbX08ELlvSKD4MPMp
         8Zlw==
X-Forwarded-Encrypted: i=1; AHgh+RoYlpkhHF97aQ7winjYfC/rwTOhmZPtTYCB6flhBKqIjnBOY4FlzIKemG/IKh3f2i5e7C+FC4den2WoeDvO@lists.linux.dev
X-Gm-Message-State: AOJu0YyPS+6MsIszTuLRPinSMZL2woM/PnhDfKWvoMVxmg7Ww15LFL4R
	ytJeT/p67kEKTKyRMrWKXhVBtjBlIWjGJkPp86wyvQDUqwNa/OYA7eiM
X-Gm-Gg: AfdE7cm0kohcHebyhlNybEXBFAudMmvoxBNQ8dmfxW6PQPG2e8PGLvC9boabbe2GxDm
	olmveJ8lvkmWEQLMENGM0rQw/yKWVr6MWZxchcs3qWXecEfdeRXdzJjrEO3WmGzIpsBar4S281k
	qNLGsAChkG8AqOuHHPD8fbFZw31qeHvH2Rc2yeOaoOIn2nAHZStKkRPIJQLCNsbjf7FlYhbSXut
	aNcg1Ei6PEEsx4kzHom9rHXVJS1pFL7+6wdLjE79dJg1UNfOp9JpTcal55P9BFxC8D9smcpVdbI
	kO7u1GbA++/FFLv7LKxR0YYsrn6A/SiylDta7sB76bq6dpp86IqP8S0PRDih6lPmUN29oKkVKPl
	722rjlUHDLyF77ouFrAf/TcOFaVs0ZKUrPm9l/Bls2Sz9FL8z+bHnkmZGQYZTXGoUxwiLVA==
X-Received: by 2002:a05:651c:2203:b0:39b:d0:e992 with SMTP id 38308e7fff4ca-39b1da26188mr8230171fa.4.1782826000423;
        Tue, 30 Jun 2026 06:26:40 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1d81c80fsm6120731fa.4.2026.06.30.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:26:39 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v2] media: atomisp: fix block comment formatting style
Date: Tue, 30 Jun 2026 16:26:31 +0300
Message-ID: <20260630132631.25762-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting warning reported by checkpatch.pl in atomisp_cmd.c to conform to the Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..20abc2c0de80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+						/*
+						 * If the grid info in the argument differs
+						 * from the current grid info, we tell the
+						 * caller to reset the grid size and try
+						 * again.
+						 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0

