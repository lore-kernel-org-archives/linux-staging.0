Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A082A29;
	Mon, 18 Apr 2022 17:21:55 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id z5-20020a17090a468500b001d2bc2743c4so1119529pjf.0;
        Mon, 18 Apr 2022 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fogjq+0iPdBZBMK4jYk682UP+pZNG32fCLfhwIfhhXE=;
        b=eNsdqSr4O0QCRIf4YJ6R7gSwH2ItG46kuqFE3YxpMmutZ5ERKfeckih7AFfsT7fdCL
         CFAE+T+u5I+MrrH1+y7jkDyWp7pkiPj0FfQISV3uD6Zm6uG06OvHNLmOfKtPT1HPKnVm
         xGK92DPetlM3mJFlh8cRBNSlHxiRnu2sWgKzniZSLjAx40SS+sbb/5zpAEyVzZkBIYlO
         LoEcYR5DhSxXg9cwd+lOtsnfAhDou4odz+CsP/CjzG7jps3uU6zBMSjXvdcOFKvoyMBv
         i+1u13PZQi8MB9klWrGMnkLy5fOhJy7dULdJkVuGuhFDsIbfaLv3+9DDSSy2CWJDmqGL
         CAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fogjq+0iPdBZBMK4jYk682UP+pZNG32fCLfhwIfhhXE=;
        b=g+sNuR52b0RPko63ZktfIL7bX917ldXjj8pg4eGSoXmmyWNR1WFtVFrD50N+S4ZBIh
         0fuZqMr6DKHFIbtxKDSUMfdH3+ofvdHbi5AspZS3lbMFLPE/a0KNdqztJOR8F08roUIY
         ZNzeVopFdnX2zhm3aKg3jtjkAiZM09/pHzUoYA2B6/tmH7oIGcfj0T+X/HyG7NQ3pui0
         r+bhAHV2TlEhrAjut0ICRkCAgG8ydwLC7mIcCLWkF+JMjsYH9hxSYmHqoWysMb7BQg+K
         jx4iPKvRhnk22ac5PAI+Yr9nP9AavpWGN0+MgXxgGRmSJdfbizqwBE6JNB352DGMgNIL
         mPqg==
X-Gm-Message-State: AOAM532MmgovFsbuxOKieoVw9e2oNsjmU4/eUD0RaR3AThs+wcXU6cPi
	f4nILLmkUgCDq1Y0WuoN7iBiZ1i/M270iQ==
X-Google-Smtp-Source: ABdhPJwDJ0uJVfx2QrwbcFNBAgeqo9mTsjaUibpHBycw03Lj63qCZLrmvZN41QlydRogKqV/3XUqQA==
X-Received: by 2002:a17:90b:1a8a:b0:1c7:c60b:f12 with SMTP id ng10-20020a17090b1a8a00b001c7c60b0f12mr13992859pjb.139.1650302514956;
        Mon, 18 Apr 2022 10:21:54 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id y9-20020aa78f29000000b005098201d2f5sm13041394pfr.205.2022.04.18.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:21:54 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v3 1/3] staging: media: zoran: use seq_puts() instead of seq_printf()
Date: Mon, 18 Apr 2022 22:44:52 +0530
Message-Id: <20220418171453.16971-2-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418171453.16971-1-aliyarahmani786@gmail.com>
References: <20220418171453.16971-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace seq_printf() with seq_puts() for a constant format without
additional arguments, reported by checkpatch.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/zoran/videocodec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 3af7d02bd910..16a1f23a7f19 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -250,8 +250,8 @@ int videocodec_debugfs_show(struct seq_file *m)
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a;
 
-	seq_printf(m, "<S>lave or attached <M>aster name  type flags    magic    ");
-	seq_printf(m, "(connected as)\n");
+	seq_puts(m, "<S>lave or attached <M>aster name  type flags    magic    ");
+	seq_puts(m, "(connected as)\n");



-- 
2.25.1

