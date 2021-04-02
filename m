Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF76D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d191so2804028wmd.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6DXbe4IYvmFdTJ6TZ9KJIXC4BttTk31KU7HbbVtW6IA=;
        b=j0Kj+KgNjhtrVZdfha6ltMQMvJ/xVSm0nDIT4GfkvYzY4fVgoJUXcN1bpkD9qN/W3c
         ZfUSC5WcYgo5x+hQ8Lr1LdSyy03g7lnsbzdq9THgG9CdMvBZZgnCCOxG2NoqXlr6Wa5m
         YkO/EsZANqS5D0f2RuntMeuvyWjhHXs47eFdK/irlAoNCOwkdYpEY4VhcdjG/fa2OXGt
         lW4kwEYLKWeLMvN59SXOdNh+eC7cBYwDiFK3Ybu1uzO9gx1g2bNm3qykF+00trs6sy2F
         +jgg3ninpF+Wb7sj8Odqq7J1dIW6xuFMSUNBeJIRQeIbfbS+Y1DIVo1oksqT2WG3mI+U
         jAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DXbe4IYvmFdTJ6TZ9KJIXC4BttTk31KU7HbbVtW6IA=;
        b=kYvj0XmYROL0BtSQm2vCY1UWKqLpiBHFdjNHxJX0I1xMBR0OScsSY3CaYFz0fEff6m
         cptk1lZ74+leJUi+0Kh+GC2WSLe718Y0dY0n32xWlLLfR1Y/h6sUCTVAJ6RAuF4S5dP6
         Y6C13tV0fsX36gL5klqtlizBPU1qkT/nsLrMuW/A0bZ3DJsyqbOM6+4oHT+MnTYd59If
         Fnhs43xC7jdBTFm3JpJ0fzsTczUIoScH1dfsfPgnXvFf09YpdDFXZ5QVj1tuSMett49R
         K4clWhJUEr+8agNYnSDXiZBoNOU9WDqw0XXcRSec1QZumMTCXLjkZ9xSyQh+BqreE+oX
         JiZg==
X-Gm-Message-State: AOAM533JvaZ3SjknB8X3Hq5S6ZfV1hi3dhLszUGWQyF6ZE6L0UkzTKtV
	6NrzoqN5f/DomWCehoTItpNmC1xPUz1Szg==
X-Google-Smtp-Source: ABdhPJwrYOiJuTpu7AWQJv7gLaYbZ35zFySo7WGpk7t/pGureytTFE06LaoMFhakfL/xgwnM7YOC+A==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr13351580wme.138.1617384633468;
        Fri, 02 Apr 2021 10:30:33 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id u17sm11882917wmq.3.2021.04.02.10.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 10/30] staging: rtl8723bs: remove unnecessary parentheses in if-condition
Date: Fri,  2 Apr 2021 19:29:52 +0200
Message-Id: <72f5d8324886a072f0699040161953065da92997.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook issues:

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

