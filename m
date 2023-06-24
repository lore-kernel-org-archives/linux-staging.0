Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03C810
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:04:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3127e67842aso368627f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586696; x=1690178696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tet128yKFRAGmSck7VlR0R9HJycI8gkXHzRpAiz+cp4=;
        b=XfHsYRrLcYvqHbX5mezvMVFndkXXC8t3V60vN4rVd2S9FF4ERl+n/SESuVPhz6xE47
         cKxcdjuq6csWg/Kg7tPwZRDn39A5TY3mlGMSD+Q9guhvByGPSlcyTvLrEH3Ij2rXSAz8
         o3Jv8WEazYUFg3mt64C/Y+hRsbVJJmFiUdwq1oKXA58Mev1oTalYG3wuvWkwxNtjAvSt
         InyTT2idm4xMeg9XEGg+Y7DkOUKkmhYOEPvFiq2H6giwr7OyuwTu6IQuN+uUA25imLf7
         SraojVtfkSHZXs2KwPE+5hPqqZ/oesb0th0qPCXHWSl9auPjXyAmgwqqlyuvoEmgoD55
         WszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586696; x=1690178696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tet128yKFRAGmSck7VlR0R9HJycI8gkXHzRpAiz+cp4=;
        b=RiFwjbDhcBcWBR3UVl4dRIn0pDP/w/l4MMCTdoquKMA6QV6CCZu7Qa+pXRj+wUDgUT
         O3fdq7oFfFVsCxzB3DLOXmAuBEcy1+CrqdDiT+hQRbe1DBz6SScswYrTXXozaX6zRDbN
         rruV/HZbHLytIPOmkWcBB4kJxtXzzxU+AxM6dE/WXt+4YXFk1ZjsBroHFf4bjF1b4pDu
         aaIqpuuIvqi84EUBV+raTqT4bAaX7ybMc78/dbYfkdppMFU1UoK47ib9bnCPrGbbQpo5
         y5PDQhCOlJZqDBlhkE1t5hIDmGoj7xReWLRh5wluXk/JKBV2CK/HkAni8t94o/VIhEto
         xwvg==
X-Gm-Message-State: AC+VfDyyY5cIfSVpbSHWAStsb981CI4xYTq05sWd3qwo3CZeVpicYzd6
	SOWPHEeJlJcR+XZKlSUDR88cBjCLdyM=
X-Google-Smtp-Source: ACHHUZ4eBS7OlQqScAhFpM4221U82I1snsSK/VLUX/ku9G/PMGOJnrVE3ffTabuNO72GZ0sAbIMBQg==
X-Received: by 2002:a05:6402:2787:b0:516:463d:8a10 with SMTP id b7-20020a056402278700b00516463d8a10mr16811642ede.3.1687586674935;
        Fri, 23 Jun 2023 23:04:34 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id p2-20020a056402044200b0051beb873d98sm311422edw.27.2023.06.23.23.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:04:31 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:04:27 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8192e: Remove variable card_type
Message-ID: <f0f40f574ac4837bd2be3b6384ae42d9aabf1832.1687583718.git.philipp.g.hortmann@gmail.com>
References: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687583718.git.philipp.g.hortmann@gmail.com>

Remove variable card_type as it is initialized but never unused.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 2f504a4838a8..e9eb55c6e6d8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -807,8 +807,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 
 	priv->rtllib->fts = DEFAULT_FRAG_THRESHOLD;
 
-	priv->card_type = PCI;
-
 	priv->fw_info = vzalloc(sizeof(struct rt_firmware));
 	if (!priv->fw_info)
 		netdev_err(dev,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index ec9e454299a8..1cb68d53a17e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -259,12 +259,6 @@ struct r8192_priv {
 	u8		polling_timer_on;
 
 	/**********************************************************/
-
-	enum card_type {
-		PCI, MINIPCI,
-		CARDBUS, USB
-	} card_type;
-
 	struct work_struct qos_activate;
 
 	short	promisc;
-- 
2.41.0

