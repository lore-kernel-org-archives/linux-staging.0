Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D03210
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 15:31:49 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id ea7so16757548qvb.12
        for <linux-staging@lists.linux.dev>; Thu, 09 Jun 2022 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4U9tS0TY3KQZ435ts/jOG5/NkA8FDER6JfA1XuwruEc=;
        b=GO/ZD7nJmNNk5znGqfkplygLhVlLFll4LrMSC3aMHrJN95dIQM47T+WK6Hf358NNed
         pkdfFs2NnoU/a1wY9wkHSerQRTWEZ6TVrSReqSDEKcPt1Xj+pcqsWG10+o0ynboeLcef
         /ffECQsZZuozFGNsarwsPNyJmCb4YrfRV6ELPYtc1q5AoU3Qd4crtNBUv5ICZhONtUC8
         o3ZkfFIN6IWLKEjvkYvTMiihc/uFcaQfN+CwpNJgvah3wG+IUUe73IwABrsE5RON9zQh
         22jK5e/NEByz4FYpel0RBOOC6cqBmcTMdHKhQr3fojpEpTzIrIBMSQfHw/nHyr2e4EW+
         8YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4U9tS0TY3KQZ435ts/jOG5/NkA8FDER6JfA1XuwruEc=;
        b=tgwS0lgeICocfLLqgk/0En/02KISpH61xAaUnRegQXkkFLcKrbKfsUFbbZs7cyr4Hf
         VC3Fyp+4WP+rcwMJWold5QlctDHB/1wohyGYmWwP4jNcACXzcv5qepDHeOuqn4x9YgXm
         Am1hXPEQ49r54ZyHbR3W/+CkFfZQmxVI/WVH6tNcPRXSvkWi+8PdyoKwGXKCL1a3OVei
         ep28Kp9uJjMQcz1f+x9SQtgBhGRPVi0KISCPHDWQKYlCYcXhmQXsCmTj33Eph4qwy39s
         gPSAthswbB9OEhK7Rd75KMt5ZRwDrTgDfUz9NmSdGr4y0erXP/2lCBkgOXk4zc5Y8lKu
         6QCQ==
X-Gm-Message-State: AOAM530Zc5Q2UlXvrID0mQigIoHvniKmkg+4QtGcadXwNUdFD5cH+WJH
	us8XlONmg/Q1eOtqg2az+uQKhQeDfKCLNsJC
X-Google-Smtp-Source: ABdhPJyGw3HPEdkBQ1FLH0cDnMy0u+XWLFOapa7dgKtiV7lxnCmyJZfpfNO1C2KgxZU2qzih8jwhTg==
X-Received: by 2002:a05:6214:ccd:b0:46b:b0ee:bece with SMTP id 13-20020a0562140ccd00b0046bb0eebecemr13867099qvx.114.1654788707834;
        Thu, 09 Jun 2022 08:31:47 -0700 (PDT)
Received: from Agam.hsd1.mi.comcast.net ([2601:402:4500:22e0::e952])
        by smtp.gmail.com with ESMTPSA id gb3-20020a05622a598300b002f93554c009sm16795726qtb.59.2022.06.09.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:31:46 -0700 (PDT)
From: Agam Kohli <agamkohli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Agam Kohli <agamkohli9@gmail.com>
Subject: [PATCH] Staging: rts5208: spi: Removed unnecessary ftrace-like logging
Date: Thu,  9 Jun 2022 11:31:44 -0400
Message-Id: <20220609153144.11803-1-agamkohli9@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding Style Fix

Signed-off-by: Agam Kohli <agamkohli9@gmail.com>
---
 drivers/staging/rts5208/spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rts5208/spi.c b/drivers/staging/rts5208/spi.c
index f1e9e80044ed..0d2d065508d3 100644
--- a/drivers/staging/rts5208/spi.c
+++ b/drivers/staging/rts5208/spi.c
@@ -460,7 +460,6 @@ int spi_set_parameter(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	spi->clk_div = ((u16)(srb->cmnd[4]) << 8) | srb->cmnd[5];
 	spi->write_en = srb->cmnd[6];
 
-	dev_dbg(rtsx_dev(chip), "%s: ", __func__);
 	dev_dbg(rtsx_dev(chip), "spi_clock = %d, ", spi->spi_clock);
 	dev_dbg(rtsx_dev(chip), "clk_div = %d, ", spi->clk_div);
 	dev_dbg(rtsx_dev(chip), "write_en = %d\n", spi->write_en);
-- 
2.36.1

