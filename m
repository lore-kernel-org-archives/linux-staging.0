Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC7259E
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 21:12:51 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso12608045oti.11
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=lYGlm6f9hRZfWcvjLtk2u1uECx/OsINvUuHizYsL5p0=;
        b=AlkB4TUOWI8w6++//9eiTGeZfnj+FP4fONZLRXYacQlcnY2ASqQS42+uUKjTZDjSbv
         3/bHNoxFVTcYO4fhf63MMjhsFau2txb6zXdaeEwPy4/x1/63441TQ4WiyVrZtsFaPUkM
         tGLgfBiPH9oGhS4h+5uC9UqK0q4i7O5qCo/mIBqCSrVNOZAEz1Drk7CA/0XVdOLu9RXC
         muYqjgfoMOYyKijlrQRjBONp3R5rP78j2DOAwRP5wk4MM17mML60RmTAyMBUJlgNgy7m
         //p+aSvmptIQ6Yo/jIdBGir92TTT87dudUiR1HMkQnFTjmmeBpeW+chfvnuW5IYRo9+R
         x6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=lYGlm6f9hRZfWcvjLtk2u1uECx/OsINvUuHizYsL5p0=;
        b=N+uFFOIj+yaRx9fFF1GuXERbahJ0xa27JYWo8K75/blxbytXFTXDMOv46GEtr94JRa
         72t4mPcdKSm3ZBiDJyiEGuAgIpKmK4lyzxpThywdYTZBEOMDAu+GIslMNdMI+aGLGS9t
         Jhu19MFZKTaoWNambT+JVrPLL4+uLv2oVCOZeamu6b7P46wD72xiKfxZoRINRyeTnlr8
         69l6xVefIL9q9G8ooYDFFBd25Bzuqc6B8xqSZ3fBKZZ7QLuEtuIAM0QL7qszYBJ47ObE
         CyToLGyD57Akpo5tW+OBxK1+mKgJ4CaZ8xET/1axCkMq8lgAnMlssIQskZ3gPWY2FHjD
         WAmA==
X-Gm-Message-State: AOAM530jSi0mWdIgniikKJf8vR6BOaOQ2MDEcjVRiQoQ1b+YRwP2iOL9
	dWyP55dd/v0QSyo7NOozYA0=
X-Google-Smtp-Source: ABdhPJyKP6WYlSNq8PN6FzokKUDIR0wPYA4MMy8A1vkpGwPPV2Z9I61Q/ajpaJZgN80b1Fkg7s7ljg==
X-Received: by 2002:a9d:1c7:: with SMTP id e65mr23709619ote.259.1617657170705;
        Mon, 05 Apr 2021 14:12:50 -0700 (PDT)
Received: from fedora ([2806:2f0:7000:86b1:c1bc:6875:f962:d652])
        by smtp.gmail.com with ESMTPSA id g13sm4178255otq.3.2021.04.05.14.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 14:12:50 -0700 (PDT)
Date: Mon, 5 Apr 2021 16:12:48 -0500
From: David Villasana =?iso-8859-1?Q?Jim=E9nez?= <davidvillasana14@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Message-ID: <YGt9UNqRnOx2j+4M@fedora>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Bcc: 
Subject: [PATCH] staging: media: atomisp: i2c: Fix alignment to match open
 parenthesis
Reply-To: 

Change alignment of arguments in the function
__gc0310_write_reg_is_consecutive() to match open parenthesis. Issue found
by checkpatch.pl

Signed-off-by: David Villasana Jiménez <davidvillasana14@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 2b71de722ec3..6be3ee1d93a5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc0310_write_ctrl *ctrl,
-	const struct gc0310_reg *next)
+					     struct gc0310_write_ctrl *ctrl,
+					     const struct gc0310_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
-- 
2.30.2

