Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767C7C;
	Sun,  3 Apr 2022 19:17:59 +0000 (UTC)
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-d6ca46da48so8318528fac.12;
        Sun, 03 Apr 2022 12:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rsazcajhwAV1pXduS7vg1S4Bv/a0jWiLu0YfVDB4Bpc=;
        b=fD8XtscC62a8RjjvUesg11cshBRy2kBxbHskMpib/MzQ9FOgvf7cHyh8QcNxhdMypf
         tW0BxL0psdUKT0v5VoFGFiYGhxy79v/Ek70I848q9TNL1Tchadv04Tcah2LMHHO61FwW
         n+DzV5BP/TWXXil5iFO2DY9d1SFcjSx+DP5nKaMKeng4zk9riZSPWDCEV9BlCAQ9hiU0
         4EPzGpF4qiPkz97BE3crZvbpuftS7hfp8DNi9nuphTPIhI1xhAcWpVHvnG+n00lFKKdA
         65XaQNgY28zJ/OqMB1I9qD+X4VJ40Tjzx1oqpzUyYU1bDz+x0ewiRzwVQLwILPnyly1K
         f76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rsazcajhwAV1pXduS7vg1S4Bv/a0jWiLu0YfVDB4Bpc=;
        b=QeIvkaXavU8AEVA506LvGHqu/M33jI49sJc7HkGd0b1Zb4DzEN9ElOGt1ZrSKlqrF1
         axMM6LVOSSzfECuADvHlLy+WBLDt6tjfsdyPALJuNxcH/KHPZLnUDqu7oT2w3Ei98I/0
         lpBl6qVSqebaaxIr6iwjZ5BYvL4tEBNnR+fxphiEfEpNIV/Y6BTFwf7zgYb0XGudBfhO
         fWwUSZpZ3gbmpuRdTQnRnDm+a1dM7IvpjKccFsuWEI059/tE3MSYgnjuz+eNnkvucW/2
         gBOXE6qHnrYlQ4LdTGgSIEXE77LBM0Ux3aHQPDgPMAHVg8uDswqdr9r4Lreu4Q8SfR3b
         eu+w==
X-Gm-Message-State: AOAM5305Taeh6ujHubq3qn1k9HZHOxf5sW5owM/J9d8o6Ka4lxR1AfmW
	4BmdmIfveXRtM7zI2MEZZog=
X-Google-Smtp-Source: ABdhPJwGX4CftSqnUovbKALARqMBw6hWHNEfEj6l0gI+yMEG/eiqtanlkfbDx2i0Tt6Ta4ZH/sDo8A==
X-Received: by 2002:a05:6870:61c8:b0:e1:a94d:d5da with SMTP id b8-20020a05687061c800b000e1a94dd5damr6961613oah.271.1649013439676;
        Sun, 03 Apr 2022 12:17:19 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id m5-20020a056870194500b000d9a0818925sm3305786oak.25.2022.04.03.12.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:17:19 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/3] staging: r8188eu: combine both sides of conditional statement
Date: Sun,  3 Apr 2022 14:17:05 -0500
Message-Id: <d33c51bc3a20fa25e4737b258f3b1c42cc8124e3.1649011311.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649011311.git.remckee0@gmail.com>
References: <cover.1649011311.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both sides of conditional statement are the same except for the comment.
Additional instance found with git grep.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index da455eb4d8cb..2d316a6c8294 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1411,11 +1411,9 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (pcmd->res == H2C_DROPPED) {
+	if (pcmd->res != H2C_SUCCESS) {
 		/* TODO: cancel timer and do timeout handler directly... */
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
-	} else if (pcmd->res != H2C_SUCCESS) {
-		_set_timer(&pmlmepriv->scan_to_timer, 1);
 	}
 
 	/*  free cmd */
@@ -1445,11 +1443,9 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (pcmd->res == H2C_DROPPED) {
+	if (pcmd->res != H2C_SUCCESS) {
 		/* TODO: cancel timer and do timeout handler directly... */
 		_set_timer(&pmlmepriv->assoc_timer, 1);
-	} else if (pcmd->res != H2C_SUCCESS) {
-		_set_timer(&pmlmepriv->assoc_timer, 1);
 	}
 
 	rtw_free_cmd_obj(pcmd);
-- 
2.32.0

