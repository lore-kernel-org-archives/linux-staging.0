Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1738832
	for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 18:57:27 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50671ef0c48so433040a12.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 11:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681757846; x=1684349846;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE3ERkCAWNr9wsRiVjR5cLI4utcW1wDlpWiM4VfO9CA=;
        b=QgcNlMMSaOqpEEifxEOpSwBrj2tQtwettx6DMLLZnmsjhoP2cn/gVqpPv7mMHHMDey
         PudCINrwhvxaKJWnuv83QkKAScVY5zeTwoJVj7Q4MoVbr2+zR11GTzp2VlD83Wi2X/a0
         K0vhohuy4F9BAo6Qk9FiMQP6dljIKi5RgfqZeO/jCc9aZkSaTrUxT0fAEYl2bzFRUQIB
         Czg2o2dOSCEzDduyTZXpxcmJ9w22oTn9hhFmqOwV/BFPv5TYJ/ng5NbG7TNI15oYO/Pw
         o6BrNTzvpxW/uZi2ScLhDBT2HK/eeFHuAG2tSnGOonwUhBUia6TBwqTs7EVxV7gi67Lx
         OcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681757846; x=1684349846;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EE3ERkCAWNr9wsRiVjR5cLI4utcW1wDlpWiM4VfO9CA=;
        b=hTrDhDXwBCcjyydkixYEpEsvst5S0jd3JEA6yM5ZaQ02wWZlKs5q7tdF9w10+ho2NI
         ZLFq28+1/SZtlIzv5C0R+Z5LB+RrOBDJ7roMG9FEWYPYKXVTzEPsRzWeLsXFxGpNmyWh
         q2l5GL3qw7pJ7hcp81j+FiEw9iV35vuylbuLixHyo7MlpDNii/NFoLghyUdSxBTwylp5
         F5A+4EFuKrfISkMLfzBeGQdUWbat5WLmaD7tWABNRXVoC5MTaBNTes8Y5bDe3U1epjMT
         Zjxq0ul2wCokmV7hFkwQVTPCcdoBxuNpUURsOPA7NY2KFR/FwKTYER1P3E1yI+KgH4tH
         RL/g==
X-Gm-Message-State: AAQBX9eWI2nois4LMWx7euX+e8pSfeO6F6rFUeqbnBGKO4d4gpjrkbns
	1P5dHAFRoHHhV33PxOD8aQs=
X-Google-Smtp-Source: AKy350Z9BvcKcVnbQRVW+ZWpFJDq57BbyIyojxmsBJFgZRkjQImhmAnTEJSNNw+5tZ81YagP8zkEeQ==
X-Received: by 2002:a05:6402:2692:b0:506:6c2a:528f with SMTP id w18-20020a056402269200b005066c2a528fmr13426094edd.4.1681757845693;
        Mon, 17 Apr 2023 11:57:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id i10-20020aa7dd0a000000b0050685927971sm4590105edv.30.2023.04.17.11.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 11:57:25 -0700 (PDT)
Date: Mon, 17 Apr 2023 20:57:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: Fix W_DISABLE# does not work after
 stop/start
Message-ID: <20230417185723.GA11245@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When loading the driver for rtl8192e, the W_DISABLE# switch is working as
intended. But when the WLAN is turned off in software and then turned on
again the W_DISABLE# does not work anymore. Reason for this is that in
the function _rtl92e_dm_check_rf_ctrl_gpio() the bfirst_after_down is
checked and returned when true. bfirst_after_down is set true when
switching the WLAN off in software. But it is not set to false again
when WLAN is turned on again.

Add bfirst_after_down = false in _rtl92e_sta_up to reset bit and fix
above described bug.

Fixes: https://lore.kernel.org/linux-staging/248ec330-b4c3-aa7b-61eb-69ce8d333b69@gmail.com/
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Added Fixes Tag
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 4cf84b5666a7..27040d1e3230 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -645,6 +645,7 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 	else
 		netif_wake_queue(dev);
 
+	priv->bfirst_after_down = false;
 	return 0;
 }
 
-- 
2.40.0

