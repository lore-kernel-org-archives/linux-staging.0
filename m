Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678D71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h13so1155707eds.5
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZ5b7ao/ZXBfmZah2BX66hKezYl8HfGL05msSmUSV60=;
        b=JqYE6dexvnr0vWlIntrmoTG46FCTPQGmnER32LiN7Qzxla7syATeYrJCY8EKGy89fB
         Q9IsJE/i3TJb79BOGAFhUe55dcjEh3EoKzl7mUEJlbc8U0wgiRIiGRl8xCOchEu/V7Fp
         dpgnl6qMk9KmUhb7h78z/ZYGjJDEA1r8yVWyjeZERoZBKDroqkvbzQPQ9CmRmOWmiEUV
         xPl/0AoZ6qqeXKdY9aSCVYkOGssUGPbLk6kUZK7YfQDa24NKDfBVrXWtUg8OEtleH8SU
         uV9Qn3IQ18IaTvamWdZ/vo0EE0mJixeOMWP7exdmj9mHTXGeTY+BGqcQEmPYVFpa6H+5
         UAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZ5b7ao/ZXBfmZah2BX66hKezYl8HfGL05msSmUSV60=;
        b=ZEajqDDE+VKvGzGYNK7SF67SepmevnjwBPPkn/atPkusxwn+clF6yt59Ql5SRVof5B
         SRNfYyFdyYbNGuv44YYswjhhS48pXwbbfd/B+c3gLJEiEW7/g84yUVuLNmS6oHsLNK+O
         mGuRUJ/x8q1oqJ5B0WZ+SZHyC9xS3/0v6nQX4CAFDhvXKtSWZjt9uCDwAJeZLIXaKDd9
         Lu8Di2ptgO1xXFymt56mvcFt7Tg3otB7crNWYLT1ahQhPRPyL2wG43hAVoM71RakfgC+
         pLEUKFbMrg0+BoF4KQERqn03KJ4zRF2B2ugDoT5bEjRV2A2adm02KNQbOqnsZF51Ftha
         sNcQ==
X-Gm-Message-State: AOAM531oaqN9DN1dlWDbE/5ToAm0FUZcW0h6n+sTVCYXIkbRp0xavCU1
	OxRYl1U1ESiwtI7szKGRDfA=
X-Google-Smtp-Source: ABdhPJxd8EFptUjoHx4I1U+bLj/s/lYI3U/iTgYCHn8xcImA3hFdEGNdH65lUT+IfVQ1ALqBZDsuNQ==
X-Received: by 2002:a05:6402:32a:: with SMTP id q10mr8692185edw.15.1617268915994;
        Thu, 01 Apr 2021 02:21:55 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id lu5sm2442044ejb.97.2021.04.01.02.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:55 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 20/49] staging: rtl8723bs: remove empty if-block in core/rtw_ioctl_set.c
Date: Thu,  1 Apr 2021 11:20:50 +0200
Message-Id: <2eb03134008d273b89907dd67757d02c556131cd.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty if-block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 44bead8cb6f4..080d548fe269 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -457,9 +457,6 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
-		if (check_fwstate(pmlmepriv, (_FW_UNDER_SURVEY|_FW_UNDER_LINKING)) == true)
-			;
-
 	} else {
 		if (rtw_is_scan_deny(padapter)) {
 			DBG_871X(FUNC_ADPT_FMT": scan deny\n", FUNC_ADPT_ARG(padapter));
-- 
2.20.1

