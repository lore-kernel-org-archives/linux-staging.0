Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE33D76
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:14:17 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i13so4881459edj.11
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aC62YFpOcEgWM0eoM1eba1ujgEXycmF9AE85pHvVPYo=;
        b=KsTgxSJ5gv51eJV6HUga21BewB811m0hye/yDxqPfcv+IsH9dsaAFdaFCn/3cLUkAQ
         pQa1QGAJn8i0QDTBw/kfIzKFM8l9lOWFgSsn+q0cCeFvfxi9f8X7Fvx6DwvG40GBZOYF
         noG+BiV92KwzXJGhqjd/d+7wFERUUSaL3PIj85vfPo9wXIm6AtyfIWiP8L1Il2OMKWBq
         vv3gi3rcXALPivyf0n7D3XVSeP30PmaD/NiJCwd3XQALvbQiTTwtOFnqenglq3lhISIP
         mz5w9Rys0+Q8kae/Wrc4lUMtTNau7JXzCXFVooxvR4eenDhlpXgeL3O0zAvW9jOJuRSc
         jPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aC62YFpOcEgWM0eoM1eba1ujgEXycmF9AE85pHvVPYo=;
        b=VV7IR4wf8W0ZzRIpDAyUvaoPRCEWIL79XWQtocAhtBw/Rinzhx79YFd+LmMVUbJgh7
         hR0tlR/BO00gwl+FTfhTkODOH7gNG0llSxfz6fqYgTEbxrwFkhGkh3LbECQk5YGQkSOI
         pFup0RAwb87R+Pr1WIz+arvfg7j6gGOe2oqbvarnET4S8BpdhVn4UXxg3DvsPHrp+JPX
         kL4aYKS2cftJwDml1J3P4oaG3w6ipnqXioP99yUFejTjkfVFm1Gf4BDCDx+Mb4E+Gxi4
         uWu+o6LEqougkvXyg+6zKJnzk3mXQ5Xjxz6ZBgZwOrGEjkqESTdKCplsxRjYOkgBrCL5
         rmsg==
X-Gm-Message-State: AJIora+/auavnwqcLZ3aQ7Wv32/v8hBuvK0RuL5LKWaZaPrqdWgrTjil
	gmknFO0j0CCWQ6sL9wIHzVH2S0tg224=
X-Google-Smtp-Source: AGRyM1uitipKu6Ae5L9nGXPf52ek+oE/jutXwoIVEw+HWNBWNxcMSs5gLjcTG6/skZ+sYiL+EdoslA==
X-Received: by 2002:a05:6402:3511:b0:43b:c84c:e233 with SMTP id b17-20020a056402351100b0043bc84ce233mr2402327edd.211.1659082456016;
        Fri, 29 Jul 2022 01:14:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906311000b0072b13a10477sm1375609ejx.108.2022.07.29.01.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 01:14:15 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:14:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] staging: vt6655: Convert macro MACvReceive0 to
 function
Message-ID: <059aca149bd0c1d75df4fb3cd8a177aa4948fb02.1659080988.git.philipp.g.hortmann@gmail.com>
References: <cover.1659080988.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659080988.git.philipp.g.hortmann@gmail.com>

Convert macro to static function. Multiline macros are not liked by
kernel community. Rename variable dwData to reg_value to avoid
CamelCase which is not accepted by checkpatch.pl. Change variable
declaration to u32 as this improves readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Combind patch "Rename dwData to reg_value ..." with this one
          Changed order of renaming function and conversion to function
          Removed function declaration
          Changed variable declaration
          Improved patch description
---
 drivers/staging/vt6655/device_main.c | 11 +++++++++++
 drivers/staging/vt6655/mac.h         | 10 ----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 92583ee8bffd..39bfbb1ab742 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -205,6 +205,17 @@ static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr)
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
+static void MACvReceive0(void __iomem *iobase)
+{
+	u32 reg_value;
+
+	reg_value = ioread32(iobase + MAC_REG_RXDMACTL0);
+	if (reg_value & DMACTL_RUN)
+		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);
+	else
+		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 0122c4603c66..d21313f3067e 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,16 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvReceive0(iobase)						\
-do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_RXDMACTL0);			\
-	if (dwData & DMACTL_RUN)					\
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);	\
-	else								\
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);	\
-} while (0)
-
 #define MACvReceive1(iobase)						\
 do {									\
 	unsigned long dwData;						\
-- 
2.37.1

