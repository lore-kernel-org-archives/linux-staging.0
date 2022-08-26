Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FFB33E8
	for <linux-staging@lists.linux.dev>; Fri, 26 Aug 2022 11:35:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id k9so1511835wri.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Aug 2022 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc;
        bh=Ww3upExwiPpiTI29okfKvaHqZZosx9vnWFgG6m9gKLk=;
        b=CUgv+OUw8hzxfpn8aSCnEk12aZu1VsXeoTF+YbX7GU/pzbC97UgR9pvrvQm5DjJGQx
         SZ6ZjXS55do9ne+yv3Ih5+yM1wd3T7PEzjtW2E33+V4SoEtfbSMrWrum3Y085GTXdtSZ
         CqcKln8gTXVGVdzFiEVYm30njyxpfzAHpzUHYWTNz+Gv/THHX2xjiV1E18EKwgtZyPkp
         fx8UwvmPpJprawDy2A/2zlrjkQF8WIvnnY037dhGQ2Mh+JZ4po6C1x74tXDynyeYQIML
         EOGIx3uMiJlkZUo7RQV4TqsrA0c0SEiYWHMdYXLlTfITPwFM+OBazep5+GzYCtoIQQZd
         1ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc;
        bh=Ww3upExwiPpiTI29okfKvaHqZZosx9vnWFgG6m9gKLk=;
        b=TV82QQY/1ZwOqutynXOpY4YpJxi7PSj8kjX2vHP8LKcKKtaVivG2drcuQ3E+8Qcdja
         UMiOJzQafGEYW2pxAchP63Y53MkRq7/SijTJJMEeZBNJU0uDzip/yyuNJwdu0hieAzth
         ebiRvt7QiPFkD6ql5X/5Bc9MtR3arU2wZoIxHW+VBDw6Bm3VrlBw6n/Nm7M76+XHvo5r
         o3HX/SF3hgADkjSvczTIlbonlIOfENCqgtqJqQEivGqzvB0DoZrZ1BwYpEWyA/pv7ftB
         arMlNN1ebSIeHb/ExJ7lBUp7tYMPfVwuCvqJy2CEhn3ixIsaWy8Y2nk9k1WQ9TTHD2+B
         N/8w==
X-Gm-Message-State: ACgBeo2kqtfuHSx/Vr7jxW7r93OVndBelWV/AkibssN183WwBAZQAPM+
	/Dl6e81duDv3yN5mSgyosA==
X-Google-Smtp-Source: AA6agR4rgVnYyLXMO+n+qFQRWwXtgGtB++LXSeFoCn4/Y1YdtXkplFO8Wzdm6ITv/ILRtvOaLe+FYQ==
X-Received: by 2002:adf:d23c:0:b0:226:af6f:2df5 with SMTP id k28-20020adfd23c000000b00226af6f2df5mr554309wrh.595.1661513737756;
        Fri, 26 Aug 2022 04:35:37 -0700 (PDT)
Received: from themakerofstuff.broadband ([84.69.200.79])
        by smtp.gmail.com with ESMTPSA id q15-20020adfdfcf000000b00225285b8136sm1643771wrn.38.2022.08.26.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 04:35:37 -0700 (PDT)
Message-ID: <d053abd3e60d3f2d7724d6857c28a6a255b4f46b.camel@gmail.com>
Subject: [PATCH] staging: rtl8192e: Describe each kernel config option
From: Alman Khan <ak47.almank@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 26 Aug 2022 12:35:36 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-1+b1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

An important thing people want to=C2=A0know is what each option that
they select in their kernel configuration file actually does, so
that they can select the right options for their system, and, once
booted, make sure their hardware works as expected.

Add more details describing each option in the kernel configuration
for the rtl8192e (rtllib) driver so that the end-user understands what
they mean, and, if necessary, enables/disables those features
if they are not required.

Signed-off-by: Alman Khan <ak47.almank@gmail.com>
---
 drivers/staging/rtl8192e/Kconfig | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/Kconfig
b/drivers/staging/rtl8192e/Kconfig
index 39f5a6a7346a..e06c189b4ce4 100644
--- a/drivers/staging/rtl8192e/Kconfig
+++ b/drivers/staging/rtl8192e/Kconfig
@@ -10,6 +10,9 @@ config RTLLIB
=20
 	  If unsure, say N.
=20
+	  This driver adds support for rtllib wireless cards.
+	  Only the rtl8192e is supported as of now.
+
 if RTLLIB
=20
 config RTLLIB_CRYPTO_CCMP
@@ -23,6 +26,8 @@ config RTLLIB_CRYPTO_CCMP
 	  CCMP crypto driver for rtllib.
=20
 	  If you enabled RTLLIB, you want this.
+	  Adds support for the CCM mode Protocol crypto driver for
+	  use in wireless cards (including rtllib cards).
=20
 config RTLLIB_CRYPTO_TKIP
 	tristate "Support for rtllib TKIP crypto"
@@ -35,6 +40,8 @@ config RTLLIB_CRYPTO_TKIP
 	  TKIP crypto driver for rtllib.
=20
 	  If you enabled RTLLIB, you want this.
+	  Adds support for the Temporal Key Integrity Protocol for
+	  the IEEE 802.11i standard for use on wireless cards.
=20
 config RTLLIB_CRYPTO_WEP
 	tristate "Support for rtllib WEP crypto"
@@ -42,9 +49,12 @@ config RTLLIB_CRYPTO_WEP
 	depends on RTLLIB
 	default y
 	help
-	  TKIP crypto driver for rtllib.
+	  WEP crypto driver for rtllib.
=20
 	  If you enabled RTLLIB, you want this.
+	  Adds support for the (now weak) Wired Equivalent Privacy
+	  (WEP) crypto protocol for wireless cards.
+	  NOTE: This protocol is now considered insecure.
=20
 source "drivers/staging/rtl8192e/rtl8192e/Kconfig"
=20
--=20
2.37.2


