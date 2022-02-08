Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A382C80
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 18:04:43 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d27so3970029wrc.6
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 10:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rd4kXiCHX1JiB3XHGRQrPutLCcRUBpsFocZnJyKVeYA=;
        b=Zekmcg/F0gXl2lTHQ+Iuf+YDVpXmk8DGyGcYKxpgugmaot8g+yWX82rTWFuFGN1kS5
         aFJOxReAILg1ETjWOPttcJ6oI8xi2hhL2Zvjqe57i3V6opHKDjPWkkQPA1CPSYMJimmo
         52obj1Tp1FohouuLlGKSbO8rTOcvnuO1Tmo1Zb0K/GULbxUS3kEUhvbQIVNWCTmYZlmQ
         9JAZo8hD+RdE13bIDCngVhut0hagwfUVoxOtq8oKZKZDM0ANYGW6aXXKaqQ+SrKCr+g9
         n2XYSpMiiNnD2er375NvRle9F0HI/p9bFB7iXMSE/sjgq8htImz9UTKk+cFxikC/WtB5
         SRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rd4kXiCHX1JiB3XHGRQrPutLCcRUBpsFocZnJyKVeYA=;
        b=hjyAlpmepRsFS5cMBGL5HMZ8ntX3QsdXY9UXN0harj2VpzLNLLb975xPSPSvtwrL7E
         50LQ/dOCTo/u5vssKkiPFiVeuoWVDGkWMLF68fGuonnGCJhctP8ntrjD0jKIvda6S30o
         36lh/WSv4CNGBrwAl0Q2QuFokChfv9AbRKFTRVmeXxCjex/1Xm8cuzcdfv9Hz2/aedFQ
         e7BtH0U1Gb07l+CaKStkt5U53LLvRI6Ba6HF3o7sUqTAueUOk5Eig/IAm0ilbRlWKHh4
         Bacuf9GITu2/G7A+jdbMCU24nryp7EkfqUyV5eznL82wDiz8K7kbGqtodTptRexYnHYz
         CPsA==
X-Gm-Message-State: AOAM53001CgojYQeNDiCqDMynLjpEoT5F5/zam7MpyvmQWQ9lCWy5k9a
	jhpeg28+gxWQYOI1uTvlTQE=
X-Google-Smtp-Source: ABdhPJz6VHSsE0bxxnuY/CnoGXeD4TPVnfrv8CkWjmRReX2sSZvNww99j70HMbHPdto99+fvEXXB5A==
X-Received: by 2002:adf:e18d:: with SMTP id az13mr4632410wrb.521.1644343481727;
        Tue, 08 Feb 2022 10:04:41 -0800 (PST)
Received: from localhost.localdomain (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id n26sm3176872wms.13.2022.02.08.10.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:04:41 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 2/2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Tue,  8 Feb 2022 19:04:26 +0100
Message-Id: <20220208180426.27455-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208180426.27455-1-fmdefrancesco@gmail.com>
References: <20220208180426.27455-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in rtw_set_key() 
because it is not allowed to sleep while it executes in atomic context.

With the GFP_ATOMIC type flag, the allocation is high priority and thus it 
cannot sleep.

This issue is detected by Smatch which emits the following warning:

"drivers/staging/r8188eu/core/rtw_mlme.c:1603 rtw_set_key() warn: sleeping in atomic context".

Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index f5b2df72e0f4..860835e29b79 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1600,12 +1600,12 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 	struct mlme_priv		*pmlmepriv = &adapter->mlmepriv;
 	int	res = _SUCCESS;
 
-	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
+	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
-	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
+	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_ATOMIC);
 	if (!psetkeyparm) {
 		kfree(pcmd);
 		res = _FAIL;
-- 
2.34.1

