Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3722C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:11:18 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id i20so46947554edj.10
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v2uW/uDJiVzmx6sq5G95XgEuBsqcyd3YnNIT04Tmx5U=;
        b=Em7GtEOUv8tKJyX5/o2e3+Zs3o8HF35CU9eCxOTE2OeSS+3DtXV5dkjwrSSj5VGKSk
         MWPCrDRHGTay3R+NKcrPdIz7EV8kWBsRX4A5ReYOD43JeZs+cUo8lhz8CCvAmaNCLSNd
         zl6aMw/FZUcUEPb5TYnFTdXW5ZZqB+lf721rcTCUxn+m/Z8L+U3koEPlcN3/mY/SESkL
         nNqvM6b1mMAemuF/8nzXaDxdfjJiJXxqFJCrRYJO3CETFnPTQHOaRfrMchVywZf3HjZT
         XwxlwYjT0u2Bprqxv9ere2zD3Th1QxNn8ZWz+yHWIvtlQvK6ZAch9yP/nPz97lFCz5mE
         77bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v2uW/uDJiVzmx6sq5G95XgEuBsqcyd3YnNIT04Tmx5U=;
        b=4wV1WYYOvmlQmvO2qx/4P7yiGlrWimpuhKTiDnHLTTzWm/h6ByMul2mUe9ZnW9oIwX
         K/tPNGxFWD7u0xAjjW1hstXC9I2WiNmYvUO3xCsZEOeV2vI5dy4qXcAR6uwhzrYL2dcd
         6Xvl8f/EFck1HnuB5FzeXi48cylUuheXnB2FV41OrzGgO+NaMtbRw1Mm/5elzJOB0+Y/
         bh1T3/ZIEW2MQWPFRopoV++DzgH4PT4Ar2GszQGJigLVRIxWfzhGa28rT4z8fXV/ZdY8
         o6wfGJjiaWONAFI7mKlgB68eI7D2HJ5DULaup7CBaX1A7OayeD887zHrI2M0I78KlLe5
         ncFQ==
X-Gm-Message-State: AOAM530FSnLnyNlbbrwgg6nnKCd8Qly7V5AJ6lY2y6NcPGpMNX26RdWJ
	DpvDFRMTajAj0IZV5VVXFNg=
X-Google-Smtp-Source: ABdhPJw0wiNzR9wde0NKgiJEc9rUrDy41Fh2S/bT+PBgLxC16PXoTPYOCam3k9D8E4BYsgZKwZjEAw==
X-Received: by 2002:a50:c31a:: with SMTP id a26mr24450970edb.193.1634375476795;
        Sat, 16 Oct 2021 02:11:16 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id o15sm5934723ejj.10.2021.10.16.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 02:11:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: Remove redundant 'if' statement
Date: Sat, 16 Oct 2021 11:10:42 +0200
Message-Id: <20211016091042.19614-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016091042.19614-1-fmdefrancesco@gmail.com>
References: <20211016091042.19614-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a redundant 'if' statement.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 2900c31d8ec9..2263e35b45cb 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -255,12 +255,6 @@ int rtw_cmd_thread(void *context)
 		if (wait_for_completion_killable(&pcmdpriv->enqueue_cmd))
 			break;
 
-		if (padapter->bDriverStopped ||
-		    padapter->bSurpriseRemoved) {
-			DBG_88E("%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				__func__, padapter->bDriverStopped, padapter->bSurpriseRemoved, __LINE__);
-			break;
-		}
 _next:
 		if (padapter->bDriverStopped ||
 		    padapter->bSurpriseRemoved) {
-- 
2.33.0

