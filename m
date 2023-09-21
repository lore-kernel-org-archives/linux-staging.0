Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03717EF
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:26 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-578a397a30dso313013a12.2
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266486; x=1695871286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWipJlFZbM4YKAg+kUj2K0xbQNVWSm/6S2rT+1aBy/Y=;
        b=PKNJy0K/GzBJ0XKG6w3lmeGjc1Ne9P6xwJjAdTmb+HfYRnrr22MN/aFGnL3y99i1QE
         ENC3ALzeVQJF4SGfv1eY7T0Co8nm5erBYEyAhKSRj6+JJH4hMMCY+H0QRS+fRKbhRPMN
         E8PDUq6pRqKc+xfkhFirw3Q6xoJZScNEIUZighL+FdEtYXHRNojwlYY4y2PFkuUrSkE6
         P5+w38hAHGLf4P1LsOttfmgufLr+Plgw82YhGhsr9lqTMMQpCCK++Vf8K1OcJPTlSQbI
         SFq0McBtvG+GaveJK+hojihjNXEpyCcMz28aRdRxvZRINLaE2T898QDSbT/KuGRGDBB6
         zf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266486; x=1695871286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWipJlFZbM4YKAg+kUj2K0xbQNVWSm/6S2rT+1aBy/Y=;
        b=XboQPYdMVj0lpC2bubmq8CpErwtrisr/VyJeaVHgN6zTHzACRmzKnYgIZLZc8p1NsR
         LCHbXIuq1kx963SKA4xrdSWpV0Jyi92DqeBoTebBK8paxsWCJeExLpYwFua23H7T1xu2
         d5w2zlNg6jkGamSqTdpMzWPOvfJ2WBSgWk56pBZ+4AlWH0Wl5+RQlx7Lk+DFvfJE3UpR
         XIOcs/6EEq2owMZpX9bFQYPDW2ZjnLcwieTu8nqjSao9ux4s0Y1pFp0Rb8AjT43ncBiU
         iDv1Ujs6+yx1ZpjJeGyCOlHRGI26y/3JYhla0F0Dd3Qle778ysp78/sKu915Z5AOR8CM
         DDeA==
X-Gm-Message-State: AOJu0YxGpde02rt/1BQEjJWnqb0Auc3cucv0zaZKaBeBfzsQgEW6hEg0
	MJmxH/khTu7w5Li9+a374dLPKQ==
X-Google-Smtp-Source: AGHT+IG6autl2H7Q76IFP7iq7R8Jl8qIPbMQGrmuceCL90rKqOePFrrOh/3ACu51r4dUWhqWU/4OCQ==
X-Received: by 2002:a05:6a20:6a1a:b0:158:17e6:7a6 with SMTP id p26-20020a056a206a1a00b0015817e607a6mr4466137pzk.42.1695266486355;
        Wed, 20 Sep 2023 20:21:26 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:26 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/11] Staging: rtl8192e: Rename variable Time
Date: Wed, 20 Sep 2023 20:25:05 -0700
Message-ID: <20230921032515.96152-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Time to time to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a57673ecf791..fbac0e598cf9 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -10,11 +10,11 @@
 #include "rtllib.h"
 #include "rtl819x_BA.h"
 
-static void activate_ba_entry(struct ba_record *pBA, u16 Time)
+static void activate_ba_entry(struct ba_record *pBA, u16 time)
 {
 	pBA->b_valid = true;
-	if (Time != 0)
-		mod_timer(&pBA->timer, jiffies + msecs_to_jiffies(Time));
+	if (time != 0)
+		mod_timer(&pBA->timer, jiffies + msecs_to_jiffies(time));
 }
 
 static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *pBA)
-- 
2.39.2

