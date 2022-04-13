Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCBD28EE;
	Wed, 13 Apr 2022 11:36:34 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id o5so1738721pjr.0;
        Wed, 13 Apr 2022 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zf4sTtMYOsl6O0VXx5PG6tdTUoIbgRuzf7TFuOtj/Jw=;
        b=W+RkYRTCC/HMY1Atq+2ML2koRNsaqn79y2SOKXZqxqPAEuuojHN/Up7NJoZl/kFIXR
         ChztVAIIQht5gGkpBbC37KMneg4u0lXtR80F448bWF5HobD8sXFkUztSUAkTrGQ6yXuE
         5gdeK5X5v7fglmV19VnLkMuPu5pPl9WiLK6KKcK6wb57jZeFk2ZnBZSwit3PFUEBWrZw
         spFhYhI1X9Ya1REJM6uHLLQCGA4SrRXpUPVxXQo2YMnscrI63Ibt+Un+/CRY8TrJGNml
         YhWIyUu+aX56lW8oiK01WD9WZloGlMz1SkH2xKWnZlNDZbBZ6SW8B289eoHTHjM2jPmA
         OKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zf4sTtMYOsl6O0VXx5PG6tdTUoIbgRuzf7TFuOtj/Jw=;
        b=jx39+VVWkb/FErtUBy626IPBNBPWsY2HnFLXb0n3lsGix5TBlgrDWQpyFELpRz+qYv
         INV0itYcvCYzCfAWe70AmO+YVOME7jq4niXvbMBAOIA71fDykVUMpnmFLY8eCEZdLXQM
         RLJ61AavYoRFwrwB1/PwTXG0+H6UMsAK+b8qYRZbdq8lQHYos3ONZVwl9ze1KNUaHtid
         TtYIKaRTYcEpmY0np7xkabQX2z/tn8RSbdczcLcPB3ZXEOhrXh9kmz3E3+KLS4OM4bE8
         9fvxxqoNEBXlNGeRlhJ2JVIAQCVqAR8j/ZOC+MRZy0fr9eKJj4Dm8ULFgYJOAXTSsub1
         2f0A==
X-Gm-Message-State: AOAM532yRL/F2UznevahUgpwUQgIzyWbi24xm/ffrb2lIwEjKRD6Ddkh
	L+/kR7QNglOpcLfAcHlnf7g=
X-Google-Smtp-Source: ABdhPJxFW8//KvpEgzi7Zu7E0W36tSj8WgI7rzQjgO+ZV4/XzcL5+O3sd1itMgoirE6betArNoBHvA==
X-Received: by 2002:a17:902:9001:b0:156:a567:2683 with SMTP id a1-20020a170902900100b00156a5672683mr42107095plp.164.1649849794255;
        Wed, 13 Apr 2022 04:36:34 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id y16-20020a63b510000000b00398d8b19bbfsm5878913pge.23.2022.04.13.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 04:36:32 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: florian.c.schilhabel@googlemail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2] staging: rtl8712: cmd: remove redundant space after cast
Date: Wed, 13 Apr 2022 17:05:31 +0530
Message-Id: <20220413113531.31224-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary space immediately after a cast. Identified by
checkpatch: CHECK: No space is necessary after a cast.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---

v1 -> v2: Updated the commit message of the fixes.

---
 drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index f5746020a1b7..4be96df5a329 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -536,7 +536,7 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
 		return;
 	}
 	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
-	ph2c->rsp = (u8 *) psetstakey_rsp;
+	ph2c->rsp = (u8 *)psetstakey_rsp;
 	ph2c->rspsz = sizeof(struct set_stakey_rsp);
 	ether_addr_copy(psetstakey_para->addr, sta->hwaddr);
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-- 
2.25.1

