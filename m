Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02515A7;
	Tue,  5 Apr 2022 03:16:30 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id t19so9460438qtc.4;
        Mon, 04 Apr 2022 20:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRi6mg+Ezu0oiDDIceXrLTZ+9OfQbKuOLQbA8q9YTdk=;
        b=oiZ5OOkmx5jtptFYs/x7G6URXWmZbRLK6/MwcYOIKV82KH94lio3pXKayG88cIjZIc
         N/cgEQS96Xse/wBSWCyuxwT9KhAJhC3gedNQgi8DfVSdFCveWsRNmwbxVttso1Ec0gIi
         r4qC6jrFJM2M8mthtL/WPC3NX99B6I10aPhKO/TgF8s+9iIbwpIcOZoV6CB5pdwlSGos
         zbwDOGzOy1kInjOwr24evMuD0wxRAkRhmdH1emzjeLfplpIIH15pQu7PCIRGvYu92LSz
         MNWNS8bvRRGFCc0A0SQA8RU1amLHz7AV4rzmHeHolo+P/VQ8NBQhoXCb7KVR33Eke0jL
         PJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRi6mg+Ezu0oiDDIceXrLTZ+9OfQbKuOLQbA8q9YTdk=;
        b=teLujck9iAfzbZtXOQh1fpw2SnAkdGjH/kjleJ9WQnoSoqgKpC+fBMTR3XLw6BFs4G
         kACCbdDV4eA3qdJbBsN2a81mLia5QWDHXSSrWTmVuNmGw0lMC06uJi+TOhE3NnOP2N2+
         vdy9WsK4GBqgpJa68bjUGXbvIfSswKIS8ehBE6SEKfYxmTuJdEIT0SpdWw15zaYqnEBk
         m6KqD9uFWGbxWO7ib6mVgI4m24G/SB8/0j080mXGaN5p3gHfyYkCB8p7uP3C9fDDig2F
         SHzxVxZPslcb8jO4D2aTEVRUJ0AQr4lcDeb6UIGSzY+YA7/Bykm6KmtOSgPjwaL77zaH
         MPdQ==
X-Gm-Message-State: AOAM533J4DZRepe89/b/SpfVWXgAS3IaFOZ1MrLxORO25R5i3lOf4g+u
	ujetuFFj4NvXe9RCrygVepo=
X-Google-Smtp-Source: ABdhPJw9XnDGw80Q8wrV7MypqxyBgsxIY1MUHc7umgqBr+tTK/zgae+0/dBMH9BLvRGOrHFR/Z6wpw==
X-Received: by 2002:ac8:5702:0:b0:2e1:ec8a:917a with SMTP id 2-20020ac85702000000b002e1ec8a917amr1263525qtw.682.1649128589221;
        Mon, 04 Apr 2022 20:16:29 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id bi36-20020a05620a31a400b00680fffef5b2sm7512101qkb.48.2022.04.04.20.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 20:16:28 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: remove return from a function returning void
Date: Mon,  4 Apr 2022 23:16:10 -0400
Message-Id: <d1aa09f34cd192e284048999ba8e20d26a224483.1649128267.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
References: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: void function return statements are not generally useful

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8c3b1448270a..c06be65b45cf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5112,22 +5112,17 @@ void survey_timer_hdl(struct timer_list *t)
 
 		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
 		if (!ph2c)
-			goto exit_survey_timer_hdl;
+			return;
 
 		psurveyPara = rtw_zmalloc(sizeof(struct sitesurvey_parm));
 		if (!psurveyPara) {
 			kfree(ph2c);
-			goto exit_survey_timer_hdl;
+			return;
 		}
 
 		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
 		rtw_enqueue_cmd(pcmdpriv, ph2c);
 	}
-
-
-exit_survey_timer_hdl:
-
-	return;
 }
 
 void link_timer_hdl(struct timer_list *t)
-- 
2.25.1

