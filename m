Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DC70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:32:43 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id c123so8180728qke.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=alZ/njDA6kDUiXsUqrZlj3PHW2OGA8s+7K/9VZo9fWw=;
        b=IrB5OOVtvD+sK7NlIiEoVjBIDu7KE6eRZbHqC99ISyF78e8bvtg7Wew06Cd70O12dw
         7inwuWxyECY6katLBk3CE7xbmI9Z+Z5RoM3v+CLXB1Qh+KWQEUeZC1TzQm4opMCg9z2l
         zDq37qo2QVPPZov/OYT83cej5jSStyjWXwyKBB1l0/0QBheLuveOdcTvgIZdN1BP7UE6
         he09QLNRLTqYXbdUl4fsxCZVesJCHlDQBOCSUpQyzSmrLE0rtxHkVY8tRzk3n8bz2DJ/
         zvmuLrWWiCTCfeGXWhwEKQ7yiJFcjuZnH7TZe27wtZVr4kMd8UjVHNIdrKW9noxS//Cz
         EHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=alZ/njDA6kDUiXsUqrZlj3PHW2OGA8s+7K/9VZo9fWw=;
        b=S0r0WHTeq2msj8ei4h01lDnWkjdiNJRxZ08Qfp0Y9fCB6Q7Zrao5zBJqUD2H03BYg8
         /2gjD6nTwBfurCNsSihYDQqYCKeJppwIJ5DV2RyOE4CqJ2Uzffi67yHilZQpZHJBjBpd
         ctbsOC2BfH3SG7e90ng5BMPKmKKkHZzpe981Q0/iD427BFoEQQvgdtyDh7c/HlD4Xur2
         El7atyTI3OqUEGLapIiSoa4jqON1eu2VfwY3fYsos6jBGLw640GJnIGiZsqUiKzZsK5v
         nZG9I1Aq5QkCKPYcw1HgK4QHYRhDfDX+KM8GX5G+D64nxl0KH/XAMdAiGjFrgohEVI+G
         Dy0g==
X-Gm-Message-State: AOAM5302DRG21Lg+JmgiUiIVSydYZ32JTtKZmN7dEMFfljwARY6lsmyp
	7C92HwuCbdSBZ0TPZHPcZwo=
X-Google-Smtp-Source: ABdhPJz4C60O6AngmQ7b0XRWnnOu3FX9tZWFaN2kh5E01pnaNT245XTfipRbalOoeKn1vnPH5mlflw==
X-Received: by 2002:a37:9c85:: with SMTP id f127mr7659821qke.283.1618230762320;
        Mon, 12 Apr 2021 05:32:42 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id v11sm7495148qtx.79.2021.04.12.05.32.41
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:32:42 -0700 (PDT)
Date: Mon, 12 Apr 2021 09:32:39 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 2/4] Replace macro function by static
 inline function in file iss_ipipe.c
Message-ID: <3d3facd1c3eef996d7e824917c19282bd1e1f041.1618230425.git.alinesantanacordeiro@gmail.com>
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
 drivers/staging/media/omap4iss/iss_ipipe.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/staging/media/omap4iss/iss_ipipe.c
index 26be078..09c941c 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -38,9 +38,11 @@ static const unsigned int ipipe_fmts[] = {
  *
  * Also prints other debug information stored in the IPIPE module.
  */
-#define IPIPE_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###IPIPE " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPE, IPIPE_##name))
+static inline ipipe_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###IPIPE " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPE, IPIPE_##name));
+}
 
 static void ipipe_print_status(struct iss_ipipe_device *ipipe)
 {
@@ -48,16 +50,16 @@ static void ipipe_print_status(struct iss_ipipe_device *ipipe)
 
 	dev_dbg(iss->dev, "-------------IPIPE Register dump-------------\n");
 
-	IPIPE_PRINT_REGISTER(iss, SRC_EN);
-	IPIPE_PRINT_REGISTER(iss, SRC_MODE);
-	IPIPE_PRINT_REGISTER(iss, SRC_FMT);
-	IPIPE_PRINT_REGISTER(iss, SRC_COL);
-	IPIPE_PRINT_REGISTER(iss, SRC_VPS);
-	IPIPE_PRINT_REGISTER(iss, SRC_VSZ);
-	IPIPE_PRINT_REGISTER(iss, SRC_HPS);
-	IPIPE_PRINT_REGISTER(iss, SRC_HSZ);
-	IPIPE_PRINT_REGISTER(iss, GCK_MMR);
-	IPIPE_PRINT_REGISTER(iss, YUV_PHS);
+	ipipe_print_register(iss, SRC_EN);
+	ipipe_print_register(iss, SRC_MODE);
+	ipipe_print_register(iss, SRC_FMT);
+	ipipe_print_register(iss, SRC_COL);
+	ipipe_print_register(iss, SRC_VPS);
+	ipipe_print_register(iss, SRC_VSZ);
+	ipipe_print_register(iss, SRC_HPS);
+	ipipe_print_register(iss, SRC_HSZ);
+	ipipe_print_register(iss, GCK_MMR);
+	ipipe_print_register(iss, YUV_PHS);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

