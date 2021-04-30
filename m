Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37C2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:16 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id gx5so13608589ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VSRdyXZZcxxoSZhQrgrWUXUUkaC+1Kk+0joSCnHO7Sk=;
        b=i33rYOTggasKM9qIUZXWBWuoQ68DxIDjCE26r7eMan0O4IwHCKTLILv3dSx8bkZHQ2
         mUsztz0pFnAX/wfFgkNmWmgk4WcSBmm92IcXIIwWasDOI2ESOo6ycSUf1ZrLQg7zr5l2
         HsWVJ+ahYRbenPyEwIxE997UePvqZvCSvTmuXUYzMNIUntoUxRIia/HDbIUZASqs/APV
         kZ5AenPSTI08iatUkNoEUDVaWVE6QCYPgqQ5d9QEqEYnjUPFnaEUtbfjpzPhSxSNbLUJ
         3vUa4ic2pmUwcDVNzX79aVKeQFVhcsC4PvWnd/YI/Q0rmb6R2mKPEc9VEH7iiIRwi0Eb
         Wj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VSRdyXZZcxxoSZhQrgrWUXUUkaC+1Kk+0joSCnHO7Sk=;
        b=MQ83UrWxWaAIivQtHd8rO06SU7BiMcGKlqG/l9cZGQzctqU6OWcsLbadtprXahF7fU
         chfbV7xlYDh1rCyJ6HCB8LR12FZCm9uxMHK3HnC/stT6ae/9aj4NKrLZ5X7gVFMJt332
         8h03h5usYKup4fwsGUOzAz2rfen2OgV7Re1ciAWzdLkuaQ/h1ec7hDsSNFnKbQNgsNc0
         9gGJAP2Gw0R4/5SySmluTnySpR6DOhuDYSX2cY03Upzp15Tbm7LQSZFgL8heSLMhBjJM
         563ARtPeo/a8sO5f5TuPxXp561Q3fzwQaZx5PyCzITWcMCZiVVRjaRnHzL/2R9QduNAj
         Tnwg==
X-Gm-Message-State: AOAM530zF0vj0nP0YQjlXashFEbaglInWTl/e2OCkR6cK4dkLVEa7CDk
	30VHSklRRDiTbbtSHw4gSUw6OlrNPJI=
X-Google-Smtp-Source: ABdhPJy+2OTz64h5SY2xinWf7VskuDaICWUurJeGybHZi9gn1cnxOAAtIv1F1FJuayNkQXw1xi0GHw==
X-Received: by 2002:a17:907:3f99:: with SMTP id hr25mr1546111ejc.231.1619794635448;
        Fri, 30 Apr 2021 07:57:15 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id o6sm1474531edw.24.2021.04.30.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/43] staging: rtl8723bs: remove undefined function prototypes
Date: Fri, 30 Apr 2021 16:56:27 +0200
Message-Id: <77c0c9027448be020a00e7ded9ffeb967341b588.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

