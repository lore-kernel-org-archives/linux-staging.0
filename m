Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122372
	for <linux-staging@lists.linux.dev>; Sun,  9 May 2021 17:14:35 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id b15so12026451pfl.4
        for <linux-staging@lists.linux.dev>; Sun, 09 May 2021 10:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dT5OkAYCALyixcxFHYYKTuu0iIYm2fnzdCuDeHhhfJw=;
        b=Feg+YLNPEoJySXrfgZ14g85XpumBmBR8d0SXdMNJhUWLpSR7rXzYd+BXYJ1dvxTsQp
         6V2nVvCDszeaA5iMGn7HJji93qJyUsKs6WaNzGAnK5rDVEOI3mTdLBJApVYS5R2nu7OU
         iLKX3FKtXADm5vG2i2/9hFQoemCoEv0/d2bItN2Ru/tFbZTdtbX0N9ve/a9iAi2SY6R7
         dvF4wNvi1xaqofYAbMd10KeVSpeQfI5qUOD627vXNXR+pL/2A0dxkYlcHjr7Uckq2FEG
         AAchoiZjygbIidCUYvrePODMwVACaHgDqQARlsdxGvqF455/HSO4XmSU9ICLrXLfHttS
         HKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dT5OkAYCALyixcxFHYYKTuu0iIYm2fnzdCuDeHhhfJw=;
        b=TkkiZzQouR02HXYHm1vhW5o139QLpTYcykKs23KA9+DTrCaY8XRnqHzJNVa/vm4l+7
         hypNY1+0SyGwOYERGeaIyAfEWKlZRdfHMPmTpDNX1xq1NIFmIDCoJR0wTs/1mk3Wxdza
         6YtD3IUKLmUJtzcExZ390PXgYsaVrpQ4+UEofke27aGyCaQcM3af32hsjw/9n3xMpK6T
         8N0fAzgBJ/74ut5lEy5gsQhuZTle/lN+aqZjG+mWcyAz5KZn3MuWbYNrMO5UwUpLlU/O
         36cwMPg+iceWaoI7sr7/vYdnd0G0NkYQb/QKpe+dEdePlfPjog429unjlDkqTcWwmfZG
         cL1w==
X-Gm-Message-State: AOAM530iETcCoLhG2lC0j51wjiYir2PMP1eg4jhqP7s1qtiuNB6p/RwO
	30sPqHUE8sR2cTbL2zqpXm0=
X-Google-Smtp-Source: ABdhPJykw3FWTgTEI5/kBjsLomeWUheNQoTyz/VcsBdPm8L50AFxfj0DHw2M0RtpsDXFBqUKZa3UQQ==
X-Received: by 2002:a05:6a00:895:b029:27f:96bb:915e with SMTP id q21-20020a056a000895b029027f96bb915emr21437655pfj.77.1620580474655;
        Sun, 09 May 2021 10:14:34 -0700 (PDT)
Received: from user ([2001:4490:4409:3b7b:b3a2:efed:aeca:89f9])
        by smtp.gmail.com with ESMTPSA id a20sm9214970pfn.23.2021.05.09.10.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 10:14:34 -0700 (PDT)
Date: Sun, 9 May 2021 22:44:27 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, atulgopinathan@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8192e: Remove duplicate declartion
Message-ID: <20210509171427.GA9937@user>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove dupilcate declartion of function rtllib_stop_send_beaconsi()
notify_wx_assoc_event() in rtl8192e/rtllib.h file.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4cabaf21c1ca..c6f8b772335c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1979,8 +1979,6 @@ void rtllib_softmac_new_net(struct rtllib_device *ieee,
 void SendDisassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn);
 void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee);

-void rtllib_stop_send_beacons(struct rtllib_device *ieee);
-void notify_wx_assoc_event(struct rtllib_device *ieee);
 void rtllib_start_ibss(struct rtllib_device *ieee);
 void rtllib_softmac_init(struct rtllib_device *ieee);
 void rtllib_softmac_free(struct rtllib_device *ieee);
--
2.25.1

