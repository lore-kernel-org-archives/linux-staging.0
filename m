Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BF3FDC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id u19so10543673edb.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lURT0bL/Ua3DL+p4fVIfhBItarDnpsIG5IN7GeJbB/Q=;
        b=BmddaGugaU1xVoVsKmmDZU9ArzsbPtCO2WAEr9pbxBSWIKx7xi92dRTfpGv8gSz+Rc
         K5lUDzTGcD8de3FpKt0VtN7gG/7g3/hjl5Eni6dtVpiCpNIvdeQNpnKGqyIzy+58TR0r
         fCscbbenvuMhdXHG1cIx9irEwdMHazjC7Z37NMQRF3meer2J0+mZlGI3HFCCFYGrPPBd
         GDMh4c7dEuo90E8SY0XIo9kmu6nYF8mCkN/A89fkSq3anCcjRXbPJKE2kSvlqS/mboVY
         bWoHHeF0bf7SbmB54qDY1d92WeDNwcJN1ZThThGlVUGJm7GQPw8aNECwzNgzjdjLtoa7
         u56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lURT0bL/Ua3DL+p4fVIfhBItarDnpsIG5IN7GeJbB/Q=;
        b=tCGrf7fJC0HK0YnykRgjfyEskihhnEBiODIgmiMs6OYoMnVjl1y5BSexE1o1KYLJfF
         qK1xYLYjEadIwPlf818Jl5x065AMyFEZNS+HdlBtkSTrEyiIEj1M0/hemSQL/rSZPoiw
         xUiepJoR3UNtdo+7gDO8cZbC7oZudTkQaGHSxb5AClVPzF3DXz1EBNmPjclm54/JfDzc
         o53CBIXFYs4Gkb7FKsy5Fhz5bD2enbrmVFATJJDBRvjDkNQF/xNZi7vKVp3dJLq3ffO1
         72PzG0enSGSjtutPa0yYvCaXW35jCSQSDLA7yNfoJHuYCB3/ITIS1fmYM/0jV21oEOpp
         2Edg==
X-Gm-Message-State: AOAM5306Qydrw+xt7+0rh5ICN3NHEZb9+XydjnutEPXXQZP/Lifmtudp
	CCn0Rw8lSdX2VbqSGSxZ98Y=
X-Google-Smtp-Source: ABdhPJyqeZF68fRvL3JczaJYLdIlqSScB0fSQgrppMPeYPqv78zgvrOhEzWDjvLKw+SdmkpXLGx9ng==
X-Received: by 2002:a50:8dcd:: with SMTP id s13mr14504666edh.383.1630952710251;
        Mon, 06 Sep 2021 11:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/40] staging: r8188eu: remove unused enum hal_intf_ps_func
Date: Mon,  6 Sep 2021 20:24:10 +0200
Message-Id: <20210906182438.5417-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HAL_USB_SELECT_SUSPEND and HAL_MAX_ID are both unused,
so enum hal_intf_ps_func can be removed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/hal_intf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index eab0b8576c92..3bf0d18e2ba8 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -121,11 +121,6 @@ enum hal_odm_variable {
 	HAL_ODM_WIFI_DISPLAY_STATE,
 };
 
-enum hal_intf_ps_func {
-	HAL_USB_SELECT_SUSPEND,
-	HAL_MAX_ID,
-};
-
 typedef s32 (*c2h_id_filter)(u8 id);
 
 struct hal_ops {
-- 
2.33.0

