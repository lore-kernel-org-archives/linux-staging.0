Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CA32F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:32 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u17so103937059ejk.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDyKLq5fjyeL62hL+6feutXGTzuTSzr50xAs4CUIRQM=;
        b=ZmpoSWhmVFsEPGYgXDKray/EBzI25ZlH/YI99h7hu+uqxlFN8GQMvHi2Ag/HB14fy0
         t/DrK8IZk3dcbDde0SfAEgTAn1nDxXB3oUxaCuEirAXMtlkcqglvZ37UHDkN/O5zKQ71
         gnbtFASbAXHjhk6g59hwR9476SfqoA5EA9I25uMJkyIWSVdr1pTMDsbc26/QQmx9GMo6
         kwa7Dhvn+G62KQx4tg6rlz56IyeTjvLbzbLl8iuMrNUJonfWvSg8ehEz16k9EmfP9dOM
         8kav5uxaoNhjzTVIXtWHa26fIbjqcf1doevV4G1Eixzfm07Gm0U6czRExLZ/YZ6FOsaC
         3mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDyKLq5fjyeL62hL+6feutXGTzuTSzr50xAs4CUIRQM=;
        b=t65lzzIVLxsEmbekk2TNv75JCW1NoBAUmVWaVI3Q0GAapCdJPzywTCwRj8b+nGAbWP
         +ONDjBAX34izrVxtiVyWw2fmVQ2/ht5GlKzMSNjUTkWZwMVHQvuUvCMqzgEKzfzylftO
         Yv/sXvRfCyY6sg1gLuwOhV8SKUmpFQftj8rlrejmkS3+pPx1RATivn0KuNqDkJ/4BPtA
         5puZ2wfxKoMRuwXCxKUCT5AabtcNW/Yn45RV4SLualOpGXPDLouNgWRAh0KHGHC78jhZ
         dDhJkXknVJ5Rw+bRnnzEIJOvZk6QbymSpXrP4PBJubaJYR1Cz8Ndy2p0C+e2olQOiYzV
         rkHA==
X-Gm-Message-State: AOAM531FM+hvDmallmqw9QJDkjUeJFSPTMrtmwo8LGOGDgUgOG/o9j7n
	Osg2Pj9OOtU+o+CZvH+RESk=
X-Google-Smtp-Source: ABdhPJxr1h+aFB3HGcPF7cWcGX2AbMkOLV2t85Epzc4lTzjBeoI9rk8lfBNsfiqkJN4qri+q7zmZ/w==
X-Received: by 2002:a17:906:5a83:: with SMTP id l3mr2847326ejq.50.1619768670965;
        Fri, 30 Apr 2021 00:44:30 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id f19sm652724edu.12.2021.04.30.00.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:30 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/43] staging: rtl8723bs: remove unused ASSERT macro
Date: Fri, 30 Apr 2021 09:43:34 +0200
Message-Id: <007c7e1fd9681674dfa71ee2a4577b01a53764f9.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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

