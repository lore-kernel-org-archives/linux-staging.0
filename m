Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168267A;
	Mon,  4 Apr 2022 14:52:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso5768831wmn.1;
        Mon, 04 Apr 2022 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qYxLsEyrkgXdnm5LAQn/zPFIjossJ27xzVLlTLKNJ1o=;
        b=mJwseqYMjX/TfeU0TOz5lm6Zk4glWq/g3mAYF7Z4aRpv+SDPrL8NZyBjFJ3xeKA1W9
         nygt+qc3exzXmzW90iQSz1PtJ2DGIqDxkXPTKcqsYffKmUADTvOyM0UDX/cv4hUsayET
         5nc2qAPmbJzkwxox6fOSHbKecczcn2eUCS5mHAY1piJgJArOS4t5Gt7vcX914nqEHCHV
         KFNKev5qRw4vMDGKJWAtryaWmFOZBoDURehR9o+t/0WCRn7a7XnqiVXifEOlMMTm5emR
         l6g5bVk4Bq1ZpF0RUXNdk/1TJ3Gs7R6JDloT/xpvIeMbhdkA6HY1k+z+YrbmzokwPPH6
         zXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qYxLsEyrkgXdnm5LAQn/zPFIjossJ27xzVLlTLKNJ1o=;
        b=N3yqTWpjlqIu0+T2VDz6rwxVx0b/oj9w8EPv8zNMF5dvn1qMR6VLnJyAUk27yXsl36
         LvHzXNyw6Z0YtARzteUq1qMhx8kX6chsAq3GS4U8N1gN8akcyx3SvcDb/8OWGlfFwsaS
         tCv9UpEjbx3xOHc48ckSvhVsDbrVeEqDE5XDscfPmc/c4DwjRobapuFJAbJNltnd/h36
         CdqPqCvlFE3SEswfURfe2YooAuKNCWMSfzoKRGuHshW6P4ZhPMsbrvr2DeViimkVmDW0
         tunOD+slWFZejUknXgRW5A2Q8tX8OEM1b3fT9IzhpRlVJG9EVeWPvVvSkIbUADJYH1xG
         B+sA==
X-Gm-Message-State: AOAM533JI10d/8K48eUkGVllYYq144CwKH0pY8JBcz0FtHUGQhtjg1nC
	SJvknao4SS0EGFcwKF9NzR8=
X-Google-Smtp-Source: ABdhPJyAXJ20VBx2Ek7B4vBvpOYLDKniIMEAu9TwaQfHA38MDBoTVIZu0vLfi112O8MFSf5vnU6jvg==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id m4-20020a7bcb84000000b00382a9b92339mr20140642wmi.91.1649083941411;
        Mon, 04 Apr 2022 07:52:21 -0700 (PDT)
Received: from alaa-emad ([41.42.174.117])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b0038c8dbdc1a3sm9412536wmg.38.2022.04.04.07.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 07:52:20 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] staging: r8188eu: remove unnecessary blank lines
Date: Mon,  4 Apr 2022 16:52:17 +0200
Message-Id: <20220404145217.15069-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 2ff78ed1faab..ac6effbecf6d 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -188,7 +188,6 @@ void	expire_timeout_chk(struct adapter *padapter)
 				spin_lock_bh(&pstapriv->auth_list_lock);
 			}
 		}
-
 	}
 	spin_unlock_bh(&pstapriv->auth_list_lock);
 
@@ -381,7 +380,6 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 		/* set ra_id, init_rate */
 		psta->raid = raid;
 		psta->init_rate = init_rate;
-
 	}
 }
 
@@ -455,7 +453,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
-- 
2.35.1

