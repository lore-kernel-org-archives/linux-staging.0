Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106126E
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id x16so25469944wrn.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=64XzXGiiOPVhVUd/gZVmb844//zvcVb3ysHntQVBRMc=;
        b=kstyUUavTT9Aug7yhAWArbEQSccCFrM8Kg0zvwa1QL3YVIUgKwncxDyeWOxjMkuaBj
         lOM8d63iQl7HjuOfPz0QowmxCiIPBAruxXmoiNvA3/uiYXZHzrSBIzSK+3Hjf0qwFfEf
         s0CH8EqeVf7QKSwRNpd4sY7gO8PhPUvIAzdTut5/2rDV8lfoBI6EmdYntaxtdxvaLPjw
         RjMpxc3fImUicegkJebz6dao7DOkyA2inSqHEGTClPSsumS/MuN/Bro1cAZObc1p0/R9
         Sk59lY4OKQFxj1+2Igju+/wIvnb7QeikCKPa9yTuAXnRq28U/u1gSzrcMyYSpWQD2cyE
         n0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=64XzXGiiOPVhVUd/gZVmb844//zvcVb3ysHntQVBRMc=;
        b=kLAxJV3dixdXRS/Qi1+oGjSelGMqXyeyizoChxSbRkdokGABpTlbKacGRkhJex1Z+9
         rh4sDlEwDAABwlafiq9cOEoPf0GH01jAJuVVDS6R9edZSRVCX0MO8n6tpIrYkuFyhmTm
         tYTzJvKEIyVimgvSbDlznEFsm/STAvHpfowe4r9eFTu8j3lzcg2tEwKVjaaMfaGoSZwj
         RrQI4wKgAW/65m5QOroW8bXbJJzhRzRlyojmpbcQOieLExsj3TwRdbpr+noVWSM7LPAd
         0VCoEBsQYv1av84W3UT9d/8Fg9QaAoXmp0RluY/e1XP839nLptamxNodDdzW9aixTxmG
         hZ9Q==
X-Gm-Message-State: AOAM531d4VjHjBhGrbhSsS3K2cRpJnhcBJVJz4UUtXm7PSC0sxU4o/pl
	L+m68sCa4qn+7wUjJSoYyw/PwUWPihc=
X-Google-Smtp-Source: ABdhPJwUHQMSqmOfk+ZsfG2KJBgGys7h9D2wRqCYRZDYjou1ICfTIBt0mRFKSm9/MgsvcijsTwfHMw==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr4887527wrt.117.1616611123502;
        Wed, 24 Mar 2021 11:38:43 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:43 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/21] Staging: rtl8723bs: remove enums in osdep_service.h
Date: Wed, 24 Mar 2021 19:38:32 +0100
Message-Id: <20210324183847.5595-7-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/osdep_service.h:

	enum mstat_f
	enum mstat_status

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 .../staging/rtl8723bs/include/osdep_service.h | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index c4d29d65187f..9405bdb2abf0 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -59,33 +59,10 @@
 extern int RTW_STATUS_CODE(int error_code);
 
 /* flags used for rtw_mstat_update() */
-enum mstat_f {
-	/* type: 0x00ff */
-	MSTAT_TYPE_VIR = 0x00,
-	MSTAT_TYPE_PHY = 0x01,
-	MSTAT_TYPE_SKB = 0x02,
-	MSTAT_TYPE_USB = 0x03,
-	MSTAT_TYPE_MAX = 0x04,
-
-	/* func: 0xff00 */
-	MSTAT_FUNC_UNSPECIFIED = 0x00<<8,
-	MSTAT_FUNC_IO = 0x01<<8,
-	MSTAT_FUNC_TX_IO = 0x02<<8,
-	MSTAT_FUNC_RX_IO = 0x03<<8,
-	MSTAT_FUNC_TX = 0x04<<8,
-	MSTAT_FUNC_RX = 0x05<<8,
-	MSTAT_FUNC_MAX = 0x06<<8,
-};
 
 #define mstat_tf_idx(flags) ((flags)&0xff)
 #define mstat_ff_idx(flags) (((flags)&0xff00) >> 8)
 
-enum mstat_status {
-	MSTAT_ALLOC_SUCCESS = 0,
-	MSTAT_ALLOC_FAIL,
-	MSTAT_FREE
-};
-
 #define rtw_mstat_update(flag, status, sz) do {} while (0)
 #define rtw_mstat_dump(sel) do {} while (0)
 void *_rtw_zmalloc(u32 sz);
-- 
2.30.2

