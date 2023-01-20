Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F7613A
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 20:18:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h12so1828425wrv.10
        for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 12:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5PEEpYbd9JR0sOvYfHmr/vW+Rpo6V/62Q72U9s8gzY=;
        b=DbUQV68qiUmqYwTvudP7uOeZobN81AfWmNWt0Nh3auBFSBNVx+O3ch4S55njTe4jBn
         X44UQKRcWOggjFtlTVeAxFqaRafmwdKlcU1PBvd8v3zF6wubTdyz/QgnC+zZcclCoi5F
         3UOBcTONrozvF6Uy4xJ4WKuBTCReitgoOaJSPO+FVp/xJnEZilXZIGw6HiIC6qcvjD3v
         I8W8FuLxeuY/h6iNKFoSqlb9OqJSe44VMU0PfNTzp6W6bWXVtRGZ0UcQNbnEYQGZ3Ly2
         11BgQDZT71InEewOUFTD56aLyLEACYqSifYr3BW+Dq52B9aPkFZxdWRenY0ULlOVAZk7
         GodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5PEEpYbd9JR0sOvYfHmr/vW+Rpo6V/62Q72U9s8gzY=;
        b=0RKk56uliILpm0fHZxBxxMuDH12SXGM+fxQnHc3RWGQ3O29NGghs0S8Ys7vUdEhlsy
         rdTvmMCxHH2x1GTsfLPm8K106FXKyChbsQI1g7p94gWlMZWVWsK1aglgwdK/PgkVR7m/
         4L50K25NnPDiCniamz2JO5F9taLezjpjxHxhoEMWemiHg9ry/LiiTGmomRdXHIYSBFFZ
         Q1y+rxLRqr7a2jWWZVBs3X2FF75qA4wTA285YjtnslXwbo6lSy+wcEHAHyUjUJW4sToa
         xtfK7DMK3Mnf6RF9DoEyhQihMB3S9ZcsDKX2e1KM8P7JjNwA/VZO7/r/DHi8UAeY0FC3
         URgQ==
X-Gm-Message-State: AFqh2koMkdOLw8J6/XNvuXDT6VOdnOSK3gBYgh9VFjA0cGoWISCZbsdu
	ArTp4EUlvUI/J+1gqogsVQHoljxpyHI=
X-Google-Smtp-Source: AMrXdXuNKBtCSjWeKMf84yR1Y+Ktlm218N/xzFttX8ZwRtQc6uvcg3ZxwI4TuuOPDdBCdIO/LTHXvA==
X-Received: by 2002:adf:f992:0:b0:2bb:62bf:f5cb with SMTP id f18-20020adff992000000b002bb62bff5cbmr2670640wrr.4.1674245909015;
        Fri, 20 Jan 2023 12:18:29 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id m5-20020a056000024500b00267bcb1bbe5sm37671154wrz.56.2023.01.20.12.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 12:18:28 -0800 (PST)
Date: Fri, 20 Jan 2023 21:18:26 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: rtl8192e: Remove u4RegValue which is always zero
Message-ID: <2aa104c0f7a5cede7eea289fe92390295592b0e9.1674244819.git.philipp.g.hortmann@gmail.com>
References: <cover.1674244819.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674244819.git.philipp.g.hortmann@gmail.com>

As the array antenna_tx_pwr_diff is always zero, u4RegValue is always set
to zero. Replace u4RegValue to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index c969c40c3979..d56c58ecc19f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -586,7 +586,6 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8	powerlevel = 0, powerlevelOFDM24G = 0;
-	u32	u4RegValue;
 
 	if (priv->epromtype == EEPROM_93C46) {
 		powerlevel = priv->tx_pwr_level_cck[channel - 1];
@@ -603,13 +602,8 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 			priv->antenna_tx_pwr_diff[1] = 0;
 			priv->antenna_tx_pwr_diff[0] = 0;
 
-			u4RegValue = priv->antenna_tx_pwr_diff[2] << 8 |
-				      priv->antenna_tx_pwr_diff[1] << 4 |
-				      priv->antenna_tx_pwr_diff[0];
-
 			rtl92e_set_bb_reg(dev, rFPGA0_TxGainStage,
-					  (bXBTxAGC|bXCTxAGC|bXDTxAGC),
-					  u4RegValue);
+					  (bXBTxAGC | bXCTxAGC | bXDTxAGC), 0);
 		}
 	}
 	switch (priv->rf_chip) {
-- 
2.39.0

