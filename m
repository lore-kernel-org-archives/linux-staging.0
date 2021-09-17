Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27EA3FC9
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t18so17689863wrb.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVr0STWCT0vadAEVLvK4H+2tlmiDZVUwHL67IoyY9r8=;
        b=UwBBKehRXoIdIhAznDWq1YgzBlKTXIKjVdkNas6jDWfhdvm0jZZVLk5aBtRt7rZr2k
         EKJ2A12wInuUeoVBBMUI76lqMM92MASbV8JX023hDIFW03EWVQ2x1PEvPRAntd+y0tKW
         gxAW+kevC00k5jchmMzI05b9hRozo+DhZvsBuRcvYg0UejJMioK9oZKGIPIQwYuHsxCz
         A6W9mfc6GeTJyjietMHl0zwbSYT6ICRCiq8LH5vKhApj4avRkIqYityJJmZjMNBMm7MQ
         Yhzr4tDR1bT0TwV69Zju5m74R0WKZ5GTjY+iorJc3q2EL3HpdueFCL1KjJOCFYB02GKl
         fuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVr0STWCT0vadAEVLvK4H+2tlmiDZVUwHL67IoyY9r8=;
        b=DwGl7noNyAy4lzWzL16MvrEHA7P5zk2ZeJ117B+MhWoR2wv+y45dQPXEHmarKooqwB
         R3D54FCveNrczZpkxmZXBJbDpOAeesoKgvXu5c8k9QJrfUAloKP5NYXtx9pZuSg4LrBI
         qy8Tjd/z2vizLh4vO8UW1SOrt8LNOJxsc4GTjqDo9vXlNWpkzYa+L6G/GzsBxBE5jKRs
         0yu1yymA8OmPwyTRu1wCbuYMPQ/yVTYk6urGy6QpxpSskTRtkJvb8vj0Ib8A4GEfiQ+M
         JQUWjyJeRUIl0P6buwK+9OAhXthJhtby4fyQ5QCPbLn6iNzb1gMC/L2xwlf+PSCk02+d
         2y2Q==
X-Gm-Message-State: AOAM532IiY5+IkV4YSzlbtpEXNeYEmjuOFo5PPQb0RFmQAdX0TpgtNhR
	usaTSt7ZmFs/BWnDT1SWpsU=
X-Google-Smtp-Source: ABdhPJwD1eLXjR5TRvW7s7+q2x47kcBu+xG7oEGfcnMIfZxBjlLj2ORKg4xEIKPO6eZYXlZnGMqeKw==
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr14864823wrn.400.1631921473151;
        Fri, 17 Sep 2021 16:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/12] staging: r8188eu: remove ODM_IC_11N_SERIES, ODM_IC_11AC_SERIES macros.
Date: Sat, 18 Sep 2021 01:30:47 +0200
Message-Id: <20210917233048.31677-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros ODM_IC_11N_SERIES and ODM_IC_11AC_SERIES are unused now.
Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 265583a43494..0d85e4fff6be 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -460,11 +460,6 @@ enum odm_ic_type {
 	ODM_RTL8821	=	BIT(6),
 };
 
-#define ODM_IC_11N_SERIES						\
-	(ODM_RTL8192S | ODM_RTL8192C | ODM_RTL8192D |			\
-	 ODM_RTL8723A | ODM_RTL8188E)
-#define ODM_IC_11AC_SERIES		(ODM_RTL8812)
-
 /* ODM_CMNINFO_CUT_VER */
 enum odm_cut_version {
 	ODM_CUT_A	=	1,
-- 
2.33.0

