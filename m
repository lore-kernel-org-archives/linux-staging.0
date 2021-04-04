Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FAB6D09
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v11so8761098wro.7
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eJRj1n/cuhJAwDRjHiH4R8KD3m6yCHecaRSvaH7YYy4=;
        b=WJ78iTKhfMaahPc9Z/k2wDQYtzVIYNNGY9ixBq7QH3vX7zWAwYfl4QqFLHwOyyevj0
         ABHEr8AY31DfZCYr/o0zE/2HsY5cS3S6TL+/4v2DxEDtkXU8GaZhEASSbWH35j1H4/TG
         bIXHw7fOMPsBQtv5jAcZQsyaGcCLQvEnlPxT06jArH1i8ldfnyyqUzjVfT67iHS4VlLv
         JMVm1y5UvY2V6WSyltYhkLnBVb6gWUptnh+ixjUTxW79uz4q2N+b/DPVZSpsnQc69+K7
         iCS0CsJFdCsLHC13nucmo7GyAlPEoQDSYy8pt8bIPEvlx640Uofp0239dMr+lHdSSPFC
         kqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJRj1n/cuhJAwDRjHiH4R8KD3m6yCHecaRSvaH7YYy4=;
        b=KGDepn8V9sUYzXaM1j5ZRbDHH6NnHD9tb54XaRmHB2Igw/h8ze1Ug8b0VRlcM5DldR
         pxIqILibj/jCN7yRlB9+R7bfz3I3a85NsIqWGUtvDFWrcIeb9nxb3hwgFcy9HatGhMIF
         Xe5cuE76q6DCgScgFMavROi6wh8QT6PgNbc5NPUIjgE9olsmkU/yObcQ+v1E+XEUkepo
         aAAZLHbz/eUlv6Nr7usmY6RogcG020hHHn8Td/DiUuckMAt+xK7ARa8sf5js9N73Puw8
         yxcgVzporrW+BIqa58G73We/pyyrwcv/9oNQG08Tt+YxvAcBjrrS9j9/orrrXOnTNJPI
         8XSQ==
X-Gm-Message-State: AOAM532p2NlAI6zn24NhnV3EBu8+1leQYMu4dnzMmo//Devdwd9EIWwC
	Q8ZNmpOzA/o60z6D5S70moo=
X-Google-Smtp-Source: ABdhPJx3AmUpjkYciXT8sFswJpO8jkqb1oZyEtL2z+A9NcplRilpL4QoPPCtEvYODLLZtxmP3rPh7A==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr6750814wrv.142.1617545405535;
        Sun, 04 Apr 2021 07:10:05 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id r16sm22348349wrx.75.2021.04.04.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 09/30] staging: rtl8723bs: fix logical continuation issue in core/rtw_pwrctrl.c
Date: Sun,  4 Apr 2021 16:09:25 +0200
Message-Id: <ecbd557c645e280a801c34d235559d2d138ec67f.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issue:

CHECK: Logical continuations should be on the previous line
22: FILE: drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:270:
 		if ((pwrpriv->rpwm == pslv)
+			|| ((pwrpriv->rpwm >= PS_STATE_S2)
		 && (pslv >= PS_STATE_S2)))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index cc1b0d1a5a7b..fa06144337ce 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -266,8 +266,8 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	if (pwrpriv->brpwmtimeout) {
 		DBG_871X("%s: RPWM timeout, force to set RPWM(0x%02X) again!\n", __func__, pslv);
 	} else {
-		if ((pwrpriv->rpwm == pslv)
-			|| ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2)))
+		if ((pwrpriv->rpwm == pslv) ||
+		    ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2)))
 			return;
 
 	}
-- 
2.20.1

