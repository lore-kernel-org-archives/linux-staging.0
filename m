Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F958F4F;
	Sat,  1 Apr 2023 18:58:55 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so17382253wmq.4;
        Sat, 01 Apr 2023 11:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45/uUH+GA+g3TzzPmCYcmE2gkkTwmaIuQw5taJgSmzw=;
        b=oFnSc0BInMmk+K4wobRGty9HhtMLWMo6hhByjwS8VBUnMZdRqwqrHKKa5i3jloNeCA
         nOMueRUXendCJ505jW0KmBe/ZFyJUvPMOOe4n3e4Uci32nW6IgvaAyp6/o+6rl9/rBou
         qnPfX+N9vZHmzSJftLrzcruk5pTgQy4N+QjLq7YKkkTpIuT5SoH6rToNUw9DND2yk+Jc
         jq8CIGXUFVqbN57WlxkrmQouatgMxLYptm9BUifJdxIUrBGXS0CzlLDlUkWmIsZglxsq
         u+WNErbektNfgAU6vinyzwpnu4hlUZpuo+u0XGQiSqOSMAyiGNY9FesfhrdahgQ9wELg
         H81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45/uUH+GA+g3TzzPmCYcmE2gkkTwmaIuQw5taJgSmzw=;
        b=NAGVF5Jx26J8/mZtI2dWy9MsUPUA7tTLZfAWbP60wHEnLemIG5r2O1xeQma4V4Rimw
         ivPP4/cg7X2sCPEGoMhXgPJF2hPZJjP4Fmf0qXS7qoney7gLNijLVi1KEtZUXQwNVW7S
         l1K4tRV9dZ4RulpxT9Sg0JV/N2Vqxf1aD45qcRcTc1i5dJr+OhuqoJReg0VIHtgrKSIC
         olXFO5+57j7VNzcx2OWEfwNecA6X30X6LXUgH/pIz0AL0B4vNubwIkF4HDNEIU7DGPJ0
         Zhv2vcud9EHeGRYoivddPCFb5wknB+z1Er8eUs6gBs3UZwQLRqo8vsYjhm7mvKcSLmX6
         gpZQ==
X-Gm-Message-State: AO0yUKWmzFnr0OsVzWkP23IuWMu3h1edQP9f9SzR3xyY/EENw4X/6TGd
	Go/7FDYs0uisIzylWuQZWTEDlw4RRsPP++MX
X-Google-Smtp-Source: AK7set9s8UXrjEJdWqyo51fhyCBtOYvvguTSAgcapsnQFwa09yojzoProaVglsGQFSL+qmUYNk+FQA==
X-Received: by 2002:a7b:ce16:0:b0:3ed:2709:2edf with SMTP id m22-20020a7bce16000000b003ed27092edfmr24775939wmc.13.1680375532974;
        Sat, 01 Apr 2023 11:58:52 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id s17-20020a05600c45d100b003ed51cdb94csm14017463wmo.26.2023.04.01.11.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:58:52 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepak R Varma <drv@mailo.com>
Subject: [PATCH 3/5] staging: rtl8192e: avoid camel-case <dot11RSNAStatsCCMPFormatErrors>
Date: Sat,  1 Apr 2023 23:58:42 +0500
Message-Id: <7ed9ed4df19b1ab818fc4b3ec43083e1a051c38e.1680375200.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680375200.git.kamrankhadijadj@gmail.com>
References: <cover.1680375200.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernel coding-style does not suggest mixed-case names. This issue
is reported by checkpatch.

Fix variable name by changing it from camel-case to lower-case. In order
to describe the variable name better, add a comment above it.

Suggested-by: Deepak R Varma <drv@mailo.com>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index 8d3067a6ccca..e8a3bc94efdc 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -34,7 +34,8 @@ struct rtllib_ccmp_data {
 	u8 tx_pn[CCMP_PN_LEN];
 	u8 rx_pn[CCMP_PN_LEN];
 
-	u32 dot11RSNAStatsCCMPFormatErrors;
+	/* .11 RSNA stats for CCMP */
+	u32 ccmp_format_errors;
 	u32 dot11RSNAStatsCCMPReplays;
 	u32 dot11RSNAStatsCCMPDecryptErrors;
 
@@ -226,7 +227,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	u8 pn[6];
 
 	if (skb->len < hdr_len + CCMP_HDR_LEN + CCMP_MIC_LEN) {
-		key->dot11RSNAStatsCCMPFormatErrors++;
+		key->ccmp_format_errors++;
 		return -1;
 	}
 
@@ -238,7 +239,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 			pr_debug("CCMP: received packet without ExtIV flag from %pM\n",
 				 hdr->addr2);
 		}
-		key->dot11RSNAStatsCCMPFormatErrors++;
+		key->ccmp_format_errors++;
 		return -2;
 	}
 	keyidx >>= 6;
@@ -374,7 +375,7 @@ static void rtllib_ccmp_print_stats(struct seq_file *m, void *priv)
 		   "key[%d] alg=CCMP key_set=%d tx_pn=%pM rx_pn=%pM format_errors=%d replays=%d decrypt_errors=%d\n",
 		   ccmp->key_idx, ccmp->key_set,
 		   ccmp->tx_pn, ccmp->rx_pn,
-		   ccmp->dot11RSNAStatsCCMPFormatErrors,
+		   ccmp->ccmp_format_errors,
 		   ccmp->dot11RSNAStatsCCMPReplays,
 		   ccmp->dot11RSNAStatsCCMPDecryptErrors);
 }
-- 
2.34.1

