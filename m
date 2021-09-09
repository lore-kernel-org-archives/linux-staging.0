Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07E3FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:05:33 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id g21so2100591edw.4
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 04:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I7xGDBdz64wmEzOneTZADBd1QDtzlZv4vk2FOyjlh/4=;
        b=MeqHvM0PrVC2fWIc1pNOHOwKVAOufi/brwvOBCw6klHF9cJQ03rAfdJe09jm3VvKqk
         NvPONbHgmT3n93U977Egcm1tesnF7+sgUW6iJOPLuES3Pk279DuTeCJYNIPfE9XDSvDD
         rnIBOe2CEOEKlFE/r8iavtTMvSiZYuMQSugSFGfL2VgChPVif/t1d9ek7lXvnlR68Y5f
         A5QlpqKi6t4DoD+Ll6LTIE3fHxSesABasIsu6jBn0BtKvpWsSQ5yvNiUY+WYJLwi7Jvv
         LPnyjNLQGhYLUCoiVccLxHZTTNKowKIdKuz0ilj7WlJVE80G890do5G7aYKhOhmB8Or/
         Vs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I7xGDBdz64wmEzOneTZADBd1QDtzlZv4vk2FOyjlh/4=;
        b=VpTYhBXrZnv8EHEdNPlvud6ZvfSK6hT14t6N0T32GW5KFoUhi+PbinjarUFjHI5Clq
         qY5IV/uOFqpT1YyYZaDsiZ9vrXCdB3pSyTlidA6TvdWOfIVR7nguSyHxMsMdwq53YVcx
         xJvxOQ+YR9XN/NvTFHk4nOvf/+fpmyfX2vEje98hUUKJP0ZEn8KDq651YlKjZU4U9RiI
         gWFZkSx7fiiLJqxjw3EPr/4iYWoUe6JbbRFainyFmvKirVSlsu8hrg4OLUxX038kZJQ2
         aPB9zSB0K1RxPrk+0cGYO/pfzxYsddemW7oK8vBbbKsuG83t2iPV8xEBTbdmhVfsxmVC
         XqQw==
X-Gm-Message-State: AOAM530zsOrcmMS8zWhLRXftA/E0+BSQIq2YLnyxR1QcqJjow43XWcMY
	gMHzBoeRXUrZ42Xt5kZPGCk=
X-Google-Smtp-Source: ABdhPJwRK9B7E3eQNxRZEQ9Y/3PSW4oHHGD36jxRVY6zpXr600GahEmUHyg44d0ZFDs7JQdcmzGckA==
X-Received: by 2002:a50:ec0d:: with SMTP id g13mr2578628edr.233.1631185531863;
        Thu, 09 Sep 2021 04:05:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::dc38])
        by smtp.gmail.com with ESMTPSA id g9sm883373edk.54.2021.09.09.04.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:05:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused macro READ_AND_CONFIG_TC
Date: Thu,  9 Sep 2021 13:05:17 +0200
Message-Id: <20210909110517.15243-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro READ_AND_CONFIG_TC is not used, remove it.
Found with GCC -Wunused-macros.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index ada22a526fee..058d04f6aa58 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -6,7 +6,6 @@
 #define READ_AND_CONFIG     READ_AND_CONFIG_MP
 
 #define READ_AND_CONFIG_MP(ic, txt) (ODM_ReadAndConfig##txt##ic(dm_odm))
-#define READ_AND_CONFIG_TC(ic, txt) (ODM_ReadAndConfig_TC##txt##ic(dm_odm))
 
 static u8 odm_QueryRxPwrPercentage(s8 AntPower)
 {
-- 
2.33.0

