Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5671
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso1117524wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/iuAYCkylVx5j5jv0oESLumvsivAdphbpwMNPrf8hZU=;
        b=OaPkt1MqxSjiKYy/HHqOt9fdtD5l8W4OgiagNm4R5zaHS+zYLksrTiF/IXNPJ1R1UU
         C9rTY01xlc1hZiUr7r7BEaCQJScnWOD4v/NirW5t5etBFOb5Tgka/XmCkh/94PORoTpe
         2zIh/UAfbw5BvbRcxwIalJSV99Ci5gUbj/zaVpjhaFT3qp/32YpwA8ntvNPrAgrkQwWO
         LijpYdXq+vlh3L7rtdXDMpjToxLhs76UR3xoKKB8iQ3WJEJJod2SHM6Jmbk2U7AOJgR7
         URDbgQIU467pal8LVkla4l6mDnNznEu7XweGhNwhCjGyVsn91PLfKkuSPnXvCI6lED62
         a74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/iuAYCkylVx5j5jv0oESLumvsivAdphbpwMNPrf8hZU=;
        b=K5GzOtx87xKWXB1gaMSmAhVjMqoqkmHOGp82PIabpTJcD+2HM+YVIFu3IEiICypddG
         Ae1nL/2Q+QlkskaIB0WUt4C0uN89A1ebhxLNeEyoS0yrhU/uYQalVhdGrBA6+L6hug4A
         vA3/XZMe4HkJgCACiAx4r0Yxz2WA9JKw33FLLr+5eiMV3b+5v5Mcd4btNhHBZsW7vbUZ
         vgtt/sXZ5zhugLvm1gKV5AjZT9asZdjTZu5klVXkD8hx9p2sowYdqZxZVsx1faQAi8X6
         8do4+CbrcrHu2NAyTFU+iwZlQc/ppsWFCE4GBP/Y0NJppEM01uGqPvb0DOeuXL1ioUI5
         ZfEQ==
X-Gm-Message-State: AOAM531DJTJ1V19ijAYu2mSaFHf4VFWKRvGsVU1VtogB+9znDvKBzb3d
	B8GzsdCK/dAfWpLFjT8C4zM=
X-Google-Smtp-Source: ABdhPJx0OcpH7wpD2EEbzpStDIqo2it0feT5wC2nVaKvcHRMMqQpD+Z2/uMafgLrnz+grcjgRa4oIw==
X-Received: by 2002:a05:600c:364c:: with SMTP id y12mr2807043wmq.96.1616589915442;
        Wed, 24 Mar 2021 05:45:15 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:15 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 31/33] Staging: rtl8723bs: remove named enums in HalPhyRf.h
Date: Wed, 24 Mar 2021 13:44:54 +0100
Message-Id: <20210324124456.25221-32-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
hal/HalPhyRf.h:

	enum spur_cal_method

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.h b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
index d7eda508d04d..fdbdd68edf2a 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
@@ -8,11 +8,6 @@
  #ifndef __HAL_PHY_RF_H__
  #define __HAL_PHY_RF_H__
 
-enum spur_cal_method {
-	PLL_RESET,
-	AFE_PHASE_SEL
-};
-
 enum pwrtrack_method {
 	BBSWING,
 	TXAGC,
-- 
2.30.2

