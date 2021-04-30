Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62AD2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id j28so18914277edy.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDyKLq5fjyeL62hL+6feutXGTzuTSzr50xAs4CUIRQM=;
        b=DvULl66FhxFEmYGhUNdSFUs5tQtELRovgPLvt+DtlLHAHvigE0E/B+BuvHHX45tkGP
         KJUczN2v1yy3p1lJKxq6kbTads7LXxp764TZ/oo/F31AM24cL/CsOc8b0UXEOgjbmkNa
         gX794wXRab97mz7leHe5ZTm+1AuR0NOcbllm2rmz+61ZuFXFH3v7UOHI+yPe8Euft7L/
         rU/rIFz9TrVVdWWtnyfyagyuyyxlA97KFFA9thNCjL21fFm84/miOfs6KReNjpGcSjAU
         bYThyNbGEFRHYIf5XsvGQxP4akVl6l7T692gSHj6YResk1oqtkLdWUS773YvYc/w+Fvg
         lpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDyKLq5fjyeL62hL+6feutXGTzuTSzr50xAs4CUIRQM=;
        b=oXddZifJwzscI1sMJjMfWt92u8PCB5R16RW9Mk/tRVoouwQ4huxQbepNmzN+mhLu4+
         HA7BS2u8n05ZJfGHbpd/COKhEcrCaNezk5Ns3n7ivAO69JJF99Dx2WvTaqJmWLyXBExG
         OgFEN2vKciEsY0zo+uUXVvg0Lg6jwVqIeFXLOCdu++vbgoq8qtbRKnrkt3qG3Sv9MyDq
         +qi30XDTUSOxI6XjpJ7Q4FEScBzAjHLaga07IT8C8fEG7sBSdFQ++ypYDcL/BWivqpf7
         IAevfUIiiFFVzZOUfi38eyKufWk8+e+5M+vf+da4sOQwsm0pi31pL3OH0pGVvhYifd+U
         1Kkg==
X-Gm-Message-State: AOAM530RhAq+wpelmCUoKGula/tlyo3Kr71BMpCgKZrB55qfgeEENJa2
	xBW0RNdx+Nhp0ztg3KswlFmxGG2Rvyc=
X-Google-Smtp-Source: ABdhPJwBxIc8I+rD6O3w0xVT4Dn55M9OpjtCwOqCvoTcP9hXlFmgY0wtQamiYH+qxd4CTWpFEmMBKA==
X-Received: by 2002:a05:6402:8d3:: with SMTP id d19mr6389527edz.302.1619793878440;
        Fri, 30 Apr 2021 07:44:38 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id k5sm1623471edk.46.2021.04.30.07.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:38 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/43] staging: rtl8723bs: remove unused ASSERT macro
Date: Fri, 30 Apr 2021 16:43:46 +0200
Message-Id: <08ae971f989010c85f0ae0196461671479cc3048.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused do nothing ASSERT macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 8ae9948fb0c6..78b9b4548dcb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -92,7 +92,6 @@
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 #ifndef ASSERT
-	#define ASSERT(expr)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

