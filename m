Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603CB2F42
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 13:09:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l14so14444339eja.7
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UbzD73ANBmIAnFLQ4kLmnJvqIHDS1D6Ssvlro3k6SAc=;
        b=CCRU87sl0dDdVinCDDVfHoNWtWcAWNbY9lxV4uj/16ArW1D5qzxNp83v0CEgRg3vw0
         ppMN/Wrgqb0I1ZIDGu2qCdn/6yvNka5kIo++BJB6r/aIpViFVMWwbwsLpQPMO7J/ezr7
         s19OXW8UHZ19vQqBcRPSu+DVLFrmBWKr3DSMkl6oboKOxFYjWJoH6rHpj6z1p8k+qLyi
         qDkYw192zz9XREv6su1NYNCa1dTU7NGyCVyV1kvXKoFHjmzYdPl79O99/dhrqIsLOi5d
         GMFItasEEZRm5Xqpon9FdfsJZD0HOCf/G+evRPKXDZqeEhEBxHDn74AyhI+clCIz/BGQ
         kE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UbzD73ANBmIAnFLQ4kLmnJvqIHDS1D6Ssvlro3k6SAc=;
        b=HWC0z7OJBzrD31TFjdXORIo9GSMO5AztCVTdT3fGTyJddS4PKHZPlZVWGEVrdYXdbP
         Rk7Urr0oPBp1U9rgEHs5jp6q+wvODfW8vTpTrz+UyNeZeord4IZ39D1PSilQ/V3Zgqhf
         0FM41kZqmvn1JJWKTAs1x7I9HSNTVWSvg/YMrVgSYpUalSCckQYCL2ZfRyffYBfN1oXK
         1Zmd8vl+s/OfGRclRlXf/EdpmefKOauGovAu2AR9dvgkGetcUymvjWKTvqBfiXRIk9ND
         wSYn0ojFz5db42/s1VFEN9JON4mJMQYAOpQZJ8eJE92O1tlDQWa7JSk/lVqcgotO3MHk
         rQXg==
X-Gm-Message-State: ACgBeo1tB/iyJ6XgK4FBnwcwrL5Ii8aMtKYfRl1EocLD5vghZnMQghHJ
	2Mt4Hfdc5aDyX5TgjcLFsss=
X-Google-Smtp-Source: AA6agR7u46nTrfb6Eb2z+eTVWECtts9/p08dYc2kxgLV8wGg+eN9CO6LeivOA6umOXzrd8Zv62WQ7A==
X-Received: by 2002:a17:906:a0d3:b0:73d:be5b:2b52 with SMTP id bh19-20020a170906a0d300b0073dbe5b2b52mr6117358ejb.727.1662642566641;
        Thu, 08 Sep 2022 06:09:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id cf6-20020a0564020b8600b0044edf0a2deasm4847978edb.69.2022.09.08.06.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:09:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: remove unused parameters from _BeaconFunctionEnable()
Date: Thu,  8 Sep 2022 15:09:12 +0200
Message-Id: <20220908130915.8406-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908130915.8406-1-straube.linux@gmail.com>
References: <20220908130915.8406-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameters 'Enable' and 'Linked' of _BeaconFunctionEnable() are
unused. Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 63c5cec655d5..a478b83dcbf3 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -496,8 +496,7 @@ static int _InitBeaconParameters(struct adapter *Adapter)
 	return 0;
 }
 
-static void _BeaconFunctionEnable(struct adapter *Adapter,
-				  bool Enable, bool Linked)
+static void _BeaconFunctionEnable(struct adapter *Adapter)
 {
 	rtw_write8(Adapter, REG_BCN_CTRL, (BIT(4) | BIT(3) | BIT(1)));
 
@@ -1043,7 +1042,7 @@ void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt)
 	rtw_write8(adapt,  REG_RXTSF_OFFSET_CCK, 0x50);
 	rtw_write8(adapt, REG_RXTSF_OFFSET_OFDM, 0x50);
 
-	_BeaconFunctionEnable(adapt, true, true);
+	_BeaconFunctionEnable(adapt);
 
 	rtw_resume_tx_beacon(adapt);
 
-- 
2.37.2

