Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A13FC7
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 08:11:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t8so18954441wrq.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I0jcC2Su8d4wIhHItiadcLqrply5RR3Vd1Gurt9GSRs=;
        b=UcZL9sEWvQ5JVT4YGOZ4TS3qFdPdIkM0viO7FN2rHd5FzCcaSnYv0ifNp5uiD1FdbX
         E3NXVQ0lqKNzsDUVEUT6CCaoAqbzJvtNOb72P84H/NfvE3fOBzMxmquzpyCbU72XriAS
         o2sLM1yNBI90AGUjR/EwAbq7/2npwHlQtGOqMQJmq7q1pShRAnBXcGRf7AkM+bMjLkcD
         pvAwXFW4K59nFcLP1F2MOb7Oamr15Q/4QclEF2RsjnPyDZqCBQ59MiNkkXepOA2bV9RB
         ROhDxil5/9icFprRLgusH3zB/SH13V+v5ghNbLyJrRnfCZoJQ3jnFwvQKW910l6S5OFc
         M+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I0jcC2Su8d4wIhHItiadcLqrply5RR3Vd1Gurt9GSRs=;
        b=uWYkuHWBkJAs2czdoFiezrSgbThJDiwt5Rij/9P/3n7OVwAOu8vfeKrkfAp3vJuVG2
         MpPB3K4Qw3WbkOTsWf67OwUMNvFhzSu3WCAVZjY5dyNcPZRmpgXqlZjGi+ER+LwnZS6J
         ivQnn+YsHWA7DeEQ9qUUyOciAyjSxpPh8X9Scvl61n54HXibsHOwvd5hd2qSoQyvWB9B
         XmN0Rfv0OYwiX8whGS/fSvNp6h8Trlwbr3B0pTC75A3txkFd3m7f6vwaj7wZhvX1vA9/
         a2WnsTyLlX4z8370ekI5NftkHPEwNhdqfhahahCKiC/hOj8YHHKtXOdcPdlmdKIZQBHF
         Ucew==
X-Gm-Message-State: AOAM532yE1X23XluaPVJevPblJSU4YcrxofDz5QoVEhBVrq8i2AZXP4H
	4JUVhZoT/w5MPGl3S11GV0w=
X-Google-Smtp-Source: ABdhPJxtuu2TYPeOHkPytgfWQSXeh/haNUP1dPrhVkPe/F43jsHi9yrNlqGfWWENI5RbXlIGQOHNRQ==
X-Received: by 2002:a05:6000:1562:: with SMTP id 2mr13895503wrz.36.1631952691417;
        Sat, 18 Sep 2021 01:11:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id d17sm8918760wrp.57.2021.09.18.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 01:11:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: clean up indentation in odm_RegDefine11N.h
Date: Sat, 18 Sep 2021 10:11:20 +0200
Message-Id: <20210918081120.2798-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918081120.2798-1-straube.linux@gmail.com>
References: <20210918081120.2798-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up indentation in odm_RegDefine11N.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/odm_RegDefine11N.h   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_RegDefine11N.h b/drivers/staging/r8188eu/include/odm_RegDefine11N.h
index 3e2fd6b1c793..82a602b39cc7 100644
--- a/drivers/staging/r8188eu/include/odm_RegDefine11N.h
+++ b/drivers/staging/r8188eu/include/odm_RegDefine11N.h
@@ -10,14 +10,14 @@
 #define	ODM_REG_RX_DEFUALT_A_11N		0x858
 #define	ODM_REG_ANTSEL_CTRL_11N			0x860
 #define	ODM_REG_RX_ANT_CTRL_11N			0x864
-#define	ODM_REG_PIN_CTRL_11N				0x870
-#define	ODM_REG_SC_CNT_11N				0x8C4
+#define	ODM_REG_PIN_CTRL_11N			0x870
+#define	ODM_REG_SC_CNT_11N			0x8C4
 /* PAGE 9 */
 #define	ODM_REG_ANT_MAPPING1_11N		0x914
 /* PAGE A */
-#define	ODM_REG_CCK_ANTDIV_PARA1_11N	0xA00
-#define	ODM_REG_CCK_CCA_11N				0xA0A
-#define	ODM_REG_CCK_ANTDIV_PARA2_11N	0xA0C
+#define	ODM_REG_CCK_ANTDIV_PARA1_11N		0xA00
+#define	ODM_REG_CCK_CCA_11N			0xA0A
+#define	ODM_REG_CCK_ANTDIV_PARA2_11N		0xA0C
 #define	ODM_REG_CCK_FA_RST_11N			0xA2C
 #define	ODM_REG_CCK_FA_MSB_11N			0xA58
 #define	ODM_REG_CCK_FA_LSB_11N			0xA5C
@@ -28,7 +28,7 @@
 /* PAGE C */
 #define	ODM_REG_OFDM_FA_HOLDC_11N		0xC00
 #define	ODM_REG_OFDM_FA_RSTC_11N		0xC0C
-#define	ODM_REG_IGI_A_11N				0xC50
+#define	ODM_REG_IGI_A_11N			0xC50
 #define	ODM_REG_ANTDIV_PARA1_11N		0xCA4
 #define	ODM_REG_OFDM_FA_TYPE1_11N		0xCF0
 /* PAGE D */
@@ -39,9 +39,9 @@
 
 /* 2 MAC REG LIST */
 #define	ODM_REG_ANTSEL_PIN_11N			0x4C
-#define	ODM_REG_RESP_TX_11N				0x6D8
+#define	ODM_REG_RESP_TX_11N			0x6D8
 
 /* DIG Related */
-#define	ODM_BIT_IGI_11N					0x0000007F
+#define	ODM_BIT_IGI_11N				0x0000007F
 
 #endif
-- 
2.33.0

