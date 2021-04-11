Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1C72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:05:10 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l4so15486566ejc.10
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gSsTwCvLzeHONfXXfMoWnkseUsAdTn25RtS0S0FESUU=;
        b=JoTiuI7J03ZK/zUMWHy2lvYEQhqY54DyViQODpjueEd+YKS3Ap4bb0mssmR23Ad3aY
         LnhQH9VWzAqMLNgWf29dZzVA2TG+LDkOBYQUZ+rbLsV9B1WERIGhngQAvKo6qq1Klz8x
         arjoHTAk3dd5umVGPDM99Lfat3TFUEbjbCddTw4rzuR9jWOnB5zpae+Im9rMIRVDJcCI
         FPKMgqLcULeikw/A/9dlnnRMEcRs99Y5IjMM1WcDnno876IzEfeD8mnj58/fttOVERw8
         UAcgj0cBo4m+nk/0tFGPqkHSipQkUK+x9DmmoU41fKoNCaimWbZKVRai6DYbu6jIPFpW
         V02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gSsTwCvLzeHONfXXfMoWnkseUsAdTn25RtS0S0FESUU=;
        b=iEYWlOMvCZIRxW1kbEX7PSyxAYCcOvnVWJN9BaglGMEPIi8Z/jqmqWtqbqICrzsN86
         A4tYRP03UIIcA5H8e6UX+s11fpCI2xABTtt0b3w2UizO2vSnPQjMj7Et6CjHurC5z222
         82EF5m85ad3BV3VzqAS3uOvC5P51fb5KxNVp5bv6OMbh1/fiLuy0U2CLyUxIxGqDMp+O
         mjAlyFHLKZGlj1wrtvv8Ca35eRkpFGQmO9l2FlXItbhMoaQqig57y4jVN4jk/7hCLOVR
         Ol4Z7i+Pi7h7WLRi918oiVTwVN54te/1TjIUsd1gHRQ7bWC4pjQlwiQ7pcOSmfS+hwTU
         xsYw==
X-Gm-Message-State: AOAM532KC/f8T5PGOUV82ZD9Vvkn+kQ1u2B2rhzwE5w7b9LCw5n+I5m+
	iEgQBOn1qOorSW7vW983ZiI=
X-Google-Smtp-Source: ABdhPJwaYEB+uPzxOixlcQbuoELwVX8bkoD8SdDeSHbFDaYUxJfLKLZ0g4Zuq5CaIFJhEKeRrJ6Wvw==
X-Received: by 2002:a17:906:3643:: with SMTP id r3mr22725051ejb.527.1618139109483;
        Sun, 11 Apr 2021 04:05:09 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id i2sm4577202edy.72.2021.04.11.04.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:05:09 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v5 3/4] staging: rtl8723bs: include: Change the type of a variable
Date: Sun, 11 Apr 2021 13:04:57 +0200
Message-Id: <20210411110458.15955-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210411110458.15955-1-fmdefrancesco@gmail.com>
References: <20210411110458.15955-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the type of fw_current_in_ps_mode from u8 to bool, because
it is used everywhere as a bool and, accordingly, it should be
declared as a bool.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v4: Write patch version number in 2/4.
Changes from v3: Move changes of controlling expressions in patch 4/4.
Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
series because it had alreay been applied (rtl8723bs: core: Remove an unused variable).
Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 0a48f1653be5..0767dbb84199 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -203,7 +203,7 @@ struct pwrctrl_priv {
 	u8 LpsIdleCount;
 	u8 power_mgnt;
 	u8 org_power_mgnt;
-	u8 fw_current_in_ps_mode;
+	bool fw_current_in_ps_mode;
 	unsigned long	DelayLPSLastTimeStamp;
 	s32		pnp_current_pwr_state;
 	u8 pnp_bstop_trx;
-- 
2.31.1

