Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14DD3483
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:41 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id z4so13386608wrv.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqdwyoZf1vpfOIbIS80UeAc68MaSamPymPd5+ezVtws=;
        b=IplMSnsTiuUNgHuzOknuR6EYUtf6stLk1SJdMdgobu7S/2KJWAf5N342foqRZ3U0xs
         IIVDBPpQgq4xSe94h4iCPSKc+ez3j9v5pI/G/3fL+HxkIbm0teC5rUo6tYsUhjZoJnSi
         OtE4THsFbXuqyvubwMQOhQPLVjNWRg+6Llkc2v4nVMHElCOlwL+yHDc4V4KM5tq0qVPi
         6G51XtDyhGEY6gw0+JjEfNp4ajri4DfgQU2i2oYb8jXTM6y3bNAfR3o4XqWf3g1t/xN8
         2u2jRg6wozl2aX5Vfhn6wE4iHcztpvDDAcxv0t905Hi/hkp2kH+1bfUOVYFeJozw1dUh
         kZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqdwyoZf1vpfOIbIS80UeAc68MaSamPymPd5+ezVtws=;
        b=nOqOClOLME1uBPeJtmFWSVByRAWPqzmTTJ1sEtErKACgRBw3eKotim9e0w1i2cprmt
         dn0zmU1jmKf+lc94i+36+rdjVPlRpLbccPNH3YCZuWW06rro13nxrYE7fn5xFqD1Lntw
         DsxGlPpQC10f30rpz9hG3RHfpidfq2ySO/Y8jy0syjnNPOXpkU3RFyb0NjMdD6afrKD/
         gupgKX2gyqOfjUKxRvLjKwzZ00h1NdkgmBGRrw89qrNrbE1ykwLBkAwcbkV2h6C/R7bw
         ijZZPUV2kcLLQ3bEYgYHLvtgaw+kJ2i+P914+IZizMVwbnszc3j57PjzVIwnh+xZhi7n
         qNZA==
X-Gm-Message-State: AOAM532+3WGg3z4LsS3fI5oZU4B9+pYgttLB/Et2rjo8i2wohO0qvOqs
	EGZSCI9fSQpLccdkBuba7YJj0A==
X-Google-Smtp-Source: ABdhPJzMUKs8tnXo6sc/YWJGQGzLNEVkgb/k1TsVJ0xiSmItSnFXDWLnL0DDoOjhFzADdvGdlA9Esg==
X-Received: by 2002:a05:6000:1886:: with SMTP id a6mr5800609wri.17.1627691980109;
        Fri, 30 Jul 2021 17:39:40 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:39 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/14 resent] staging: r8188eu: remove ODM_PRINT_ADDR macro definition
Date: Sat, 31 Jul 2021 01:39:24 +0100
Message-Id: <20210731003937.68615-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731003937.68615-1-phil@philpotter.co.uk>
References: <20210731003937.68615-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_PRINT_ADDR macro definition from include/odm_debug.h, as
it is called from nowhere and is therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index 171fc5cbf27c..53ab6debb6f3 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -108,19 +108,6 @@
 #define ODM_dbg_exit() { DbgPrint("<== %s\n", __func__); }
 #define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 
-#define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr)		\
-	if (((comp) & pDM_Odm->DebugComponents) &&			\
-	    (level <= pDM_Odm->DebugLevel)) {				\
-		int __i;						\
-		u8 *__ptr = (u8 *)ptr;					\
-		DbgPrint("[ODM] ");					\
-		DbgPrint(title_str);					\
-		DbgPrint(" ");						\
-		for (__i = 0; __i < 6; __i++)				\
-			DbgPrint("%02X%s", __ptr[__i], (__i==5)?"":"-");\
-		DbgPrint("\n");						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

