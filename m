Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AB70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:32:47 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id e13so3168361qkl.6
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ufJcji2+m5srymBQPjBrGfe67cUzEZqDOtn26wg7648=;
        b=qmZowgBMDh564wGGBAK1Y1joojizHF7rqrmZftAPLZxtvx27k/0X6Pgut82fixi5cf
         bA9LTq2CbQyy7wM83UFfKezSsxfv+WnJe/VKlPDE19Yes60j8YKthliqDOnVEjMk4bA2
         heb1VIYTXB10TlggpqLE0O6Guif5cScxju6/dRAbnNVIVjggyRh9mMP/7hnBjnEvhc2T
         GASDkr+istx/XQJSrD/Y9BzVq4CUfwoyXq5Wv7l0q66Wk4pb1Qj/M4y0ieDcaxpVtM9Z
         LwgV+O8dqBJkR9OLyxWDW/zZ5A4k6IGVF+j99oWD4KrYc5PAMGLp3LrQDawSSlAlKxdZ
         /GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ufJcji2+m5srymBQPjBrGfe67cUzEZqDOtn26wg7648=;
        b=eN5+9faqMlu0efg2rHdvw//fugzBAl2OwlP5Le81ebFojSaTCeVgHuI47V4P+bOeY7
         wD1U1aFmHSB6AW4ykHPSlHGkQOMG7nVFnKajuYHh8qC0/ZKDOj+/tlWDArYsdB0NRwne
         pIiU6sYDu/sii3B9WnVpQFOBBxvGtBetvKmoW1/Ka6L8AccFnWRMsZwTa6w2gRT2d4VE
         2+0AmJaiiGqJ9HYJoipWlwvZL9YhYrRpVNikw6ziAyHQmewOtonyvOO2RFd09vP6r9cB
         UGMFnEZ2spWF1kvrDqWbuVmQTbih7HtrQmwWeBtT/rY2OqWGdOKJauBdTQzAWhXKErzE
         E8zA==
X-Gm-Message-State: AOAM5326C0kPOrUtuby4BXnnC8CLGQsEgoq/QwE9VHhBomPBApvggESU
	inFIjHUOq0lMgbvRZjbo3vo=
X-Google-Smtp-Source: ABdhPJwmIem/9PltNNtX361r7eJlfDfF/v4WGNSnhLLBJHmAaPropaUMqQ3u/AAtkSQzUNsEa02G7g==
X-Received: by 2002:ae9:e015:: with SMTP id m21mr25440661qkk.420.1618230766509;
        Mon, 12 Apr 2021 05:32:46 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id f25sm6898173qtm.49.2021.04.12.05.32.45
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:32:46 -0700 (PDT)
Date: Mon, 12 Apr 2021 09:32:43 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 3/4] Replace macro function by static
 inline function in file iss_ipipeif.c
Message-ID: <808aaecdd2783cd1c216ba5ca3d592242731e73a.1618230425.git.alinesantanacordeiro@gmail.com>
References: <cover.1618230425.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618230425.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss_ipipeif.c | 62 +++++++++++++++-------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_ipipeif.c b/drivers/staging/media/omap4iss/iss_ipipeif.c
index c2978d0..3dc98f6 100644
--- a/drivers/staging/media/omap4iss/iss_ipipeif.c
+++ b/drivers/staging/media/omap4iss/iss_ipipeif.c
@@ -34,17 +34,23 @@ static const unsigned int ipipeif_fmts[] = {
  *
  * Also prints other debug information stored in the IPIPEIF module.
  */
-#define IPIPEIF_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###IPIPEIF " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPEIF, IPIPEIF_##name))
+static inline ipipeif_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###IPIPEIF " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPEIF, IPIPEIF_##name));
+}
 
-#define ISIF_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###ISIF " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_ISIF, ISIF_##name))
+static inline isif_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###ISIF " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_ISIF, ISIF_##name));
+}
 
-#define ISP5_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###ISP5 " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_##name))
+static inline isp5_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###ISP5 " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_##name));
+}
 
 static void ipipeif_print_status(struct iss_ipipeif_device *ipipeif)
 {
@@ -52,25 +58,25 @@ static void ipipeif_print_status(struct iss_ipipeif_device *ipipeif)
 
 	dev_dbg(iss->dev, "-------------IPIPEIF Register dump-------------\n");
 
-	IPIPEIF_PRINT_REGISTER(iss, CFG1);
-	IPIPEIF_PRINT_REGISTER(iss, CFG2);
-
-	ISIF_PRINT_REGISTER(iss, SYNCEN);
-	ISIF_PRINT_REGISTER(iss, CADU);
-	ISIF_PRINT_REGISTER(iss, CADL);
-	ISIF_PRINT_REGISTER(iss, MODESET);
-	ISIF_PRINT_REGISTER(iss, CCOLP);
-	ISIF_PRINT_REGISTER(iss, SPH);
-	ISIF_PRINT_REGISTER(iss, LNH);
-	ISIF_PRINT_REGISTER(iss, LNV);
-	ISIF_PRINT_REGISTER(iss, VDINT(0));
-	ISIF_PRINT_REGISTER(iss, HSIZE);
-
-	ISP5_PRINT_REGISTER(iss, SYSCONFIG);
-	ISP5_PRINT_REGISTER(iss, CTRL);
-	ISP5_PRINT_REGISTER(iss, IRQSTATUS(0));
-	ISP5_PRINT_REGISTER(iss, IRQENABLE_SET(0));
-	ISP5_PRINT_REGISTER(iss, IRQENABLE_CLR(0));
+	ipipeif_print_register(iss, CFG1);
+	ipipeif_print_register(iss, CFG2);
+
+	isif_print_register(iss, SYNCEN);
+	isif_print_register(iss, CADU);
+	isif_print_register(iss, CADL);
+	isif_print_register(iss, MODESET);
+	isif_print_register(iss, CCOLP);
+	isif_print_register(iss, SPH);
+	isif_print_register(iss, LNH);
+	isif_print_register(iss, LNV);
+	isif_print_register(iss, VDINT(0));
+	isif_print_register(iss, HSIZE);
+
+	isp5_print_register(iss, SYSCONFIG);
+	isp5_print_register(iss, CTRL);
+	isp5_print_register(iss, IRQSTATUS(0));
+	isp5_print_register(iss, IRQENABLE_SET(0));
+	isp5_print_register(iss, IRQENABLE_CLR(0));
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

