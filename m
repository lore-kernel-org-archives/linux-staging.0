Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC56946
	for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 23:35:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j22so10305340wrb.13
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 15:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=owMM0MyODP9S0fBThXOMsfsqzmiy6hi7ZMz5dzGpfrQ=;
        b=xaaS1XUGcRe5wBuR2EjG/YYJL7aRWre/dZK5/1zvdjYcvp4SEqLVhJeef9dIqE5X/K
         jcL65pSWpn5jyzxAsQ3up4qrEMFn+JxIMUvjDsf33IR8azog7h9jCLu74PqqqyNOY4od
         G7rzDQEelHmLIGqf3KicPgyR3zGfDLnuK6zhNzJk83dKSv3qH7vYUxDuZqAILbNWrFV9
         B2vZFbe7nAvHAFkZPlTXGK8odlgoPXw5ndraZNY21d1LCZ20tmXBMinRZEivkznk6HBL
         OhYbEzDB17g6xj++OT/E7Am/baxgwp1939p1Qm864U1tpmsWKa9MK4BIQmSw7kQHKxUQ
         Vp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=owMM0MyODP9S0fBThXOMsfsqzmiy6hi7ZMz5dzGpfrQ=;
        b=4B+qxHLdwSXJimE0ww3nJLuGye7uuons3akVbGa7gFkz8lIhgg0E62y5tvfyK294HO
         U+ElGZ30kdbp8XN4PFVmirpaIRPKirV2nhKhRQSR7xZNAsp4QUZVIkSxlJsbujMgeTMv
         0Vtpk/24SIBa/DZJIxFX0/d4CBBCuucn910ROCmK9GUyI49hDvPtWeYdyIu5kCp9qKu7
         xSV7EQOyu9APqrMR9CS5NtNCRa16DGXG3gismmP8spUdqt1krA46rxv4i8m4qquAMuZd
         BD+MgnVBhfS3XRlhr6O+7HRKFX2dCSQ2BSMa+dEDLMQgJCYN66WEzV/TQIWvAGitBkmy
         NJVg==
X-Gm-Message-State: AOAM533HFTKrqWEtw01z8JwzKboJOXU+4O5oStRWoJbC6sjEfOfDCc5J
	LAO0JVz15fImOc0pvdrADqeHfQ==
X-Google-Smtp-Source: ABdhPJz2ov7OFX6GiQnn5S+SlBfODGaH6/54lyEGQ/ZUYKAI6+txY3GKGWUyHcKVDgOXELiv67sDyQ==
X-Received: by 2002:adf:fd03:0:b0:1e4:a106:8fae with SMTP id e3-20020adffd03000000b001e4a1068faemr20586447wrr.336.1645572907597;
        Tue, 22 Feb 2022 15:35:07 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id f3sm21563638wri.6.2022.02.22.15.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 15:35:07 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove unused variable from UpdateHalRAMask8188EUsb
Date: Tue, 22 Feb 2022 23:35:06 +0000
Message-Id: <20220222233506.72778-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'arg' variable from the block inside the if statement in the
UpdateHalRAMask8188EUsb function in hal/usb_halinit.c, as due to the
recent DBG_88E cleanup series, this is now set but not used. Also remove
the rest of the lines in this block that further modify 'arg' as they
are superfluous, due to it never being used afterwards.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0704fa3156af..d7dcef3ece3d 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1528,12 +1528,6 @@ void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 	init_rate = get_highest_rate_idx(mask) & 0x3f;
 
 	if (haldata->fw_ractrl) {
-		u8 arg;
-
-		arg = mac_id & 0x1f;/* MACID */
-		arg |= BIT(7);
-		if (shortGIrate)
-			arg |= BIT(5);
 		mask |= ((raid << 28) & 0xf0000000);
 		psta->ra_mask = mask;
 		mask |= ((raid << 28) & 0xf0000000);
-- 
2.34.1

