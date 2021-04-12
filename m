Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0E70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:57:12 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id d15so144661qkc.9
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x7tmmZHrCVQE02Px5t5c/UG1yYUMoOazF7ZKUu9ZpuU=;
        b=bG0J3T9h0gD7RFwfNzKPHOpVtBGHDC9e4xfbvB/QjXJZsoROBH322oIhWOFt5ydN0P
         1anCaW9cFkl95K0dNa+EbRMXAoPlXdrJx/e+se+pX2glviRXmq3OhrFFPY51YvC3ajn+
         83hUxE2xXl9vp1qfzUjp8D0oX2JYcx+LW89E6owH8J/SATk7ABbi7x0yPotpnPoYT1tp
         Qx/gClqyN/42t0LjlexgVS5y1uBh4ECm545BJhY0d/VMPNO4GjoPgZ8Cl41UFTzUeyPg
         9RKFFB17yrw2osPKw+yR5EFHYdcJjyI1SYsI62WeNfQtNeTavOvnyTfcLSc1/76Lt8xs
         zhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x7tmmZHrCVQE02Px5t5c/UG1yYUMoOazF7ZKUu9ZpuU=;
        b=I4DZrHiCeRblO6WbgmdxkJPs3QAhRPwMLJst8lAClohlgWimyUxKt+mYuFgFabtnRD
         JEZ97dinrn3Kqeoh8NccXXulWGdDVMvgrW632WWeTD1HgMSVKbjpUkr9cvjKmK1GzOmo
         QqWpJdD2/jZPNpT/Kefm4kmXO21D8+HTVQpWTylgz+H/uqFOOkAtkta26sZpxKH/FoKd
         9nNrNimGGBXfyExuAFYM51cLDOn5KKrfeNDCktjPmzBmyjfurrkv8MJTqDrtkrfgpQFJ
         3nUpKLZyoJPK4tCUkvh9wLKVlqxpQWM9oSt9bBM7qzeSFT9JKCimhJw0qx2+YZiO+rqh
         uP5Q==
X-Gm-Message-State: AOAM533GFPNdmn1aKkpuQeeFtEzdwXjeyENIaqNjivmZtxx0jt6Q+ps9
	I7a/Gv3VqlSM7BCMNM0D474=
X-Google-Smtp-Source: ABdhPJyQpNi3IhdSeoFbNulAoOEdI449xVECFe4I0yY38UdmVEZ6p6nM/pmt1/u/ctp7QN3XPnZ+Fg==
X-Received: by 2002:a05:620a:1592:: with SMTP id d18mr4863797qkk.329.1618232232193;
        Mon, 12 Apr 2021 05:57:12 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id t198sm3824160qke.44.2021.04.12.05.57.11
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:57:11 -0700 (PDT)
Date: Mon, 12 Apr 2021 09:57:09 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss: Replace
 macro function by static inline function in file iss.c
Message-ID: <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Insert file path in commit message

 drivers/staging/media/omap4iss/iss.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index c89f268a..3bbc39e 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -27,22 +27,24 @@
 #include "iss.h"
 #include "iss_regs.h"
 
-#define ISS_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###ISS " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_##name))
+static inline iss_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###ISS " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_##name));
+}
 
 static void iss_print_status(struct iss_device *iss)
 {
 	dev_dbg(iss->dev, "-------------ISS HL Register dump-------------\n");
 
-	ISS_PRINT_REGISTER(iss, HL_REVISION);
-	ISS_PRINT_REGISTER(iss, HL_SYSCONFIG);
-	ISS_PRINT_REGISTER(iss, HL_IRQSTATUS(5));
-	ISS_PRINT_REGISTER(iss, HL_IRQENABLE_SET(5));
-	ISS_PRINT_REGISTER(iss, HL_IRQENABLE_CLR(5));
-	ISS_PRINT_REGISTER(iss, CTRL);
-	ISS_PRINT_REGISTER(iss, CLKCTRL);
-	ISS_PRINT_REGISTER(iss, CLKSTAT);
+	iss_print_register(iss, HL_REVISION);
+	iss_print_register(iss, HL_SYSCONFIG);
+	iss_print_register(iss, HL_IRQSTATUS(5));
+	iss_print_register(iss, HL_IRQENABLE_SET(5));
+	iss_print_register(iss, HL_IRQENABLE_CLR(5));
+	iss_print_register(iss, CTRL);
+	iss_print_register(iss, CLKCTRL);
+	iss_print_register(iss, CLKSTAT);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

