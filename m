Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62F3481
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:24:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l11-20020a7bcf0b0000b0290253545c2997so7426622wmg.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Is39HpL/PKw5LqFK5S/i54PTBc1QGMOiWY+feaoJszs=;
        b=aGbymugbX5LmqAdYCoF2+x692NPkiLr2tyL7TvmXILh8y18pAhWHrDFYlfiHIY6G++
         0k3Un2igZw3rYZUXxJMPeMNev5xc3CxhHFfn3EYSwaji3e6Q5vaScWLKXUtXqMVOi1Wd
         7QRd3X7N21vqzzUmSPJseZe5QcMOlIcEeYNhIj9NGIPp7a7DQ/+He4oB9GBzTBmS+cRu
         ORFc2xTo7deDeyMkV9lJc+Cz+ZEJI8aeMInnZY10eiflCCemL8GtR+UdMVkc+BGuCR57
         q1HiQaFfFlyvhym4787+KFT6g4EwIitCFlsExobmzNLn3Hu0YFbAci2DW4DumJu1eHph
         vk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Is39HpL/PKw5LqFK5S/i54PTBc1QGMOiWY+feaoJszs=;
        b=VwR2H/jfoZsQN3qpW64p5zOkc3iwDdGAg5PIvT/GhEw/u37GR1Ia+vMmp+JphtKz12
         3bPtQk9FC4BttlpXMPlx/v89dDJmJSl6W/ohWd/YXhrcLrhM9VlVZszwv0kNqRvBXLXl
         i3hjxqPZL/6TGHgxQH5ZxytDeTGvO4C/E8tHdr45seTZY/sNqYwv4yzRy/0ibhwl/fWx
         GZeaJIv+Z0GGcfg6zpIMnBkebBh/84hoRehTmIBYFEMaePnls5NPxV7g5AmSiLv+8vEZ
         REgf/GZbnJQUf9Fe8tqnQZWdHIId5sof9hHqoVXFNJ6mzW8CTPK5PZFOES458qZHw09G
         YFBw==
X-Gm-Message-State: AOAM533LmWXOVPbEuh448RRp7c3bQLXF3SyjFJ68FaysfcCk6x1E6pGu
	a/IL7ZNYORUJmNsBBuV20tRdgw==
X-Google-Smtp-Source: ABdhPJyi5tWn37aXk152I+dVFxSvPgxt6uHj/ta0B2CCj2jrN57dpmdA2SMSDXVw5wJRJQhnFyci1w==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr5658867wmj.144.1627691044277;
        Fri, 30 Jul 2021 17:24:04 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:24:03 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] staging: r8188eu: remove ODM_RT_TRACE macro definition
Date: Sat, 31 Jul 2021 01:23:51 +0100
Message-Id: <20210731002353.68479-13-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_TRACE macro definition from include/odm_debug.h, as
it is called from nowhere and is therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index c70fe73e3339..38b07664b07c 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -68,24 +68,6 @@
 #define RT_PRINTK(fmt, args...)				\
 	DbgPrint( "%s(): " fmt, __func__, ## args);
 
-#define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)				\
-	if (((comp) & pDM_Odm->DebugComponents) &&			\
-	    (level <= pDM_Odm->DebugLevel)) {				\
-		if (pDM_Odm->SupportICType == ODM_RTL8192C)		\
-			DbgPrint("[ODM-92C] ");				\
-		else if (pDM_Odm->SupportICType == ODM_RTL8192D)	\
-			DbgPrint("[ODM-92D] ");				\
-		else if (pDM_Odm->SupportICType == ODM_RTL8723A)	\
-			DbgPrint("[ODM-8723A] ");			\
-		else if (pDM_Odm->SupportICType == ODM_RTL8188E)	\
-			DbgPrint("[ODM-8188E] ");			\
-		else if (pDM_Odm->SupportICType == ODM_RTL8812)		\
-			DbgPrint("[ODM-8812] ");			\
-		else if (pDM_Odm->SupportICType == ODM_RTL8821)		\
-			DbgPrint("[ODM-8821] ");			\
-		RT_PRINTK fmt;						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

