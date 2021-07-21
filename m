Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D0168
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 11:28:34 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id k27so1941032edk.9
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 04:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bk4wRjdguMEsiA5aIxfKqwQ+Lo4bbEX+lKr1vHTiTCE=;
        b=IvR2mUTkaWaFBQaDJsMeWZ6HGHikIF6+dDtMpCrWMJUTZ6GsMwR3F9XS/7fDSYCKOU
         3nmKKBhKBVVeWePnsTqAVVMn/oxwk948xEQ10YkwHuK2zB1oFFJJnfkGHKcDZLw2LNxF
         8Jq4gdzH+tR0sDGDXs6EApeFLrryQkFEQ/orJxs/QRKmJBFeiGulwjAuhcA1/vFijx/f
         OnoncDirGe9wGSwljqPY6r+w/rb3bPDoaEAmq+l9tbV0Puo2ZC2erFDh5FkBUALgEtdp
         sS1LAseB7oDd/EWtnSiGVY5McMV7fxnBpDPx5Q+RWwy4Tst73At0tOgGf/6LsX/OgEEu
         rHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bk4wRjdguMEsiA5aIxfKqwQ+Lo4bbEX+lKr1vHTiTCE=;
        b=WnVGPM6eEAKINPoRpAiLfHyyjB+SjqCam/t5crVw1pS9B7EC6oMrFO4A41sa0o+Oci
         /s2TYHaGpIFCT6EfuGTADmvvLoSVRYe0/d/xrwJTDWZK5Z4urCzX2e0TcL5Dqp0ruso8
         O0JUoEzufAU0NDAGT5MyAJ3QzNaPBX9/pcuDAOEBhIfKHrXR3b4ktbRF5301Ad19CdO8
         x1CwinlBn/lvWDGsc9GIuwpUnMeSIhzqq2QHWXrZURps63A4EUw2zmc/d33okUrzJN5v
         Hg1GANOLyiqPTE2PQKgFKOHOa8QKXxLS1Cs3LMhjqynWf/7jTriEILekKw6XuNNdWqKK
         9lmw==
X-Gm-Message-State: AOAM532nLdNGPWQXYAIhAeG0mIJjY0ZHTSqrlLFhDzXksvfziub58KRd
	0e+wwJVMXS20ha6FWI9krMY=
X-Google-Smtp-Source: ABdhPJwK9RYgH4F1Mem8Y4k4Mpo5mEHPqjfXYj5VyaOJdyRJept+nu09/wWv4Np5bRPH+hs37cUZ+w==
X-Received: by 2002:aa7:d604:: with SMTP id c4mr47350553edr.39.1626866913301;
        Wed, 21 Jul 2021 04:28:33 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id f12sm8205065ejz.99.2021.07.21.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 04:28:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8188eu: Remove unused iw_operation_mode[]
Date: Wed, 21 Jul 2021 13:28:29 +0200
Message-Id: <20210721112829.17317-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused iw_operation_mode array.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index d4dce8ef0322..eef8ed71cdef 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -46,11 +46,6 @@ static u32 rtw_rates[] = {1000000, 2000000, 5500000, 11000000,
 	6000000, 9000000, 12000000, 18000000, 24000000, 36000000,
 	48000000, 54000000};
 
-static const char * const iw_operation_mode[] = {
-	"Auto", "Ad-Hoc", "Managed",  "Master", "Repeater",
-	"Secondary", "Monitor"
-};
-
 void indicate_wx_scan_complete_event(struct adapter *padapter)
 {
 	union iwreq_data wrqu;
-- 
2.32.0

