Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8170
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 13:43:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso8724309wmq.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NycMU0cz3kJfBn80ZlCBYweE/JLtLsmBXUcJn2/DB0g=;
        b=ZSNuqAESESzRNHrvcezSyPa8BAQkVixnafp2tzGO0dkZJ1EEUb8Wl/KCJX7e6j4jCG
         cKHd+NpbLjIZNNPbMqA7rW0fd4C+Ojc7tUQiSjdY3aB6WaklUf5Lvjxvp33rObgYMZfo
         KH33N3HrMQ1jwSbupofwA1/GhJdtsFAQpK17Psf3rNAM482IAXLbwwmBWeIsC7auKjBN
         VWa4ltBhdfq6cEpNWW4v282jdZlgnyU/tjK2oiebHrnRHnIomET3eSPKFhk+3bPo56rc
         aqai6Mo7EK7wJYm7qRijOAPLm36+oHlOSMvur3bltweo72qIP2meJR+HvR8IHI/GrMjC
         sqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NycMU0cz3kJfBn80ZlCBYweE/JLtLsmBXUcJn2/DB0g=;
        b=o5foxddXEr68uEeCi0Mg5CnsXzaojvhIeXiv25tOzXvrEwtZMCCh2k1uZK5G9Yw7Hj
         a8/F5JhN836qDOHmIbRi534MZY7liAduLj5fnitY99vOrfo9MQuOKKfxniYzyYbt3DGU
         GN4NtBV7nYWEBMF1ZMyOhjaiCuD0KVXB8YPO/VjSaO1G6IerRWaVOJZeOw77ppFPJ4FC
         LaJ1BNsTPzRdj2AiTFmYr3ZdimeD9cRjcu1uU9EQroQf0xnaX5ZBditeDm+QHmUqD2nN
         VtiLfn/HkIjILbTkNqp/OKwLzj7Rkf0NDpPv3CvKBAFa4h6AmMROpREs5c46NGDvKrg3
         OuYA==
X-Gm-Message-State: AOAM531R+Vda+YEMEDtpInv5aRrCAeHHcmI9RJlHAbfq2BA4srXYalix
	koVbSVrkKAQoys3zEDm3iuY=
X-Google-Smtp-Source: ABdhPJwcSkVXUE7+Gw9X9xA2TbXb4xDJcYCcBeUJDeOR+rci23+7/1ux6sGk/mjaEAZajumf+kFwVg==
X-Received: by 2002:a05:600c:4f13:: with SMTP id l19mr25592568wmq.89.1618234998788;
        Mon, 12 Apr 2021 06:43:18 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:813f:b20e:675a:834d])
        by smtp.gmail.com with ESMTPSA id f6sm9313922wmf.28.2021.04.12.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:43:18 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Cc: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: [PATCH] staging: media: atomisp: i2c: align line break to match with open parenthesis
Date: Mon, 12 Apr 2021 14:43:01 +0100
Message-Id: <20210412134301.11587-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aligns line break with the remaining function arguments
to the open parenthesis.
Issue found by checkpatch in file atomisp-gc2235.c

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 78147ffb6099..6ba4a8adff7c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc2235_write_ctrl *ctrl,
-	const struct gc2235_reg *next)
+					     struct gc2235_write_ctrl *ctrl,
+					     const struct gc2235_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
-- 
2.25.1

