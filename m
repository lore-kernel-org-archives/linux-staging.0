Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A728E0;
	Wed, 13 Apr 2022 10:24:28 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso5840113pju.1;
        Wed, 13 Apr 2022 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aLrBLPs/BclxlxyZGvm9aVZR/0fCDUSapsC45+5YCt8=;
        b=ly7ghn/O2LbtNgXVYHaUcn8UgD4a85de73UziNbaoPPMcQei61Ztq/5VhPZpA3ZyBl
         eqoxCRW9ekOnV2l0aHlfr55CARpISabMxKeJIWHqlYvwpi+2i/KCFycj7i4I06BQmgH9
         /iJ9lmu8x8r+URXbMslxzS1NLg0MJi+2GTPqxzFZmHnJnsrFgsKIr8AMQ0TYc8dh7BWJ
         aTKAhgVuH+U28fh/XoM8nX9jRxoYjZ5coArRS5AOphpKdHf6nyq2SJTw949ZlUk1/SqK
         t5s3B3CKfa7KIcF9Snr6j9Z5DI+jzsSzUabFCv2SVmO/2fIRST/ic3fhF8QnA5JozFox
         f/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aLrBLPs/BclxlxyZGvm9aVZR/0fCDUSapsC45+5YCt8=;
        b=xNPZUq2I4/fu8mIXTpMKM5ot+KtnNButD6C6BqcJzPQt2f5RvsAspMmxyelx7B5OSl
         o25x+kLzrh2NMSHnjKhAn5Mki3iDp2HMHTptpR4+hAMvcetkqMgEOf55/QdvpbtoixRg
         a7YvV4VEAJcyRtFHEFSqa8WXOp3nBfMdBUNqeQC0NTesfkBDE8c2w8K1+/gvrpRComvn
         KY2ds5TONTQigWB/sLdiMjo0otHJ1ZXH4pyn7PaMuZLK18FL33ukLmgIn+7QzWd5RhZ1
         EEr5qgLdYZGf6kHT77cKd50XWLzhgrXDhZFyW2Mwl25U6RkSupIiIrr31/y0eB76I7uS
         R2vQ==
X-Gm-Message-State: AOAM531BhvOmf6lNPfMajz+u3y+FcyhWT7kMKHB66194kAW/pQRtt/Mf
	hRa7NrYDgxVDMEuYo6usQFBei5QcI3LcsQ==
X-Google-Smtp-Source: ABdhPJz5tty63VdLx1dmJCmpkGTwUZy5vaY3xvPvBrHsZSDlZmMwV2NxbvbOlHC9cyFvlEE/JS8w7A==
X-Received: by 2002:a17:90a:fe05:b0:1cb:b98e:8c78 with SMTP id ck5-20020a17090afe0500b001cbb98e8c78mr9785891pjb.181.1649845468262;
        Wed, 13 Apr 2022 03:24:28 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id x129-20020a627c87000000b00506e53ddd4fsm1273550pfc.114.2022.04.13.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 03:24:27 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: florian.c.schilhabel@googlemail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: rtl8712: cmd:remove redundant space after cast
Date: Wed, 13 Apr 2022 15:53:56 +0530
Message-Id: <20220413102356.25357-1-aliyarahmani786@gmail.com>
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

