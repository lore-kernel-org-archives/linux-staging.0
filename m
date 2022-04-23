Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A87C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:19 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x80so10534469pfc.1
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+3gUIKqgjIoqwfyRdl1gl0gu9sfmeEdgyuQbdCNe5BA=;
        b=LN46w5S3b44hmyqlW8bleygWumr9HpM35L/IWvTsW2aVpra7CrkWWp7so/GivC7wS4
         K9iUcT4o8T+bZXihS+zOeHAmcmoTBKE0otsLwcElfTrewYuDDKDbNBRwLoutCrt/de0W
         8We+i7z52FruY7VU3uCd5NXYM5sa2Qx4H+VCEDgkyMOfHOGoL4Ym1IbuNDbt0CuXOB2X
         DtlVR+fgZWKYWiNjmYrIECen7dFpfqG8zAEGwlktMSZP3W3WEVVKwMTOd1zlxK76TUzf
         S/xfImg2o2KaLtfuNhtAw8GjMahPILScWywueuVqyvYpbWABvLcZpNTYrnD1Cxt6NSVB
         L8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+3gUIKqgjIoqwfyRdl1gl0gu9sfmeEdgyuQbdCNe5BA=;
        b=psHO5trhOetVeiGoztyJ8tQzuW4OoXDpumT49Gev13xA8ftJWLhzrC2JRBnF+fnNJZ
         R5zZMwfawOUI8LDnXncgX2uQTbVEUOwonPVG+5ZoSDHqLTb9jRPrjd4iQrVAxtxq1JVY
         OBVq7t+Sb2lcxv+my50EeIO5FfyaWufXrAEHPlUJyeQcz1M+H4yjJ9IsZJlhLfzp62Nw
         XskWlC4FGZ1tKg6RbDw9s1c8ULHUk5HXrvvmm2JdyMX8s6jH4/nEw1i8ulmlfqOtwICN
         9w2KRllHqe/orx6ia+Evf6l82BE3AWTzTUyEDr7VFrjAyKqZHenmwoM2mQ2WowOjbSLI
         tlgA==
X-Gm-Message-State: AOAM533mUSCQJnCR37LYwh8/Xs7n4ZrUfz5N2ZOHE+q9PbMx3waOQxqS
	vkUfN8TlxQ4HV8qJl68roIs=
X-Google-Smtp-Source: ABdhPJzLZyrXSGRaOPPlqezEIm/raJzvDqC2gZAi8gNTlVurCBybd2ZOdD+ntz/RHhOcwoeeuMs3Tw==
X-Received: by 2002:a05:6a00:2186:b0:4f7:5544:1cc9 with SMTP id h6-20020a056a00218600b004f755441cc9mr9719631pfi.62.1650718937763;
        Sat, 23 Apr 2022 06:02:17 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:17 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 3/7] staging: rtl8192e: Remove unnecessary u8 cast in comparison
Date: Sat, 23 Apr 2022 21:01:46 +0800
Message-Id: <20220423130150.161903-4-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220423130150.161903-1-wjsota@gmail.com>
References: <20220423130150.161903-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the macro VERSION_8190_BD is defined to be 0x3, and the structure
members card_8192_version and IC_Cut are both u8, an explicit u8 cast is
unnecessary.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 4fe806eae5b7..b608540c036c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -811,7 +811,7 @@ bool rtl92e_start_adapter(struct net_device *dev)
 
 	rtl92e_config_mac(dev);
 
-	if (priv->card_8192_version > (u8)VERSION_8190_BD) {
+	if (priv->card_8192_version > VERSION_8190_BD) {
 		rtl92e_get_tx_power(dev);
 		rtl92e_set_tx_power(dev, priv->chan);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 1b70c12be365..b7bdbd895e7b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -919,7 +919,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				continue;
 			switch (CurrentCmd->CmdID) {
 			case CmdID_SetTxPowerLevel:
-				if (priv->IC_Cut > (u8)VERSION_8190_BD)
+				if (priv->IC_Cut > VERSION_8190_BD)
 					_rtl92e_set_tx_power_level(dev,
 								   channel);
 				break;
-- 
2.36.0

