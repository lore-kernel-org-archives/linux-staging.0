Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5B76F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:52 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c8so11400742wrq.11
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r7apWY46fVAV3AL1ndZvt9Ffal8HHISUKKhDuc2/2RM=;
        b=eqAjYMxd6RmOOD7x6JnW1aEh57ixIKL78wimRUZPr4ZswqM4FbFbDWVSm7Oh0dWUpr
         G8B0OudqJjlRWN/frtVENGj+o0f+44RxX9T+yO1oE7DlyK8qeiqdyPQVi/9ZurZkhxlP
         +pS0dd2h7u3EZqmRPs++0cCxfCqMxKnLBwNH1RnzrE2NflEKirmD1Rp8Qjq8hOcJgAFD
         aEPb6A8kODI4dAXm/1M8Vz/5Odt1avkTlxZxPqt9jOoQOJSJgxJfpZAdS2uD1gmmcTbR
         /1IchmEr0NLWIcLTcObpICm0ED2mKFXgLsVA9DTJpsqwg4Ugyo0zKlASsDfzUAszvSrL
         cz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7apWY46fVAV3AL1ndZvt9Ffal8HHISUKKhDuc2/2RM=;
        b=lk7WirBbRAuPJ/yZ6P/MpyCvwVukkYmKsxpHXV1QRNILSCDH7I8bMsS+8dGlpACzbO
         x80TLMNSJ7lMfXACqjio/JVAnodh4ljh1ILwgXk0Uc/sqvuPUSByTNwAonyOcZyX8Jzj
         bAVsBxVBIS3KXlcxDQtw7qZ2BmattrVixkR4xOSI3+uTd7TSG/J6CWzi8eXSwSU/CtVo
         L6zALI4QmGY+qRuS8JnbbOUAMzzxogTWFnMx0M7dXpYBalLN8b5bL91tTVFmVXsOKGCf
         i86L1xJvp1b8nowlrSmwM8hFamQPZ4NXZviMEJWdK/pHccGNtAr3CatVPnAGk0JylFWl
         hOzw==
X-Gm-Message-State: AOAM5325EpQiOTPMWuD+6Fr48/GwDlL1Wd0f6NXwCVAzO8rGvagv5+dg
	zpdfNX5TEzcP8R/h7Wu9dpI=
X-Google-Smtp-Source: ABdhPJzetL7DMbKfeZBy33+RXSPBJj+nsLXD5oh7xX78ScYF3GvZP1AJEr57X0JfXaV0Hb/DNlgeIg==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr3268574wrq.34.1616589890996;
        Wed, 24 Mar 2021 05:44:50 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:50 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/33] Staging: rtl8723bs: remove named enums in hal_com.h
Date: Wed, 24 Mar 2021 13:44:27 +0100
Message-Id: <20210324124456.25221-5-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
include/hal_com.h:

	enum firmware_source

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 28451385dec3..3629b912698a 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -171,10 +171,6 @@ enum rt_media_status {
 };
 
 #define MAX_DLFW_PAGE_SIZE			4096	/*  @ page : 4k bytes */
-enum firmware_source {
-	FW_SOURCE_IMG_FILE = 0,
-	FW_SOURCE_HEADER_FILE = 1,		/* from header file */
-};
 
 /*  BK, BE, VI, VO, HCCA, MANAGEMENT, COMMAND, HIGH, BEACON. */
 /* define MAX_TX_QUEUE		9 */
-- 
2.30.2

