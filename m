Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA43FC5
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 20:02:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id e15so33555265lfr.10
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 13:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DA2UKuLK2u92CFl87mNPANcMsuKDJqU2qIFoERzDd/w=;
        b=BhK92otjhD3xaxoPKxq8dGARgg4mm1Yl/hJdJw4FaYlMMMUDh8XYYkLIXLlRrUcvEa
         SpiIDnHHH2Ts8FQYlgNsK31m5lrpwXsD7w3YX+67a320Ssw9eVrDeE3yDFLOm2qsbiuc
         nOUcfuxp7d/0tJuU9ufuJTd4soHpkSLMMumM4rTCSfo3GixbMtiMqQ5qrjmRQLglj21Z
         rZNEu0yyPj3f1tmgHCaFD1BxhRfUz93JIe2BAwANsdzvZOrKd86sRxAzwK3Afqwu22Ql
         9as/7e5rXVAyoPUA97+wwxJzBDvZq0x+slm1de5IDNIHUDJ6H101EDmLTLenOdFcaV8j
         IElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DA2UKuLK2u92CFl87mNPANcMsuKDJqU2qIFoERzDd/w=;
        b=0ywg2hbO27bX0vPZKd33yM4t+u/MMLbW1TNUu7kvuwLNUJhV4v/CYOfj1Ptp9Zn72F
         pOGyW6jgk7dAElS/L6PGX3/OuAV5a/kVnmD4HDHHCQV8GmpK2YbZJJ6mNSO+rr1NLIhO
         8lUiW0wHL9fXLCrj+Cba5LdrxbVusvmweTCtz8Wdj0FLNP9IH5xtRKgVOlpInTj12PHf
         2gObKxfY+WBUijUk54BHLJcxJnPzHEi6PAfVNi1OJhQ1q2uCuTkpfDH18I3deCItta+f
         K/oJG07dMTSbH75v2ympsEMLpZRgRYSHNW5HNjgD9+8QhKjbA4dCUj+psPZT1Mg+Mzcd
         5nzQ==
X-Gm-Message-State: AOAM531m2sRK0228NPKTZfJwYLWXUomgcqU61y7Z+EepCCS/Ux2B8KLH
	glavd1eq6hqs6XxOj99a2M8=
X-Google-Smtp-Source: ABdhPJzzUtG5jeCmlfMAoFe1F0K0Lo3jMvKyIPC3Q9gD9Q2yW5gij6hetl6DT3481fOrP1F4wLtLSw==
X-Received: by 2002:a2e:5442:: with SMTP id y2mr22916242ljd.436.1632168135294;
        Mon, 20 Sep 2021 13:02:15 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id u3sm1350862lft.149.2021.09.20.13.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:02:14 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: hantro: Constify static struct v4l2_m2m_ops
Date: Mon, 20 Sep 2021 22:02:10 +0200
Message-Id: <20210920200210.18935-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only usage of vpu_m2m_ops is to pass its address to v4l2_m2m_init()
which has a pointer to const struct v4l2_m2m_ops as argument. Make it
const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index f23fc14b3562..fb82b9297a2b 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -179,7 +179,7 @@ static void device_run(void *priv)
 	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
 
-static struct v4l2_m2m_ops vpu_m2m_ops = {
+static const struct v4l2_m2m_ops vpu_m2m_ops = {
 	.device_run = device_run,
 };
 
-- 
2.33.0

