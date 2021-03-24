Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0770
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1758357wmy.5
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZitrNETvdur8eFqvmfY6Ygo5ijaLf42cxFb7jgH6wBw=;
        b=A46UjhfSO7rqU2+Vgq52s+qG0rPTxmhwHbuyz8RGxXq63awQ+ron6gCLPT2siCZ1X8
         3P8+eU4G2CHIrbZIfU6Jmwd//eia8VTvRdDeP4EWVus0j6fJL1H0EPm61ylh7P/+3Ldh
         FMwT4ER+8Dm1YyrebfomU+T4vSg5GXSdtX8lKXF+QGQcxQbaiuO76PCgLhUqX5rs3dlT
         fWvD64mkPJUZ7oG020QUWlElF/9CWI+ikDaQ//mhYluu17P5tk5x/9waKzO7n0Y1zIiY
         BfkHmQpzYWoyQojKkfp+g8yDOBDEx2ggDMBXwmhSRgHnnNmby/k4ZRAfYKKSgYGdJ+Od
         3CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZitrNETvdur8eFqvmfY6Ygo5ijaLf42cxFb7jgH6wBw=;
        b=nzzRHRP0srGpu+L0YwMg38QzWf1jEA19aQpU9saoZ0RVQf1CfH8zDE6OjCRwXzigUj
         jo0QuP5v0Aa++zPQ9Zf/jhcB2eG28lBT51Uphes2bimYrox4PKynrML8jn5iXfnZrh68
         D/v7JXLPl1dRvHquSHE9Nojw7GITBA2fPnVtudJ3LByj7uIdbfELDmcuYu9RH99bQ4PO
         d/BOpsJLp3Zs5OYfwClkVd53Wji+yg74CQ5UUNa0PG+wjbA8cAcDphG+YcbjwxhNmwBA
         HAmMRE5k6kmAlArIGrnb4Ruo4bHsb7sr7LqYNizISNqQ10Q58ShERUiqAhsv0e3zEYc4
         iDUQ==
X-Gm-Message-State: AOAM530IyP7Flrejx82NtQt8NmUjPD4s/PXxcBIqeXGL/vX6nMOZ0CQ8
	sddxEmug6yBzEnCiggiLB2w=
X-Google-Smtp-Source: ABdhPJwl0B0lYGjuFR7m6A4mH6hNGulh/pDVpfQFQU1etOyus6slR1NCFRheD0vz4EOYBiDVEySRqg==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr4382844wml.31.1616611134703;
        Wed, 24 Mar 2021 11:38:54 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:54 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/21] Staging: rtl8723bs: remove enums in odm_DIG.h
Date: Wed, 24 Mar 2021 19:38:45 +0100
Message-Id: <20210324183847.5595-20-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
hal/odm_DIG.h:

	enum dm_dig_op_e
	enum ODM_Pause_CCKPD_TYPE

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index 20d4b88da9ff..88cfd542df16 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -77,27 +77,11 @@ struct  false_ALARM_STATISTICS {
 	u32 Cnt_BW_LSC; /* Gary */
 };
 
-enum dm_dig_op_e { /* tag_Dynamic_Init_Gain_Operation_Type_Definition */
-	DIG_TYPE_THRESH_HIGH = 0,
-	DIG_TYPE_THRESH_LOW = 1,
-	DIG_TYPE_BACKOFF = 2,
-	DIG_TYPE_RX_GAIN_MIN = 3,
-	DIG_TYPE_RX_GAIN_MAX = 4,
-	DIG_TYPE_ENABLE = 5,
-	DIG_TYPE_DISABLE = 6,
-	DIG_OP_TYPE_MAX
-};
-
 enum ODM_Pause_DIG_TYPE {
 	ODM_PAUSE_DIG = BIT0,
 	ODM_RESUME_DIG = BIT1
 };
 
-enum ODM_Pause_CCKPD_TYPE {
-	ODM_PAUSE_CCKPD = BIT0,
-	ODM_RESUME_CCKPD = BIT1
-};
-
 #define		DM_DIG_THRESH_HIGH			40
 #define		DM_DIG_THRESH_LOW			35
 
-- 
2.30.2

