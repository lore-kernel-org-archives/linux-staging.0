Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C02F28
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 13:40:37 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y5so12074658pfe.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=TGF9rxKbfLgE4yzeN1f8tbFRCeGks8IIW/eVpPUyeiU=;
        b=ZyaZgt0719MVOEzqMhPX9YuwhOcvk4Tfgtci93hXXrWqzr0VZbI2hjq43PQTBQMuz8
         nIGCqRdMsDziUzsgblBes1baEbn8xA5hGHAkNjFYWF3vQLkNzx3HsIWUhhHM4RPA+8le
         tC51WGTcxkNfvVsF3DZfZ08jLbQ80xAuq+jnkAmSShFDCaPwuN+jkwkH9LYcJU7X4Zy6
         3QgQpGfke4WWvrb564nfUnAhbGpAgKoptflj7l1MBWG3lqMg++4W5Ide+nPfY/qnc2Dk
         L4t9PeoHicJ/YoBZK/SGm6Zl6qErkrGM88O1SL8CwidyADrMEJKKBtAxhpBzCJphZffh
         JPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TGF9rxKbfLgE4yzeN1f8tbFRCeGks8IIW/eVpPUyeiU=;
        b=5GPMwEGze5rpB8jDx/PIVlqVLro1wW0YlVPKBiGAYbAcLPqwFPX5+6x77tnZXu2MT9
         6Q2WEB92z+Bxu2JWIjiQ9yQJur2YXtvGR91p9e/8cpK5l3BpEZJxyxqx467X/MMSHT1u
         j7mq1cxI5VxXUPs4kaFHRqMNp6TlwtXnq7Cw2O0iUsVAX01dRZzhxrLi/CMDG3MP5HLE
         LKHzXrC6vpdxloXzGZ48AYMQgzH4MO/teli6naOHcoQqQuFTtCTaQZTL3hiHF4QupFVv
         5T7dG8eFNjAq5pfPVN3pY2qHC/OVXJQRu9p7cpGa95DsNoMei2v3gb3Sq+3Fms66lqag
         l4kQ==
X-Gm-Message-State: AOAM533nIFsM1Ogxhhht1v2o1Ag5BePdxboO5pd7A4RBzMsXfvPi/tgF
	u3jbGvw1A7MUp9lVpzkMhJg=
X-Google-Smtp-Source: ABdhPJzf4r4cyGazko/1XgNj0OygcynEqxH7DclCZ/kkCf8azez4RKIt62fonUr015Jjv6NO2Ylb/A==
X-Received: by 2002:a05:6a00:2350:: with SMTP id j16mr15992959pfj.78.1644241236437;
        Mon, 07 Feb 2022 05:40:36 -0800 (PST)
Received: from localhost.localdomain ([103.37.201.178])
        by smtp.gmail.com with ESMTPSA id u17sm8424156pgi.14.2022.02.07.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 05:40:36 -0800 (PST)
From: Ayan Choudhary <ayanchoudhary1025@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: Ayan Choudhary <ayanchoudhary1025@gmail.com>,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: nvec: Fix ending in '(' error
Date: Mon,  7 Feb 2022 05:39:21 -0800
Message-Id: <20220207133921.4287-1-ayanchoudhary1025@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This patch fixes the checkpatch.pl warning:

CHECK: Lines should not end with a '('
386: FILE: drivers/staging/nvec/nvec.c:386:
+		err = wait_for_completion_interruptible_timeout(

Signed-off-by: Ayan Choudhary <ayanchoudhary1025@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 990d15c31a13..b3f114cb00dc 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -383,8 +383,8 @@ static void nvec_request_master(struct work_struct *work)
 		msg = list_first_entry(&nvec->tx_data, struct nvec_msg, node);
 		spin_unlock_irqrestore(&nvec->tx_lock, flags);
 		nvec_gpio_set_value(nvec, 0);
-		err = wait_for_completion_interruptible_timeout(
-				&nvec->ec_transfer, msecs_to_jiffies(5000));
+		err = wait_for_completion_interruptible_timeout(&nvec->ec_transfer,
+								msecs_to_jiffies(5000));
 
 		if (err == 0) {
 			dev_warn(nvec->dev, "timeout waiting for ec transfer\n");
-- 
2.17.1

