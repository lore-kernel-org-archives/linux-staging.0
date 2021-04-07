Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2086D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:04:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w23so8852932edx.7
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44ZqeD5EPkyiyFJAkLWDYZXBNtCAIXuuyBZhNmXgs0M=;
        b=u/qSxrao7mOSvvfEmGSW2fzH0XEfHO8maFw5c9HCl34YysuTze6lqPLTjRnRTvJ3me
         RfeTYTn0WukHHg9JeTEtw6cCmzAfr+l2qh9Q5siNCsPO5I5r0GHTPXtZvqLNQmU6L1d1
         wKJV/ADf9TZ28i+Y8tdjLy68CMO3m3/WgOK/kh0MtfBUwbHAjHC94ZtH325G3FzYiMO5
         cXRJ+UeqwkTirPwow9jl4Jp8tiM45Ow24x3s+5tsur1cXD+1HXlnsayU50aAWNDX0+OV
         LsYOYcQzPL0//hgaTNPNA4xDXIr9OXhDzqwMppSwnLF8SByTteK6Kq1UWvHjSLtyMuOr
         b3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44ZqeD5EPkyiyFJAkLWDYZXBNtCAIXuuyBZhNmXgs0M=;
        b=dHnYK0SCXQXvT79zVkFQPhBOGr6QjI95+csF04fWBZl5xF+WH7GVhJSRv+QD/Pf9rq
         J3z8uYRO1C9PvRcBdhHYIHcuj65/dvYN3M5weWC7/+mcQeIYkNCAGA/61hdG5M8eWqJL
         4t3apWgAwu6XPboHb7u/mrLAc/74BhnX0b6yo3ixgcqhbWlYg9iLLh0dQ/q5iIDu/pIu
         G7vug7KAuKTnl30k3GtnS5qAHX1jW7yejH6jR3RV48PKcmfammc1wuZFhdmhS/XLEGui
         Yq11cGP1L7sbg/dHAnJ3HDHUaVEwI3Vazbo5gxEcC8L+GX6+LrJu+otQ1oUAabNbQ0KR
         exiA==
X-Gm-Message-State: AOAM533dB5XpbyILHhq+9bavE5L4m9CAchHDhcAeJ5ytYb9w+PiU/QiG
	OKqsQbsO2miEWfYjMhh/Oys=
X-Google-Smtp-Source: ABdhPJwTPdIlhDnf3qWqbIT1K3D1vTVfwJAOzx9LyF4DagVoXaJs33p7OdefzswJ1sNPCSoEIOJ1Qg==
X-Received: by 2002:a05:6402:b26:: with SMTP id bo6mr3559011edb.162.1617789854662;
        Wed, 07 Apr 2021 03:04:14 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id g22sm12427533ejm.69.2021.04.07.03.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:04:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v4] staging: rtl8723bs: hal: Remove camelcase
Date: Wed,  7 Apr 2021 12:04:10 +0200
Message-Id: <20210407100410.8058-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase. Issue detected by checkpatch.pl. The symbols aren't
used in other files, so this change doesn't break the driver's code.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes since v3: the previous patch cannot anymore be applied to the current
staging-testing.
Changes since v2: forgot to cc some recipients (again); no changes to
the code.
Changes since v1: forgot to cc some recipients; no changes to the code.

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index b9aca99478db..616d20106392 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -112,7 +112,7 @@
 #define REG_RSVD3_8723B					0x0168
 #define REG_C2HEVT_MSG_NORMAL_8723B	0x01A0
 #define REG_C2HEVT_CMD_SEQ_88XX		0x01A1
-#define REG_C2hEVT_CMD_CONTENT_88XX	0x01A2
+#define REG_C2HEVT_CMD_CONTENT_88XX	0x01A2
 #define REG_C2HEVT_CMD_LEN_88XX		0x01AE
 #define REG_C2HEVT_CLEAR_8723B			0x01AF
 #define REG_MCUTST_1_8723B				0x01C0
@@ -429,13 +429,13 @@
 #define	IMR_RXFOVW_8723B		BIT8	/*  Receive FIFO Overflow */
 
 /* 2 ACMHWCTRL 0x05C0 */
-#define	AcmHw_HwEn_8723B		BIT(0)
-#define	AcmHw_VoqEn_8723B		BIT(1)
-#define	AcmHw_ViqEn_8723B		BIT(2)
-#define	AcmHw_BeqEn_8723B		BIT(3)
-#define	AcmHw_VoqStatus_8723B		BIT(5)
-#define	AcmHw_ViqStatus_8723B		BIT(6)
-#define	AcmHw_BeqStatus_8723B		BIT(7)
+#define	ACMHW_HWEN_8723B		BIT(0)
+#define	ACMHW_VOQEN_8723B		BIT(1)
+#define	ACMHW_VIQEN_8723B		BIT(2)
+#define	ACMHW_BEQEN_8723B		BIT(3)
+#define	ACMHW_VOQSTATUS_8723B		BIT(5)
+#define	ACMHW_VIQSTATUS_8723B		BIT(6)
+#define	ACMHW_BEQSTATUS_8723B		BIT(7)
 
 /*        8195 (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
 #define	RCR_TCPOFLD_EN			BIT25	/*  Enable TCP checksum offload */
-- 
2.30.2

