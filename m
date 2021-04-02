Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF76D00
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 10:02:08 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id bf3so4948809edb.6
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=VOZjXsKNDs/43HC/yzuSI2IhkHsNbgagKnNvPhzvZMXHyU7ax1sAfuzjwhFyY98MMw
         dLkRqxBtgnB8Hynl5XsCDMQLZuHiW0H1Kj2Gy1+FxwTYHP177prSt6eSCpm8JaX3vNsY
         AdtdpdWH4SU/Z8CACyG35bDnJi/KhWXfaFyXzRQ2Jyr3RGSZzscm3lL9jcqqorzetfsV
         28auFWPYLBh3Q796Qr+N53OeqSNNST+4PXusQY9aYVy5vP40JP13eB8b3t3Z2oTjg0VK
         kuM4NEZCM40JFvpH8Y8swjqwtnCt47hyK9Xtmg7oS+t/jCxBFwVt5iWCP53JjiUm35Of
         P8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=i7+NYETZnkNaJmoUetr16ULRx581STJRo05ayxgi6BLwN8UET1o7IY037rhytjv8bi
         xJnCZc5j2iwdv2bVAKy2tOyYkxYDEUaEu1vxYo491kFbHYaE32uj/TrA6qfMvEUF3/Qe
         MJgTwefMgDzJYpwWf/E1iHMaM/BN2/taQvZUbrG7p6TzLH/zv7aTo+lQcvjB8RwMmgtS
         IEm1Pfe1FpTdQQSJn4722hI2hL71koQWn9Lf1rl7txtIyfkA0xrA66oqWwWij8JFLa2X
         IN4bte4xsZnf/Oo6UqhcCcASgfNo2HfkwvdiRmMLmaVADb5JFEvamtobaJ1WoWAomf23
         CW7w==
X-Gm-Message-State: AOAM531MJu2v314EAq9ut5wq/e4F04fdHAFFcO+INtaE2kbv1rxn40Q2
	//Zy2Mc2h3BAkcgRGnAeRY4=
X-Google-Smtp-Source: ABdhPJxjdOT7EkL/Ri5zpv67Ha91FlYLy7Yfw/wWnWNdSbV7UfahWlzEu/lbhM+P2s/2+h32tju3NQ==
X-Received: by 2002:a05:6402:1d33:: with SMTP id dh19mr14555728edb.362.1617357727372;
        Fri, 02 Apr 2021 03:02:07 -0700 (PDT)
Received: from agape ([5.171.72.128])
        by smtp.gmail.com with ESMTPSA id k26sm3952485ejx.81.2021.04.02.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:02:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 12/16] staging: rtl8723bs: remove commented RT_TRACE call in core/rtw_ioctl_set.c
Date: Fri,  2 Apr 2021 12:01:32 +0200
Message-Id: <65df341f90e3d62e00681a97997ae3112218189e.1617356821.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617356821.git.fabioaiuto83@gmail.com>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
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

