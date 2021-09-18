Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53A3FC9
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id q3so43092318edt.5
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVr0STWCT0vadAEVLvK4H+2tlmiDZVUwHL67IoyY9r8=;
        b=VCVmtb0TFnWO/1falwfaUyiXlF6Pt3ZHyAg4J6uo/+MfGvsiAwL+w+O14gIOSsnTyG
         P53tFl7clW7GLp8mhzYdia0xJOobVYqslIStgF0sC+aJbZDKuY+m68ebEy6oU7Kzykx9
         z9Uik929H+OZR3wq7xrZKDT9OBnrHXbd1dJ0zm+wvwqE3le8gs2fnauzsmhFXArtdgkz
         L9m+AW9CFP79zg2qLcCRMm81GHULRcXzOjArO7dKDDYzHohHXXGrp/aAyrmbr0LXMjFc
         4g+9u6vp2sC/s+SaKJ65w1hDRhNPH7GuwNR84LbV5d9AEJptGTIYhuQ6l1HP8orvvRiX
         bt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVr0STWCT0vadAEVLvK4H+2tlmiDZVUwHL67IoyY9r8=;
        b=6znwI1ularObhzHflFai70/GAvLlOjGkPKwP/amCbkr47d392IUcqx27TDS00T0yW2
         uoquSq1aC8WI3kiyUMVLMJ4H/R6orQRQPZNzQtotJewTnpwx2ufbsigQ7JUo5yCQn3SF
         EWqh1mdOeaMfbcgbLixb/Lt6r2AvmoK3iGLYi3bFs4EPzlHUmrUhuY9VVHnrt8kSOow9
         D1kjlFgHQTzPCVsioOcHvKIaaglJDwJR+GRPzS+vMTSre1llnEkb5efPCWtqvAzrL4Ig
         0+DjMM6o3rCMr2TNjiTcZq95AIMJTj9qnywDRkPfaW3GoTWEia9Vr7jdoeWD/dqX+Zuh
         mjTQ==
X-Gm-Message-State: AOAM531roUsXJSdzpbGguPoC74BMArumY+c+AdmMikqGR9bJXSJyjvbv
	Z/5s/ObgeL9SUL/mwBVG7cQ=
X-Google-Smtp-Source: ABdhPJx3MB7iexYfdqJsglrWc0ydXqxqBGCPW8g1IUjSMTHga8hn7ZU2aTNxgM4+krbMFjiJ4jD5lw==
X-Received: by 2002:aa7:db17:: with SMTP id t23mr20410178eds.387.1631989169320;
        Sat, 18 Sep 2021 11:19:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 11/14] staging: r8188eu: remove macros ODM_IC_11{N,AC}_SERIES
Date: Sat, 18 Sep 2021 20:19:01 +0200
Message-Id: <20210918181904.12000-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
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

