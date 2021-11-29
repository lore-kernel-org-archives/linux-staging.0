Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C846829CA
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 23:06:29 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d24so40265883wra.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 15:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIbZUt/YFgWRfyP/uXvxQWzY6RB+wFRt4dt1V30FGkg=;
        b=Wr2c/Dakc89dINMCpGVmmSgkuaFb96bJvgg6Lratrao/MuWUSrAHxvzVQIVoaxkJSn
         l2iEM01jacukj6GsQ09Z9rezsHNWBuiNXJwuGEi+1uiINAWWZyYM22rBg1oMvZnfWaHc
         h6UDEpZfTgBf83+/AvRfPqSPJeR4RJVxkYK19050Sh6HQ4C4j86dyRCNIfAWgPL0867B
         djMo31UIHRBvlYKhJULi/F78udFQQFMrh+Nwj89Ymq+pTYqS1Pa4RATiPutsIvpSxcNk
         TVT66okLupg27o03asdx13avEGpYGN7Z2y3qHXNalUwN54KCNekh+1A+Tt3om0Y5DaTD
         uIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIbZUt/YFgWRfyP/uXvxQWzY6RB+wFRt4dt1V30FGkg=;
        b=Py/yZtl1aQ+oVtWSrxc+Pwcjy0ypitzI+U86654EkWCynC701GtxveVERTyTkga+iA
         WRnoQp1pgVi3GY+HtRS3yPSpiPW1v3EI8giOZq4FtZaSo3qcOclWWkSlwjs+PKeROXLB
         RkOt4t5PaPgM64QBSS3LU9lxEg2w9p6yWpoXTh8eTVyIJuZNbIJgoiabQwC7e1L/18mh
         uz+RsdEVZAHfoNzOemOmMkfKW6abIXfB+EuzazshqeuROUNKkNfd83PucSxGL0mmIJ4u
         JkRle63CIElIgf5eh9SUcsAkesf6P0C66nMf8660k4YGqUk/hqY9DDk7rW3tClMPfsTU
         5ZQw==
X-Gm-Message-State: AOAM532AyAOxuk08ri97tWFULG7O5VaAm+Huc/1vOpkUNkaubSLPumik
	Ys6ElJ057ruUyg==
X-Google-Smtp-Source: ABdhPJzKV1nYUF1XunQDqsImT/BMVzjWBD/ZtbatqJyIP557SuvlaBHZ0QnZVC9qC4FJg4NX1FO+0Q==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr36446791wrv.240.1638227188186;
        Mon, 29 Nov 2021 15:06:28 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id 8sm552690wmg.24.2021.11.29.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 15:06:27 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: make array idx_map static const
Date: Mon, 29 Nov 2021 23:06:26 +0000
Message-Id: <20211129230626.549090-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the array idx_map on the stack but instead make it
static const. Also makes the object code smaller by 16 bytes.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 41ed8e4600ff..09f87c285b8d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3399,7 +3399,7 @@ sh_css_params_write_to_ddr_internal(
 
 	if (params->config_changed[IA_CSS_MACC_ID] && binary->info->sp.enable.macc) {
 		unsigned int i, j, idx;
-		unsigned int idx_map[] = {
+		static const unsigned int idx_map[] = {
 			0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8
 		};
 
-- 
2.33.1

