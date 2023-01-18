Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5AD53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:59:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id j17so34352wms.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6Bdv7nTejW0X4oYcoZpe18GPl2p/Zqclu64+iodiD8=;
        b=CYVT5Rppani6wxwY8+voluYiPSOsncCvGa+9pYIBABQO8FxN6ytHC1WoU8lTwWHT3w
         V5mDrRk2t9+TMd0VmG2rX5cufRRP3IgKhHLV6AyfPj6GhswQ1fvVJOoBklO7WKrfPpjk
         gbAHGglQccmMoF1oskhLNOLNk9zt1WOwUU9ZClWevBf2+HBFG62iA8fO7JhOh3k2qxZY
         2cUP+eiug7qSpj3M8xKYo8r859zNo2GkORY+xWfGF36AA7FI8e6vVUglferv+ByYHQiV
         jfxj6J8hvtQ/w9+HDIjf7dXHySMl+UQH5QrbMaGTehEMYAkoIDCnyIu1FTjWb9eQv2CF
         m/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6Bdv7nTejW0X4oYcoZpe18GPl2p/Zqclu64+iodiD8=;
        b=ZNVfkHGNMx+67ovHwixWLZ6MaKiSMePDr1KQ8kgPi2oE1pgObzxGkwrusyxED8SKHY
         84yl+GoRMQW7qKDhYTvnQP5+d5adG3CtFIt4Elq6jkL3WV4OJKoadOC6bAxvxbMuOwY3
         +AzoSwWaEe7xrIRc/0NKMCrjHufBnGZq+2BCauN/QG9/0sw4YcgLWV07gaZi0ERd2tTN
         xt2ej6AO856VVmNNE0SCO82MFTYBOisSbFyp9o/cPRVp5Zd9LwzuCFxMiLqGpF9gr5mN
         hiblLMVoiqBu+8/iA/QsTezIAm409x0C3YGmFY+p1eI817EYqgX8LFJbQNoQsVxka03E
         zNGg==
X-Gm-Message-State: AFqh2kqujxA+K+kELB7oLhsdgilXWy6Vxwtn4ylB8aV6UfNcNh5sTVvX
	FyvJ48tzUmcuulhAan3otq0=
X-Google-Smtp-Source: AMrXdXtobt3huvs1MBdSTFnIWy+NxrYZPYk/TmDvlu0QH1DBBkkRMDIJeJTLmHUqK0Yqs3up4JBrfg==
X-Received: by 2002:a05:600c:5107:b0:3da:272a:bcf3 with SMTP id o7-20020a05600c510700b003da272abcf3mr2150925wms.3.1674071955666;
        Wed, 18 Jan 2023 11:59:15 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003cf894dbc4fsm3023595wmq.25.2023.01.18.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:59:15 -0800 (PST)
Date: Wed, 18 Jan 2023 20:59:13 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] staging: rtl8192e: Remove unused variable SifsTime
Message-ID: <40234d0b1ab1eff23c71d96e8b0f1f0085e2bbac.1674071236.git.philipp.g.hortmann@gmail.com>
References: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674071236.git.philipp.g.hortmann@gmail.com>

SifsTime is written and then never evaluated. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index f7865d0c787a..ed27bdbb8fb9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -581,7 +581,6 @@ void rtl92e_get_tx_power(struct net_device *dev)
 
 	priv->framesync = rtl92e_readb(dev, rOFDM0_RxDetector3);
 	priv->framesyncC34 = rtl92e_readl(dev, rOFDM0_RxDetector2);
-	priv->SifsTime = rtl92e_readw(dev, SIFS);
 }
 
 void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index cbafbecb5ca5..feb48ee35110 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -412,7 +412,6 @@ struct r8192_priv {
 	u8 short_preamble;
 	u8 dot11_current_preamble_mode;
 	u8 slot_time;
-	u16 SifsTime;
 
 	bool autoload_fail_flag;
 
-- 
2.39.0

