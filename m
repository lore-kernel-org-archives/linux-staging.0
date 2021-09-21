Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A33FC0
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q26so72557wrc.7
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r8i4ETp6SsjxBRzn3W/XRkmhBMm7CUtUm23mxNKtW8w=;
        b=NA+/YLF4987qabrTuPO0rh2mlNmFcNTD4L/47utjVdx4NbaQ8RLTW58GBPM7xuVIcj
         PgP/rGrPYgbZHOHjqWL4kSqf2eosaQ72BBaYZXpeJRumZjIMDKZVZh7KknPyFiPYAujB
         5I4wIacen4WPetBTtTFHVpCD/Fx4QfJl3I9zUpIndM+8ONNzoCHfhrsw3NkcpcJU3AT/
         qdYEyHl+QUfT3xL30EbrIKpfrTLYHtGk3ACH6b4fHVjcod2QX3VjnobrPvgbwIMajWE5
         aKMwF0YPcDQVLt3dS3anAFMtVPOlQsl52N9gtyHDL3hbrm2G3cfO3ZZYaJ4NFmaJ2CFI
         msZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8i4ETp6SsjxBRzn3W/XRkmhBMm7CUtUm23mxNKtW8w=;
        b=A8XITvqElQbTONU8bqivGWsNzzm4cYXAAK6Y/586CtvuRTijzfCGZbauDoa3q5apdF
         VsIsuJ4g3Ni4nNfmzWn6KB6C4CIfBWtJNAYVCod6iWQP4O3Tbgz+tg4I+8Wdxzx7MlAr
         V8f/k6322Q03mcG5wDFFbKHCgy7yj11Vb5Op0uLEGTY6EEHdcy0wYiioCGKPKh87m2sW
         pvgOMcU96iolOuuDT9KV8KwnqQJdv1vgFUFf8NV6gIvhWnepsZybDREbmqyyMQG1oQ/4
         LWZE8YIdTrp5ffXl3auaPbyRwIHgtT+gZn5WJzfG6GxH1n6QyJVO30fVcfN8yc0yRnfz
         cHPg==
X-Gm-Message-State: AOAM532/mWYQxeRxHZnw2BZf/xcVhLn2tFRVTcXMNJwITu4w7E7IA0nM
	8MN0c0wbb0l8N4g+Uq28pIE=
X-Google-Smtp-Source: ABdhPJyLVPgD9H6qBFBczc9m28TGDNFm/mZ/8AkmLRiUMnHrfl8ulokkGHP/94x2LdLiSXOcj/RHug==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr37214609wrs.196.1632253643146;
        Tue, 21 Sep 2021 12:47:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/8] staging: r8188eu: remove odm_DynamicTxPowerAP()
Date: Tue, 21 Sep 2021 21:46:52 +0200
Message-Id: <20210921194658.10654-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_DynamicTxPowerAP() is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 5 -----
 drivers/staging/r8188eu/include/odm_precomp.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 9fc36ec2f56c..e39c79db7667 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1209,17 +1209,12 @@ void odm_DynamicTxPower(struct odm_dm_struct *pDM_Odm)
 	case	ODM_CE:
 		break;
 	case	ODM_AP:
-		odm_DynamicTxPowerAP(pDM_Odm);
 		break;
 	case	ODM_ADSL:
 		break;
 	}
 }
 
-void odm_DynamicTxPowerAP(struct odm_dm_struct *pDM_Odm)
-{
-}
-
 /* 3============================================================ */
 /* 3 RSSI Monitor */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 91f74d694770..1d6e93b13d7d 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -57,7 +57,6 @@ void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
 void odm_1R_CCA(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskCE(struct odm_dm_struct *pDM_Odm);
 void odm_RefreshRateAdaptiveMaskAPADSL(struct odm_dm_struct *pDM_Odm);
-void odm_DynamicTxPowerAP(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheckMP(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheckCE(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheckAP(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0

