Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4123FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso11720904wme.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVr0STWCT0vadAEVLvK4H+2tlmiDZVUwHL67IoyY9r8=;
        b=kQ9KO2/nNuI6hiiWH8rqqADGsuXgTijLD8jNCF59UbxYzuHIGu8fgpLKGZBDxQTvW9
         C9XbfCMCEPPgmR41Pvi4NEgh6omZ7MYqWUpdodilA6kTurhHmuMYBDG6Tlw/kB5a4OOW
         0YwXrPGjeBOM2156Cm3cAqbguFQjyOpoS5C55q7s2GNGusM5eBx3+OKqZyP3cD5a7Qdl
         n4/Pu7tqY5KbsV/nk52j/WqtQLA+b65RADfDxovZf2I66qcsrbZKVq8d39aEljhoymG1
         HB+ctOCpcc1NrHdIF7iK9OubU/Yf2396SkYngzksVF8DYtikL4KIbrFibFgQ3V6aVStr
         ihEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVr0STWCT0vadAEVLvK4H+2tlmiDZVUwHL67IoyY9r8=;
        b=hcMkW9+BVdHhu4uxuRJZ3UOAozYmUF/I3JTB3G2oVv0ahPdojKiJ+uIy8a1vrhO2nY
         k6vbYtghFJ0elxJlzq8fStiXpN9gntHcWoD6nRJLZYIIf126YXAX/jO7M3aBHSXQyVtq
         Ww35BlO24Q7HQUTwY9OepoohATqDHHTgsp9Rz0Ri0OP96WQppDgrMxJKuqLOBKBdMXVa
         +9LV7igTLJ/NEp6lK0X18yIQIkiBB6SDss8a1TsbdJ5Eb6olCo6/t5SmnQuUY/Xe/dRP
         rF8mokaMRIF+CEz0VQcEwTPUFxmOGA6vcHIAS1sXeTpCua+3XfyAwuCPisAiB0cs4mvE
         wPuw==
X-Gm-Message-State: AOAM533ETFcQw9NBYD2DlsLtjnlbRj3Ygrv3SeMWF4xfSuUH4LpV+9o4
	M7y254y3lhrm7zQCEExTxxE=
X-Google-Smtp-Source: ABdhPJzjsNyBIjX4bx17UNZ9Z4Ae6kt79Gs460i4/7S+3NYf8IkAJCKgXffDAuaUybV/STVUP84BSA==
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr14744852wmg.21.1631957113711;
        Sat, 18 Sep 2021 02:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 11/12] staging: r8188eu: remove macros ODM_IC_11{N,AC}_SERIES
Date: Sat, 18 Sep 2021 11:24:42 +0200
Message-Id: <20210918092443.8724-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
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

