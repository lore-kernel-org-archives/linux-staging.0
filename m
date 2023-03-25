Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3D1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:36:04 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cn12so16559459edb.4
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dc8fh90KbqBXiSamQ6fXKYW6QBeBG1tBvztL+KlOiwQ=;
        b=opPGtoK1ZjhdTj4xeZNlU8az/JqYZ0c0T3Kqnlu5mzLAB6A+8TgqpzNBRFdFy+OX2J
         Xv7eWBWQWIzQggVobHI4TeDcsfuu8/9EZ5TzIgXhOSOCgjN7ZUvxi1YuFYrxCdhn+kKt
         oxeAzyytXgEcSOTaGkW1aZ/qLe4VM32x/EilKO+YQgCDYtsllsNMNPXe8fGd78HrMAQ7
         IO7ztMd8Y0rvH73VavPpqKGQJBOzB3SPywZ69bZF/T5kiuMdQcyX2z1xsfT2pQgour9B
         lKPJ3HwK2gCCvSxT1lPB7yKL/xOuPo+xqZelWRX8PTc7BzpE8Lg9csstHmOqA0ujLtUH
         /99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc8fh90KbqBXiSamQ6fXKYW6QBeBG1tBvztL+KlOiwQ=;
        b=Owkqrwb9B94+vBFi/fOgQEQC61S8rD+3u/1xUlYHPL5WZTReRgHQ8cpEIpC14inLoy
         LTE3ONLz18+NW7wtUAnHI+d+s7n4lgL+ZRZ0Gfuahv3xNcnX2iID1eV1nznDLF3wUvwK
         p/bA0He/lgJHNoXWw+7JRK7lPgsDW+a4DjAraLH/uE6k2C2B5VNk5Di8dcvBB1jKfGU9
         TQfOd4FTSp4gmG/LiNBpMAjyb8UXtkpqjWtErrKEN9VwndckZBgdne+nPAG2aKw0btKN
         +Dxopd9u/5e7yQTZh6K3wasYfa2GZpVH04bTqG8SdwJEVvFZ68hUZQuppdL2m4MqoZjn
         PgoA==
X-Gm-Message-State: AAQBX9cN3JweWbafi2WEv1a/ivBvP9DXOruPOgu86ajjhertxFFHRvac
	/ZgBVB4D85m8cL/+9TkqMt4l0IOl74c=
X-Google-Smtp-Source: AKy350ajQinP2StLkUzxxcWkRp63A4pTcKP30b42gk70VTq4fpKond+pi4yMMaWY5nABKE/Uwr7S1Q==
X-Received: by 2002:a17:906:74ca:b0:8b1:2614:dea6 with SMTP id z10-20020a17090674ca00b008b12614dea6mr5107443ejl.1.1679733362676;
        Sat, 25 Mar 2023 01:36:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id c3-20020a170906340300b0092fc6971000sm11387480ejb.40.2023.03.25.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:36:02 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:36:00 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove priv->rf_chip in
 rtl92e_config_phy
Message-ID: <c0d4e98308c9198776d8d04d1c2910f089f45a90.1679732276.git.philipp.g.hortmann@gmail.com>
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
condition in function rtl92e_config_phy as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 6579c7b81bfd..e35085253e70 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -491,25 +491,10 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 
 bool rtl92e_config_phy(struct net_device *dev)
 {
-	struct r8192_priv *priv = rtllib_priv(dev);
 	bool rtStatus = true;
 
-	switch (priv->rf_chip) {
-	case RF_8225:
-		break;
-	case RF_8256:
-		rtStatus = rtl92e_config_rf(dev);
-		break;
-
-	case RF_8258:
-		break;
-	case RF_PSEUDO_11N:
-		break;
+	rtStatus = rtl92e_config_rf(dev);
 
-	default:
-		netdev_err(dev, "Invalid RF Chip ID.\n");
-		break;
-	}
 	return rtStatus;
 }
 
-- 
2.39.2

