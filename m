Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC4871
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:30:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j1so6217110wrn.9
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77HnC0dTisnKWDPVh1Io+8wCN1+6InnJC2WdQmork9k=;
        b=rdIVl7ROyyVmuoqNAkV8dbJL+vZedB4CXaLyU7TGt8lH/W0VIBSY/UYiS/QSTR1fBs
         HoEppTeFdMHJp1T597KjgtlaavwOUcO4uF7NrfZLdKeMYs5/CpcoZsDDz6MngW2dEBJU
         MfGktjhlEA5EY6FnGDyOxaEHmX367iTKjFmwpI+iQdDccmqUaiKgpYHi2tp0jGuQGbr+
         u1CqawABMt8pUweKb7Jxsq7uXRoZ2B94VC3zUnYNK12gRmwop3at6ttrwQipF7eZuxpA
         fiUYY1ywEo8ZwVfuycTL+OZ4Aab+RmIbHGXK6wvhx8U6puoeH2Gyk7N0zMOuXCCUGh6a
         ZU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77HnC0dTisnKWDPVh1Io+8wCN1+6InnJC2WdQmork9k=;
        b=THtnW3zDRcmINozYPyobyju8p2GxSx4G8hzeAi6VUSddIf9e+tzRkvjb77OYKaakcx
         +VGxJV/ZXphIHk//rdobq5HYw37CGmvHM5fPMaMJvYCX9e/mmvxtHZBdvT3UCk2jSXhn
         8X/HgkqIWA6i2typ43+tutAW3rz9+WzyjxXtdjQ08uHUdi12QoF/N+SPkvyHjY+J7R+4
         qg81b56IASSry0CFMdJGS5GJ7G9M9eAqBE2vfoEm6PPhKP0GEPNXfs1DyBzeG8uK1MLV
         jCrgKBx6oNrqN6nALIyAkEHQNsJjdozgJNoz0pIxjngXh6OfzkbGfSx1AjdYKNpuQkGy
         s6cw==
X-Gm-Message-State: AOAM532WDhzwEKu7uCwbekskypckUX0kx07pgY6AnLYBYmAx8deKrjHr
	9PMNJnnXX6G/gWNzEXtPtj0=
X-Google-Smtp-Source: ABdhPJz4Db5GSAdsilVCU398r/9Arl/eVVs48bqh6Y0/ht8xNGBP4uPkWEbO210Qaa5qHMIYPyQWuQ==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr4515535wrn.222.1624365004924;
        Tue, 22 Jun 2021 05:30:04 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id y15sm2142399wmq.17.2021.06.22.05.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:30:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/17] staging: rtl8723bs: fix macro value for 2.4Ghz only device
Date: Tue, 22 Jun 2021 14:29:39 +0200
Message-Id: <d4dc048406bb8972b17db51a76a5dce0fa4eabaf.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix IQK_Matrix_Settings_NUM macro value to 14 which is
the max channel number value allowed in a 2.4Ghz device.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index c349de205f93..abf6547518fb 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -195,10 +195,7 @@ struct odm_rate_adaptive {
 
 #define AVG_THERMAL_NUM		8
 #define IQK_Matrix_REG_NUM	8
-#define IQK_Matrix_Settings_NUM	(14 + 24 + 21) /*   Channels_2_4G_NUM
-						* + Channels_5G_20M_NUM
-						* + Channels_5G
-						*/
+#define IQK_Matrix_Settings_NUM	14 /* Channels_2_4G_NUM */
 
 #define		DM_Type_ByFW			0
 #define		DM_Type_ByDriver		1
-- 
2.20.1

