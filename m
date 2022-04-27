Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635133E5
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 19:01:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id s14so2368316plk.8
        for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u0vK5DOioCsOu8Z5Tn39+iFk9MTYah9fv3mNsqNjdus=;
        b=VGuPkdx1C2SRHqVcIOD3NwOHKSTxdpr4/FzXdBdKcq2ZkJoaKu1TdlHaunnM1K3WWH
         ipIbve51Y5/tGawUbxvvl+Z+mfKq/RaIKffRWPl9r/XSXVtYV2QmHGLuzwN1agT47SDk
         MMoLN8/y5f60qTWzGTHdt/D/ZVrjYDvshq31rMp05SxQnyn39XUTplndeYoZ8y0830Hx
         IR89RPQj3m8xWVmzXLp0X6+QP22DYHuMYdOnIVUiSGJXQreK//f2PqS6EFoIojGFaqLE
         548thIYFnoXHMcqh013B8sJsZVFYHfYCCvks/RLoLFb1RYtTDW/yLhmpSZfjtDgR+qQx
         ykbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u0vK5DOioCsOu8Z5Tn39+iFk9MTYah9fv3mNsqNjdus=;
        b=JuGPsaOXbbJI+7Ip8xr6WdNeN5/1IkBSzGM9bDZxG92tAaGnwG1rifFlMW5XyiOQ8W
         9Xg217rDL2tLvQyiUEGS4dI4uSHDpJRykzgqvRTSeW6RlKpBO5+fM6WByJerkr/sMOji
         nvR9cQUMQqK6hILamTAACoFel9Ma1QtFRsXqznmEhCSMVerp7fEfLXnvE4qmv7M35y2i
         AvXl82UIzT/dV1rwzJuFJq6CZzFFDaEklLOcWnOF2sR3XiA1HlwoVOo+UR+ov+lCttPV
         UjfUEKp4SLiu1ESg21+cLni3Ey+QAGCnJgTokcW3baryEb4bmQP/pAlViLG63wAovxuF
         nQ7Q==
X-Gm-Message-State: AOAM531QxA2D5yBeI2hW4QKl341JlPeXE3hhBG+zuCeJfm+oOR/X+Cpo
	faeX7lcB9Mk6KUu57yH5CLk=
X-Google-Smtp-Source: ABdhPJyEJ8yHmRhG5rBMwXHXYAHKMAwjdAhqOfNHguOBLZjVoCrmkuf7G/MW+zXsWCSaMhQB7WqVgA==
X-Received: by 2002:a17:903:290:b0:15c:1c87:e66c with SMTP id j16-20020a170903029000b0015c1c87e66cmr28402806plr.61.1651086070650;
        Wed, 27 Apr 2022 12:01:10 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:e0d6:603e:265d:6bf])
        by smtp.gmail.com with ESMTPSA id w129-20020a628287000000b0050d4246fbedsm11349661pfd.187.2022.04.27.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:01:10 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused semaphore "allrxreturnevt"
Date: Thu, 28 Apr 2022 00:30:54 +0530
Message-Id: <20220427190054.17841-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The semaphore allrxreturnevt of struct recv_priv is initialized but not 
used anywhere in the code.
Remove the initialization and the structure member.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 Compile tested only.

 drivers/staging/r8188eu/core/rtw_recv.c    | 2 --
 drivers/staging/r8188eu/include/rtw_recv.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index c1005ddaa..4060c0457 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -80,8 +80,6 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	}
 	precvpriv->rx_pending_cnt = 1;
 
-	sema_init(&precvpriv->allrxreturnevt, 0);
-
 	res = rtl8188eu_init_recv_priv(padapter);
 
 	timer_setup(&precvpriv->signal_stat_timer, rtw_signal_stat_timer_hdl, 0);
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index e57e48a51..66d240a71 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -166,7 +166,6 @@ struct recv_priv {
 	uint  rx_largepacket_crcerr;
 	uint  rx_smallpacket_crcerr;
 	uint  rx_middlepacket_crcerr;
-	struct semaphore allrxreturnevt;
 	u8	rx_pending_cnt;
 
 	struct tasklet_struct recv_tasklet;
-- 
2.30.2

