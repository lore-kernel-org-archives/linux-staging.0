Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C630672
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:01:23 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id bg1so1448696plb.13
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=4UhAzAPVc+icCp7Y2EezPOc71pObAloaN9xXjYM1qls=;
        b=MdjTjxH8zJRW8uWJWPTAZK1RSHyGcYMLiQabXQY/zKTEAt9ixk8Qiovp+36Zabc2Qm
         2UiOf5rnkOGqf1qd5LPLm+9vhcLRJUOn7z2Q+yMyuPDdqQPYXqEs5+JWGBcWvD0NMr/o
         BQ2hPynd0ivspYkVbnGqOBk6feCtleyN5N8J/3O2tX6TjxEkWCZ22Ppiin8JaJ2YoK5u
         VW/CHpEp1ImTl5kTTJhHpW+S6a1LNG/xVIbn4UUeTnq845S5K75Yhaf8/E5IJ/1aqiXF
         doGnbgADJf1bZWTCAVPBExMWDnyrv5aTt4zY0UxRho8PO9y4UlbBQNNiomHEM7486E1K
         az1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4UhAzAPVc+icCp7Y2EezPOc71pObAloaN9xXjYM1qls=;
        b=ZOyN0Tsa1+vGaeDPNf7FrsywcMMDDaeMlikjpbkqYmvyIXzlbWamxXVLNybXphvJvq
         FHJ9ylXbkP6z5i4JDyo0ITpCvRMDVhgHxRYKdZus8L5s6arrPX+yIrpufXHq2k8trzvZ
         96MbyIVRrh99QwEcfqUKL6LTWU/f1hVCz/7HaDDJ3rqDwhnMakRlVABXNNBRwCcQN3P1
         7ZtmOwNMQN746n5l75cYsZNhTQq/Zcq24cDGHiuSCzBY5sBPsNaUyBoKsasu/j5ovFXs
         l0FSEi+XfL9mQsotOVBd2fycp6UhX5feS9Pvtd7DjAj8gRbWFGljpSZC9ARoqnqtdWhz
         CcXw==
X-Gm-Message-State: AOAM533hZr1zzCIXzwYHmE8gTr7ImTI/coVWKl2VGbdeThb1StiG/5xo
	LHkgfj/kVIhRYvTevwzqZFk=
X-Google-Smtp-Source: ABdhPJyhVNmjEHSADuxEbsj5bOgEqE9c1xAjyTeT0qaF9+UN0Qzyo3McstdapWEB8c48mI54qsgyEw==
X-Received: by 2002:a17:90a:1b07:: with SMTP id q7mr20143146pjq.100.1630227683234;
        Sun, 29 Aug 2021 02:01:23 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id 130sm909293pfy.175.2021.08.29.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:01:22 -0700 (PDT)
Date: Sun, 29 Aug 2021 14:31:15 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove condition with no effect
Message-ID: <YStM2wxtkDAnRemt@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the condition with no effect (if == else) and group multiple
cases which execute same statement in rtw_mlme_ext.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 5a472a4954b0..4178b3c1ff57 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -453,17 +453,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 		fallthrough;
 	case WIFI_ASSOCREQ:
 	case WIFI_REASSOCREQ:
-		_mgt_dispatcher(padapter, ptable, precv_frame);
-		break;
 	case WIFI_PROBEREQ:
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
-			_mgt_dispatcher(padapter, ptable, precv_frame);
-		else
-			_mgt_dispatcher(padapter, ptable, precv_frame);
-		break;
 	case WIFI_BEACON:
-		_mgt_dispatcher(padapter, ptable, precv_frame);
-		break;
 	case WIFI_ACTION:
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
--
2.32.0

