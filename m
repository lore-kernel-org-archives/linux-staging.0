Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C546770
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so7241783wmq.5
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6pwu5pM4dbgTBood6EBI5joCOsJM78eFvHusKdHfshs=;
        b=vhu9sWByZXK8kb+zqz3C+BIbUKY/FPpNYY6FDXEolJWaWVEe1JMlquk7fN5nnHLGZe
         vl6PC7kb5n3qIDJdP5DgERpxMUCaL2fYSvwHCy5paxnI3u9JxzK12QSC1fWK1B0/mhWL
         yHyPHY4iBtAL7FBEGHV7yGaccsxoAIB7a2RuTJIQ0pGB5I6KZd6hGtLiu+tjbZmKNsfF
         I9a7ne6BgLmi4RzAuvUhPmI92/ui6dAAUqOnZwlyNe8DONL66ZzcD23JI6PCWTZqSU0z
         3MggFyenClWKsUgdO4uxQNmLbritSCYeXM+fcHpXDDD/QXoY/ebt+gDtlhiJYgC1tDCa
         bJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pwu5pM4dbgTBood6EBI5joCOsJM78eFvHusKdHfshs=;
        b=LMzC0coRPdG+ALE0bsSUvvCTAdNCNSSmyDVFziL01euFwk0At1Yn/Sz7lhKBJi0YKS
         20likrqziGvR9gK6Wyoo5xlR8s91ULHIgF6MZwDFeorl5AeFMA7goMVrWtkY9XmNwvKE
         ntMZLuI7eOOdUVTXupa4u5tHNo4BSO1k6qp1nbwkoszPWHU6ZCHUuyjaXgbx/mWS/KiA
         54GgVkhpxz6qqOhrRryT97RO57r58lYSJYDDkgRaKm1/dTD5zti05n9m1fZ0Qqe53Drx
         v8xSi6+raXWEk+zaYo4taInddg/FC2jftJqht4HZENysxvWgzJTyVJao6TGLOKEMk4Bx
         X8Ag==
X-Gm-Message-State: AOAM530MUTjaL43Hyf93nck2GmNuBFjBK7u4auS48RzAzD9RMet3omis
	lW0qLm3lfYahhmGaisqnoR4=
X-Google-Smtp-Source: ABdhPJxN5J84pzXijlVT8WSK7KaHe294q7cpJdO92cn76gaQ1PY9YE2clQRaBBJFzObkrISJSL6JTA==
X-Received: by 2002:a1c:98c9:: with SMTP id a192mr15925668wme.66.1624099647418;
        Sat, 19 Jun 2021 03:47:27 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id w9sm5506667wru.3.2021.06.19.03.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/18] staging: rtl8723bs: remove unused enum items related to channel bonding
Date: Sat, 19 Jun 2021 12:47:06 +0200
Message-Id: <aee2c78ea50a0bc24c114853500bd44c358745aa.1624099125.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused enum items related to channel bonding.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_rf.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_rf.h b/drivers/staging/rtl8723bs/include/rtw_rf.h
index 98bc274e5e81..550471637315 100644
--- a/drivers/staging/rtl8723bs/include/rtw_rf.h
+++ b/drivers/staging/rtl8723bs/include/rtw_rf.h
@@ -98,14 +98,6 @@ enum {
 	VHT_DATA_SC_DONOT_CARE = 0,
 	VHT_DATA_SC_20_UPPER_OF_80MHZ = 1,
 	VHT_DATA_SC_20_LOWER_OF_80MHZ = 2,
-	VHT_DATA_SC_20_UPPERST_OF_80MHZ = 3,
-	VHT_DATA_SC_20_LOWEST_OF_80MHZ = 4,
-	VHT_DATA_SC_20_RECV1 = 5,
-	VHT_DATA_SC_20_RECV2 = 6,
-	VHT_DATA_SC_20_RECV3 = 7,
-	VHT_DATA_SC_20_RECV4 = 8,
-	VHT_DATA_SC_40_UPPER_OF_80MHZ = 9,
-	VHT_DATA_SC_40_LOWER_OF_80MHZ = 10,
 };
 
 /* 2007/11/15 MH Define different RF type. */
-- 
2.20.1

