Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176772
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 07:34:27 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id k23-20020a17090a591700b001976d2db364so1890906pji.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oIJeMbHxMu9wl8J86TMN3akNUdvjmRjWbKEAkHMeMlY=;
        b=LpIaBsKMOsEN0w91XVOXIqx7N9WT4h8imK48xF4jq3Q2lWAtl1WgX6HVZCwQayAIT/
         jHlEls3zn7hibAYCfLjMwBpP9WT4IAeZtX1RMCL8zeopn3J0CXDMiCAS8TaQYbRftJqT
         5KSMtugVY6LYxd3VhdOEIjq3IYhm1t+BaozjnJwxmb/ZIqREZGEgbU4bQGSOSSlEgx1Z
         wuYW6q35W0Yx2ScSYeL4NrDrQPrDTddDWdgJMcTFG22gGMGul5IuofkHHYh6fpwyJ+KU
         Zx0N3Q6mn0eINsc/gnTgnfuTySqWYtcmBrPqS9dQ1C3WcyvN1NyM178/j1aYfzoL21wd
         RbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oIJeMbHxMu9wl8J86TMN3akNUdvjmRjWbKEAkHMeMlY=;
        b=D/FskjkU1RJEwf/r26IGkEHp7s/D3NC0BNoblDDlqrN/P8aNrev2s2CbxbYboOsOla
         TJC6jt0VPZV7xK15hU9KyqvZ5dsV3rcR+kx8Z3aMVVIjSWdBxuJcd8W4dHT3h/Jfy8rh
         vs2BaigKrqtzGy6EoDXJjGG4fjtI2ebXhZUzzZ8EF2ySorUbc+Xwz7kdFejFka9jaKQY
         va7m8KcU+iqfhTdZopx3r/Rtnbdz7hipIOrWVoxFQJkTsXF1TgKN115LKD7I28TOabMM
         Gxiwvd051yesvB2lOGWIc9mpLM3Qbj3lenjSZnoXTbyzd1txbP/j9YtKmngWRUmgiOtb
         KyXA==
X-Gm-Message-State: AOAM530aNca1S7znfMU865ucSZ0x5PY0zRk1Qut6EKhnq+q+RmgiXMc4
	cuzV94P5mtVqaYEtNAm8gMs=
X-Google-Smtp-Source: ABdhPJzg3zFMgXBqbkGWXkq2u5by+cHchp61zrpZX4yklrr382bRbtt/QVpzvDfLdnMylKmtyUrU6w==
X-Received: by 2002:a17:90a:1a19:: with SMTP id 25mr3733534pjk.34.1632209667166;
        Tue, 21 Sep 2021 00:34:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id x8sm16565957pfq.131.2021.09.21.00.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:34:26 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: rts5208: remove unnecessary parentheses in rtsx_card.c
Date: Tue, 21 Sep 2021 13:03:42 +0530
Message-Id: <41db2310fdd942a8d840e21572f1fe21879798e2.1632209460.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632209460.git.benjamin.philip495@gmail.com>
References: <cover.1632209460.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes unnecessary parentheses that have been flagged
by checkpatch.pl in rtsx_card.c.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/rts5208/rtsx_card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx_card.c b/drivers/staging/rts5208/rtsx_card.c
index 294f381518fa..326b04756f62 100644
--- a/drivers/staging/rts5208/rtsx_card.c
+++ b/drivers/staging/rts5208/rtsx_card.c
@@ -165,7 +165,7 @@ void do_reset_sd_card(struct rtsx_chip *chip)
 		chip->card_fail &= ~SD_CARD;
 		chip->rw_card[chip->card2lun[SD_CARD]] = sd_rw;
 	} else {
-		if (chip->sd_io || (chip->sd_reset_counter >= MAX_RESET_CNT)) {
+		if (chip->sd_io || chip->sd_reset_counter >= MAX_RESET_CNT) {
 			clear_bit(SD_NR, &chip->need_reset);
 			chip->sd_reset_counter = 0;
 			chip->sd_show_cnt = 0;
@@ -636,7 +636,7 @@ int switch_ssc_clock(struct rtsx_chip *chip, int clk)
 	dev_dbg(rtsx_dev(chip), "Switch SSC clock to %dMHz (cur_clk = %d)\n",
 		clk, chip->cur_clk);
 
-	if ((clk <= 2) || (n > max_n))
+	if (clk <= 2 || n > max_n)
 		return STATUS_FAIL;
 
 	mcu_cnt = (u8)(125 / clk + 3);
@@ -886,7 +886,7 @@ int card_power_on(struct rtsx_chip *chip, u8 card)
 	int retval;
 	u8 mask, val1, val2;
 
-	if (CHECK_LUN_MODE(chip, SD_MS_2LUN) && (card == MS_CARD)) {
+	if (CHECK_LUN_MODE(chip, SD_MS_2LUN) && card == MS_CARD) {
 		mask = MS_POWER_MASK;
 		val1 = MS_PARTIAL_POWER_ON;
 		val2 = MS_POWER_ON;
@@ -920,7 +920,7 @@ int card_power_off(struct rtsx_chip *chip, u8 card)
 	int retval;
 	u8 mask, val;
 
-	if (CHECK_LUN_MODE(chip, SD_MS_2LUN) && (card == MS_CARD)) {
+	if (CHECK_LUN_MODE(chip, SD_MS_2LUN) && card == MS_CARD) {
 		mask = MS_POWER_MASK;
 		val = MS_POWER_OFF;
 	} else {
-- 
2.31.1

