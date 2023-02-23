Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64EE7E
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 19:36:38 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id z5so11943848ljc.8
        for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 11:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qk+cDCcz2CVt0ThfX9BY25TGDL0RI1Xa6b4kLFjXY2o=;
        b=QoSM0+1dwluesL8imzF5TA/C1dlhofcJJ982B2XLpjkuJOjOIXop0NaPfao9JJa5Wj
         RJKQv1JU37jBGfMA3uCgwTUjjG0ko5NI6PV0gbGGmSy4DT6KTmpqvoFKW1bnArEqZnNh
         OlUVIT5fglfoBZzc0JQWvJUqm3ZyaWddaeKtAhIknvGKteHq7sdMoj7Zjx5BQ6M9NahU
         ynkrxpdlonGzBZAemFUsOcegS86ts7hSIRv9XXM4hbxxgi9MxcNngI/d9iEMB15yhvWm
         UKAb0bA4I8QcY1FjeouakSqMGNHKVvafa7G+9GqOZ5LcEiN16Eey3D0pJq0Mc2qOEI0+
         LtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qk+cDCcz2CVt0ThfX9BY25TGDL0RI1Xa6b4kLFjXY2o=;
        b=XxralbSjL3ouq2uwFZMNWM7j1SfSXxHCTyweWcPNYgt0qS9DoZykQEoOoUXO2U66vq
         8P+R7QeQI2TRs1oeIAxCArcfd8r8UPixZEEslFK0ScqCz0+aCm7tnfs+8jW4A5VxZEqP
         d/WQfpiS+8eeibX6A38uBXSJ2MVRza4ifo+AogIxKeWWDdY8I7NY0x7T1qBVEMd54sAn
         Wx6r0dRg1ON9qrBrhWfn1vm/jc/NYEhne7uAksp/ev9QP7r8y5JAJD6iofeMtfER6Ayd
         PDTP2W1giGwGTDODFrNrp4mNmGjZLhMiXdEdbMZaHK1gYEFnVqZK46wyk+sqSKKSRrw4
         F0uA==
X-Gm-Message-State: AO0yUKWanav1vA0dZZORGQQClqthv7bOTPo3ZrMlfYIJdfZFPhX3zuCo
	WxwAWzTzvMJWCmWJXgksKz0=
X-Google-Smtp-Source: AK7set/c6lm9czTl0xw0+ysZMiL6iurd+kFscmhxC7LVZXslMR9fEAOxekMYiiObSDDdcfL0fJutWg==
X-Received: by 2002:a2e:b893:0:b0:293:4fda:22d1 with SMTP id r19-20020a2eb893000000b002934fda22d1mr6134008ljp.46.1677180996613;
        Thu, 23 Feb 2023 11:36:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:1370:81ae:2572:38e9:e6ee:6827:29dd])
        by smtp.gmail.com with ESMTPSA id f7-20020a2e3807000000b0029343fe58e3sm1422209lja.130.2023.02.23.11.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 11:36:36 -0800 (PST)
From: Leonid Pershin <leonid.pershin@gmail.com>
To: 
Cc: Leonid Pershin <leonid.pershin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Tong Zhang <ztong0001@gmail.com>,
	Rebecca Mckeever <remckee0@gmail.com>,
	Deepak R Varma <drv@mailo.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192u: remove split in user-visible string
Date: Thu, 23 Feb 2023 22:35:57 +0300
Message-Id: <20230223193559.157880-1-leonid.pershin@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to coding style, user-visible strings in printk()
function calls cannot be split across multiple lines.
Issue found with checkpatch.pl.

Signed-off-by: Leonid Pershin <leonid.pershin@gmail.com>
---
Changes in v2:
  - Replace printk(KERN_DEBUG...) with pr_debug()

 drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
index 9bfd24ad46b6..c378bdff453b 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
@@ -72,16 +72,14 @@ static void *ieee80211_tkip_init(int key_idx)
 
 	priv->tx_tfm_michael = crypto_alloc_shash("michael_mic", 0, 0);
 	if (IS_ERR(priv->tx_tfm_michael)) {
-		printk(KERN_DEBUG "ieee80211_crypt_tkip: could not allocate "
-				"crypto API michael_mic\n");
+		pr_debug("ieee80211_crypt_tkip: could not allocate crypto API michael_mic\n");
 		priv->tx_tfm_michael = NULL;
 		goto fail;
 	}
 
 	priv->rx_tfm_michael = crypto_alloc_shash("michael_mic", 0, 0);
 	if (IS_ERR(priv->rx_tfm_michael)) {
-		printk(KERN_DEBUG "ieee80211_crypt_tkip: could not allocate "
-				"crypto API michael_mic\n");
+		pr_debug("ieee80211_crypt_tkip: could not allocate crypto API michael_mic\n");
 		priv->rx_tfm_michael = NULL;
 		goto fail;
 	}
-- 
2.39.2

