Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9274A569C
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk/hUIPa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-523029050d0so745530a12.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297504; x=1700902304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60TEIsDbZcJztid9/FBNOOfGZ+ibynkio00841tSlME=;
        b=Hk/hUIPatVVKLTE1Nvm1RhlcxfS/jKki1E5thYo9sjB88kwM6pmN3MTWVDx1aKsP0k
         mcHqMB/2cjvef+LyYkAOskiSp2Ch3Ns1Ho7ExfO9yuk7XdSFHMiUjjJ2crDLEVQaDZxn
         HXZv7Xh2/UJE+XiXsE5sMzYwDiKwvLbXuSySSyUN4Bko5xC5nQLnlfV2KjIvoi0FrcnP
         M2d+kgLlB+DdnIn+SKxy+d3BVIAD/9wGJPbFT/JCtl0uANYeBOcVQjDnNS9UkimbMQwH
         I5oe8Y9Vj+WRgvAch2+Vse8cSDSSS4ThbAJI6Xpr43q5UTU8X/uSMUtPYBbIxaCeURbL
         FfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297504; x=1700902304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60TEIsDbZcJztid9/FBNOOfGZ+ibynkio00841tSlME=;
        b=SY4GIsNqvAWu8iWFPns4I0lS7QJtXsyEYoNrx/z+KREnHxbMN525EK2/4pKW/zBcIl
         7oRykRO+2sCz9cVOQuDfa6kQAxPUz2CVTdQIIST0rEZqDeOkxbUJUnQ/QJymA2aAJlJp
         DHIDDOz44O9Q7VTyfKrnVLFab1FKldRJbepRJ2A40O9m/iIn2gL6cWEP6tvEyRAT6bYp
         /+kX1bCF0NdPbpysoU+0IvZFmLU3yle/Zq9F8Ls2n1tNX5m4qn9xZJTZqFoN6PA0VXNQ
         uhBz6kiIgqeY7Ku/iqvkKG0iZWqoEhoy2ukHds2sH0Repi1OM9i9g62kmvKXsDVfor1K
         BF1w==
X-Gm-Message-State: AOJu0YzITkQpCiG+Xd+fncl6z+vmrskJspRlivxR2d1HJIUGiRQ1P+PW
	lB/29HFo/rQN4RxstY+ScW0=
X-Google-Smtp-Source: AGHT+IHpDvqR83tfTWq7GrzTx5Ftu0W4/DcSCPG8Olvrsf3Se+/xJDhPTqZHJf/14sHUGjSXHeNG/w==
X-Received: by 2002:aa7:ca50:0:b0:548:5671:8330 with SMTP id j16-20020aa7ca50000000b0054856718330mr1236640edt.3.1700297503703;
        Sat, 18 Nov 2023 00:51:43 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7d88a000000b0052febc781bfsm1504123edq.36.2023.11.18.00.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:43 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:42 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Remove unused variable
 eeprom_chnl_plan
Message-ID: <ffc592edd61332d2d8f9b0da68fc956d76e68fe0.1700296319.git.philipp.g.hortmann@gmail.com>
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

Remove unused variable eeprom_chnl_plan.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 9b51deba149b..8fe4c03b19c1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -261,7 +261,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		priv->eeprom_customer_id = usValue & 0xff;
 		usValue = rtl92e_eeprom_read(dev,
 					     EEPROM_ICVersion_ChannelPlan >> 1);
-		priv->eeprom_chnl_plan = usValue & 0xff;
 		IC_Version = (usValue & 0xff00) >> 8;
 
 		ICVer8192 = IC_Version & 0xf;
@@ -283,7 +282,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		priv->eeprom_vid = 0;
 		priv->eeprom_did = 0;
 		priv->eeprom_customer_id = 0;
-		priv->eeprom_chnl_plan = 0;
 	}
 
 	if (!priv->autoload_fail_flag) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index addaa1eb39ee..e7b331c4661c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -284,7 +284,6 @@ struct r8192_priv {
 	u16 eeprom_vid;
 	u16 eeprom_did;
 	u8 eeprom_customer_id;
-	u16 eeprom_chnl_plan;
 
 	u8 eeprom_tx_pwr_level_cck[14];
 	u8 eeprom_tx_pwr_level_ofdm24g[14];
-- 
2.42.0

