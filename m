Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACCE6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:00 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so2646722wma.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B7lbCDdH/ioQh2gU0nwdRgXHD+A5zzpfP1C/55L3Bh0=;
        b=DmAWWeEuoCad0tYtfP3yAid53H4D5YHkweaeLCmGPbGdBaWW/zSd0mpygD2GUglJba
         +KNjk5hfCM4qPfpd7QK7BxnYJJ1kaBwtPBKtsCIr7h1ScujoM8E8gexS3+dFd+wMOitZ
         7wMkD68A1VrecvDZa/8D7UUvutYjs5p33KCKLVY9Zb9ab4mZI/8TORHQrUDVp5lhlkcs
         82jnaA5zcHmt/BP29GwaS5eLzt9CV4eThbXGflIRyEQ7BlHoP8iO0emEj+j16imrXu25
         ntNZumQQ1Sc2VIC0XCj76LHlHsPMykn01p+FoBKnSHujIJ8rjMbJNoMZHB/sjvYOZvqq
         dVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7lbCDdH/ioQh2gU0nwdRgXHD+A5zzpfP1C/55L3Bh0=;
        b=sWF7eA8D3E/JXCZ0tIN69BCs5fo2kW4yUDd3/iJxW+l5st781eZIplSj1wgUBygvbQ
         OUQRHZtOrccRkKIde5q/gvNhy924Dd7N0uBYPnUzo9xFPdkc33rZg1EnXDiacOYI0XUX
         9aKKq6VdwnmQ062dVfwFiIFRCOavRFo8KQoPMt2ffwZlpUG+AVnSqg2IEDFmMUlS9A9X
         cUE3ZmoSYhfDwp4qSym1J8qEKH3lQ4tuyr4BYpO43al8EfZC5DKD5WAARx/sDpicNxWR
         i8brDo4kNN0ZKrdoccJS/GnyQjJaXyXkCMAEZMaE9JhmTbRYOvyZya70y5N6Sp1vlNgk
         cwFQ==
X-Gm-Message-State: AOAM53267vmCeNRUZujmedp/xz1L0u+1Jtq2J+iY0Et5v+VapU813f3I
	DhlESceFG3xRQUREpYM3cck=
X-Google-Smtp-Source: ABdhPJw4ERFepcOYYlN8xIKIslCUyCQyZ1TNuaM/E7g74HgOhOk8rSf+O9j+ywPsu02CyNfOv8s25Q==
X-Received: by 2002:a05:600c:4f89:: with SMTP id n9mr2810526wmq.133.1616589899285;
        Wed, 24 Mar 2021 05:44:59 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:59 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/33] Staging: rtl8723bs: remove named enums in rtl8723b_cmd.h
Date: Wed, 24 Mar 2021 13:44:36 +0100
Message-Id: <20210324124456.25221-14-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum name in
include/rtl8723b_cmd.h:

	enum h2c_cmd_8723B

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_cmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
index 9629a8844c2d..dbcf01bbf051 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
@@ -11,7 +11,7 @@
 /*     H2C CMD DEFINITION    ------------------------------------------------ */
 /*  */
 
-enum h2c_cmd_8723B {
+enum {
 	/* Common Class: 000 */
 	H2C_8723B_RSVD_PAGE = 0x00,
 	H2C_8723B_MEDIA_STATUS_RPT = 0x01,
-- 
2.30.2

