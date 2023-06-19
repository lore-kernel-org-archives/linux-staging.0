Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED4125D8
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 15:10:08 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5193c97ecbbso3699543a12.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187406; x=1689779406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09Nls6tXLgOvm0ng8/7m8dRNZ/h0ThOPEUKr3YHTZzs=;
        b=pme+MsdXK1u77Qcjve1hUQzq86C1M6dYAPy1m3hfdiAtb72eyv2TOoLP6TWC9DPPSg
         me1SSIX9+gs9DZl/C0tp0aap+CN0oV07PPnIZNPnqcbjhzEkZqekyXN/me6HPs70P0z8
         hwDeeCACZLSSq0s1dErFwVZo6S5ESwUrlFxobMlVtoX8wPqdB4pQVHPCBHhWJ9KaPDSU
         fN1MxkXkZY6gMQvzxetHaBMvQY3SjmkQ0uulHc2Ht1J3f8sN67MuTaweNkXBM7GfB2AY
         pRFJKzNVAEzdL5akaO0o8yL49L/CV/+D6XJxH7+BFAy4Y4dYhXL+52aNZacdCfn9vR2o
         2opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187406; x=1689779406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09Nls6tXLgOvm0ng8/7m8dRNZ/h0ThOPEUKr3YHTZzs=;
        b=h7yyabsKJSlNmrTZkZkdpuWdkPKkns2mtbsZIQL62SvWE2nStSP/XlK8UdRsY0GgsI
         /z6LTYmLFDUr4ZsAlXO/bBdEw7KCHriImndDVmC7OqNHQoid0yKSTjmQNuq2fjCxM5/D
         ZrLLPUjh6ku1zE8pke8M22nZISFxDzEwCvgSGEvnUv+dUjCd4iicItJeOweKzXpGTX84
         7JRCJXZHMRi6MsV0SmZMxbV1xXPTBGZOzektaRbWP2V7qcVuIeix/LIgKtvjzM5k4vPL
         bWflUmZ9wvzKpAYPnzmABWKFVsZmU2AUN9DaTFlSMTs+kZxqL8dYzy6NmCSVDTLwuetj
         N5nA==
X-Gm-Message-State: AC+VfDwA+keAFDwb9XS0d9jy1VIazIPsnRo2sBaAhUFXBhsyZSd0OEi9
	kphBLFOL06kV2aihg1YKjQzVr+wXDI8=
X-Google-Smtp-Source: ACHHUZ69hXtQAYUmB8YoITV8a1MdHg2JXDtk41CV4kQ7vR5XjOQLePMVMM/AeZQdilYcUSqBH2RLVw==
X-Received: by 2002:aa7:d0c8:0:b0:51a:4a25:bfbd with SMTP id u8-20020aa7d0c8000000b0051a4a25bfbdmr3392543edo.36.1687187406486;
        Mon, 19 Jun 2023 08:10:06 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbd5.dynamic.kabel-deutschland.de. [95.90.187.213])
        by smtp.gmail.com with ESMTPSA id p6-20020a056402044600b0050488d1d376sm13297186edw.0.2023.06.19.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:10:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: rtl8192e: remove comparison to true
Date: Mon, 19 Jun 2023 17:09:53 +0200
Message-ID: <20230619150953.22484-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619150953.22484-1-straube.linux@gmail.com>
References: <20230619150953.22484-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a comparison to true reported by checkpatch.

CHECK: Using comparison to true is error prone

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index b680757cfcf6..88975dc804c6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -391,7 +391,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 	rt_state = priv->rtllib->rf_power_state;
 	if (!priv->up)
 		return -ENETDOWN;
-	if (priv->rtllib->link_detect_info.bBusyTraffic == true)
+	if (priv->rtllib->link_detect_info.bBusyTraffic)
 		return -EAGAIN;
 
 	if (wrqu->data.flags & IW_SCAN_THIS_ESSID) {
-- 
2.41.0

