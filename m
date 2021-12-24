Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294122C82
	for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 12:11:16 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id gj24so7570591pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 04:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLRsIPs2YlObaX94PJ2gtnsp2s66ALN3C2c1+XvIaAA=;
        b=LJDZsQ7rVTVbdZzMSvllJ2ILUIgHVKV2b9P1Y/Mu2j80ULnPrnUK3JeUbwPS/Bo8Cs
         wcoAoVpLTbdRDa0y4R/K6K30413Ox9cEJmzgkVfBNhdhVW6Xs9+Ho7VvfCqjEvFGD1i+
         3cXZuuW6AnPAABGURM3oUdSWb2M9M4qTEKsUNla7OSy5xF2IbfoRQdWDtAnx2OtZoqci
         SzWihexL6btxoBM+r9TpWYviAJoqW8VB7X8tWE43NmxlXBa9saD/z/+f3hfq4nG1umFS
         zZ396rYVT3LntD6rP0+fl6csSIoY9Rs4xDZpMIC/Hv+QW77NRj2+5xCI8sldGMB9YBjv
         fm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLRsIPs2YlObaX94PJ2gtnsp2s66ALN3C2c1+XvIaAA=;
        b=6636aftOaAA6g2wCQQuahdT+VxdRwTxnxoL4eToCbklWUuYvBiQYI9kb+qTV8i63PZ
         WDkSiwbnJqYN6IY5NcRKuul+96KoCLHvtJHDg+IO1r5WeTYl8/UrSwmwr9E/zanudHi9
         taUi0iw1keNMP2CPRXeJwjZXgafF+eHTWUOoVcHtUJuAcxm/klXLGAO9wpYCBi35PM/u
         s/CHubW58zK4r+P8E9WYEU6F6bZRadgQeBwf4GVwM6bGNMyQE/qxZosxsqLv3xmRIkj+
         b37jrop9Ev05WNNYwQ17FGRAOo8QuUHKCNeLe8B9dAzS5AU9h8YMnvye5VpdjIyh2D7l
         Dwwg==
X-Gm-Message-State: AOAM532bqyBX6uqoe1u+E+SwUXdxJsvjvc0hZRgZFdwRuctWtKTeZuKS
	fJ88vcezY1HC/F1xe6x7KdQ=
X-Google-Smtp-Source: ABdhPJwVKis/iBpumb86o3yaM2fzVdi4PSkxzjKNzY2lHBVVSiauCuKydNExi9UYyvL2yFd3o0OL1Q==
X-Received: by 2002:a17:902:8a84:b0:148:a2f7:9d8d with SMTP id p4-20020a1709028a8400b00148a2f79d8dmr6374310plo.172.1640347875602;
        Fri, 24 Dec 2021 04:11:15 -0800 (PST)
Received: from localhost.localdomain ([122.164.161.127])
        by smtp.googlemail.com with ESMTPSA id h17sm3729047pfv.217.2021.12.24.04.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 04:11:14 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: include variable declarations from Hal8188EPwrSeq.h
Date: Fri, 24 Dec 2021 17:40:43 +0530
Message-Id: <20211224121043.175650-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable declarations of rtl8188E_power_on_flow, rtl8188E_card_disable_flow
and rtl8188E_enter_lps_flow are present in Hal8188EPwrSeq.h.

A previous commit changed Hal8188EPwrSeq.c to include HalPwrSeqCmd.h
directly instead of Hal8188EPwrSeq.h, causing these sparse warnings:
- symbol 'rtl8188E_power_on_flow' was not declared. Should it be static?
- symbol 'rtl8188E_card_disable_flow' was not declared.Should it be static?
- symbol 'rtl8188E_enter_lps_flow' was not declared. Should it be static?

This patch reverts the include line to include the declarations.

Fixes: 4f458ec5f497 ("staging: r8188: move the steps into Hal8188EPwrSeq.c")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
index 566a1701302c..6505e1fcb070 100644
--- a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
+++ b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "../include/HalPwrSeqCmd.h"
+#include "../include/Hal8188EPwrSeq.h"
 #include "../include/rtl8188e_hal.h"
 
 struct wl_pwr_cfg rtl8188E_power_on_flow[] = {
-- 
2.34.1

