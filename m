Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F53FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id eg28so31055090edb.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRuRxrDfiresVO0AJUGNoniq6DpbX4yHwIzQEFqu2CQ=;
        b=eTRjZxf8tBCNIzyC3hOwXENy186naPWJ72GzDOC1amEDygDzYbQNQ0Xep8wd+P701+
         L1habGBUNIZbP6Xj5EHGs5mccmakQOfK53vKUrQYEbfdq/idj0a3jzfz+9IwkFv5q3I+
         UX2Mo+UO/ORxz3BO7ZT7lfJ1TPnhXzif+C2n7hh8wzhmFBheuV56YLWwoeEzT8Qj3tA9
         JQInWkfk6BbVPGS1tYSRkY8OPoGa06547r1Q9EowxK3Z83Dts0Fmu9s91e7AtGcH2Rke
         kiLx+KCTDl9ODFGgsm9gjkMmxQv4zHVn5F4OWP+Cb5SldU6BaHQpU+z2DUTf0Tbb/LJt
         m97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRuRxrDfiresVO0AJUGNoniq6DpbX4yHwIzQEFqu2CQ=;
        b=4d3Y751NDAqScr5RCGTnurVYDJ/54JwpbfuAuWtHMkQ2M4fGSFoFV2wu1ZGv6UjzDE
         RUDRQHRzC8eM7WNEsJ8EcHw7I+BJR41Bm4NAAzskkyvRgo2aGWsrjcpIZE8gz1rQ7Ma0
         VSlGB3F4FgYV8I5QWStuKzcUVZbkXG8EO+qb8Fg3k2Uqaa/1PuWlW7WE/CnpvcRTIBAV
         XRPK2sHFCWhV1Ve4NcbK51huZjeLTuzigiqTTOG0UMZ90LYMedng1N67vpWMxI10V5Q3
         ICEFWgWxWsXPI6YJuUuFm7Q9PQAcm+PHWnKsCGiEHV49ARDdjgTuJ5rVuVJ0tkFFJLE1
         1uWA==
X-Gm-Message-State: AOAM532W7ST+Pcg2SH+vAi+AwDoX9JLhnqfODZLkmHGRnEFMo7Pu9E/B
	s3zdq+JOPW0lACsBZc27GyoFxabrauY=
X-Google-Smtp-Source: ABdhPJxtvh9Aub8PSF0x9sgqIELjjK1hExgmPs3D1ZwOiFAxXj8Hb0k/hwUEpLtAkXQrDfHjzXzxoA==
X-Received: by 2002:aa7:c588:: with SMTP id g8mr25223720edq.331.1632095648676;
        Sun, 19 Sep 2021 16:54:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 05/19] staging: r8188eu: remove unnedeed parentheses in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:42 +0200
Message-Id: <20210919235356.4151-6-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded parentheses around a test for -ESHUTDOWN in
usbctrl_vendorreq().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 9138b730490f..0b48dde5657f 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -63,7 +63,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 				len, status, *(u32 *)data, vendorreq_times);
 
 			if (status < 0) {
-				if (status == (-ESHUTDOWN) || status == -ENODEV) {
+				if (status == -ESHUTDOWN || status == -ENODEV) {
 					adapt->bSurpriseRemoved = true;
 				} else {
 					struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
-- 
2.33.0

