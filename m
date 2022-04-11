Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC1C10EC;
	Mon, 11 Apr 2022 06:42:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id s10so5513122plg.9;
        Sun, 10 Apr 2022 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SQ2N6Xpk1aMKru9A8jRzZuHmVKTyUpO6upZUMW+pk2k=;
        b=qM7VY12/XlZEfZa2W2UFp9xfmGnL6U+TH5E2XLLyqXnl1qjmkklwtdGhZ+Aau6ke1u
         jMGRyUyusJTTAO6bws2z+5fziKx/iTIEBITkcYKVyEYi6KcSHeKLehrQh6yTIaA9OXHk
         Mwp2ncTO/rNgBbbQHWEw/GiWLT4+9qSP2IuCJCF7MehBMw0B4hChkJ+KPSfmpAmvBTWr
         x+uwTKzP7+4xdnqardBSxrmg9M7HgTLZAmytNu891tCxjsqaBeTyxZ5CMxHjA5IOP6P9
         ouIb7HuC0WiCUA04f6qU6KrnHB7v6knPEHd+mH2nlp2CwVE8iPXrrCOppVqT5Hf5pydb
         q2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SQ2N6Xpk1aMKru9A8jRzZuHmVKTyUpO6upZUMW+pk2k=;
        b=4R7gBjOGGN/0vy3UemuRhCXbktmcTJ7tgdtUM4/3+6bA12NmEDK/UXUjk4+XmUC6zT
         MylfXkO9g3lBlMXhLBctFzdZ/bfDJRt/dVIgp8w9gkZwdyH74LfrpBDlQInhAh/+oaet
         iGpFiC+ZvTgMU+3HxQ/mr5PZQXzSNA9jOuU73HvaMy6yZEHGVEI2pUTWYb2cyFIINZMx
         zkLfYKBTkSULHucSGMlrJxGjle9Bz8atTCtxlFtJEQRpF05fWoCOLaEtI8xfkcJEDVtl
         MsV8dcElVV62vomYEHI4T16TLHrbKGiTf+24z7cXhHyO4TUXjQ7Yyq46KCe39171fCP+
         HYBg==
X-Gm-Message-State: AOAM532AO5sIshb9UJspZYVO05LVkiBZHuNifP1zCm4B2sL6XWnhQS1J
	LQCP4pchsbvzXjZI9vOvVmr0QAmLQ2NaQQ==
X-Google-Smtp-Source: ABdhPJxOavYT8NLCgSmUHkbQYHe4YnYquL+uRp94r8S4s0wcm2pXS7DIZnf6nZSW+3vJnLwQIUFDMg==
X-Received: by 2002:a17:902:db10:b0:158:657e:10f0 with SMTP id m16-20020a170902db1000b00158657e10f0mr3526793plx.125.1649659372660;
        Sun, 10 Apr 2022 23:42:52 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id n23-20020a17090a091700b001cb57fd5abdsm7712455pjn.40.2022.04.10.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 23:42:52 -0700 (PDT)
From: aliya-rahmani <aliyarahmani786@gmail.com>
To: outreachy@lists.linux.dev
Cc: florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	aliya-rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: rtl8712: efuse: code style - avoid macro argument precedence issues
Date: Mon, 11 Apr 2022 12:11:43 +0530
Message-Id: <20220411064143.45300-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl check:
 CHECK: Macro argument 'offset' and 'word_en' may be better as '(offset)' and 'word_en' to avoid precedence issues

Signed-off-by: aliya-rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_efuse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.h b/drivers/staging/rtl8712/rtl8712_efuse.h
index 4969d307e978..2e1ea9d7a295 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.h
+++ b/drivers/staging/rtl8712/rtl8712_efuse.h
@@ -15,8 +15,8 @@
 
 #define GET_EFUSE_OFFSET(header)	((header & 0xF0) >> 4)
 #define GET_EFUSE_WORD_EN(header)	(header & 0x0F)
-#define MAKE_EFUSE_HEADER(offset, word_en)	(((offset & 0x0F) << 4) | \
-						(word_en & 0x0F))
+#define MAKE_EFUSE_HEADER(offset, word_en)	((((offset) & 0x0F) << 4) | \
+						((word_en) & 0x0F))
 /*--------------------------------------------------------------------------*/
 struct PGPKT_STRUCT {
 	u8 offset;
-- 
2.25.1

