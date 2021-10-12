Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BCE2C83
	for <linux-staging@lists.linux.dev>; Tue, 12 Oct 2021 21:47:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id t9so2813298lfd.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Oct 2021 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUVv9MTjN3o4lS4ubMPiD1BExy7qbG6BXOOhNOMCzhI=;
        b=FooP3E8Nhhx6bq4Jp1qsHB6rl4d1cGpg9dHHqtC1eQENLPUqhufHKiJR6HmpbYKC89
         XSE8KQaTXvhRjA/reL/kDv65k3lly5oXpuHojoitApvUH1j9P30m/xoT5DVMt3uY3KPA
         K85kr9uxfKRh2+QAhf7RgCgqtywUce9NvEGeI1jfd2ymCjL4A4H79UzpNBHN82U/uVTd
         yjkobqhckq8ffxdniBD0lMPELsPoTGzrZ5A6TXmoP/zgVDBUOwlsJKLs+dlSAd0b8xEp
         mUTMU+LhlMNYw8hMb+gisSs5R7XvuID1vOkjDLpxS5GhaSUzN3QJQ0AA8YtMJsceGEvE
         8WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUVv9MTjN3o4lS4ubMPiD1BExy7qbG6BXOOhNOMCzhI=;
        b=4FkWR9h99/T1FYdJce18MrtKEzY8Ag6VyGoCAt2RnUmaXsrm0VYxPvE4+p5EAacftL
         0iWHBcySvlLgYKKq8BQ1EAbWP5d7wK/OEoMRwgP+QA4fT2nPAHmCgZ9McyUFDjuFhGOt
         fPZzoRbcbrxinj/V5OUoAYhrNW0w3hohr7xROHm+KgjSLFhP/vHhXSIvJYih0KWV5son
         3QX0BSwpRKqpRUacV0XfsCxEs0oecD+UqFzJzf+p8PNyUZfnkQbB6cM3Eru+hGOJT6xh
         AHg/ZJe0uPnaOVR75LR8hRzDF9P2pOTkklx4Eu1sql+2QnOOCDi86P8BicVmsv+dxfkh
         FALQ==
X-Gm-Message-State: AOAM530rLbTg2/3YD3sjst8rju/EJ5EA+9BxeZa2q20JC0sjnZTgnGwP
	hr6fpQ6Yg0IQe1Q2N9jYP5c=
X-Google-Smtp-Source: ABdhPJyRBMDkpJFUTFQS7G+4/N1LZlZozF2NmOFa4a06BCK87fLlm7HZcfaClFpk+h1lXvzKFoozXQ==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr4758736lfg.617.1634075247497;
        Tue, 12 Oct 2021 14:47:27 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-5.NA.cust.bahnhof.se. [158.174.22.5])
        by smtp.gmail.com with ESMTPSA id e15sm344837lfs.35.2021.10.12.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:47:27 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: imx: Constify static struct v4l2_m2m_ops
Date: Tue, 12 Oct 2021 23:47:03 +0200
Message-Id: <20211012214703.25433-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only usage of m2m_ops is to pass its address to v4l2_m2m_init(),
which  takes a pointer to const v4l2_m2m_ops as argument. Make it const
to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index eb6da9b9d8ba..1fd39a2fca98 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -820,7 +820,7 @@ static const struct v4l2_file_operations ipu_csc_scaler_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static struct v4l2_m2m_ops m2m_ops = {
+static const struct v4l2_m2m_ops m2m_ops = {
 	.device_run	= device_run,
 	.job_abort	= job_abort,
 };
-- 
2.33.0

