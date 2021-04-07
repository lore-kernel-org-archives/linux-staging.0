Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5F270
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so1187089wma.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ATocqzISrvJhii+4mqvqB6jnvgXhMORzZO+oZXnMLk=;
        b=F7SMBjXMoQNt/S4a54onFYpu6SDPHVjbXyfXEls5sPeUr+sdCwYQVzNSx5qED+3o8u
         eiQVv0tzteF5QWlGBjY1HLYj1SKc6twX3pBjuasV6feOe6XgBIFKcHY6P9S3n7+1Cvqn
         r4rltEDzlNnxDYTxM4Cm0Fdjxg4KQNfOVgef6Ak0UQDN5ckD2+zFh1rAp7ssvRyWalS1
         JRxHErS3tgJqye+FuHQ9fwrQrn+4+nT5IvahkgwFAeQ3lGjPuziXTbh1vSr+VAuKrYh5
         YXre5KCPciSyn+33Pansm6vKIMRx2hqh5ncZkpkk+/07nH972+EP9hgxSZgWnAbwno3H
         wMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ATocqzISrvJhii+4mqvqB6jnvgXhMORzZO+oZXnMLk=;
        b=Wr+gAmnheOuR8ETvK5pGU9jWFskv67pCh+shU045rVJq8btKBoaVBMsP/kTD15Iy/7
         rM4q2D9ZzD+smIQruNWH+zILL+HWEbwBV9hrsBvHl0nP/SMxHJNnfp1KrkAIZhRL1chH
         fJ2qTeTQNPy1iXR7J8qiflNMdrjqm3dwqrjHarpTsjjacML/BaZ/fNcg4xqUAahYbZ14
         s8mMUzGIu1svshyPzgSvpeRr/Kxvw5cCg5eeI/u5u9WF+TX3j61lmm09IusBHxWHjdXR
         dV7CLYs/viZ2sMtKNIlcUYQ/z7hV96X472l2xtxyuZlvhmWfwQY1WnZhYDrz0vE+ZoPo
         UyRw==
X-Gm-Message-State: AOAM531W+N51fQGIWQlmsyvGq+FkyD8Y0auZg30YkTSSoQKHhwnLc6Jh
	rjT2g1qPfk0GoexDWQIkDmg=
X-Google-Smtp-Source: ABdhPJwxZOSviwk8T2n9bCN+M0nwC98LmNBuf2OsEeMRkttoVNgTu/deYLLOSemwtCVpcg6nPopWQg==
X-Received: by 2002:a1c:1d53:: with SMTP id d80mr3220568wmd.62.1617803427225;
        Wed, 07 Apr 2021 06:50:27 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id c2sm8663811wmr.22.2021.04.07.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 19/19] staging: rtl8723bs: remove unnecessary parentheses
Date: Wed,  7 Apr 2021 15:49:43 +0200
Message-Id: <a45ec5059ea315db6509989f320340c1816068c5.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit checkpatch issue:

CHECK: Unnecessary parentheses around
'padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X'
84: FILE: drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:335:
+	if ((padapter->securitypriv.dot11AuthAlgrthm
			== dot11AuthAlgrthm_8021X) &&
+	    !(padapter->securitypriv.binstallGrpkey))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 893c7a417587..f7465cf90c46 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -332,8 +332,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if ((padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) &&
-	    !(padapter->securitypriv.binstallGrpkey))
+	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
 	if (!rtw_cfg80211_pwr_mgmt(padapter))
-- 
2.20.1

