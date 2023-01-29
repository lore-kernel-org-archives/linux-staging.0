Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78CF23A3
	for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 14:58:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso386100wmp.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyvKP4txQ13hA3WgepX6K+C6nDjIWuymKszT6lxk42U=;
        b=SqTC1lH9c+quHuDgGjFZOwgvbXTCJGzGUtee6cQENP2LMMrrqgbzbMqwDWWPcXZiI+
         2LE2M+NFydezoE4SyPVKtdGQUaEvtDYgkm3/KWdGLgERRc25WA+LLrBjvko6qGwYacBS
         6UpgSqicII3V5ehThNEZe5K97HD9NEiF5E+Z5ielQnsBjThnqiscfVoG7CWlwgKH67zB
         TtBGQa/8CPiBhkDgMBieJmNa+tHqwT4sojmHhkv5R0/Q1Vi4WpTFJv+sk+nh83MgHKxz
         Nv1IzhYJY+Vw59y5c0i6wbwOzamg0DdG0bjbsRFrU/VzQU2moIP1dLAUwbPm0TfaJCQs
         jMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyvKP4txQ13hA3WgepX6K+C6nDjIWuymKszT6lxk42U=;
        b=O+/+vKxOrJ/yVK44bIJB3MN/qNBMf+o8hjJv4M33ZdO0e6xgDsAw1PHKI0h+aed+Nr
         V25EpfG0xicqmguJKxoHtcZTaQcJaVEKLJK8vuqhgx/psL8Dem1PrzuppaczQ7IZjvyh
         mNDhfklT/DjAWSQzR/2aO62WWst3ApYedXR3ATfZWjp7VokoyIPRJXnNr6KXfu0UuQXC
         AoaDy0oK2UcLo0mKSGD0m+qmRZQz+E02pqBQnq58USZCsq3yZYz5KILNznQLLD/Eo+5g
         g+mX4IT+kbQwt21+SS1I3MjRMpNVxTfU0omSGqBR48M93CbjPeg5nHupK0mfkhavd0NX
         3CdQ==
X-Gm-Message-State: AO0yUKVxL6zRZUe8V3C1zpVlf7dm33eyD9Gkcn2GpW4tHZ7CL8eYNLYe
	QAdDg+OA7uLhCvsJ9P5Xa8otlPVZ9Tk=
X-Google-Smtp-Source: AK7set+PZCcyiCmeYuSRg30WqJc7QgxR+F2xwdzL5dzChR+UQMuHUKi1gcVCqqCFxb/4UF7Qgj2z3w==
X-Received: by 2002:a05:600c:5008:b0:3dc:557f:6122 with SMTP id n8-20020a05600c500800b003dc557f6122mr386081wmr.1.1675004319099;
        Sun, 29 Jan 2023 06:58:39 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c099000b003daf681d05dsm10048927wmp.26.2023.01.29.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:58:38 -0800 (PST)
Date: Sun, 29 Jan 2023 15:58:36 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Remove unused constants at
 beginning of r8192E_hw.h
Message-ID: <d01232f5ef10eac02abb3f31f2ac6f53614fa954.1675003608.git.philipp.g.hortmann@gmail.com>
References: <cover.1675003608.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675003608.git.philipp.g.hortmann@gmail.com>

Remove unused constants at beginning of r8192E_hw.h. A part of the
constants would need to be renamed because of CamelCase on others spaces
are missing before and after "<<".

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 38 +------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 858cfc203f13..cc1e62f7074d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -12,63 +12,27 @@ enum baseband_config {
 	BB_CONFIG_AGC_TAB = 1,
 };
 
-#define	RTL8187_REQT_READ	0xc0
-#define	RTL8187_REQT_WRITE	0x40
-#define	RTL8187_REQ_GET_REGS	0x05
-#define	RTL8187_REQ_SET_REGS	0x05
-
-#define MAX_TX_URB 5
-#define MAX_RX_URB 16
-#define RX_URB_SIZE 9100
-
-#define BB_ANTATTEN_CHAN14	0x0c
-#define BB_ANTENNA_B 0x40
-
-#define BB_HOST_BANG (1<<30)
-#define BB_HOST_BANG_EN (1<<2)
-#define BB_HOST_BANG_CLK (1<<1)
-#define BB_HOST_BANG_RW (1<<3)
-#define BB_HOST_BANG_DATA	 1
-
 #define RTL8190_EEPROM_ID	0x8129
 #define EEPROM_VID		0x02
 #define EEPROM_DID		0x04
 #define EEPROM_NODE_ADDRESS_BYTE_0	0x0C
 
-#define EEPROM_TxPowerDiff	0x1F
-
-
-#define EEPROM_PwDiff		0x21
-#define EEPROM_CrystalCap	0x22
-
-
-
-#define EEPROM_TxPwIndex_CCK_V1		0x29
-#define EEPROM_TxPwIndex_OFDM_24G_V1	0x2C
-#define EEPROM_TxPwIndex_Ver		0x27
-
-#define EEPROM_Default_TxPowerDiff		0x0
 #define EEPROM_Default_ThermalMeter		0x77
 #define EEPROM_Default_AntTxPowerDiff		0x0
 #define EEPROM_Default_TxPwDiff_CrystalCap	0x5
-#define EEPROM_Default_PwDiff			0x4
-#define EEPROM_Default_CrystalCap		0x5
 #define EEPROM_Default_TxPower			0x1010
 #define EEPROM_ICVersion_ChannelPlan	0x7C
 #define EEPROM_Customer_ID			0x7B
 #define EEPROM_RFInd_PowerDiff			0x28
+
 #define EEPROM_ThermalMeter			0x29
 #define EEPROM_TxPwDiff_CrystalCap		0x2A
 #define EEPROM_TxPwIndex_CCK			0x2C
 #define EEPROM_TxPwIndex_OFDM_24G	0x3A
-#define EEPROM_Default_TxPowerLevel		0x10
-#define EEPROM_IC_VER				0x7d
-#define EEPROM_CRC				0x7e
 
 #define EEPROM_CID_DEFAULT			0x0
 #define EEPROM_CID_CAMEO				0x1
 #define EEPROM_CID_RUNTOP				0x2
-#define EEPROM_CID_Senao				0x3
 #define EEPROM_CID_TOSHIBA				0x4
 #define EEPROM_CID_NetCore				0x5
 #define EEPROM_CID_Nettronix			0x6
-- 
2.39.1

