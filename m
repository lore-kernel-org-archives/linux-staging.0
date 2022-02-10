Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD82F23
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 06:02:14 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t1so4100430qtq.13
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 22:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKrz6bApi0/dsmE95e4g0zGa9CuMMOhYtsPE3YuMXWE=;
        b=hQw2cIl4ZF4Usav+Wpu99AIfOMknmyChe7N4wleG0Aqh84i0EYKXwuPtxfprUWsYro
         hwrHjwskZM9feaFA9SQatg8ZnR5P28T83p4u9EJ5AjCcAq6GdGsyS5v3J/gazY1Nhr3M
         4maSe8esqQGnkPir68BRJ0qCNDBKkF1Hu64pyUgT5hjQ07vPp4GNv4kekFM9kiVuUJgm
         qjbZllq/DvUx79jgGssoHGVzOWKOJDTOgu/So2qLGky7Cir2ogq/3oG98uKEJIQBjm4m
         BKcIBRmToGjo/HI7f7Uq+VJrjLfXCfspfcDpxCcc1cxKmUj/DcF7VIcqrCJTw+4nu7K0
         zeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKrz6bApi0/dsmE95e4g0zGa9CuMMOhYtsPE3YuMXWE=;
        b=CBEtHc9yEIAlilGgFPmCO9ssfU25ri8plxTyFG6y6q+9wzmjgiQgiwRlC1+s6buLcN
         QjcmJvsc3GxXXphMe41GgXh9I4XeO2ah1SNyyxQXDCHTLUOgDyh2bucoLtzzpXMr126J
         WBM7CFRIS50FyyzVBCnWRkYw0XynoqtBXZf4+RPPbofzRRvZETiTvokBTE7C9UKwS2aQ
         uKqcjxvCCGBlt+F+r06tzVrUAh3X536+2n7E2cMJHV0TqR7dNst5OHSbCf2TmD1kScEY
         yFJv/gulbiSGPn3GIQSlGFVOxjjQnzlIuWcgZJf5px5N+mqqajHKpoZNniE2ofc41J+i
         skxg==
X-Gm-Message-State: AOAM533GenqP62z4TqhNwVDVWuGX+1Me5bqVbJkPkJ8tFe8m3HV6MQfe
	0alMa6XWvdTXsP0xQeSdt9c=
X-Google-Smtp-Source: ABdhPJwsJcp4q7PEnSA447KhyLtwRARtizksuTwP1Dav6tE4wkPVKCyLIGMnuqsMHDXS0p0l8STZrQ==
X-Received: by 2002:a05:622a:64e:: with SMTP id a14mr3689197qtb.212.1644472933488;
        Wed, 09 Feb 2022 22:02:13 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h9sm10009584qkn.121.2022.02.09.22.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 22:02:12 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: rmfrfs@gmail.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: greybus: Remove redundant 'flush_workqueue()' calls
Date: Thu, 10 Feb 2022 06:02:05 +0000
Message-Id: <20220210060205.1607792-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

'destroy_workqueue()' already drains the queue before destroying it,
so there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/staging/greybus/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 37bf04c22dbc..25bee5335c70 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -858,7 +858,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy_dev)
 	gb_connection_set_data(connection, NULL);
 	mutex_unlock(&host->lock);
 
-	flush_workqueue(host->mrq_workqueue);
 	destroy_workqueue(host->mrq_workqueue);
 	gb_connection_disable_rx(connection);
 	mmc_remove_host(mmc);
-- 
2.25.1

