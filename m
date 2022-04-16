Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2977E
	for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 08:00:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 11so7209790edw.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 01:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/eHNQjz4f79BR4/ytGgYvqcYT3Mpa3ln0lhSc14HpYY=;
        b=RB39KqfDVLTc3vVHvaNdKfNaIzsU+s2zPd2pLpxal8+wZyOuu1AijiChM6R0oXAie/
         XPc3IOaSfNmNJ4RqM5TflHFeOtjMd9iYypQGbB9wFAmvXD3BHA1taluEnwb1fvJOHkLi
         I97y+1t4u9Y1Abuj0WISmBuH07jwL44RbvaT3bmhtVfwU008OpFLxPtHFp5zrEVbfPl7
         0DRYsK5yUmFTQAj1Bdlr6iqMSW1j+IKAkIpozdZZlv3oqpq1Ejirjn0UHguu0m1VY1oV
         F6Rr/CUtl1XJINC1fTJluFBQyIDtazV5gbOSmV5+8wO4lAmOkc08cPxuZBXsvrF4TwsJ
         oRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/eHNQjz4f79BR4/ytGgYvqcYT3Mpa3ln0lhSc14HpYY=;
        b=coIlfOJ8GZRAkNkvcfXFtAd9Sk2AVpYFrSU++JImGxIuZhS5iVP7DwctwoirgBTp9W
         xVCqC6VBlr8mdXm8y5td5m989QJsc0pjGXTw1rns/wwbjj5gHP/tefiJG0u2SjQWMD9a
         8OrWD5ykkRSmQ+NK8myaIxqD55vZ2AM5uO9DjFaWdwPvjFMFLV/JyxUBTFdr1N87ds2Q
         96akQlJNrTDC8LXNhufMUoI9fbCt5ghN/1cyDHJRbCH6nxUkvapVLbPOWFG07TNOw4aV
         //XTG9cVoe2jkLVUm51GlD2wK51LK7y2NqYNBBYe6dSsyYBCnqLEgCMdA1lThASl9KHH
         P4OA==
X-Gm-Message-State: AOAM532HQnr30z0HT3xkxLubLH+DrvCA2Oq9mgF4VI9SJ4hfFLZtBwqp
	JbuwCGs6PazQiNY/V+Sxjss=
X-Google-Smtp-Source: ABdhPJwO2PmLCY9irpkH2G8a0NtCiv1GAxfZC58sdbmmimQ6EyinxYr6VyR+3jbrn0+2H6i6opuz4A==
X-Received: by 2002:a50:c014:0:b0:41d:5ee9:f354 with SMTP id r20-20020a50c014000000b0041d5ee9f354mr2708599edb.257.1650096053105;
        Sat, 16 Apr 2022 01:00:53 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906c08400b006e82dbd3f6esm2400805ejz.116.2022.04.16.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 01:00:52 -0700 (PDT)
Date: Sat, 16 Apr 2022 10:00:50 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: vt6655: Replace MACvGPIOIn with VNSvInPortB
Message-ID: <0a3c3eb0d4dad544fa281b34c5a70d4a3ab2d9f1.1650094595.git.philipp.g.hortmann@gmail.com>
References: <cover.1650094595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1650094595.git.philipp.g.hortmann@gmail.com>

Replace macro MACvGPIOIn with VNSvInPortB.
Next patch will replace all macros VNSvInPortB with ioread8.
The names of macros and the arguments use CamelCase which
is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.h         | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 897d70cf32b8..8b6efe2126ac 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -377,7 +377,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	if (priv->byRadioCtl & EEP_RADIOCTL_ENABLE) {
 		/* Get GPIO */
-		MACvGPIOIn(priv->port_offset, &priv->byGPIO);
+		VNSvInPortB(priv->port_offset + MAC_REG_GPIOCTL1, &priv->byGPIO);
 
 		if (((priv->byGPIO & GPIO0_DATA) &&
 		     !(priv->byRadioCtl & EEP_RADIOCTL_INV)) ||
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 6221351c6400..a5ce084f6961 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -735,9 +735,6 @@ do {									\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
 
-#define MACvGPIOIn(iobase, pbyValue)					\
-	VNSvInPortB(iobase + MAC_REG_GPIOCTL1, pbyValue)
-
 #define MACvSetRFLE_LatchBase(iobase)                                 \
 	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_RFLEOPT)
 
-- 
2.25.1

