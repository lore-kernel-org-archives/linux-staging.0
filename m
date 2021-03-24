Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6816F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id c8so11401411wrq.11
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xo+yaGy0cTDFKKgzPZkjU1FXccuHrngtXrYGTtCGk8g=;
        b=UAclSjzWTLAhOSx7sWU8baX0tsZSkJmoI2dh5UNdWGFbuI+vJIVW9ugCX6cvO/3Gxh
         etI8ekMzp6F3/5nw84MAUq1MBezDn5uPguu65zu4nm1Xw5p7RdgCHk1iWZ6t9tu8EzQ3
         vNYRkmtiOaANtORZPyymgZqveku2BSuKFC2tzIIYD+Fo0NV3Uf+ec612cR2keSkjB+VC
         z2FDjhh9vjP5ADwMn0Zzt5UQyxkjfkLqSJOkjQIcJ7EhbseJx3esJ16/ejukrLmM/hWo
         +Ca/EoXoSaK47bXpjDOB9X2sUsdGQhZtafrN3BSw+k1zR6WIAotLB1NwCrQ1g4r2kSCc
         33zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xo+yaGy0cTDFKKgzPZkjU1FXccuHrngtXrYGTtCGk8g=;
        b=qn7Cog+Ox1815q1T5QmK19hS+eZisyxcP0ZAe70F9bNvk0T2uMWAb4P21iklLMcOep
         dKyGOp0xfgkfZUfr5v25vPSdviBjPmi7Pe800BfdEvTQqPCzJz+8WWc3LxA1Wrwp/RXR
         vT68UX6RYxUhW9Ax+9edzj0kBxai6+y/47b6SytgyvPpmQbok9VrzDhsi/2frGXfIPzL
         EXTr9r3QR6xkoIOVIDSJt4aagjFBx/U+J0oVIzMq8ZwpvQMDGg8Kz/GP/1EaCq10PTiG
         TFGoeD0l+W1ZhtkVdHLw8NN2txWhNfCwxUo0b8Ba+TQHLAK7N7bWHvow0x/BNVd0Af+u
         Gh8w==
X-Gm-Message-State: AOAM532UQ/wO7xXW5oX7/ov6AV0v+cAQV/X3erGv/sWcmTG1gVDL0G6I
	TWQKDo+C5rnjMX7tmu7m5a8=
X-Google-Smtp-Source: ABdhPJyst077CJPnBhYM9yiAwlu5CdgfJ6iSPjsipcBupry1lF6LMFr+PpwM5AofsSLXCywed2a8lg==
X-Received: by 2002:adf:f948:: with SMTP id q8mr3361557wrr.296.1616589902773;
        Wed, 24 Mar 2021 05:45:02 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:02 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/33] Staging: rtl8723bs: remove named enums in rtl8723b_hal.h
Date: Wed, 24 Mar 2021 13:44:40 +0100
Message-Id: <20210324124456.25221-18-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
include/rtl8723b_hal.h:

	enum c2h_evt
	enum package_type_e

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 9b043251ff30..c1d7249e3e9d 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -152,7 +152,7 @@ struct rt_firmware_hdr {
 /* Description: Determine the types of C2H events that are the same in driver
  * and FW; First constructed by tynli. 2009.10.09.
  */
-enum c2h_evt {
+enum {
 	C2H_DBG = 0,
 	C2H_TSF = 1,
 	C2H_AP_RPT_RSP = 2,
@@ -174,7 +174,7 @@ struct c2h_evt_hdr_t {
 	u8 CmdSeq;
 } __attribute__((__packed__));
 
-enum package_type_e { /* tag_Package_Definition */
+enum { /* tag_Package_Definition */
 	PACKAGE_DEFAULT,
 	PACKAGE_QFN68,
 	PACKAGE_TFBGA90,
-- 
2.30.2

