Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A772F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:14 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id f24so5273646ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VSRdyXZZcxxoSZhQrgrWUXUUkaC+1Kk+0joSCnHO7Sk=;
        b=L50J7FYAXOKUKvuxOn2WDZKeul4PqLsiA1ZhPThBBudnDfrwPs8lQG5HN//48JNGSI
         8cDUojKu8+O1EIOSmss6l27mwOy4UXyhrIDh/D7m2fdoDPD2x4rcAAci605YMbCMvJNi
         wVqUPGfA3xPBQbrVWzPl956+GpD400HJQndV+l8j31fUpFPFuO/eW9puMRQjES4BemQc
         vNkoVSSgpTg33+q3UJgYiXGKcs+ShnsbzHQHt/gbJnxWtBMLYjYBUKyiVwgUbck5yVtL
         j2nncLxXnHbpPhUcfdy2G4j53u1Iq0Z/cc9Ki8KDQwWtrm2t9exJxQKu1j3JlWqPd5SH
         URxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VSRdyXZZcxxoSZhQrgrWUXUUkaC+1Kk+0joSCnHO7Sk=;
        b=h5hGcGWVTW63XrJsiy9BfIjItLPTnsB1RKaQ996z2Qbi0WrcPkLIn+tlWh/V+cDmVz
         tw3FRMZUL7qu5RkukkirGdjg8Sd7UKh8U1WXOxmCJwWnHaOe1jUTGx4C/gaL7DWYIKb/
         b1lpuXLIUwKpnqiVfROWbtKxhpXAordNenzM9ejeShXdiXjJyt/t9skaO92v3sXgEbTu
         /XnS6/eBvgJZX4dOhCFR35IO6h4fphoi1lJEY4RbsCXs/IwthR9ONFexuKXg46v+5Cz8
         x6Yc8zL/HbO4K/woDjdmmeQ3thYw67RAor/gTefycHiDUh+Anl3ArM8crsBQuLUmoWMT
         Ng/w==
X-Gm-Message-State: AOAM533S8aVD50AHVIlxU9y+A2qDaGkBf3o4kgFh/dFHl6p2k/rwsaBz
	4cuWp3bGBzaCwTZLdxSkHn5RO2HvlKEC2w==
X-Google-Smtp-Source: ABdhPJyoc9uFg0dL6wVxCz1ihfiMfLcB6kvKSJAz6b2opFw5RF994oCTuGFYD8Ys2hRskp2ohsow7A==
X-Received: by 2002:a17:906:27c3:: with SMTP id k3mr2764521ejc.519.1619768653051;
        Fri, 30 Apr 2021 00:44:13 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id b8sm1452823ejc.29.2021.04.30.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/43] staging: rtl8723bs: remove undefined function prototypes
Date: Fri, 30 Apr 2021 09:43:23 +0200
Message-Id: <3ee9b7a6998bcce9bfe702aa86639e093b4a5e45.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove undefined function prototypes.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_PathDiv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.h b/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
index 7a5bc00c3682..de69d5ea6ffd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
+++ b/drivers/staging/rtl8723bs/hal/odm_PathDiv.h
@@ -8,14 +8,4 @@
 #ifndef	__ODMPATHDIV_H__
 #define    __ODMPATHDIV_H__
 
-void
-odm_PathDiversityInit(
-	void *pDM_VOID
-	);
-
-void
-odm_PathDiversity(
-	void *pDM_VOID
-	);
-
  #endif		 /* ifndef  __ODMPATHDIV_H__ */
-- 
2.20.1

