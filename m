Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC82FAE
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:41:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b6so9421120wrh.10
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=49hQMNle9dACVaZdfdNQ2gB9ofJNp4uzzkJzv4Ua50o=;
        b=Ed4Q+lnX4tSmxgrQDB9h7k/ltDqxAlizvCzZVNgbPMYsFfqivctbOMT+nC0EsTId9/
         6pYgxFm/haN9aTb43SyroOcfls8w67n9J9s4tJwef/aZ8oM+HM6s3LnszNT4jNyYJ6kA
         vxRgQnpzX9wPjbQ05d+7kWuOBBm9oRgBT8BMi7QKXr2UnMpx6/7QfW0nacCcFD0IylXa
         2iQ+G4NHz4EzwnFLlnRZI3gDrZTmS2N12o0rd5mOOO23v2AB68Wdrmz6tBz0pNWBkMAH
         cqEiIOiECr2Rn6W2lTIeT9iNRraKLkVRGdzDcQmBntE8U7WDqCvTvv9oMCX6X4mF652B
         SRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=49hQMNle9dACVaZdfdNQ2gB9ofJNp4uzzkJzv4Ua50o=;
        b=ILELF1k87iu6gGme1xiKDmmz4w6/45y5/YJ/hgJRAlgrxwcYaUOMliY0ySmvDx2tr9
         6udi28gzYbsyU89X4QnoHDb0wVixS+pXDV4ZnG1jTDkEN7qxMVFgUJXdsiLYnl+WpMm5
         CfFiuLYg0uSwlvJBjghmteuNxtfXSjPuhKoMrpss4uQ2vrfrNbI75M2ZwiEjnAvVA+fe
         uifrVNF3xso8UpK3yCqAROxf66c8iHcVlZxkI92lvpmuTFNkQk2xCd4I6/4XrhI7ngYi
         FDyd15TeVFElzkL0VvaxS0ggaqY2W1iKLlYWm2KNR+9NBLPNSointfKUp4uZ2SVciTgN
         UXtg==
X-Gm-Message-State: AOAM530lqdePFubJK6g+NkB7eN6Kye6UFt/cbQfM/RdeqeawA2FuoaWS
	L7dC0SR7rY3SAxaiWrhrsZg=
X-Google-Smtp-Source: ABdhPJztegC/vpNYym+j7OUvPm1XwfPJJ4uwJyBls7PnnG328OGuiGIIEXcpN9whDQ1kCiW6d2BVwQ==
X-Received: by 2002:a05:6000:1a86:: with SMTP id f6mr9207231wry.345.1630057314892;
        Fri, 27 Aug 2021 02:41:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id b15sm6500034wru.1.2021.08.27.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:41:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: remove ODM_DynamicPrimaryCCA_DupRTS()
Date: Fri, 27 Aug 2021 11:41:43 +0200
Message-Id: <20210827094144.13290-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827094144.13290-1-straube.linux@gmail.com>
References: <20210827094144.13290-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_DynamicPrimaryCCA_DupRTS() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RTL8188E.c     | 7 -------
 drivers/staging/r8188eu/include/odm_RTL8188E.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 70afa0a21bf4..c64a291f9966 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -335,10 +335,3 @@ void odm_PrimaryCCA_Init(struct odm_dm_struct *dm_odm)
 	PrimaryCCA->monitor_flag = 0;
 	PrimaryCCA->pri_cca_flag = 0;
 }
-
-bool ODM_DynamicPrimaryCCA_DupRTS(struct odm_dm_struct *dm_odm)
-{
-	struct dyn_primary_cca *PrimaryCCA = &dm_odm->DM_PriCCA;
-
-	return PrimaryCCA->dup_rts_flag;
-}
diff --git a/drivers/staging/r8188eu/include/odm_RTL8188E.h b/drivers/staging/r8188eu/include/odm_RTL8188E.h
index 776a8a6dab68..00d2678532f8 100644
--- a/drivers/staging/r8188eu/include/odm_RTL8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RTL8188E.h
@@ -33,6 +33,4 @@ void odm_FastAntTrainingWorkItemCallback(struct odm_dm_struct *pDM_Odm);
 
 void odm_PrimaryCCA_Init(struct odm_dm_struct *pDM_Odm);
 
-bool ODM_DynamicPrimaryCCA_DupRTS(struct odm_dm_struct *pDM_Odm);
-
 #endif
-- 
2.32.0

