Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CED79CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:03:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b20so41657821edd.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679951008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AozKR2DoQOOyJHBglyYFmZBaHgy3GkeNuTZPAIS6qrc=;
        b=MVgyfKsxyF7IMhk6z/KTbB4cUeKi3N9CiLUP5+wDXffu0NBjZ1vTVkD9gutrRv3/28
         Nyj/Y2/H+keaqnF016TTUdblXefz0kpYHeoAFQKmLOdCwiO7ZaZ+wLYSPBEtPkFk/O1j
         eganBRmBIgU+utePVhgEk8Vk/i/WQIvVtvmXCswmk637rDwGiszFpX4SHrlp+5sxzL49
         jW1JrUUyW+7GOJSe/B34JY0FCI5cEb/7cnFbxV0VhaW9aoKJmg3UxcPEtxESd6r8BDO6
         feL5qQQf4yrI7s6rZAJjL3tyiGmclltYVZOxKsBeSiE+1cvDB6M0SiFveoohnu6sR0cL
         8BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679951008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AozKR2DoQOOyJHBglyYFmZBaHgy3GkeNuTZPAIS6qrc=;
        b=HuDULIOym6Y2YnsFCdbWEAeI/c7GKRZC2CRiQ5COI/NOzSprtGy8UqH24xe8b/AbYx
         u4+SALPbknYIV5RHP3lmaiKYrqd3VuEhQni82hOox356Mm+YwNVI3Owyua5Hl976bgg/
         tMg8QO7Lx20tKmgaRpJ9PRnmEqi5ccBbbppNboMBcxIcQQCXPXWZukWzaG/sYUxiH6ak
         aVa35uJkPPRACO5MM75dmlC07gK9Ln0IuOjMhz3ifxzGNlpw8RUmGurVTbMwktRpiBQt
         pb8EPFJhhNi9CCBdzh197l2WiFWPJHKxZUtNDg0nyAgWRC8vj7y34nSsEPzj7FiBkWiA
         bNdA==
X-Gm-Message-State: AAQBX9dMi1jUIZ1cbpAFOt6Ro7qAVQyoPQgiTT1eLY3QFXN9V3rAfncL
	16NhXxncUC8qMBopNWG49B3+v3iSxCE=
X-Google-Smtp-Source: AKy350ZK0tpkIhJczcUkPG0Uonl+xK8i3Ec6WYb/RETj2/9m5xG31AKWZnZq2aowbnlkT+3PpTR5vQ==
X-Received: by 2002:a17:906:49:b0:944:4d7:d3d9 with SMTP id 9-20020a170906004900b0094404d7d3d9mr6011882ejg.2.1679951007840;
        Mon, 27 Mar 2023 14:03:27 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id lg10-20020a170906f88a00b008cc920469b5sm14541859ejb.18.2023.03.27.14.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:03:21 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:03:06 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] staging: rtl8192e: Remove wireless modes A, N_5G from
 rtl92e_set_channel
Message-ID: <aaaf832fe5f90ad2c618bef22c1bdbd5209c4359.1679949171.git.philipp.g.hortmann@gmail.com>
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

Remove WIRELESS_MODE_N_5G and WIRELESS_MODE_A as those are not supported
by hardware and to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 139d8268c8dc..dd666701138e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -696,15 +696,6 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 
 
 	switch (priv->rtllib->mode) {
-	case WIRELESS_MODE_A:
-	case WIRELESS_MODE_N_5G:
-		if (channel <= 14) {
-			netdev_warn(dev,
-				    "Channel %d not available in 802.11a.\n",
-				    channel);
-			return false;
-		}
-		break;
 	case WIRELESS_MODE_B:
 		if (channel > 14) {
 			netdev_warn(dev,
-- 
2.39.2

