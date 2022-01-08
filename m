Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B562C9D
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 08:27:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o203-20020a1ca5d4000000b003477d032384so2541158wme.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 00:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TxNoAeeze9rEMrqirvTKwXGPuD7a3cum906IRqtGFSE=;
        b=OudwkM3oWhgdary6En7VLK/7ka17/mFv1TG88WtBAJ8jdBQkDn6Oy7JgyK2xIwut4c
         qYdVfdRaF5xUhOmRsfKEz/wsY5SEghD/wIN9fre4XlWufbeHaCM8Klh2j9Zof8/U5qzu
         s0e2RJ0PUBbLGMhNnPjbt4LMqgWnt/we4Zltwx6w7yXbZFIjcHI9Y5afu1/KUUhINxhS
         dCh36A5Z+Fzwv/An/cgTaxn5Sf01R5S1/T8c4duQbpy4QPGVmHCE7bC179lXi5zZQqFu
         JPmcogb1c/iLI9gJZTQyURV5qwactd6LlejpKsA9I3eVW1i6vJ1cGicJmpDaUL/ZbGIL
         hXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TxNoAeeze9rEMrqirvTKwXGPuD7a3cum906IRqtGFSE=;
        b=0CzLIni070TmkdTPQzno6fPPm+UeCmZHOuCJPPEienYeGMVgduLRTjBaxB1RideYNm
         raafHYe50rUwWDp7UcIpCCvaXVNvplxJRzVeJKalV+UxmVaKn5br7IeRGOKJS351qVig
         80XTVebdR2MiasUSgfzbHkBILIh42oCW0hOqf3KNNU66DOS+9ByUWpXokknvLGIf8BOq
         Vs+mGr1l9/0+nWRnJ5BouwolV6DzIXlr5S1fmUZqC8jktnp7SWuNIZyKl1xLAhjzfdhr
         opQHdUSsZ7/brv4K+zQf9+3OVIP/K3BN0p4PA+53qXxhx62zcSq3VSo08aLaZ/bZlFV5
         WTJQ==
X-Gm-Message-State: AOAM532J9YWM4+xK95tNMHnqs+QRsTnt1H874Y/XE3v2kONeEPD4QYTp
	6ud30kwxLBNfkf7h1iGEh+0=
X-Google-Smtp-Source: ABdhPJxD8l8RHFO9v/JDurGVDXLLNA4PKivI9I/jMvoDQH1Zop1p7WOPJ42QHXXdXvZC2qT+PUveAA==
X-Received: by 2002:a1c:9856:: with SMTP id a83mr13738246wme.157.1641630464158;
        Sat, 08 Jan 2022 00:27:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id az1sm964536wrb.104.2022.01.08.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 00:27:43 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: convert switch to if statement in mgt_dispatcher()
Date: Sat,  8 Jan 2022 09:27:33 +0100
Message-Id: <20220108082736.16788-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108082736.16788-1-straube.linux@gmail.com>
References: <20220108082736.16788-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'switch (GetFrameSubType(pframe))' in mgt_dispatcher() has only
one case that does something different than the default case. Convert
the switch to an if statement to improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index cdd928c37a3e..a169a7a39ebc 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -443,24 +443,13 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 		psta->RxMgmtFrameSeqNum = precv_frame->attrib.seq_num;
 	}
 
-	switch (GetFrameSubType(pframe)) {
-	case WIFI_AUTH:
+	if (GetFrameSubType(pframe) == WIFI_AUTH) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			ptable->func = &OnAuth;
 		else
 			ptable->func = &OnAuthClient;
-		fallthrough;
-	case WIFI_ASSOCREQ:
-	case WIFI_REASSOCREQ:
-	case WIFI_PROBEREQ:
-	case WIFI_BEACON:
-	case WIFI_ACTION:
-		_mgt_dispatcher(padapter, ptable, precv_frame);
-		break;
-	default:
-		_mgt_dispatcher(padapter, ptable, precv_frame);
-		break;
 	}
+	_mgt_dispatcher(padapter, ptable, precv_frame);
 }
 
 static u32 p2p_listen_state_process(struct adapter *padapter, unsigned char *da)
-- 
2.34.1

