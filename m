Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF60C3FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s25so10698702edw.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lURT0bL/Ua3DL+p4fVIfhBItarDnpsIG5IN7GeJbB/Q=;
        b=aChiEZWVp3PwDKNCjzgrRAjXsk/tuCzpDMkgwoV0iX7fpzQIFOsOpBltOKxqlBbg8c
         kCkgCuZsmrq87reIL6Y7Abp6jYxELdDxHquGp6I5tMxUKzn98mpyOXXNmwtXEMPejRCe
         CxrHqPI7huitwFkiScseeU1rSwxHd9XaCLc/ayQCf2zAjKM7HTkLg/y2b1RWfOe9mXfC
         Ff6PYenRipq+qp7Bx2sCh3PQimu1ytPk77BSDYnJolqdUzssQPzt896nbrI4j3gEJX58
         zMTExMb1gGTu64BSs6e8bh9pDbPLAvaZPMzdmoCvCpxC4DJmqN3oF7Y4wCpOS1rWuV+B
         4GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lURT0bL/Ua3DL+p4fVIfhBItarDnpsIG5IN7GeJbB/Q=;
        b=DqA3imcSq3pNcnK81UfzAGZMdOb/9nIpKXH/eYxWmRlOrXrZQ0Lz4TWZm9ZlyMDiA0
         jv9xcp2vD1Kcn3eM67wavdVSdCAtcBbqmdn4uq7Ku4Ec5OOHl0O1ayYq6RcMI9nZElWK
         LUvoaXNMt7SITJnAkyPhi65pJ75T9kmVCVCqUyznMLmWIl6FDnjFX2UQUlCQu7Vd4MGm
         5nq+/5QPxaj23OsCnCIjCFIXFXnTw1Wm5s5je3NOJik/zb6eyDM3A2p0XhAkBcdYxOWN
         UgOHtP+xqEoB2i5euC0Deu64UNYO6nArLPhKQA9rSHZGONH5n0xRSjZY1m93fW3sF9Z2
         2pZw==
X-Gm-Message-State: AOAM5311ft8djlGVm/Er62jO2bwdxDBlb3M4TsCWFpFM18c6lhsCGc3p
	343dkbmVrltdbv9FZLVyZQg=
X-Google-Smtp-Source: ABdhPJxrCO/6K4O4x3PnLW/quSxv+YM6ch+/cx1KI5mXLM6lxtfFB1nvxGME5UgFrxr9Rvb1JvGPKQ==
X-Received: by 2002:aa7:c882:: with SMTP id p2mr14579275eds.46.1630954974250;
        Mon, 06 Sep 2021 12:02:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:53 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 12/40] staging: r8188eu: remove unused enum hal_intf_ps_func
Date: Mon,  6 Sep 2021 21:01:55 +0200
Message-Id: <20210906190223.11396-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
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

