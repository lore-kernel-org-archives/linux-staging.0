Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54BA31
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 08:43:59 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id n18so14868755plg.5
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ZxrxvLmhhEpAfBV6uhz1YKPOjB2lLxvj2bDyOyEBloU=;
        b=fHN0nGy6JZwVZZACiD3BMloqyF9i7AL6wUEjck1epp3PbRIMOMyCca+surdzGsIkD9
         MdHLNrWhGdMj/uoPcxX7fqguuH/8GPjq0dmJmWQdCP858Hpk7PaxSV0VVVo9z+ffvte3
         KyjkZdh+DhvkPUz7BcnBHwFRIGClky5OG2UyjXNl5ot+rLa4MIBnyHl3ATnN6yTyT3kF
         GiOYAKu4w43PR3pbHR45BrL/J2zELloW08wlmmGCoQSdmsDWKt94aIM690W8IR9n+N71
         ka6grEBkP83YGu/qVybRHR7vIZqgq/++XQPrh68bTXJ9a5rVsN9YAQCR52o/32P0loAN
         PkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZxrxvLmhhEpAfBV6uhz1YKPOjB2lLxvj2bDyOyEBloU=;
        b=1wrFrYXT+8ikbBj7jzWtPbkXAhsaTlx2J8UKVOWvUlm9/Xtb8Db7ekQ8CCWS05GeDs
         5ofdpVUnDZiM6C/ouY4WyIYgk7Zg9fyQLp7weD9KI8R9BnHqlQ4uTfaqd5gclpPLG6FW
         tPuDH0svb3egJ6HbkxzCVzc1PHGc/+BRe1Ygcz4SFwgxihl0kG9vU4oep8aaXkB+FJ10
         EBnPhvCKDFEEkJdkjraXoJ3qZyclv9OsOrGhyxlH9kYtH1v82ZPK18capHKHreXzHSxx
         mAafiH9FjmDRL5+FcYsACivXdcEoFnCV7iQXU6n17AmkgZT2BZEZt7KapuhwH0i0qSjD
         KulA==
X-Gm-Message-State: AOAM530QIPCvmzlgi4GBFrfDdRNzgJU2eKEOFAHpXvnDONADTkngv8m3
	k9c1TTLVRDK1hfofxNQhDO3GjDOiowEYjOQU
X-Google-Smtp-Source: ABdhPJwlpFZfcxZl1zBc7WLYS8WdYv68M00ubMwztbD/5H5eWT2/Ju1ejMIUUgnCP94/g2n4VT2cXw==
X-Received: by 2002:a17:902:cecb:b0:154:6f46:a5d6 with SMTP id d11-20020a170902cecb00b001546f46a5d6mr5994007plg.92.1647938639111;
        Tue, 22 Mar 2022 01:43:59 -0700 (PDT)
Received: from ubuntu-vm.jnpr.net ([116.197.184.10])
        by smtp.gmail.com with ESMTPSA id rj14-20020a17090b3e8e00b001bf50a8b468sm2091658pjb.51.2022.03.22.01.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 01:43:58 -0700 (PDT)
From: Sathish Kumar <skumark1902@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sathish Kumar <skumark1902@gmail.com>
Subject: [PATCH] staging: vt6656: Fix multiple blank lines warning
Date: Tue, 22 Mar 2022 14:13:34 +0530
Message-Id: <20220322084334.4077-1-skumark1902@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This patch fixes the checkpatch.pl warnings like:
CHECK: Please don't use multiple blank lines
+
+

Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
---
 drivers/staging/vt6656/channel.c | 1 -
 drivers/staging/vt6656/rf.c      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/vt6656/channel.c b/drivers/staging/vt6656/channel.c
index aca003031995..413e2fc4a50d 100644
--- a/drivers/staging/vt6656/channel.c
+++ b/drivers/staging/vt6656/channel.c
@@ -55,7 +55,6 @@ static struct ieee80211_channel vnt_channels_2ghz[] = {
 	{ .center_freq = 2484, .hw_value = 14 }
 };
 
-
 static struct ieee80211_supported_band vnt_supported_2ghz_band = {
 	.channels = vnt_channels_2ghz,
 	.n_channels = ARRAY_SIZE(vnt_channels_2ghz),
diff --git a/drivers/staging/vt6656/rf.c b/drivers/staging/vt6656/rf.c
index acbbf8acdf1b..464602c74727 100644
--- a/drivers/staging/vt6656/rf.c
+++ b/drivers/staging/vt6656/rf.c
@@ -82,7 +82,6 @@ static u8 al2230_channel_table1[CB_MAX_CHANNEL_24G][3] = {
 	{0x06, 0x66, 0x61}
 };
 
-
 static u8 vt3226_init_table[CB_VT3226_INIT_SEQ][3] = {
 	{0x03, 0xff, 0x80},
 	{0x02, 0x82, 0xa1},
-- 
2.17.1

