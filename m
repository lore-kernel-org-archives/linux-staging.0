Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5EC6D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i18so1836814wrm.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=g+mGITlsuxJWzvIZseazZx95AkKh4h7A88iDYBbw4uUcuuKkuj1Y32Bu/ezehEFqjL
         MvhiSTopgpz3Ltqi4Xq959DsNBXZhBHNoKjME9f6hSYTeAZC66RMBLfmW5LJqlchE2+/
         H1kIQ1/I0K3xjgNae9car4C7Uyire7dtshFMDFzyJRlX+omqQhWrXq13HDDvAZwIBAm6
         H1qAgKjNvenEsI9c7vc7s1EvRM/jb0Pew4GHIX5CzJHugTJSeflJrC3Si37EnKDQPCCo
         T5is2eCiX7Mfc1/ZbYIomjtDiAsevBiQZEs59kFzdh0yfDHNEJxGAZsUEudIZmw0y23i
         fLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=HX6CFK53pUhgAZSQDRm98azqZlt79MNRvG1EA1QBLIg7J0nlrP6z321cLFPNuNbqz1
         Rms0BeXjlopUgAIGJ9+dhnDmEOhYLM4cK3U1yusx5Sk1luvWEscE77pvt1H/3MA2jReP
         KIlrO9UpwqhlydbmYKJfexO7G5BVNlkIWNjlBGPuEi2s3DTlInTq7GSNF7KBxCWH3w79
         9W35KofsM3vJmHpcEzm3uRpjfmQzhfTSG2YAlIuR4y87mlFqxcWOoWcPmJ3mHcxXJTMF
         ehGLEaWjLkIbGGZC0wO8Tv6KMBeyjMcCa/Bjd41efpVwlaQTLtAgo4GIA/lmMnm/aGCN
         j7xg==
X-Gm-Message-State: AOAM530XGvwG3AhKS5ApkyPPu+qT6zNuNElw6rhIk07ZJbQ8lJD6YgAw
	Zp/tHXRNUAnTcb3TqUGaOB0=
X-Google-Smtp-Source: ABdhPJyiQ6nmGJAs26YXtGngvZSYwlHeMmAlUngQsGQqV8Ub/lRCgNZ7ZoOdgWlkbeJPqwk7gM46uQ==
X-Received: by 2002:a5d:58fc:: with SMTP id f28mr15774072wrd.180.1617384656305;
        Fri, 02 Apr 2021 10:30:56 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id m2sm3372258wmq.6.2021.04.02.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 24/30] staging: rtl8723bs: remove commented RT_TRACE call in core/rtw_ioctl_set.c
Date: Fri,  2 Apr 2021 19:30:06 +0200
Message-Id: <82b9fa684553a3b98d42481761787bc2dc10e544.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE call in core/rtw_ioctl_set.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 7d858cae2395..14eb01df69b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -451,9 +451,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		/* SecClearAllKeys(adapter); */
 
-		/* RT_TRACE(COMP_OID_SET, DBG_LOUD, ("set_infrastructure: fw_state:%x after changing mode\n", */
-		/* 									get_fwstate(pmlmepriv))); */
-
 		spin_unlock_bh(&pmlmepriv->lock);
 	}
 	return true;
-- 
2.20.1

