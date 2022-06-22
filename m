Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272A136F
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 16:39:06 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 68so11140690pgb.10
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 09:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=kvH9tIFDBGzF2qqwqEbwZArTSprppY4/+ZltmbRD2YY=;
        b=G7gfkdjLS0ZD4Luss8VUR6S0XlwWbjb/duT+CBtuvIkV09ttO3iCWlNiuJc2lqN6Xv
         FY9xPZZ51HODyLlmKTn3SMhKpqQJdtXpiihLVCJ8EXiQcO3yznLqjLZHL76tlC2cbdcg
         +9nC/7rndCsEO45wBGGWIZr7XPec+2sCe7TrnWwh+M2boGzXjKoQvghvh70UhGCPJ2Uo
         5mmfZD5rZyOL+gKU9HXrWHbp2eEacuuZK3+U0yIglj3qoXCfZVGsbVhXxzfEVwd4Ui0T
         fdEO+rcp/AlWjZSEqmq2jskhOuQA6319lbQ7Jf/VMeH+zI9TjLVO1MG1rhGyBViRrLOy
         AjHA==
X-Gm-Message-State: AJIora/O+2upm0L+l4JeL2SX/UKyqdxvMB+v1n9lRVDVNT1JNJj9q/kt
	YICKCwMLpigc1FV7os9gwcc=
X-Google-Smtp-Source: AGRyM1tiDa8CHLnECkxikPK9fTT0aLy9coDBf0pW7aC6otzSHNcUm2IPvFXPzE/NFAt3WeeYbZK/gQ==
X-Received: by 2002:a63:6943:0:b0:40c:3020:d0b with SMTP id e64-20020a636943000000b0040c30200d0bmr3701584pgc.34.1655915946090;
        Wed, 22 Jun 2022 09:39:06 -0700 (PDT)
Received: from karthik-strix-linux.karthek.com ([117.208.185.173])
        by smtp.gmail.com with ESMTPSA id d15-20020a63a70f000000b0040c762eb57esm9300449pgf.82.2022.06.22.09.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:39:05 -0700 (PDT)
Date: Wed, 22 Jun 2022 22:09:00 +0530
From: Karthik Alapati <mail@karthek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Wang <vulab@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/atomisp: use max() impl
Message-ID: <YrNFpF2qvTxpZP8e@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fix a coccinelle warning by replacing opencoded max()
implementation with max()

WARNING opportunity for max()

Signed-off-by: Karthik Alapati <mail@karthek.com>
---
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index a3aae638b0bf..0fa91628a463 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -460,10 +460,7 @@ void ia_css_frame_info_set_width(struct ia_css_frame_info *info,
 		IA_CSS_LEAVE_PRIVATE("");
 		return;
 	}
-	if (min_padded_width > width)
-		align = min_padded_width;
-	else
-		align = width;
+	align = max(min_padded_width, width);
 
 	info->res.width = width;
 	/* frames with a U and V plane of 8 bits per pixel need to have
-- 
2.36.1

