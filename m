Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221392F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:34 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u21so105668252ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBMRL9okd6exFYzTetsEZ3MsVPUnPB4cIvHOO2Zf8iE=;
        b=bf7XtLmZ3a4j+WmxKgSroJgvhYtqdydN8eGUU3bLRx4+nLTGSFujzRAOSNmzeVIz9A
         cDRi7AnXPXYR9BwyoNhcrtna34dV7hxCQSVA2rW0N440dcPBWFVFD0X7COB2+vEntow4
         GXUYGDKbA6y6/zyWL8zLJ1N8I8ei5EXHIlWKH7ifKUgbzf/+w681Gf9ACs+g13tmP4Im
         mLFTtyjXsA7L8dEa7lZykACJBILat+ImFEA4PpJLpK6wtILPnyM+A+xM0gNK/vAEl9MO
         W52aDsZMYp30mfFPbCWiYfVb6+MSufFjfRykdTnaDWFO9XD3aWs0WowRiLEa3BpfZCbr
         lUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBMRL9okd6exFYzTetsEZ3MsVPUnPB4cIvHOO2Zf8iE=;
        b=lZbOO/P2d7RuLz7WSNt2ZyesFL4IDqFYkHr0+MOaTEb5EFsP508UBRbVulWchB08Nk
         MwMlfyZI+KlfG/GyuEHBVAzRU/qNhIndv5QBkqwonouBPSWVyG/2HbBqS2dp5MITa1fa
         LLFMnSGUkL0kzwJ8vBej2oomEUsUpTyLyPFHFIzQ1kKQedT08OcvINOwUljTdae7Nwdy
         fOcu07kxBN/Wbs0jXSGgEq1XmA/wvhDEzu9ROZES1HfNrSQnuVySlmSusGL+AFxi0pxR
         VzMfrfGaKryRALz5B8Z4xzPNdnIsEWjj8IqaXzXlIrn/vb57FLKsrx6rjVK3ibrkevqc
         DbZg==
X-Gm-Message-State: AOAM531Jfc+5HSDLzo58wTa+16T5GuUv/Auy+jeTuT4AlLQJA16q4FO1
	qkZU/+51B0dy8ROyyLKgZIsyG6hoDRc=
X-Google-Smtp-Source: ABdhPJwvCC9wvGum1WaZzQWVctF4kGFrfEKzOGnvOaG2yRNK0cj5FIx6a7Eo/bBcAXSE8yn6ALxlHA==
X-Received: by 2002:a17:906:a006:: with SMTP id p6mr4792278ejy.350.1619793872782;
        Fri, 30 Apr 2021 07:44:32 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id o13sm2084553ejx.86.2021.04.30.07.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/43] staging: rtl8723bs: remove unused ODM_dbg_trace macro
Date: Fri, 30 Apr 2021 16:43:42 +0200
Message-Id: <00ffa6097928ef93cd1ef31d1b96f968d5b2b874.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_trace macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 58de4d16335e..cd68c583699a 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -96,11 +96,9 @@
 #endif
 
 #if DBG
-#define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 #else
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
-#define ODM_dbg_trace(str)				no_printk("%s", str)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

