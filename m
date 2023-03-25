Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A005290C
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 13:28:37 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h8so18226610ede.8
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cG1+U1VS4mH8d3SR6UASaJ11y3INr/ZiCFmx1pUYXo=;
        b=gq9tvb7Hv3OJY3O9pPIimpfkWwxyNLV3n4S1GHoza2Fp1Y5BGEuywsmyKyalgbbhOy
         edWYfoUbOSvJz0+cIAAFbCR/Erk4ID1ndbbXj/1/9lzPGm73dXgqGxas47ZPSZFpyhD/
         xSlIg+Pm56UfMOOZFe/5L6TwCI6J2qtMnTgyeqoKO4TlBjcmoP825wt6+Y+JVfsiop79
         v9JfyBhTC1iOJtaRNaC/6uslJyO5eAJu55uKBC2e18NnqNBJ5jlb6Rg4hnV3CE3DFPRG
         b8dyRV4bsjDlI3OAhV8IYweCCvpsZi33HdWQOmZQ8NFsaJYPQY3T1Pwo0AByaMWjfqu2
         +O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cG1+U1VS4mH8d3SR6UASaJ11y3INr/ZiCFmx1pUYXo=;
        b=Z69nuKYzUSrJSR4aY+UesJnQo9Gauw/0sNe8n8S1/6pQuNt86eQKQVCe76FjvB15iR
         Fbl4Et5GG9nL7hDYtAklfwce/yTNreZ6cwn1sn3EdQmub1Ymdcf2lzEF7SYgTA4QrsA4
         KSzxPCMkctnLDpGJByrUJHa4EyT6wytkYfZKVCG697c+gGdPNDBF7QfeNy4MYxYIrouE
         YyDFGm2GhrFSctsL/murL9QivUJe2GUB0RZjMfH0ntiL3MbBtWSKDaAvXeHD5o1VssBZ
         nF+dvo9vic7JHhMQQ43tRsIoBYNtnZrsSng622286BxohzUUWB/ZRxEtGozdOPRibOhY
         9tdg==
X-Gm-Message-State: AAQBX9f7Ly27eqFhcNHmwv/ujeV79fq0B7zPpEFAu2zAIcxAoDrRlDmy
	by8Kg8elxpxHfYf1sjfyhRg=
X-Google-Smtp-Source: AKy350YQEnwXNX6f6qG5LvZw4wfl292mwIcKULob0AWL8a5z9mspw9Qa0RnXz9CptFat8cvDzR4/Gw==
X-Received: by 2002:aa7:cd71:0:b0:4fa:c7c9:62ea with SMTP id ca17-20020aa7cd71000000b004fac7c962eamr6627224edb.11.1679750916313;
        Sat, 25 Mar 2023 06:28:36 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbe9.dynamic.kabel-deutschland.de. [95.90.187.233])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm11727610ejb.74.2023.03.25.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:28:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: rtl8192e: remove rf_type from struct r8192_priv
Date: Sat, 25 Mar 2023 14:28:23 +0100
Message-Id: <20230325132823.22872-5-straube.linux@gmail.com>
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

The field rf_type of struct r8192_priv is always RF_1T2R and only used
in one place. Use RF_1T2R directly there and remove rf_type from struct
r8192_priv.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 2 +-
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b237970ecf85..1eb063fe660a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -343,8 +343,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 	else
 		priv->tx_pwr_data_read_from_eeprom = false;
 
-	priv->rf_type = RF_1T2R;
-
 	if (priv->card_8192_version > VERSION_8190_BD) {
 		if (!priv->autoload_fail_flag) {
 			tempval = (rtl92e_eeprom_read(dev,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 914cd28897a5..1e99eb833405 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -289,7 +289,6 @@ struct r8192_priv {
 	enum nic_t card_8192;
 	u8 card_8192_version;
 
-	u8 rf_type;
 	u8 ic_cut;
 	char nick[IW_ESSID_MAX_SIZE + 1];
 	u8 check_roaming_cnt;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 46be638677d9..d45808760638 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -532,7 +532,7 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	priv->rtllib->bdynamic_txpower_enable = false;
 
 	powerlevelOFDM24G = priv->pwr_track >> 24;
-	RF_Type = priv->rf_type;
+	RF_Type = RF_1T2R;
 	Value = (RF_Type<<8) | powerlevelOFDM24G;
 
 	for (j = 0; j <= 30; j++) {
-- 
2.40.0

