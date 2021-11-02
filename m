Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52FC2C80
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 07:32:33 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id m26so18726201pff.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ArSKYKmyRdZmh0B2R8tddrdg6AgbCSgFZg/S3ExSds8=;
        b=qUgQsYpRgz50Vr4PlM2O635CCJCb0X2NSJa8nFM6xJ8eAINmMAnoSC/p1WbqA5sZH9
         xzD7CFsynOK//YFodWK9njO+NCjfgQvSvczgk+d6yNX8IWCgxz8ywVoty4ieCaBMymQe
         9i5WuM1qRkkjFmADMQVdCnJVgduo+2oULg2KKtfIfV3sm2dbhjSS3VKGOzUWue8RruKJ
         z1zyxxefygMdim6/9s9lZdHoGT+tQPEkR/92wvmHM3ciOU6Wc5Zh8dFJPzsJITMQ8t8b
         JjQuUBSN8p2vZYQVFnt5quEU6s4gJWT9XZfE38jFDjfz9YveCtFNhfdOO78ql52nvik1
         eF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ArSKYKmyRdZmh0B2R8tddrdg6AgbCSgFZg/S3ExSds8=;
        b=vOw1ZFVejZp3PDcizzt4hsGodwhe1NTk1+kkRGEwkIqjhNmw8uOWCP6hIUtN4qc98s
         CkdNJh7myOa6MR3BajShBVnvXuExQue4buHXEHUejUFilNJF54zlC2sSsWtTCwhMvAvm
         DEEiXc2k0+YTspOVTW5zRCihWqeecoVslgWHapQTs6TUCojTboFv2RNJigvLOQiOvuY4
         4Xs6qRPhVoy39MFQsqkDvC3HWHY7bAiq/DU0NXQzy1yjlnW1y3vHyWo5imGTwdAoual1
         9oUGkHiLDwnBh3pWsjjwS0pttJ0uh2zXagWJnSfFcuHAE8SQcy2mtJfQqNXVMOSm7K9D
         ksuQ==
X-Gm-Message-State: AOAM530iyGgws3f2ZXKztbkBJ8heFEuNY5rW95FgDMPSalVyMMC5zj9p
	XmZLm0p1LyFyRNbNTuuTV5Q=
X-Google-Smtp-Source: ABdhPJykGqNJovjLqSu7aNNxMhVD7URaBGswtCvspmDqJ7fzb1QpbPUj94LhOi0e+F60zoNojcCdow==
X-Received: by 2002:a63:e114:: with SMTP id z20mr16369156pgh.327.1635838353474;
        Tue, 02 Nov 2021 00:32:33 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id o22sm19256847pfu.50.2021.11.02.00.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 00:32:33 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: r8188eu: remove unneeded variable
Date: Tue,  2 Nov 2021 07:32:26 +0000
Message-Id: <20211102073226.7966-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 995a0248c26f..98863a06bdb6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -350,7 +350,6 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 int	init_mlme_ext_priv(struct adapter *padapter)
 {
-	int	res = _SUCCESS;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -373,7 +372,7 @@ int	init_mlme_ext_priv(struct adapter *padapter)
 
 	pmlmeext->active_keep_alive_check = true;
 
-	return res;
+	return _SUCCESS;
 }
 
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
@@ -1611,7 +1610,6 @@ unsigned int OnAtim(struct adapter *padapter, struct recv_frame *precv_frame)
 
 unsigned int on_action_spct(struct adapter *padapter, struct recv_frame *precv_frame)
 {
-	unsigned int ret = _FAIL;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->rx_data;
@@ -1644,7 +1642,7 @@ unsigned int on_action_spct(struct adapter *padapter, struct recv_frame *precv_f
 	}
 
 exit:
-	return ret;
+	return _FAIL;
 }
 
 unsigned int OnAction_qos(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.25.1

