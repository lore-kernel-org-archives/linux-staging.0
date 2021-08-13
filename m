Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2786D28
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 07:32:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v4so4853735wro.12
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8i1jhWaEERiSPVp0HX2ctGAQkaxzUOwrA8rdOg+vKg=;
        b=F6qOLbRj9WyHGpa52KZo62Vu6z9OiM/m1oOdQXTHp7z1Pf5OxAymDUva8xjGXdgQ2k
         7IuAhD+8CALExsJiMSg1QTA/aYJUg3iDG9ipmyQZEmiyumvtWqlj5eDmWq/d8uTcB1fY
         IRA42b8naLx2U54bDIr+nps3yGhZ/FqcSfQYWGedRWDupMGOHTBfDPyPb9E1eQ9wa5MU
         2xm489nNIwoCk2GDmAoilxvThuM0avDxUjR4UbrD8NaQOY976IvLH7NWJ6t28ejXclBA
         PCdOTzfKa+iSOs67xowiqjXVhv4kSRe5HGnePh/78J2rEXD7KqqeIBP5+qdso5EB2vCa
         KwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8i1jhWaEERiSPVp0HX2ctGAQkaxzUOwrA8rdOg+vKg=;
        b=E+0Z2gLecDM7Xr1mPS4hFYmezIrEIqrsVTPWiBE/1avkgtekySLuuCC8uLLomCGyaF
         L9+CDq8cUU3B8YGmxhHL/47sWgCkrZRuTOVNR4kKLncQ9KrfbQhhfM4sXQMoLSYRtuap
         h1n7poacAA6aVqRhYaem7wHLHORoAfKgMzlcnzYfLTTBB/hFefsGAjv7xPPK4w+rgFhP
         CIxWHcpOnzM1k+mUE3N4yfnaVVPhrKEBXeZz0A1jOCzJSbilqEcSDGIgFfR3btSkM3sO
         4/ss6HxUTY+Rg15GGZyDqpe3l9616SHHr66iVHclvuiNVJdwlDLw9XE5EFbkX4K0NJt7
         2kfA==
X-Gm-Message-State: AOAM532wTZPG0624KuOuCrzWXjp6ypvpQ8S42A1r97m09N0xHgfDGL+i
	pG3iQg9zdERbTYX4ci3jNTU=
X-Google-Smtp-Source: ABdhPJxV/FaVQh5PnEWjeNTt0dOCS2MIH9iezlZ7ue/GB4e6+sAe11NRVFcMSBFQo/ENtkLyG2rDbA==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr1411921wri.312.1628839922936;
        Fri, 13 Aug 2021 00:32:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id k12sm697406wrd.75.2021.08.13.00.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 00:32:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: rename Hal_GetChnlGroup88E()
Date: Fri, 13 Aug 2021 09:31:09 +0200
Message-Id: <20210813073109.25609-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813073109.25609-1-straube.linux@gmail.com>
References: <20210813073109.25609-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename Hal_GetChnlGroup88E() to avoid camel case.
HalGetChnlGroup88E -> hal_get_chnl_group_88e

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 07ba5f0eecc2..24a82fc41872 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -2060,7 +2060,7 @@ static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G,
 	}
 }
 
-static void Hal_GetChnlGroup88E(u8 chnl, u8 *group)
+static void hal_get_chnl_group_88e(u8 chnl, u8 *group)
 {
 	if (chnl < 3)			/*  Channel 1-2 */
 		*group = 0;
@@ -2114,7 +2114,7 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
 
 	for (rfPath = 0; rfPath < pHalData->NumTotalRFPath; rfPath++) {
 		for (ch = 0; ch < CHANNEL_MAX_NUMBER; ch++) {
-			Hal_GetChnlGroup88E(ch, &group);
+			hal_get_chnl_group_88e(ch, &group);
 
 			pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][group];
 			if (ch == 14)
-- 
2.32.0

