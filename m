Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BFB79CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:02:58 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x3so41493223edb.10
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679950977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=see/tMyHGeTFgBe28oR3fGtGcVzBX17DM6QeEae9PEI=;
        b=BG69Ctf4CNtfGm8kdwx+9G6WIIW/befZ3ZVOM/QeD5hvSR3antuakGaqq2NTuVmJ8e
         d0Rmyp4K2k3jI6RZ2IHOmBfSPxEvKduNGj2DQw0jSBNdvdO1iOyrUpFA5XHs/U3UvU8D
         gwrsysopPs+742PPmU1wjOD5k2a3VL+DN85U0tVSPM22l5KhV0Kyd8CKfz0zv+2wPRLP
         K5iYQKDbxlijmyYdTEtVEEDIorFbmn1tpueO8Kl+yLxfC3mmpiNzz6HnZjkRfdwWJ7RT
         nEFBQreByWdb/lSYdhIxLkFC8MX2qIM9pCJuvJY4vkuMBMh0x28oqvW0M4Dq8a0Z6EYW
         dTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679950977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=see/tMyHGeTFgBe28oR3fGtGcVzBX17DM6QeEae9PEI=;
        b=A1YkDeu/Uf+QI58rzmNF0HUrRf66wrp+AH1o9R/p6SL3my5SlF8+wMm/10bIomC9Hw
         YSA2cVECNUI23OTC3CNaqdO+xS9XAzWi/RI8s0Xa98lqYCl7706qc8TXeKQsxl3zk6Cg
         xX/qCxIahyIrIrv/giVEXwusfJOWcbxkKm75GPveugbMHJPoNRL88RYqZ11ZzKxHBTPC
         BIiPk/KATuNV5D9VgMi0ewRvJ/P85+YHFzlHqvzmAqsDBEqQgfAHtPNsGQjnoehqtjVm
         hf3uXPoO2Tg6tZDPB1Re3BhaG1EjN9Y1Pe9GJwGqcq0c+w0nx2rwIBdqBwyatMUUO1FK
         mwsA==
X-Gm-Message-State: AAQBX9eu6vpRPZ712oqAzdm+xGwnnXsGxrzHJrP4v98nQ5pNSEuX+zbP
	3gMP6YaSKDiPsujdIrNJ2tk=
X-Google-Smtp-Source: AKy350ZavlmG7gd+4zStA4EziPmcCI0rvw37VH+lsJkeS+LrOMdkfot21hPRD1uMPmvzYytDFGwz6Q==
X-Received: by 2002:a05:6402:3490:b0:501:ea97:519c with SMTP id v16-20020a056402349000b00501ea97519cmr15032395edc.4.1679950976977;
        Mon, 27 Mar 2023 14:02:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id a18-20020a50c312000000b004c06f786602sm15085330edb.85.2023.03.27.14.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:02:49 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:02:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: rtl8192e: Remove
 _rtl92e_get_supported_wireless_mode
Message-ID: <f8470fff23d5870cbcda3d6f4978ba17016a8fe8.1679949171.git.philipp.g.hortmann@gmail.com>
References: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679949171.git.philipp.g.hortmann@gmail.com>

Remove _rtl92e_get_supported_wireless_mode to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ecc3f0c6c267..12e5132fa788 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -593,18 +593,10 @@ static void _rtl92e_refresh_support_rate(struct r8192_priv *priv)
 	}
 }
 
-static u8 _rtl92e_get_supported_wireless_mode(struct net_device *dev)
-{
-	u8 ret = 0;
-
-	ret = (WIRELESS_MODE_N_24G | WIRELESS_MODE_G | WIRELESS_MODE_B);
-	return ret;
-}
-
 void rtl92e_set_wireless_mode(struct net_device *dev, u8 wireless_mode)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	u8 support_mode = _rtl92e_get_supported_wireless_mode(dev);
+	u8 support_mode = (WIRELESS_MODE_N_24G | WIRELESS_MODE_G | WIRELESS_MODE_B);
 
 	if ((wireless_mode == WIRELESS_MODE_AUTO) ||
 	    ((wireless_mode & support_mode) == 0)) {
-- 
2.39.2

