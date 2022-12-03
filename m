Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3BE1FA3
	for <linux-staging@lists.linux.dev>; Sat,  3 Dec 2022 03:05:49 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1443a16b71cso4083053fac.13
        for <linux-staging@lists.linux.dev>; Fri, 02 Dec 2022 19:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YyULr6voUl0K8zSMvH0UpwnL7vHX7Ko6WXAdvVD7V4=;
        b=LjKZauW2LJ43l8LQ9GYVsJbxk/jGfuyExLPKHOxAyS9agtgI7mypi1eWWBTLXIAVhQ
         V802P1uPqd6ZrrqnnHIV/3SIlyBenE++NV44aw2GShUjd1PYJ/4eNpql1GfwBvA839PD
         deMNeWiShyRdALtVJ2h4XKb9ljvbT7z+ps/VXyCFy9hp+TfccFyYRaSXVVDLpjUTzWua
         973mAzQr34cfmXATF3GhEw38SllUmdHkEeSdTJheV5UVHKW+Mv29Kn4reHzQlNCHATKx
         2+bmv0FfzIUbc2wOQLqk1hLRL78UZt+VgQsCoCtnI5zIzFyMWDbdaoY6AVJ86cCcHbcO
         dvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YyULr6voUl0K8zSMvH0UpwnL7vHX7Ko6WXAdvVD7V4=;
        b=0iq2a3oxF63Q0qsspCEiYBy6mHZUBmlBlVJNuBKlP2zy6At3qark3uSPMTEbx0vCOt
         NIhCvAtRaCLDHtYpFvueoQKifyEhaN0wgTp8w/GTqTjKmpcDTkY525m+me+KHWzM+Mak
         ukJ+vQnekMESJ+GgmZYuUft1OM7eXnR76rkqWEw6Gk/sMfZRh4Purj1TMeO1cMbGfrQX
         qCFsuuT9bopX/FeuQqsghke7WgB67OUJbxRxQrrsyvd1KuPdH7/DqNqJ37WBtuCSgWXX
         53Yw3xlHy8E9Uz/V2FZziDopJs3MGp8VuBhPVbECrHj1M216Zfkrm/iFKxdZxbUVFXcP
         2ZsQ==
X-Gm-Message-State: ANoB5pkIIG+ZPZAyvwr3IB4eM+P6ToQz8GzQr5n+qehBetRxi/t1c5ie
	sW4s0qeQrzLrwFSOGMJtGu0=
X-Google-Smtp-Source: AA0mqf5sSQdwViXhDoF2cR9NyqiwAhWWJMqIM9rRWq8evUJ75qaQH4GTFDpZF0m5osJ9edwkSrkd6Q==
X-Received: by 2002:a05:6870:4720:b0:13c:2ced:9d9a with SMTP id b32-20020a056870472000b0013c2ced9d9amr32156019oaq.105.1670036748699;
        Fri, 02 Dec 2022 19:05:48 -0800 (PST)
Received: from otter001.hsd1.tx.comcast.net ([2601:2c0:8800:a510::6e2d])
        by smtp.gmail.com with ESMTPSA id g13-20020a056870c14d00b001375188dae9sm5136561oad.16.2022.12.02.19.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:48 -0800 (PST)
From: Joe Peterson <jwp.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Joe Peterson <jwp.linux@gmail.com>
Subject: [PATCH] staging: board: Remove control flow from macro
Date: Fri,  2 Dec 2022 21:05:44 -0600
Message-Id: <20221203030544.11543-1-jwp.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux coding style

Reported by checkpatch:

WARNING: Macros with flow control statements should be avoided

There is only one return value possible. Remove the checkpatch warning
without effecting functionality.

Signed-off-by: Joe Peterson <jwp.linux@gmail.com>
---
 drivers/staging/board/board.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/board/board.h b/drivers/staging/board/board.h
index 5609daf4d869..94823d3ffbe9 100644
--- a/drivers/staging/board/board.h
+++ b/drivers/staging/board/board.h
@@ -33,12 +33,10 @@ void board_staging_register_devices(const struct board_staging_dev *devs,
 				    unsigned int ndevs);
 
 #define board_staging(str, fn)			\
-static int __init runtime_board_check(void)	\
+static void __init runtime_board_check(void)	\
 {						\
 	if (of_machine_is_compatible(str))	\
 		fn();				\
-						\
-	return 0;				\
 }						\
 						\
 device_initcall(runtime_board_check)
-- 
2.20.1

