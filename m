Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870B1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:37:05 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-93075ee221bso14108166b.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xenSdzUtugeb0/CqvxP79YZC3E7VL9ki06QF+SB8Qys=;
        b=Ius8gLpxU5pD8x0/GazMtCB5q0CKLg0MZ7i75GOUkkNagH+fBhqR+TACAHnRUmsK/F
         iNVLNgyNtTt+1j7Izciy9FaeFRQ9rIPBXWkBRxrE6Tj+7d0kEfJwCf3thyDY1Jwn3kAq
         Lg1uy4yU5PGZPUjARM49UkUOPaxWNH6ZI73wln1orZXvbsIoQ7rMQro9LilLy58wzhcZ
         0s5/3Eyd0rGRUADt5ijACRAv8pvDJgmfspSJDmB4wc8g/w7CPuVpx2PVJ+1PS7bOa3wW
         E66OL4vDKGDTr69qnYcFZjXBpgMXQa4lwL05+/SmkCF4UqkfLwObjjWJe7qQUxrotp02
         AOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xenSdzUtugeb0/CqvxP79YZC3E7VL9ki06QF+SB8Qys=;
        b=u6c2FXfq6G6tP6miy8qruR9SovCaIYIo+dLgh2abDvsYMKKpwgadxNS7BKxjHXlHuh
         76uNJow0+Z+pzZcyI54BdHmFOpU4yYLyHXb3/1bhQCBN6Um8hxTF0N0ycjRFAiVZd3KM
         MLGNsY55+TO2k8xOUMOfLA32upc34DmDYkJRDLxpxQ3OxkedSuU3OB5/Wnulzwp5iHFo
         /A+gHU7+otDbXV80UZv296oOozVPTDwjZWmebGUKseIAObutPBBjuzT0iwSGv2JyUs+Y
         akf31DPyR+Rptxns1Sh2F9d4C/snWDvK2qtHOGqyeHSGEVEaf5jpEngDMdHzQJpu1tUB
         QFvQ==
X-Gm-Message-State: AAQBX9ewCMRAjekJiDYsYn2UqnH2g+NbKPhlOOU/ALDqLDfx/wdiu+63
	n1wsW6HU0JYwRjQbicNf34NO6lRUVL0=
X-Google-Smtp-Source: AKy350ZNYezsWUfDKJfhwp03UyPDeI0FJ4MnyrevIjAc9ybsNWwRCArAjcUnF6EMsvwpUTDqs+NT/w==
X-Received: by 2002:a17:906:51c9:b0:92f:27c2:13c0 with SMTP id v9-20020a17090651c900b0092f27c213c0mr4213970ejk.6.1679733424236;
        Sat, 25 Mar 2023 01:37:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id f23-20020a1709064dd700b00931536d461fsm11431573ejw.20.2023.03.25.01.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:37:03 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:37:02 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] staging: rtl8192e: Remove priv->rf_chip in
 _rtl92e_get_channel_map
Message-ID: <b8c5a719c6f8930adb87a4ad9bd5d368ba5f348b.1679732276.git.philipp.g.hortmann@gmail.com>
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
condition in function _rtl92e_get_channel_map as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 8e4e939d7617..ecc3f0c6c267 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -895,13 +895,6 @@ static short _rtl92e_get_channel_map(struct net_device *dev)
 
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if ((priv->rf_chip != RF_8225) && (priv->rf_chip != RF_8256) &&
-						(priv->rf_chip != RF_6052)) {
-		netdev_err(dev, "%s: unknown rf chip, can't set channel map\n",
-			   __func__);
-		return -1;
-	}
-
 	if (priv->chnl_plan >= COUNTRY_CODE_MAX) {
 		netdev_info(dev,
 			    "rtl819x_init:Error channel plan! Set to default.\n");
-- 
2.39.2

