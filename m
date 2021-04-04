Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A770
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:28 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x16so8769864wrn.4
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gOPIpaHeGrNbOqM1ya170ZvKPsGM35hLd1i5IH2Aa80=;
        b=JvePyQqv1HYJpeKtI5iLV4MpnNmMIafB/e40mTFVzoI7xvuvVGVDrNCYjNBetkt6Ug
         F/RUGTvkHIWla2Vg4URIvbaYxgCQoDHy75xx3D7t9QJwYicr1xdI36r8QxXxbvfGLwVI
         zXA+i6P4BAPwgHjjhv8gAxCma/+BCaxL8c3h0Ql0UNm30VmfEwMlmBpNwOcb2ltxF0os
         YRKB+FS5RRjBUlqjFNxgN1fWlsJVBLM5gj3xSFYuponnhluPRja/mkk5ioj9ZgMV+NEX
         QQWoCYQDk50zwdRNTfeDFZDtiYV7wUn1cr8Y5x3PNBb6dUu0p/oONDISSYMyhQ8xbWbz
         mGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gOPIpaHeGrNbOqM1ya170ZvKPsGM35hLd1i5IH2Aa80=;
        b=iakVuuVpOBycuVqSh/KKlaeGnABZiV4zVdffYpQDI3PVdUIc7uvumkcaD6FfGcs0jI
         n+wA7AYq3kp+6ZxD1R4/ENpc1XNag5mPdfBobbo2Ia3b1F8Oup85uvvM0k+dQhz8dSj9
         93nSa+UvBd0+WwFZ5ubHwUjeMqPdWshk28fuWe2wfjoy/YysiSL0tnpop46PlRI1+4U7
         o18p4bUG3WgNGh/CDVE+mBXIBRab6nPv+vPZh+ohcmWgquiu8nPfNFJuFv4GegzJg8Pd
         gV/c3NZDZuI3CUfI8omKgi3h/Mq1vfq3xK1tBc9EZo8n+UY7vANxBBLuJ5586ltLsKFk
         ATOA==
X-Gm-Message-State: AOAM532jvnnSdOw4Ql7ynQQpVmdy1jVKX5v+0VkpF9Q0I/xTJGXUtvFw
	tbQGERi0LcSxsIt4v9uABFo=
X-Google-Smtp-Source: ABdhPJyL0aAn+LAMV5W7p6sdlpZOECbSkIlDaAbpSJvAhrvBBkF+2+8fQ/CxpJbUVQ941aHwQxOIzQ==
X-Received: by 2002:adf:ce83:: with SMTP id r3mr11185657wrn.144.1617545426948;
        Sun, 04 Apr 2021 07:10:26 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id f8sm323935wro.29.2021.04.04.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 22/30] staging: rtl8723bs: remove unnecessary parentheses in core/rtw_recv.c
Date: Sun,  4 Apr 2021 16:09:38 +0200
Message-Id: <eab39c58913d799dc90efb8b234c2a7fdb61ba57.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit checkpatch issue:

CHECK: Unnecessary parentheses around
'psecuritypriv->bcheck_grpkey == false'
24: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if ((psecuritypriv->
				bcheck_grpkey == false) &&
+				    (IS_MCAST(prxattrib->ra)
					 == true))

and fix same issue on second comparison
(IS_MCAST(prxattrib->ra) == true)
^                               ^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index c8a13d733c98..bf53695f9f7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,8 +378,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if ((psecuritypriv->bcheck_grpkey == false) &&
-				    (IS_MCAST(prxattrib->ra) == true))
+				if (psecuritypriv->bcheck_grpkey == false &&
+				    IS_MCAST(prxattrib->ra) == true)
 					psecuritypriv->bcheck_grpkey = true;
 			}
 		}
-- 
2.20.1

