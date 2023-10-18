Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558BE1C05;
	Wed, 18 Oct 2023 04:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKa5DVTH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso3891623b3a.3;
        Tue, 17 Oct 2023 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697603808; x=1698208608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSddBUAe956x9GyHNcmiKlaDE7dW5RFLQMzOpH7UipA=;
        b=eKa5DVTHKExIT4RSCSy9fbxODYYMbglegXHnqyjhwdULAQpC3EfsnqQWb9KU/izaZi
         rq8VWtbOOHB2de7/Z3DyWWmv2mNuyLWkh4mfg/KBLhxPzETTDsZzwF2HUZao26ICdWZQ
         DQhpT4d/D9keO5UK7k2jEGM34EEwYrRrYMOLuOLWCHz8mEL/x5g9d5pXM28FPnuRmyEt
         qpNo6fPJ+LSf2Y881tcmdn33FwJwTq30hTSQl4FdPYHKB5XDzLSe5RRWjCzDu6+qTkel
         65dStp/3r+wutdwUomYSx/DYACJ7c2rheQ4FRJPWGI/RF4HeKk5TFY8svZDUgu+Gd0YL
         vs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697603808; x=1698208608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSddBUAe956x9GyHNcmiKlaDE7dW5RFLQMzOpH7UipA=;
        b=FzPR1A5r9n3PzoicsSzbkisywIOUaKXskHDRQvlLMdlENFIOfNUSNooSka6fzKxlCX
         jAXsb9UcZvj1lZnA9z6OgcJVnliEGxxroQy1MP7l0t5rWWXPw8sSaRK2rShQI89/Yx7r
         /QXFGtdGqRfIcbmcY/dQ3x0TGSWSP3D6aJPAakMaA5yYcn9Zk9iOYq7ENiS50I7xfbEy
         JSmbZ59jjIH6S3/A+uR2opbXvHUZb/5XcbLLLeYtap0s6BBAN099nYrFFBAwAxDa+gQU
         MLlnoTolxptIc/rF6ChWarYECWzfEvO+D03mbGBHTFozuzPS2zLe7DLctLBGL2hNn/5g
         YIZA==
X-Gm-Message-State: AOJu0YyKcnamSi2J1jjWad5SuAdZFQNw1qu8qSbHAC86926lnTNlJcQs
	r8IRWF1FK9+YVzomPWTVZO4=
X-Google-Smtp-Source: AGHT+IGCaQ0E9lrWBwLhwhSx+BpUyciw5QPK+upLQ3W33LPDXkewu/finbRuG18hTKEHJkZnWNI66w==
X-Received: by 2002:a05:6a20:7494:b0:161:2bed:6b3a with SMTP id p20-20020a056a20749400b001612bed6b3amr3987395pzd.17.1697603808486;
        Tue, 17 Oct 2023 21:36:48 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902788500b001ca222edc16sm2422852pll.135.2023.10.17.21.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 21:36:47 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 2/2] staging: vme_user: Use __func__ instead of function name
Date: Tue, 17 Oct 2023 21:36:33 -0700
Message-ID: <c553e5901f16b78681e74b2d77796f8fc102b602.1697601942.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697601942.git.soumya.negi97@gmail.com>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function names in message strings with __func__ to fix
all checkpatch warnings like:

    WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
             this function's name, in a string

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/vme_user/vme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index e8c2c1e77b7d..11c1df12b657 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -422,7 +422,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_get) {
-		dev_err(bridge->parent, "vme_slave_get not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -572,7 +572,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_set) {
-		dev_warn(bridge->parent, "vme_master_set not supported\n");
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1565,7 +1565,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_set) {
-		dev_err(bridge->parent, "vme_lm_set not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1601,7 +1601,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_get) {
-		dev_err(bridge->parent, "vme_lm_get not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1638,7 +1638,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_attach) {
-		dev_err(bridge->parent, "vme_lm_attach not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1671,7 +1671,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_detach) {
-		dev_err(bridge->parent, "vme_lm_detach not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1738,7 +1738,7 @@ int vme_slot_num(struct vme_dev *vdev)
 	}
 
 	if (!bridge->slot_get) {
-		dev_warn(bridge->parent, "vme_slot_num not supported\n");
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.42.0

