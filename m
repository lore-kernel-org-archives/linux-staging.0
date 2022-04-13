Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3112F23;
	Wed, 13 Apr 2022 20:47:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n18so2956812plg.5;
        Wed, 13 Apr 2022 13:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=be5a2/43S2y7TX9wwwrDnw/bjLnbJgKykHG+dWjZkfA=;
        b=LMqiKsOdHl3qiD5CVgiBaMXL9q36SSBZJJDryRCoxbymADtXB/I1B8EtTkQWM3esLv
         Ge8jkbVG4TfesP0U0Bj4zhH+sI0L56XIwLo4KtJV07LSobiFXQxyotIUxmxOx7mdBtWt
         KzcDPIjIxB/8w5k5R3qLk2jxAgQ+1JUEBSkSXgQpCfroiTXWEi0qMwTW56DQ8nZsM8VD
         LxMVG59iGAaqKJM96xq/zph1DxgTgNgiqTAgvkp0ukk3R7zXXaDjCvfOWCIjpk6risDV
         14wUYs7qQcZH6iTKvGRZc9gLmVuAX9YznbsUuV8HCnf7OBnd1d3CZMQRMkMsmreA+XDQ
         vwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=be5a2/43S2y7TX9wwwrDnw/bjLnbJgKykHG+dWjZkfA=;
        b=Rky+/SRlldeGCFTD0sIrB9duxxaF0NYbMGm3hytBZw5OrR/K2uKDyCROCcinoxz3+4
         CkFBtiFKY1uvM7ptIDzCl1l7FxrH/cxZHtgopZVem2oScpndPSz9aShno7AsfxaiheQV
         POIvprLaSNXxULfx78K6Mktvr8E+3DgfLamQpTHwlBpP6gNdeWEKLu6RhpgpGMgALSy1
         gCsB8v8HayZ5OYNp1abAFjPm/hze4K26ZpLRCrofTzMiru5SKxTJGjVL4sDYZzg8+Xzd
         tNpLX48p1PyiRhGPJS+nOpvSJB5LAj2Dm4VFOf1hdXkEkFytS7EwGBMKOFXfuuTVxsbd
         QbjQ==
X-Gm-Message-State: AOAM533IVwpCH0iaasBQhGHZgb7iF8BdEQH70zQ3+E7a4nO21zvclr8G
	b0UoOIoBurqBoFs304ptgL4=
X-Google-Smtp-Source: ABdhPJw2KAJnRzbaBqMr/7Fb5m+kgD9gVR3m14s7TFeBR66xPvdjDCSMfucq970QR5LGWpRZpDl2LQ==
X-Received: by 2002:a17:903:4052:b0:156:229d:ffed with SMTP id n18-20020a170903405200b00156229dffedmr44109668pla.98.1649882838794;
        Wed, 13 Apr 2022 13:47:18 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id w13-20020a17090a5e0d00b001c7d4099670sm3836115pjf.28.2022.04.13.13.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:47:18 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: kuba@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: ks7010: coding style fix: use tabs for indent
Date: Thu, 14 Apr 2022 02:16:49 +0530
Message-Id: <20220413204648.60358-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added tabs for indent to fix the checkpatch error.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/ks7010/ks_hostif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index f1aa3be4261d..d0475189607d 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -2213,7 +2213,7 @@ static void hostif_sme_work(struct work_struct *work)
 	hostif_sme_execute(priv, priv->sme_i.event_buff[priv->sme_i.qhead]);
 	inc_smeqhead(priv);
 	if (cnt_smeqbody(priv) > 0)
-	        schedule_work(&priv->sme_work);
+		schedule_work(&priv->sme_work);
 }
 
 /* send to Station Management Entity module */
-- 
2.25.1

