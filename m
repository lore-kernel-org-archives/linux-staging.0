Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3335101C3
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFofYcRB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9dd9808c308so84050366b.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297487; x=1700902287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMytCypAKR6h1wsB0OQEQ+cFMOVYMGL6IbHLXc4UGuE=;
        b=hFofYcRBSVn159LqlxWdOkPItsuzW6UWDhl/VTLu/ewtPJn4mLA6H7JhwrZ5nFEbsD
         3lNnIE4TmGBmgai6nF4NDgi6M8OpYKAZw863lquO/CNVeiuZVh5hcD6Q/+Y6LLt6pEAc
         K55UNNypaUq5oDVu6SHpaDayxuL/Kl3jIYy3ApUiMTZFYJQpoS7uXQoZnb8Wvr1uNiXr
         kI9Lf8hJ3Dvq8/K2Wi+WkQ1bJkhd606B4WHSBnli7lXaehzet2Uky5lGILAfjRRr+fjF
         i2CMaf9B16k9BrPYMJg4cyPnp6vO2mmeXwPVuGaDGsXe4j2K5jNonUGIbfMv1UsAKy5E
         0ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297487; x=1700902287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMytCypAKR6h1wsB0OQEQ+cFMOVYMGL6IbHLXc4UGuE=;
        b=wc3lxHh23jBpk8UrNu3ll3OS3JHlrjuE54+2FxUBkLLkJZsaqB7vLVB82gfxh87y5I
         S4wRj+z3usr0dwTUfjiZq3pzpcuv+rfb2zWYI/4uE9c5QzeHU9QNfUVksUCVTvjIHkVc
         26sbYgV8slIPY3agAC2gWgBFot9WoP0yrQ2AiF9gSepj3bE97Ak3dsNqaRM+QPL/hl1F
         StSk7d6KQ7WKVGB6cWY7cDNKKlONQUtWP017rgyyEuyeWn5y7gwnDShVgZzzZUkhlFLV
         Sl4qQq1GJESvFKtjQMoUx33kPMOOSAcwBXbyQWjEW1w05TGTfV4wkXXdbrSMY7zBuLIB
         KgNg==
X-Gm-Message-State: AOJu0YzkiPlKGA66J5X0ukkci5L886kf5m3+gn16T2fytsECCjFQYrXA
	kFVqGkw+2hmuRCs6ZezvMzY=
X-Google-Smtp-Source: AGHT+IEJxyDYevO9u1ZvQlIAYKwA1u1hwMrPRuZiGLG7Gd0x+Re1XWYG1WT1bSHyS+iyT5Sg+atNYA==
X-Received: by 2002:a17:906:10cf:b0:9e6:dfee:8154 with SMTP id v15-20020a17090610cf00b009e6dfee8154mr1036711ejv.3.1700297487250;
        Sat, 18 Nov 2023 00:51:27 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id jz12-20020a170906bb0c00b00988f168811bsm1675679ejb.135.2023.11.18.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:27 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:25 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove equation that results in
 constant for chnl_plan
Message-ID: <d6fbe3d2297d1d5502b183785f14df51a81e3331.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

Remove equation for chnl_plan as the last line sets chnl_plan to a
constant.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e93394c51264..44898e0be21c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -387,23 +387,15 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 	rtl92e_init_adaptive_rate(dev);
 
-	priv->chnl_plan = priv->eeprom_chnl_plan;
-
 	switch (priv->eeprom_customer_id) {
 	case EEPROM_CID_NetCore:
 		priv->customer_id = RT_CID_819X_NETCORE;
 		break;
 	case EEPROM_CID_TOSHIBA:
 		priv->customer_id = RT_CID_TOSHIBA;
-		if (priv->eeprom_chnl_plan & 0x80)
-			priv->chnl_plan = priv->eeprom_chnl_plan & 0x7f;
-		else
-			priv->chnl_plan = 0x0;
 		break;
 	}
 
-	if (priv->chnl_plan > CHANNEL_PLAN_LEN - 1)
-		priv->chnl_plan = 0;
 	priv->chnl_plan = COUNTRY_CODE_WORLD_WIDE_13;
 
 	if (priv->eeprom_vid == 0x1186 &&  priv->eeprom_did == 0x3304)
-- 
2.42.0

