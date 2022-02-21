Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4CB2561
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 07:33:19 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id c6so24626590edk.12
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 23:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vwiIAmZ+C5zWK8Si6mo1Eo/U2yGxbtvFyTLYxn/HBQ=;
        b=mSth5mYOd+JbeN6ChnQB18eVFGPVZYyVEOOm+a9pQwwf2xeVpbEDsi/M7QCex6nfOw
         vDP0Qa9ivOu6kycYSxLbT9+NawEFFkFk1JhnCo4ftONlit/4hNIVjI/QmrBluOmXCVa9
         RvHXwuyRxC+m3mYksXqcKwTKsv+RckTRJ/q65AEEgnrzH17FRKH7BkpQvcRb4iyuZTmr
         0mChZUcuF4buchFbG0cEUXdur6JN015BzwvzwBJDU1UtW/U2z+tKt6RwiFuWQmz+xUsQ
         RX2ruytPUf0GiCjxwSqaJKWwcMOlf1DLxuEmy6SyZ1oAU9Q/hUEOY3raNILkLqnlFPkG
         JWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vwiIAmZ+C5zWK8Si6mo1Eo/U2yGxbtvFyTLYxn/HBQ=;
        b=G5gQSrikKJCjvEeGEsad8GaMWUxQBAgLWAzx3r7GFl8Ox21KRBaZ6Bxs8IQC5tINgI
         6QdNIEzqauRNjr9UetSjvoAfiLMrqgmUOZ6qNyXHctevlTregZcHk+/5xpj1IYW5MN1G
         M29mL+YYuAC4uWFq0pDjC+3j6uOqvjtSxr2OAzmsHwY5SlJLhHYCX2E5bebNuF8j+GNU
         9Tc4E9d/yny3/bWCnPsJxUK9+Wh+Fi+FpZTGTD8CB6mINFDGnmBnS241jhWAjHNTLDdu
         71XH66EMDQexknhFIe4SnCElE3wcgmbJVoVMzo6HYMDxigr603N50u35aTKihSDYmtxE
         5BsQ==
X-Gm-Message-State: AOAM531LwiywIWbhcCXPxLp5jVRCoEdlRF3AxXMdm0Mtk+MI24HBcizw
	tDxKpdV5bCNCPqWN0m5/hwQ=
X-Google-Smtp-Source: ABdhPJwWIvRI3iTGAk7rrx2uPOIatpxQhFfdhaoaWVxn0WgBWu2YL+jyz/FARb9qKVij+ttwEy+9Gg==
X-Received: by 2002:a05:6402:144b:b0:410:b990:a68a with SMTP id d11-20020a056402144b00b00410b990a68amr19939616edx.25.1645428797947;
        Sun, 20 Feb 2022 23:33:17 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id c11sm8673128edx.42.2022.02.20.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 23:33:17 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/5] staging: r8188eu: convert type of pBandWidth in odm_dm_struct
Date: Mon, 21 Feb 2022 08:33:05 +0100
Message-Id: <20220221073306.16636-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221073306.16636-1-straube.linux@gmail.com>
References: <20220221073306.16636-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable pBandWidth in odm_dm_struct stores constants from enum
ht_channel_width. Change the type of pBandWidth from u8 pointer to
enum ht_channel_width pointer to get rid of a type cast in function
Update_ODM_ComInfo_88E().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
no changes

 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 2 +-
 drivers/staging/r8188eu/include/odm.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 082104c9b2e8..df0b412c52eb 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -40,7 +40,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	dm_odm->pWirelessMode = &pmlmeext->cur_wireless_mode;
 	dm_odm->pSecChOffset = &hal_data->nCur40MhzPrimeSC;
-	dm_odm->pBandWidth = (u8 *)&hal_data->CurrentChannelBW;
+	dm_odm->pBandWidth = &hal_data->CurrentChannelBW;
 	dm_odm->pChannel = &hal_data->CurrentChannel;
 	dm_odm->pbScanInProcess = &pmlmepriv->bScanInProcess;
 	dm_odm->pbPowerSaving = &pwrctrlpriv->bpower_saving;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index fed12203c558..7a10f57b9bd3 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -324,7 +324,7 @@ struct odm_dm_struct {
 	/*  Secondary channel offset don't_care/below/above = 0/1/2 */
 	u8	*pSecChOffset;
 	/*  BW info 20M/40M/80M = 0/1/2 */
-	u8	*pBandWidth;
+	enum ht_channel_width *pBandWidth;
 	/*  Central channel location Ch1/Ch2/.... */
 	u8	*pChannel;	/* central channel number */
 
-- 
2.35.1

