Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5028FD
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 13:28:36 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ek18so18269056edb.6
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyY2R9QNNXGK8lmhcVSCQDWNmU1D4Zz0mD1roX5FYPQ=;
        b=mzuOkHGbLxSKepiU+jo5J/HKy3Y+rUjpFmiMwAAN7Yu9zbvih3jmgyDa3aYJtjqZt3
         zlV4wg2aQ67i+Jyocb8c6QmJuu+2167aYgENoDJR56fyR2n9xJuhEw3h9gE/aj9Q5Npg
         QfOXSMe7qycC6nS5lNaCrfSTGvxR62Hd75nHlKVrrelJ9mU9Qs1TxLsOhAKFEUMiBMY3
         jUguKEVDlv27jiY9wcdIiU0ToD+HDgxPjHbuA3LNcuALCOlD0EMR6CxWPgarzpLvpE+S
         fkR+7MjRONnSJIXAni5LDfX3aZDSFOP/sMKV1okEFtdoRwhATE5TWcfuB5vHemI6ZaYh
         v12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyY2R9QNNXGK8lmhcVSCQDWNmU1D4Zz0mD1roX5FYPQ=;
        b=kvRnm3PQkOaPq8o+mtWtsmi08fDsd3ev7OmGu63F11HTjuz78Wt4lojiVoel2ZMUuC
         0Utff/6HNbYEdOU7Y9Wl7fPLdCEW+aNlRL76Q98ZZ9ZdY/g/0oxJ04enFTKl5IcPAiH6
         JoAFy0YV9g7+PhZJrSwjZ5TXYnQuMBhcLkuobLPhdIh2pyyva2BY1evtJjpZmPIhdePq
         E+ONcf6p0peaj1U11KB06ea3HerpMoo5Z4lCfbdrxhAXHcpdDkLPZaI5izTGJFMDIKPJ
         nigfLv+dcHt14LBVOjbkiYvWn+1lJW95m56CikqdG0M87Gw2UohlQOu26+eRz4RTo2g9
         t08A==
X-Gm-Message-State: AAQBX9dRJ6U87nnuje9ACUSUlO2RaYI/2mFT7Z2NYVu1L9LTuBxNviIF
	aREb93Xxuhl1DQT2hzAEiHWWphMr0xo=
X-Google-Smtp-Source: AKy350bCXInC7huNhl9zCnXVyDc8DADdI6kTaSpaiRuZxQKFiN47xeBNrxJkaLK5N9hp80FJuLFfNQ==
X-Received: by 2002:aa7:d50e:0:b0:502:1cd3:d0fb with SMTP id y14-20020aa7d50e000000b005021cd3d0fbmr6204820edq.20.1679750915271;
        Sat, 25 Mar 2023 06:28:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbe9.dynamic.kabel-deutschland.de. [95.90.187.233])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm11727610ejb.74.2023.03.25.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:28:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: rtl8192e: remove redundant setting of rf_type
Date: Sat, 25 Mar 2023 14:28:21 +0100
Message-Id: <20230325132823.22872-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230325132823.22872-1-straube.linux@gmail.com>
References: <20230325132823.22872-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point the value of priv->rf_type is RF_1T2R already. Setting
it again is redundant and can be removed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 3027d43cb362..0e0096ef4943 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -350,10 +350,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			tempval = (rtl92e_eeprom_read(dev,
 						      (EEPROM_RFInd_PowerDiff >> 1))) & 0xff;
 			priv->eeprom_legacy_ht_tx_pwr_diff = tempval & 0xf;
-
-			if (tempval&0x80)
-				priv->rf_type = RF_1T2R;
-
 		} else {
 			priv->eeprom_legacy_ht_tx_pwr_diff = 0x04;
 		}
-- 
2.40.0

