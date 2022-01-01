Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7332CA2
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:49:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r17so59681444wrc.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOX3rSpe6Y+YD+edQeghlR9ENccpSM4hKY7ygLNTvjg=;
        b=N12nV/uvkUwL6yl4VCIwJqCSf8U2Gd+XH6dZjuLVSrU3SHtbDtBye59f7WkjX6uMyO
         jiyAD3QftB+Y5ybnW/Vl56gUuzQLr1O5TFIBnGEewuzu4t5XpKBc/bX+kdppK033S4J5
         +BeD5SUkSMe4LyqToCd+O0w998RbIkwhmE05p9zbHts62TZOhPW5PILF0aGmtfpSJ4+O
         fvjXxWEL5ygVepyNsNSEQyOJza0WkJmyonDs7M/SKlB3p9NPZUgtiDfejr6eZyGldoZY
         QJkAISqYVAZs7lNKAKfPcuMGzNWtHw5dTPxVuKUmSGf3iqiZMAhrJAA2TP+fIc3QvVUz
         NbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOX3rSpe6Y+YD+edQeghlR9ENccpSM4hKY7ygLNTvjg=;
        b=n3w1Qa7T5UPx1kkGEF4eU+IDsQAhjckjZaNoghMT6D3lOZpQjncpMCgJY7UUNlFq6Q
         gpXN0qTrQMBRFuGhOB2L5GTxxbCgo8ctrrGOYd+wwpMZ2Q1ldU7WvTOrAbmPBs7gVQVs
         W35jO+FeQPUIc+D7XHVjXsQMjpgR/Rh27fnJu/3ikIsz22cN921hjb4X/31wGlayqaI7
         /XbXwn/3vb4v/AJukLUJ9g57i5dehKZrnDEtp0xBwcABZCNFEEfUv4dXipnYJ6IWf/Uj
         ajKpR4Y8TJ8Su7Ec/e2MpqLPAMn38btywTACGybq2VwhOuHwQlaJnWmHQurVVmjrhhd1
         +Q3g==
X-Gm-Message-State: AOAM530VdAfMAXdWxb07cEZDoC/B3RAff9nCIMDzGf+SjZzTWqZnvqnR
	ZFYSUth225UGxzcLWYjeucc=
X-Google-Smtp-Source: ABdhPJy79/0Fud68RuyOC3koTrXTUAQogNlzNd86dYMW5O2Clu/GBhLkKOs172Lc+YDSIg4C0+uEiw==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr31541256wrm.30.1641026991913;
        Sat, 01 Jan 2022 00:49:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id o9sm14806578wri.97.2022.01.01.00.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:49:51 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 4/7] staging: r8188eu: bAPKThermalMeterIgnore is set but never used
Date: Sat,  1 Jan 2022 09:49:34 +0100
Message-Id: <20220101084937.3411-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101084937.3411-1-straube.linux@gmail.com>
References: <20220101084937.3411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field bAPKThermalMeterIgnore of struct hal_data_8188e is set but
never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3: no changes
v2: no changes

 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 ++---
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 065c2701077d..cce291ca44b1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1230,9 +1230,8 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
 	else
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
 
-	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail) {
-		pHalData->bAPKThermalMeterIgnore = true;
+	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail)
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
-	}
+
 	DBG_88E("ThermalMeter = 0x%x\n", pHalData->EEPROMThermalMeter);
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index de58c85b8bdc..40b3db34b8f2 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -181,7 +181,6 @@ struct hal_data_8188e {
 	u8	EEPROMRegulatory;
 
 	u8	EEPROMThermalMeter;
-	u8	bAPKThermalMeterIgnore;
 
 	bool	EepromOrEfuse;
 
-- 
2.34.1

