Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A5A2F9D
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:34 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id e7so82886957edu.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDyKLq5fjyeL62hL+6feutXGTzuTSzr50xAs4CUIRQM=;
        b=qQwdmm/oJ4xW0/ljbyf2t0jFxgYntfMDrrS8//mKMyhMYsdWqhwXefvqhUxT/lkBcp
         jnJ++Oe/gErS+uXHdG9U50REpDk/A0mrTbNMjiG75xAEQ8Zf1L4Nlax18IM8IbwtHic2
         72f9lhL3/6QYj3q41H9581tPwi/8Gv3WfavThwjtDo/xiYFS7KvpcQSg5l676JJN16tH
         JAO8Fs3d8SKLmCYg5bdXQvxrXpkutgfi5KilIz/Lh9UYiEyfjqSymmHfbYraWirqaUk6
         tI28vzmEjHbeJH8wjBFAKNHtLsBrLHj6YNjPhbJ6isMziq+hQm+97ghSlcwrHI0vqfNm
         fRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDyKLq5fjyeL62hL+6feutXGTzuTSzr50xAs4CUIRQM=;
        b=ugjzVunnoEomGSMk5G1zaqSCt0Svkkixt51F/7rVylzbb2U4NOwNGzyjNtBf95b3R7
         VqfeH2r8zToHwZbtLyCsiVg0ZwpqM41aK/7d2lJFAYGjHYzJc4A75/FfVKc30UnDUg+I
         MmQn3WdqQuv2aVHkMsWmMm/+mFqIE2OCl58kQjNPdXamyRZZOsXvbzG7Ch6eqZDhPUn8
         xNkrhewFb/HWlNC1OA3h6kgoOMiF1UnrtO8SBu68BmiAd5s8hVxPoI5zWwdiVi7h4192
         aULcwj9kgGCNEuzhG5nzsCTkJz8ePxcTPCH05spHwtlMC7XIB36rFSIhjbJ0b/tMJ6We
         s5bQ==
X-Gm-Message-State: AOAM533gyUZp31rhqPg8KjGfmjENXWDcCcqHo0PrQ2AZcdL/3Tso5AE5
	8RgjHGx5TRwPhObFZsG7ioc=
X-Google-Smtp-Source: ABdhPJzH44clthiIihsWVNBEhRtG0Aqvaz87qdAP9CWP3eJC8c+8PzqasqJ9h3/JTSa31pua3ULNZA==
X-Received: by 2002:aa7:d806:: with SMTP id v6mr6519006edq.309.1619794652922;
        Fri, 30 Apr 2021 07:57:32 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id cq12sm1432640edb.87.2021.04.30.07.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/43] staging: rtl8723bs: remove unused ASSERT macro
Date: Fri, 30 Apr 2021 16:56:38 +0200
Message-Id: <f13bc57cc3a821c40443dddc38258b87962774a7.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

