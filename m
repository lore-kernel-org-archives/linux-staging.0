Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4272F2B;
	Wed, 18 Oct 2023 04:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6oku4kJ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-27db9fdec0dso1326548a91.0;
        Tue, 17 Oct 2023 21:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697604372; x=1698209172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0plYRgApYCDuFiFfuBG96gzOa5vfFs6SazUXLUEig0=;
        b=d6oku4kJtoM73yU3bC52uRF/S7Wu+CEtNbuZPOUdeG05oY2Gzw5KnkfEWhStw9aqun
         vqYNz23o4pH62/eWozU83j39BqZVxBzZDg4Ldzs81XsrevinvJBbFCYyNqzbnjhPMBvG
         I31cciFFV8qm8KRDil6bT/Ii6QCRxoznQCPO+zfhCRbdStxnhyEeRFMRIrbWCeJYR1Xq
         JH75tH/RFV5p4jQjwNJDUFkTf4QVikJ0fvDlZwsfQIuKsB9kTnKGvV3Rg3ER3O3020gU
         NrPx6w5vpfz36foxYoJbnoLfr4Z2XXrYupVFgfxuG2OYH98TIcsy7xHrNKPtno4cf/lg
         z/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697604372; x=1698209172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0plYRgApYCDuFiFfuBG96gzOa5vfFs6SazUXLUEig0=;
        b=OehhDmjPJq1Qo+5TNd/kv2F0x+PrOdMJMnndLssLN7wZQZlMG3uDLRKmJZVkqcjvaX
         SCfj48ReDj1SuIFb/SSwemoZglpZ6Zw6ufMKgzUiM3BusW0srUJkaVvChUaiybIz84fJ
         RMcg0+e0CLQLXxw257//DTjOBPnzEa9Uu9q7wmnUehc9BUI7JJvUy4JNvL7SEQvKuEgD
         LfTBLOmB1/1xSueTHpXx5LM/VZ5PgVAXVdCcBquuCsah8ubqfgKQ720dlSwugTKg91tA
         jfrGP5umLrpyrhRFgg4vXPaPe5L69/xoYAXnrSq9QP9vdW8rMGyL0EPnLif+IcmEXBKa
         0qlw==
X-Gm-Message-State: AOJu0YwW/JW3yuXDNPMQmzx8F97Qg2t+cvRaujHfIZNNFrZEm1d5lbcK
	SxXBezBiVc1r/8C+UOuM2Fs=
X-Google-Smtp-Source: AGHT+IG5MMc2IDFm6/s5mb/T+WlATudIS8dQjYZ9X6U8jeZvpsuXVcSU0e1Wqfw387f1jRYxkxGFaw==
X-Received: by 2002:a17:90a:1910:b0:26b:4a9e:3c7e with SMTP id 16-20020a17090a191000b0026b4a9e3c7emr4380729pjg.4.1697604371635;
        Tue, 17 Oct 2023 21:46:11 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090a740f00b0027360359b70sm354997pjg.48.2023.10.17.21.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 21:46:11 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: gdm724x: Add blank line after declaration
Date: Tue, 17 Oct 2023 21:46:07 -0700
Message-ID: <20231018044609.22616-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix WARNING: Missing a blank line after declarations
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
Changes in v2:
* Change "tty:" in patch subject to "staging:"

 drivers/staging/gdm724x/gdm_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 4e5cac76db58..0c61eaff6122 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.42.0

