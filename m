Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FEF23B1
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 14:09:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso994256e87.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Sep 2023 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693750161; x=1694354961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AALeIaiiugA/l8EFRK5HkASlp0QQvRxkOCyJ73bcZ4M=;
        b=scJO0zgzwKwQz3xwPzwPPrUzvYWmfEEU4lsmzzXxp4n4PWvEAG05aX9UX0Ab2ExPb9
         b+mcWeocnvgtq98f9rVr8GKksCaHhthvWojz3BKVEB8Y36hAMq4/r4cPykk972d02LYf
         tAfNW3+iRCGm+uita+mzEUIadwDhQWMp4eUX5ruudS5ONns4GlQv/XHZiey45LM3mJPz
         exe19xxwd9l0PcO8GaROrB98Qpk7EmaXS493fNdUzdxtqzQCxiJjAWoxZ/5W5WRAZlw8
         xSmfFGHTgOp2cqGQiK4Z3yE3aLDgLh0Qdioq9frjMohYjtAhqUv4ewOVtYMQd4hyYCg3
         +Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693750161; x=1694354961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AALeIaiiugA/l8EFRK5HkASlp0QQvRxkOCyJ73bcZ4M=;
        b=jKO+HA2rPThjuc2Nr7+ZcRW5Ng5n/ozDq6OD2B6GV6T8iTnMrRNIIFKhPE2OoQ2Xwg
         vu2TQBKXuCXuGJeO/hKc2x+Y7ubszqM1bhFc3Rqa5E8OxEutaEmEGkhej9d0SzNN+Akj
         LsHYHxEDCFZjQ3tVcVWTkXDhkfGfY6E+vv/GPsEpisqFztP5FFslGT1J40yKpkuvwqvB
         dtiU1IWwRYqbn0g3v25TKVtIfWQ1cXj82vsMg0MUmPFwaOMvDZU2C/g5iWifrviKzLtA
         zVhpHQYWvjpuRgfRrdmzchqtPsQOuWxxjHzEHJd3OKGjjV2Rjwy/ssRjDA4GNGsZBwDW
         5pmg==
X-Gm-Message-State: AOJu0YxcfMyCDOCH7KRY6kUOISWAtBeFpHXFx0Hh5iMYkZfznyRuNAGZ
	LudgOUo6sr+0iqWu8A5pnh0=
X-Google-Smtp-Source: AGHT+IG3iDVr+bwDU+PL99hfbuiHt0zCiHIQWUcrjXsJ5KxrLrcR+/Y2Ex+c4EakkXcwlh8smdZPcA==
X-Received: by 2002:a19:504e:0:b0:500:b7ed:105a with SMTP id z14-20020a19504e000000b00500b7ed105amr4902785lfj.29.1693750161061;
        Sun, 03 Sep 2023 07:09:21 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id b25-20020a056512025900b004fbb69d8791sm1275305lfo.79.2023.09.03.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 07:09:20 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH] staging: vme_user: Add missing '*' in multiline comments
Date: Sun,  3 Sep 2023 16:06:17 +0200
Message-Id: <20230903140617.567850-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch resolves a warning reported by checkpatch where multiline
block comments should use '*' on intermediate lines in order to adhere
to the Linux kernel coding-style guidelines.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7c53a8a7b79b..90aaf650524d 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1010,8 +1010,8 @@ static void fake_free_consistent(struct device *parent, size_t size,
 {
 	kfree(vaddr);
 /*
-	dma_free_coherent(parent, size, vaddr, dma);
-*/
+ *	dma_free_coherent(parent, size, vaddr, dma);
+ */
 }
 
 /*
-- 
2.34.1

