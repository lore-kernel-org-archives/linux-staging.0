Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3953FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 18:41:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id g13so39816811lfj.12
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9aUcxb9sNUdrx8ObfHnrP051md775OcOXsd+ENGkHk=;
        b=Mu3u/9Ov+Flku44gHb4rLgMJ2q6sDKk3rmdIWWm2QBC0K/o5vYEZlJ1Iq5g/YsvQ9v
         Cb41OfkYvYtMZBBAd+OGE7oqJRGUzYC8yIn25Qv+vVpn3KYEnXFa8HW0TsLC3/7bp28E
         OA6tnyq00Q9F0EqdU+pGSUohNcJNCz2ttykmCuiX0cpKzV3llHFJ2wSQ/sqHTBD2i2gp
         08nyWRYlifmN88//RRTjBWUoXGZQY0YKVcFBsyPPyHYqHRKF9/1EjxOxTGj3HTFuEjw3
         leXlAont6Mfw7u32C0aCKckIi+wmysP0ynWR7eTyx8/zmVz9GPilDek2zOIKWIazjcW/
         Uq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9aUcxb9sNUdrx8ObfHnrP051md775OcOXsd+ENGkHk=;
        b=Mj0ycAyDQbgw/QuA/F66d5zG+Ls5kqazHaP47u5DahUZSmL0T8k85hmSTzwLMHZ1Z9
         TA19oHpjIjMHRA96fJpGaIqvpKC7L7Je7JtSyceTOXHZg2t+sSK32YrjecER6XXPIeL/
         2if1ZNRKxb54G++cV2JOZeYCkkfERkzKVj/jrWvncuaABzt624RkpoPETTQaYXdmsBfL
         oQXDaHtXHNFZeUrRDBP5ndAuqYzNcgVll/j8SkXj1qTYGefJa67WHgiSyhc7sL6kcL5m
         0OBSTzINdRIm5C5uTrSOwJpDEwIcyxK7fu+Y0A2MyP7ABsWeRWCcOpBKOSjSKvNSzxHz
         gZXA==
X-Gm-Message-State: AOAM531bXOwWvpAIN2ba/L2rRaxcLOWdVlslaKjh+dUz20is6yoJ8BAt
	6p9FzGSP9PXh40x1sox78fU=
X-Google-Smtp-Source: ABdhPJwk/o1nmEMAaon+9nddQadyZNbpw1E+JJZKImDdePnm9POzqopPyILRfKn8jFmUhxxhDha//w==
X-Received: by 2002:a19:5503:: with SMTP id n3mr25582947lfe.195.1629744112271;
        Mon, 23 Aug 2021 11:41:52 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id w3sm230469ljm.13.2021.08.23.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 11:41:51 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] staging: r8188eu: make rtw_deinit_intf_priv return void
Date: Mon, 23 Aug 2021 21:40:59 +0300
Message-Id: <20210823184059.19742-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_deinit_intf_priv() always return success, so there is no need in
return value

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index e002070f7fba..37694aa96d13 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -129,13 +129,10 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
 	return rst;
 }
 
-static u8 rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
+static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
 {
-	u8 rst = _SUCCESS;
-
 	kfree(dvobj->usb_alloc_vendor_req_buf);
 	_rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
-	return rst;
 }
 
 static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
-- 
2.32.0

