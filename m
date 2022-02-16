Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E31844
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 01:07:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l123-20020a1c2581000000b0037b9d960079so2669286wml.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 17:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZR7xiffqxgtLzMmjkgsmKhlDEmRIJt6j/5rXXfqzqc=;
        b=MzQU6pKbdYjhGMR5xX9JhVNIBD8aTFsewyGNpdcZluPVvFsy10wGYkX65jPCc9SM8r
         0dWyBSjCPFxNOEP0TDZIT5MYr+6y7XpJsYiSWZT1Nvd+tKxl8wy8H5HGjuXOHRzuq3lH
         XLAfvrvhqey2GfFz2LAP+UGgKvI3q4cqZjaFqEZdQSC+XKGEi1b5W1xhTNEhb6jx9mni
         jaSGfx7srSIFgDMVPQS44/KsBK7+4UtLCMy3AD5ORfKjzpeFFZAbrULghtfgkPWiOe6A
         JWTHafIednFjk+ZQ5hdeFnJTTL6v6joGTeYKazbaVPDQ4r8JnaBjdRAzZ5qHKc/Jqqcd
         pPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZR7xiffqxgtLzMmjkgsmKhlDEmRIJt6j/5rXXfqzqc=;
        b=7BdTPuiApRtZ+MWfTSnytq/jXCQnIBS7MAEUHZPGbenprAC/1sk5AK4lIH91kTjsX2
         u9DUx2X8+iYPR2e0V6DHSwnHdoYfWKYiEx4GJkrXrL10UMqe1B7LxoOT2OSBmk3DNG/X
         8e0a/aP6g5OPoeA9nkIab/tbNlsAlrc/9WG9ZsChSwxfnBkhKYe5z5fl8TIK9vD2m8W0
         6klA62HFpjZN6vszSyjU3VVrUObtG60LHX17XXdwjI+N/PBDZZ55ELxgN9XnzAncG9u1
         Ie2L5iMq+Zh9qCX/mxMlhOHHev8ex9xu9ZZf/8hn4XyUYAMPyRyZeYiyMIJblfgW5OK7
         7Qew==
X-Gm-Message-State: AOAM531+OOYREiRKfKpXzQ3wOst6EgCvkx3yp4qBXToHtBjYgRZr/jTH
	LrC4YxV9DKWGL3Z3kiPpxt620Q==
X-Google-Smtp-Source: ABdhPJxmCJIH9VYS3CAtmMfl4vXT3uX8buc5qpeZc6N11Y3rMnhu8g4CtvaQDpMEZEdnz9JJXbgYAw==
X-Received: by 2002:a05:600c:4e8a:b0:37d:1bcf:de22 with SMTP id f10-20020a05600c4e8a00b0037d1bcfde22mr4978082wmq.195.1644973642551;
        Tue, 15 Feb 2022 17:07:22 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m8sm10551185wms.4.2022.02.15.17.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 17:07:22 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH v2 13/15] staging: r8188eu: remove rtw_sctx_chk_waring_status function
Date: Wed, 16 Feb 2022 01:07:07 +0000
Message-Id: <20220216010709.791-14-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216010709.791-1-phil@philpotter.co.uk>
References: <20220216010709.791-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_sctx_chk_waring_status function from core/rtw_amit.c,
as it has only one caller which is unnecessary.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 0b87ce342bfb..c2a550e7250e 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -2125,25 +2125,9 @@ int rtw_sctx_wait(struct submit_ctx *sctx)
 	return ret;
 }
 
-static bool rtw_sctx_chk_waring_status(int status)
-{
-	switch (status) {
-	case RTW_SCTX_DONE_UNKNOWN:
-	case RTW_SCTX_DONE_BUF_ALLOC:
-	case RTW_SCTX_DONE_BUF_FREE:
-
-	case RTW_SCTX_DONE_DRV_STOP:
-	case RTW_SCTX_DONE_DEV_REMOVE:
-		return true;
-	default:
-		return false;
-	}
-}
-
 void rtw_sctx_done_err(struct submit_ctx **sctx, int status)
 {
 	if (*sctx) {
-		rtw_sctx_chk_waring_status(status);
 		(*sctx)->status = status;
 		complete(&((*sctx)->done));
 		*sctx = NULL;
-- 
2.34.1

