Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59123A1;
	Thu, 21 Apr 2022 19:20:45 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id f14so4023647qtq.1;
        Thu, 21 Apr 2022 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ul9FGVJ1sqTdARK0mUZLH5+vAqXgfv1Osb8Y+BayvnA=;
        b=PboPQS2k7qvXDrE1qoUSXr2+VaPYMTv45/YlkkbxdwUA9owtd9aItiTqTE4Wi5GvNq
         ZrzMhUzwkihHH0iR99HRnJOBjRQECZvU01YsruDLsSV6VVimkgIKpm5W/HB64MkeScMn
         CHpY7/80p2iqBHHRyKMrt8OfL4vwyCD83efJWF1+XlngJLKRFaY1zbfGTMsZnzDRaeq4
         8k7Jktm+/DyQqfUO9sa+x0Ncn0GTU4gOdWtqDlGxci0MgRBDRHf913iCRLhkwD+X0I2p
         s3YxqejLxsNu2FiRHe09Xy/N/tByUvRd2K6SkV+GIgb9VH6ZRuBp8raJgw1vSJc32qsy
         WzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ul9FGVJ1sqTdARK0mUZLH5+vAqXgfv1Osb8Y+BayvnA=;
        b=ER723TLTI9B0pdIZ/ZXRWNtruyEoieeBvINo98wlfIak+VGkPU9S+W8KyB++8kWOFM
         Ar7LuNG6c+Sd+h3NtuiLWBPeXgC8yH9PJ1XL5GGauJlJDW+k4Y3rmqeB85XtCiwlXs1Q
         O/B8+S6Cz9ESebclp/VJsKCYS2zGemQHR9NnVo3DSG32p1aHYi+CURuaI4lwvzNs7IIz
         +isN/tVsyuB6SD1Vj0/bG1Y9dK366tV2smHngTObos/rIFjDLZPWFKlt7i2EORGWPJDq
         XqjboOB+/pnCuY9uXcV8uy+5GjpL0akgSwGPwLxpuSvcwSXSp3wKjJ4hdh2H28RblWzu
         ZC9Q==
X-Gm-Message-State: AOAM533fleL/bfEcKjrlGg315xrWsBep84N48yvZ+bSKpCfNy6/9Myaj
	9pMGhTFlDX8c7nWWr/XyvQU=
X-Google-Smtp-Source: ABdhPJydGXJP9BFb1WSRFH7cUBdCTIZqsh5XL7qhdz3craqFPk3UEPjmG7JCVH0Qt25hbQzNFkc5lA==
X-Received: by 2002:a05:622a:446:b0:2e1:b95e:3b48 with SMTP id o6-20020a05622a044600b002e1b95e3b48mr758043qtx.310.1650568844562;
        Thu, 21 Apr 2022 12:20:44 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id l9-20020a05622a174900b002f34421b01csm2567736qtk.23.2022.04.21.12.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:20:44 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v4 5/7] staging: r8188eu: replace spaces with tabs
Date: Thu, 21 Apr 2022 15:20:30 -0400
Message-Id: <fd4a66013be081bc5adb491c6dc7774362d1ac82.1650568579.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650568579.git.jhpark1013@gmail.com>
References: <cover.1650568579.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tabs instead of spaces. Issue found with checkpatch.
WARNING: suspect code indent for conditional statements

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index b943fb190e4c..7a90fe826d1d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -722,7 +722,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
-			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
-- 
2.25.1

