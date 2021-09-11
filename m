Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663A3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y132so3131190wmc.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U1XjQypb/ml0GfH6ntHdvBBP2tDxlOwUZUZ6PJclaWc=;
        b=AwBQcCqDmEBkhwbTKbRcklMzO5PvasgT5Dj4W+mhpSzEcWxxMIBNtwomG6czMKC5mW
         5yq8RGbrtbVN92hTcvQE515ZXyIIZbUjy4PgnZG0p9Q7ls1OxKpR5g4nlaFZ9pd6RYpy
         5JqZsUG44t0LWk/mM54wBeu0/NBF+mW/90yjl6zvzPENTxnReaxScVzPB4Is3JHeBbKL
         ctLNfa0M1fEYSGXhvnJKWqVwD0kSe8IDzKifYsePXFrAWTiT14WNBnsSIe+6l4fhRYpt
         jiFGW5ztcSB8gnskoOZXnpUW3var2BM1vo70hrMl988vkjkcL++MNd+H5wB//n1JjN/l
         dZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U1XjQypb/ml0GfH6ntHdvBBP2tDxlOwUZUZ6PJclaWc=;
        b=hAD5lrQksYVycAClm8e+c2aEJ6ddiomNBvXx5iLC+WjObMCp0IUr0DlC6B/i0gzisX
         9ZYuyRFTT6BjPYZOx5bo3ngeqR8ByWOIxsb7lKrmKUGa5lzOgttuLp3AIX5XfuV/SbX/
         +EDenURhBvzN0hSzJ8X2tJ+8PhcLrSo8zALalMKn7E/03bbd+lPByfwcstQCF2LMcFJT
         vdc+1OmPpAHFK1Jk+A+vQaIWpDQ1X0aALTwvKf/o+YmRK7xGR2OQjFhPb3kOxx3X2mEq
         Y4U3ZAPQnsbTPwqIcfebLT9alofOEy4nTrdHTpQSq8jaEsez2IGkQ5n7qrDizR53qSbx
         wOLg==
X-Gm-Message-State: AOAM531N1hcWCDIacnBGYZfeAyecResSfqmvqOhyauAU6DCEFEY+SzTe
	3IJwp9H7w2PGsymXyjcOaCw=
X-Google-Smtp-Source: ABdhPJzlXnnKRWOEckr7IBBL8SKCxSCHcQTKMRpb8FfBY28mDb9YWOEQG7UEUE/jkwiE9lf1NZ7S5A==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr2683566wmj.70.1631366829346;
        Sat, 11 Sep 2021 06:27:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/18] staging: r8188eu: remove unused ODM_sleep_us()
Date: Sat, 11 Sep 2021 15:26:22 +0200
Message-Id: <20210911132635.30369-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_sleep_us() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 7b36584f0e6d..80c8a18f3791 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -141,11 +141,6 @@ void ODM_sleep_ms(u32 ms)
 	msleep(ms);
 }
 
-void ODM_sleep_us(u32 us)
-{
-	rtw_usleep_os(us);
-}
-
 void ODM_SetTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer, u32 msDelay)
 {
 	_set_timer(pTimer, msDelay); /* ms */
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 9afc5178955f..45caa73c0af0 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -119,8 +119,6 @@ void ODM_delay_us(u32 us);
 
 void ODM_sleep_ms(u32 ms);
 
-void ODM_sleep_us(u32 us);
-
 void ODM_SetTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer,
 		  u32 msDelay);
 
-- 
2.33.0

