Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837D1548F
	for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 15:10:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6436e075166so5538148b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683731409; x=1686323409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BbmQvMf9KzmVdxCSRKyarW++yF6GCnmLwgE9M2RotW4=;
        b=ZtJb+YQhL1NxXiVYXH/As6s0vhSNRYSvBGb+N15NM9sSTgykg2AjFG9qO3PG1SSAdX
         3CzT1p1aXATma9d/PmwuFlgGVy7iPV0mFxdq0s4DTw30wK9x5u6+A4moyvlsOiikgmKe
         AebpEZLZg5GoW77NMWMF3/j1eyyDOkLUUU0EqMnk6swb6Fa0hyQ0dXmmyn2aywJMC7Kg
         zOTes6Wbgk23IVk/ItcrUYD/ki8KW08GvSbIgX6luFY4S1pMla1MDbBqgHS6hjyOjwtC
         ShxaC9GcJ/6967chkJuXT2NCet7fFBrtkg8OgXdS0F6KlQH5bM+1Nbl+4E+PuaK1vc+S
         7C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683731409; x=1686323409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbmQvMf9KzmVdxCSRKyarW++yF6GCnmLwgE9M2RotW4=;
        b=WHJ0Q9oY0vK9KmrnqsgJR1zEkDQnzL+zlpyKY9DtxRV+FkbgdI1TzPoya7MnQWCGHG
         0ard7l67eiVJVOaj9acG3ndN8qiTfptmgx2NsowPeEEEZZ9ETMpBGg/K3yeLVYnp+1JS
         1TfX6uNHoiL8luUdpLDnmGUOTzNf4pozBJJszl20/YgMI+rfJ90jSymc0NBQ79iZAnAF
         LFFrxUiFhlCnbvrl3lpeTqsKPmcPeHZjXdTf917tdw1/Yz7H3PzFGp4d5RNWTWxt8KxZ
         1hdRYGH+eOySVKJ0bBifuU2nGo0/8dBq4YmY1dJsfmDbZPAvIsolhj5HMNWssRocolli
         yslw==
X-Gm-Message-State: AC+VfDyb7oEtz9APaF45uXbOkCnuEkx9efUlmd3nPbqS+U5rVMUqA69B
	9t7/lxN6KaUJ05fcnpucVsIGu7MuaeM=
X-Google-Smtp-Source: ACHHUZ4t+R6GTCWUl02uKMGgbAc5ywYmosUfP/6Gl+Jt3HupOylaw31Ww4uk5dzkv3/izFGWD7N64g==
X-Received: by 2002:a05:6a21:788f:b0:101:37b2:62f3 with SMTP id bf15-20020a056a21788f00b0010137b262f3mr8536263pzc.61.1683731408908;
        Wed, 10 May 2023 08:10:08 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id x6-20020aa793a6000000b00640f588b36dsm3697217pff.8.2023.05.10.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:10:08 -0700 (PDT)
Date: Wed, 10 May 2023 20:40:04 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8192e: Refactor tmp_ofdm_index variable
 assignment
Message-ID: <af7bc22ec142c33cf7346c1ab13d192b55095d1e.1683730854.git.yogi.kernel@gmail.com>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683730854.git.yogi.kernel@gmail.com>

Refactor tmp_ofdm_index variable assignment to avoid multiple
assignments which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index a44be3f810ab..feac50cd8fa0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -689,8 +689,8 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 	priv->thermal_meter[1] = ThermalMeterVal;
 
 	if (priv->thermal_meter[0] >= (u8)tmp_reg) {
-		tmp_ofdm_index = tmp_cck_20m_index = 6+(priv->thermal_meter[0] -
-			      (u8)tmp_reg);
+		tmp_ofdm_index = 6 + (priv->thermal_meter[0] - (u8)tmp_reg);
+		tmp_cck_20m_index = tmp_ofdm_index;
 		tmp_cck_40m_index = tmp_cck_20m_index - 6;
 		if (tmp_ofdm_index >= OFDM_TABLE_LEN)
 			tmp_ofdm_index = OFDM_TABLE_LEN - 1;
-- 
2.34.1

