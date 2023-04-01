Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617C8F43;
	Sat,  1 Apr 2023 18:58:58 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so12071925wmq.3;
        Sat, 01 Apr 2023 11:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sko9Z5CnVDma/o7PSvt8vNVEBnsuPXKJXiQ9VWjweDc=;
        b=NLvQkRTIvi0BY2paFYr/cb0nN5C4Hq4FHkgox+BcEX5BE6ulPDArqjTZwJw1uH+EUQ
         4ZZRLX1+eVmtH6VsvtAM+G0Nfmj6DK8lNXpZ/vmVTUXcCQ7XSJFK+3iEZrPwUmOF6Kn2
         69uFj7kOFc4SDieuz9orYB7JBmTU1mnuMltxqiN0BL5WH7LfNshWAj8Ucn5XsdEDQ3u/
         bmypvt4dnfyxsDB0dajr8+klLKZ4b/APwLirHoxFKNPgbiCYmqvQs/Q0XZGxl438xq8o
         hG0sZuU3p4NOa/vkBoHx2Y5iIuHDBnyg08jlNgY1zb32gL6jKr2c/232QwSU7Kun8Lxd
         JUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sko9Z5CnVDma/o7PSvt8vNVEBnsuPXKJXiQ9VWjweDc=;
        b=NVo054BrpQScg79iNjBzMo9RQyOk/hVyBmbe4Vbm6xZ1awp/pBtY8NPzjeDNt78/uz
         BBhu7bFedh8yuvdwi6ZrmR0o40zJ0Xu+9BOfegaAICTFbOQ2zqnxiyWO5DLb3Ty0VuSn
         a/nKK7avmTIV1hKRN5XgbjB1Kg7anL+BImlpLW5yNq6bwVVtUTriH1EhREPjsPPDY2F3
         HIpjx+eTyRmjm2qlG3dk254WtO/O7cF4A757Dz4bEbZ8EfLqSZW1mhJtueBrPO6PsKAj
         UJ0zUnHbicQHGnvAk8xrCqQcwmAwN7Tfs7r7GtBuZ44H0zOZuEaPwsYWQ5ESmo3TM3zU
         bzvg==
X-Gm-Message-State: AO0yUKUlwgeJIWklHtL9i3YQsLGkI7Otg9N3+XziSsq4JYXWsN5P2cGy
	UuAqKKsHsAuYZhrcKF2RZHMuwLuk+UidCtYL
X-Google-Smtp-Source: AK7set/FOCm+hbdY9aVJM9ptQ8ar3Evveg+ODJLWNaFs8tEXCEifUW1cE95um8PkVTjP5lnwjfl6/A==
X-Received: by 2002:a1c:4c09:0:b0:3eb:1432:a78c with SMTP id z9-20020a1c4c09000000b003eb1432a78cmr23207658wmf.37.1680375536436;
        Sat, 01 Apr 2023 11:58:56 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id s17-20020a05600c45d100b003ed51cdb94csm14017463wmo.26.2023.04.01.11.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:58:56 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepak R Varma <drv@mailo.com>
Subject: [PATCH 5/5] staging: rtl8192e: avoid camel-case <dot11RSNAStatsCCMPDecryptErrors>
Date: Sat,  1 Apr 2023 23:58:44 +0500
Message-Id: <f14ec250bbdc617936197c05d013b2829e4aa658.1680375200.git.kamrankhadijadj@gmail.com>
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

Linux kernel coding-style suggests to not use mixed-case names. Fix
checkpatch issue by changing the variable name from camel-case to
lower-case.

Suggested-by: Deepak R Varma <drv@mailo.com>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index 1783a2eaae66..3eb79bad4496 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -37,7 +37,7 @@ struct rtllib_ccmp_data {
 	/* .11 RSNA stats for CCMP */
 	u32 ccmp_format_errors;
 	u32 ccmp_replays;
-	u32 dot11RSNAStatsCCMPDecryptErrors;
+	u32 ccmp_decrypt_errors;
 
 	int key_idx;
 
@@ -297,7 +297,7 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 				pr_debug("CCMP: decrypt failed: STA= %pM\n",
 					 hdr->addr2);
 			}
-			key->dot11RSNAStatsCCMPDecryptErrors++;
+			key->ccmp_decrypt_errors++;
 			return -5;
 		}
 
@@ -377,7 +377,7 @@ static void rtllib_ccmp_print_stats(struct seq_file *m, void *priv)
 		   ccmp->tx_pn, ccmp->rx_pn,
 		   ccmp->ccmp_format_errors,
 		   ccmp->ccmp_replays,
-		   ccmp->dot11RSNAStatsCCMPDecryptErrors);
+		   ccmp->ccmp_decrypt_errors);
 }
 
 static struct lib80211_crypto_ops rtllib_crypt_ccmp = {
-- 
2.34.1

