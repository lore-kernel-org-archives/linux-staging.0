Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968686D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id r14-20020a05600c35ceb029010fe0f81519so1811894wmq.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m+xwuMQ9miiJI3ZL7Gy8Q2GKln0XoUkaK0hGIQWaMFY=;
        b=jXR9PoaQ5fuqg2K1PISHtU7EW/6mprl8LtwthdIpPxbiI0AVj3qqjbwCsiiKbPeM3W
         U1vX2Eb4K1I+MkuYeWgQWGCHUNhJwM3gL1/HRincTVh4/RssskOyI3oDDdP4qWVPpCq6
         ZmWA0s8kt7g8i80SzdNPZ3N0J/fBNC+lFqLwXv5q6Ck64HWqB9IplSxSV6SxZXjE0zFO
         6rBfmRVRgjctITvlzSnKEVcEb9ZTHBfp0nti8mooMbvqd2/2eLE06/uGJFBVlqdTboMk
         2/7awuGvMr/TpKIYWGenS8iQba89Kn76d/Yld/M7jhxiBMjbCc4Z6cBrh+o9t9LN5OAN
         d4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m+xwuMQ9miiJI3ZL7Gy8Q2GKln0XoUkaK0hGIQWaMFY=;
        b=Vk51lbFgkSYwROM/dJujYvYMhAHviDLht9MYfstiHIn7UWjDKcgGny//S8CJGbQNEr
         poADia+b0rU96zlRELgQL3d0vz2XUvp/sLhGBlEt0IMT+aVj5Apg26filbL9g49sWze6
         zON8ghKPnor7vtfzovojP4pWAnW1dqvB9zF8yCqGwC/oZOCftm8PFVkPWwrfbLqfhSPE
         zMWkKnXxFqPKhpd69nUiLQ3to9pP6HxoYq+QMjvo0SZsDl0u4nXzbBH+cNpPoCyU2sn9
         QNMisUVsfFZRWK5u/7N5SAQ/GxAB3ErGeW50Hle61U/1ddZVGH45Iuc51xMa1A14JCz2
         gwoQ==
X-Gm-Message-State: AOAM533E5TAnbf6Tk/P8yranpFl3VkymNdOfwJwNUkIJ+mLRIXrFF28T
	2DRESP6E3RAkgTJ3raYnd1c=
X-Google-Smtp-Source: ABdhPJymoLM8xMQgsXMwQcb728dHLZgUPfeQF+Jd47gAHdBivNEolbI3mqVdnbAJ+Q++blT6y9TRVA==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr15942405wma.141.1617441270184;
        Sat, 03 Apr 2021 02:14:30 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id q9sm17286733wrp.79.2021.04.03.02.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 10/30] staging: rtl8723bs: remove unnecessary parentheses in if-condition in core/rtw_pwrctrl.c
Date: Sat,  3 Apr 2021 11:13:32 +0200
Message-Id: <d4d1d256586cbdfc55157b0b384b28d53a61c2b8.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issues:

CHECK: Unnecessary parentheses around 'pwrpriv->rpwm == pslv'
26: FILE: drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:269:
+		if ((pwrpriv->rpwm == pslv) ||
+		    ((pwrpriv->rpwm >= PS_STATE_S2)
	&& (pslv >= PS_STATE_S2)))

CHECK: Unnecessary parentheses around 'pwrpriv->rpwm >= PS_STATE_S2'
26: FILE: drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:269:
+		if ((pwrpriv->rpwm == pslv) ||
+		    ((pwrpriv->rpwm >= PS_STATE_S2)
	&& (pslv >= PS_STATE_S2)))

CHECK: Unnecessary parentheses around 'pslv >= PS_STATE_S2'
26: FILE: drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:269:
+		if ((pwrpriv->rpwm == pslv) ||
+		    ((pwrpriv->rpwm >= PS_STATE_S2)
	&& (pslv >= PS_STATE_S2)))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index fa06144337ce..09bf25940e92 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -266,8 +266,8 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	if (pwrpriv->brpwmtimeout) {
 		DBG_871X("%s: RPWM timeout, force to set RPWM(0x%02X) again!\n", __func__, pslv);
 	} else {
-		if ((pwrpriv->rpwm == pslv) ||
-		    ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2)))
+		if (pwrpriv->rpwm == pslv ||
+		    (pwrpriv->rpwm >= PS_STATE_S2 && pslv >= PS_STATE_S2))
 			return;
 
 	}
-- 
2.20.1

