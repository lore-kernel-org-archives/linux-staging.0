Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534CE3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:14 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j17-20020a05600c1c1100b002e754875260so3245577wms.4
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p01o0QxDqYd8viyOgbR3daJCfiCCbU6aM9fya+aInb8=;
        b=ZbhB65qJpxk5QG7/3h7y9Ofep5yrr9lR12BHgCRwOSLGUEdS2ULDGHLllF/W0tp884
         aFptRvCY++/Ru4n18HvuXqQo3xrw/VWoxpGHOzmE4rI0zWkA+IdAxUs1aMGgZtln04oO
         Lafz9q7qrebwVIJXv5r1pdyJnvuMouRB/s8diT79o/8SWuaBmilDgQcRwcQLLPyzaPkd
         efyPYRdny9NN3yt486xN4DigiW2tPE7+MW9KtjwqJ6RTYuv2fOCBkyi+OLcTRJEW3D+g
         IdkLG/VVnmSbWB2XQ7CJeoukUFCWPup84qDhJ17YgDsw/jYXLUAssXl2c1Ab5/kkhFZU
         S13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p01o0QxDqYd8viyOgbR3daJCfiCCbU6aM9fya+aInb8=;
        b=vMbhefw3/0aefL7vx+89SkSLU+oKf2iPKYHSvo5/1aA5gpKHkslSLM93zQue2yxnsv
         kQT5vvwWC9KiuOJ8yAsWYWpAmK9SyAaGiuxf/b743G8gNoExijEoJD0kbXoJWoL7Iijm
         z4xOKDh5aY0I3JV+ykEWTGQdCU6NkjDpgIESzzNYAMX4d2AH8m4JDzjWm8svqE2jnT3t
         f8cEqxkCN5Bt5C6fZMWKlzpszcFyL93zgqAnj3ghmKiMRVa5SAV3ZoLu8ps09AUJb5Nb
         d2Uc7SgqefejxLjPVda1EJ+fYyng3WeUYikkYKbmTabC9sQnYksFnnmgZSHZVYCY1htP
         A+Ag==
X-Gm-Message-State: AOAM531DOUgGzjdCRvm5Wg7TyW/eTYBds/3i3f73qkjHLXshDRzFkF+0
	QYbcMbN5fmkNiJG1aGRFASI=
X-Google-Smtp-Source: ABdhPJyPwOxI1xEJQ7cieLgRwaYCH3zZ2K5q8f2kheJIoTcrluUtWO2/oOSmiAYUrsggl7dd4XI6EA==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr2741822wmh.46.1631366832803;
        Sat, 11 Sep 2021 06:27:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/18] staging: r8188eu: remove unused ODM_FreeWorkItem()
Date: Sat, 11 Sep 2021 15:26:26 +0200
Message-Id: <20210911132635.30369-10-straube.linux@gmail.com>
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

Function ODM_FreeWorkItem() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 4 ----
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index bd9d9f832eaf..f3b6fb886550 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -94,10 +94,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 }
 
 /*  Work item relative API. FOr MP driver only~! */
-void ODM_FreeWorkItem(void *pRtWorkItem)
-{
-}
-
 void ODM_ScheduleWorkItem(void *pRtWorkItem)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 5ed4061d2f48..dd14f465e4d8 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -96,8 +96,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
 /*  ODM MISC-workitem relative API. */
-void ODM_FreeWorkItem(void *pRtWorkItem);
-
 void ODM_ScheduleWorkItem(void *pRtWorkItem);
 
 void ODM_IsWorkItemScheduled(void *pRtWorkItem);
-- 
2.33.0

