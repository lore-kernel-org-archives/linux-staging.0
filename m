Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4EE1868
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 16:20:06 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gh9so14985885ejc.8
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xUphcrXxQc1ipnQhfpFIDYBTmrSlFRYJTDjjM/qgN3o=;
        b=hWI2lxW+3yst5tOygYtWH3uD42UCnBngUblM6Yl6sFe60p/mlNy5ItkZPgWyg8IM+B
         Bq0M5BY04O4kcIXAe7u5nH0pN5BZcToXyQ3y6ARmtW6yJJlXDV11wEB8cznjrroOK3nP
         Fvo6LvlKsX4nLh35c89hqbVR1mImbSBqJ6ftnvOyLLR098QvjSy8w7ZVhZ1yYmMvC7hr
         fG8kYJ7T93BZIdO8A8zaJtfs8CgGxTnIjBEsBwGPC2ZpwFzOX/FKf4UWbvM+GT7csOjl
         +Su4Ew6tjRJOx32gnbe7auOvnBjzXnz/dupbXyuy7oAXkrOovF9b48dugLe/qwTg5sdu
         Gm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xUphcrXxQc1ipnQhfpFIDYBTmrSlFRYJTDjjM/qgN3o=;
        b=UowXPmUEUFMCNc2rBOFjmUMrhXw/XjU7xt9i8XTBljynJY0lHTGXbuMBRk6Mt6BBDd
         giqPr+iBd9zz70/Y16RuSAncA3VxFKwOpor+H4HY27EbGhN5PwNhBe8+eBicwhxKYBb0
         lwdmJLcPjHwaen5GYOmkdTWk3/0Um0sm5+cXzxNJgE/CnMaHCojlCauYH48cxettZ6KW
         PaWH5iFle5WpO0lkZPxiaBqyj9MiF9GLDoVku90tmhwSu1xISCvJpHshHFupG97vvqRL
         sFMDMOzQDDWtAkqaXHm56Ae36tu9WIdg2keQYpvdtSqjSn7ieKv06hegtGqZLW5++shr
         AEHw==
X-Gm-Message-State: ACgBeo21fMuNOG2KWN9mrZV6aH5it3U8MVpfdZzmjHM1OEW6yfyDrJaB
	2AxOJm1hVKkwEZKvkxqtM7w=
X-Google-Smtp-Source: AA6agR7kp7AB1fLPUmeg1WKG0Ar+XXUfe3/HxCUunyPfSboqDsOv1dfV8VH86SApTcJKR2uFcJo7gg==
X-Received: by 2002:a17:907:31ce:b0:742:1206:529e with SMTP id xf14-20020a17090731ce00b007421206529emr16006575ejb.643.1662913205042;
        Sun, 11 Sep 2022 09:20:05 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id bt6-20020a170906b14600b00779dc23be62sm3055346ejb.120.2022.09.11.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 09:20:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: replace tabs with space in odm_query_rxpwrpercentage()
Date: Sun, 11 Sep 2022 18:19:49 +0200
Message-Id: <20220911161949.11293-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911161949.11293-1-straube.linux@gmail.com>
References: <20220911161949.11293-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In statements spaces should be used not tabs. Replace tabs withs spaces
in two return statements in odm_query_rxpwrpercentage().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index a870973395f6..38f357e8aeda 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -6,9 +6,9 @@
 static u8 odm_query_rxpwrpercentage(s8 antpower)
 {
 	if ((antpower <= -100) || (antpower >= 20))
-		return	0;
+		return 0;
 	else if (antpower >= 0)
-		return	100;
+		return 100;
 	else
 		return 100 + antpower;
 }
-- 
2.37.3

