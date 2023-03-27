Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3687495;
	Mon, 27 Mar 2023 19:49:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso32628wmo.1;
        Mon, 27 Mar 2023 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679946558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWKsykkKVuz2dhEzgsJk6LsgHkCtoaGRFeLVtPb88b4=;
        b=M9ozzLvSFwB0rFvoXKyJaaa4QUuyFwmExeqAdbrW5d/4GD8gy7KNsAgLxRlVMLR/4C
         fqiK6c5MW0kbcD1fnK1RsfkgDLfSh8hlycjyCREBzsTg6iIYZMJJ3uCR6qS6sMDJRMjG
         eWN0qMnpKQRZoa6chaxCXdrEQ+9hXcBaLxJ3iKEm1vCHb7zelhRifQFrB2sV4R/UCe45
         YLMlO7G1eCcJMtku+l9RvLu4XwV6BC5jS1bhCoEJEYm0ew3iVo3CbyxOGorcirWX/R1e
         o101smcEVU3jamQ4pQiiJO6OWZawW4nDMF7nzCAW0bHXDlOhP/eAPmBZF602GMfwPl7I
         Wuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679946558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWKsykkKVuz2dhEzgsJk6LsgHkCtoaGRFeLVtPb88b4=;
        b=CzfBNa9SXilB0hA1JrHKSzM0O9Hz22eQdU2de6NN3Qt8r0H8WClHSwjl6OMvnCow/n
         eFeBwIaU4QuGjWgiQZySJ9ie00uG7/ZIg+iM+lUIOZy6R0sO8MVe+Bp514J3FXuL6xCg
         qeQHPioFoJ6xmShr1LxflTeGCiAw+qRMLwLYmyKCuNBoV+yKHfYPp5AwKLYI0rZ5nlag
         GG/pz7P1XNoCoEt+zVanulQha6SMwsu7K0vo2HjqpfI1ZKOLtiqqUp5AwxyVvP0VgHOV
         LL6z6ongTaBGnygzN9HjP0slMBd2p6TvbrxrvuyaYLaPu4YNtEQ1KXkFDXVdMK7yg+mj
         zDOw==
X-Gm-Message-State: AO0yUKU1oiuQorEtlXiitqlNvWQTAM8AtjE1DZ9kdq1ByeoZwSZ0kbnR
	u6Zb458ofVWd8bjznsuLX/mHIA6ywyC4uY1x
X-Google-Smtp-Source: AK7set8Uxf+Nc7JF9L4fgS5+Z8Z3CoEKoIml9ofdpLE0kZzWgeKEu5QchrpmMMC+SqimZGpJBYaWNQ==
X-Received: by 2002:a1c:4c0d:0:b0:3eb:2e32:72c3 with SMTP id z13-20020a1c4c0d000000b003eb2e3272c3mr11137268wmf.22.1679946558133;
        Mon, 27 Mar 2023 12:49:18 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c13-20020a05600c0acd00b003ee42696acesm14661366wmr.16.2023.03.27.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:49:17 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] staging: rtl8192u: add '*' on subsequent lines in block comment
Date: Tue, 28 Mar 2023 00:49:08 +0500
Message-Id: <3a581aae65a152ce41fdd2db667574eba1783113.1679945728.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679945728.git.kamrankhadijadj@gmail.com>
References: <cover.1679945728.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernel coding style for block comments uses a column of '*' on the
left side.
Fix block comment by adding '*' on subsequent lines as reported by
checkatch.pl script.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index e5c0bece4bb4..dd9903719c20 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -1,13 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 /*++
-Copyright-c Realtek Semiconductor Corp. All rights reserved.
-
-Module Name:
-	r8192U_dm.c
-
-Abstract:
-	HW dynamic mechanism.
---*/
+ * Copyright-c Realtek Semiconductor Corp. All rights reserved.
+ *
+ * Module Name:
+ *	r8192U_dm.c
+ *
+ * Abstract:
+ *	HW dynamic mechanism.
+ *--
+ */
 #include "r8192U.h"
 #include "r8192U_dm.h"
 #include "r8192U_hw.h"
-- 
2.34.1

