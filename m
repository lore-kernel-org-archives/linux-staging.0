Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BED21840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:36:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y4so16607748edo.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TxvwzNHlMhQxqbhDKY/vp8koWCnsLAxNykHAaCh4kRg=;
        b=X/uzSL9Eb0S+87/KxZ9kB9/5y1GkDhCeHTfCE9i/WhoE4SiX0y0Z85UbK3XRpZeF8V
         AH5Nrvm1dJa/yqzWOjEsdVRZaCuuRf4t4/OkNP3VVE+dn0wywLLrBIMhEXMhv8fx3Chl
         Q/H9owBF18aJlv7SuA+dmhP31nyzj+YiaRRSDZc8QXZPWAJYO+yviUVsOQpGOHzA4f7F
         rAlcv1dMw6b3MAD/1ILwUXif59PJ2Pw0UaIaZWwbxTTx0g0B3BjJagOxIA4LZbsXwGzj
         aqluWNZ3HsnrqaeBm2WQ71d32zdD0LZ64R1g6NlHfndddk5VvGh3ObM+G+Z7Fko0jRds
         cV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxvwzNHlMhQxqbhDKY/vp8koWCnsLAxNykHAaCh4kRg=;
        b=xxT+ANbUfoecGYnMfBb0546hiYAZWfsJ2U7y8Sjka/TCzOdxbtnIHXaUA+3HfI2cu2
         dAecYnUzANXEd5vF6wjDj62N67gH/s3NDlDa6KZ397ZRSCp+NmvtBio7jDlWftGsDtgC
         eJuHwfxO0L+36P0/JQVuL3KpVOMRX74SGMYQ3ykwQydsAggL4i3cLVTwVp03AarePVKn
         YZCUBcWMDRkGZEQKDGFA+EfSfzQmdkxHtfU8obGS/2Rl2I8cIvmM+9RHwaXhRzqyqI1m
         3QT77Z0u73gPazRHbVhpJ74FcsuLNQuCXQAbG865xtsiDsoQl2ha+Qju44EsIUyg5xi/
         h2Sw==
X-Gm-Message-State: AAQBX9dcImYto41FC551f/vRqgmb9M/DyvMdwAUBiqW9wFvI0+Qn+06U
	iFasWNHUUuo0r66x475Kq6g=
X-Google-Smtp-Source: AKy350ZXqwFwkJBUMScwJeLFVmcgz2yVWOKHhIkwUr6pBQnsdf+Jbr4TDPm/eqVDFoGEKNehfFH7sw==
X-Received: by 2002:a17:906:74ca:b0:8b1:2614:dea6 with SMTP id z10-20020a17090674ca00b008b12614dea6mr5108823ejl.1.1679733416406;
        Sat, 25 Mar 2023 01:36:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id n15-20020a170906118f00b0092421bf4927sm11642321eja.95.2023.03.25.01.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:36:56 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:36:54 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8192e: Remove rf_chip in
 _rtl92e_get_supported_wireless_mode
Message-ID: <e2db309dea3208560337376fec26fa5cfba93848.1679732276.git.philipp.g.hortmann@gmail.com>
References: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679732276.git.philipp.g.hortmann@gmail.com>

priv->rf_chip is initialized to RF_8256 and never changed. Remove
condition in function _rtl92e_get_supported_wireless_mode as it is dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 3244aef12c05..8e4e939d7617 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -595,23 +595,9 @@ static void _rtl92e_refresh_support_rate(struct r8192_priv *priv)
 
 static u8 _rtl92e_get_supported_wireless_mode(struct net_device *dev)
 {
-	struct r8192_priv *priv = rtllib_priv(dev);
 	u8 ret = 0;
 
-	switch (priv->rf_chip) {
-	case RF_8225:
-	case RF_8256:
-	case RF_6052:
-	case RF_PSEUDO_11N:
-		ret = (WIRELESS_MODE_N_24G | WIRELESS_MODE_G | WIRELESS_MODE_B);
-		break;
-	case RF_8258:
-		ret = (WIRELESS_MODE_A | WIRELESS_MODE_N_5G);
-		break;
-	default:
-		ret = WIRELESS_MODE_B;
-		break;
-	}
+	ret = (WIRELESS_MODE_N_24G | WIRELESS_MODE_G | WIRELESS_MODE_B);
 	return ret;
 }
 
-- 
2.39.2

