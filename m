Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241917E5
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 06:53:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id z8so6721909edb.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=yRQXOtrkeq9hOES6fAnWUIrrP3pelRSPhYzLt3Eo1sk=;
        b=kMBqaj2P1VnKYWzs4R0t5pa3wcydqvxjcvC2TsjHAqNMZMUCe8iFyLQJWQmJ1dwX7Q
         UUN8IS5G2ln8Kajo2ueEIj8fgNcmoXABuzykK9zBUcTYlxptT9+6kG0Fg8dzjhbF/BpI
         ed3NgOaA/5tvwXItnuNJkY9D9vGFaqoNgIkN8ZBAnHrFQaV3yCDzSylEpaeP4uONIivq
         bTfA52fm1WRtAafPOMnBNddz0MQTLlmEe8lfPPRp5/v8/ZH4y2XDnwrB46wbZHPwWpyr
         uDV6fmy+U9Wec01DV7rdlO5MTS3QOaP4qlUmib0ndDx/3QoawElQ1/+2ZhE0HaqBECpl
         bOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=yRQXOtrkeq9hOES6fAnWUIrrP3pelRSPhYzLt3Eo1sk=;
        b=ntPL/6k/kNu5UYgi+Sy9GpzGnkKP0NQ5BIdXnAMtXCAkI6OZW8ZRqBAren2MJWDWiw
         ZTGjkt5kR9+0CA787tQknL3qweRPF2xR6ai3Ua/+Kxm5/G+SvGFaOIblF8bXASX+3mXg
         lf7jiJuHpVjscmY8WeB5Sy7TqzYsKcHTcFD4ySU4KR77EiwgBluPlv6MN8/PWZ8RxIbi
         krnwXZul6WqnzM805diXVQAacPV2DlIHT3FI1eHqxpoBDOdipYHP5MgNkRz7VpK2Tm1E
         D9n4viBIEMVVnETPcj3+JtploEGrvgpOueOJJWqMhl+HJ13yOiyRmeQ3HWJuHBQS3OUb
         7p+A==
X-Gm-Message-State: ACgBeo0Z2HoBHv5b2cjzwfwLekwUXMmVdAhDvgn+Vbin8CI/X+NgZ1pP
	sECJHanaG73U6a+fsF1oVlkntqjaH68=
X-Google-Smtp-Source: AA6agR61vXLf0ejseVAOO0VdvjVj4GkNuFBuD9vJkWSNjsBPTYoDHXdbLHC28qMVL/hOT8MVocDgSQ==
X-Received: by 2002:a05:6402:28ca:b0:43b:5235:f325 with SMTP id ef10-20020a05640228ca00b0043b5235f325mr12093094edb.320.1661669611910;
        Sat, 27 Aug 2022 23:53:31 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id lo23-20020a170906fa1700b006fec4ee28d0sm2872732ejb.189.2022.08.27.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:53:31 -0700 (PDT)
Date: Sun, 28 Aug 2022 08:53:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] staging: vt6655: Convert macro MACvSetBBType to function
Message-ID: <bd512f940427615ed4b134dd04f14095875eec5b.1661666677.git.philipp.g.hortmann@gmail.com>
References: <cover.1661666677.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1661666677.git.philipp.g.hortmann@gmail.com>

Convert macro to static function. Multiline macros are not liked by
kernel community. Rename variable dwOrgValue to reg_value and byTyp to
mask to avoid CamelCase which is not accepted by checkpatch.pl. Change
variable declaration to u32 as this improves readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 10 ++++++++++
 drivers/staging/vt6655/mac.h  |  9 ---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index bbe05d9538a1..6711743dcf4a 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -55,6 +55,16 @@ static const unsigned short cwRXBCNTSFOff[MAX_RATE] = {
 
 /*---------------------  Static Functions  --------------------------*/
 
+static void MACvSetBBType(void __iomem *iobase, u32 mask)
+{
+	u32 reg_value;
+
+	reg_value = ioread32(iobase + MAC_REG_ENCFG);
+	reg_value = reg_value & ~ENCFG_BBTYPE_MASK;
+	reg_value = reg_value | mask;
+	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
+}
+
 /*---------------------  Export Functions  --------------------------*/
 
 /*
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a75cd318ee25..b6c4f2bb096a 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -543,15 +543,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvSetBBType(iobase, byTyp)					\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue & ~ENCFG_BBTYPE_MASK;			\
-	dwOrgValue = dwOrgValue | (unsigned long)byTyp;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvSetRFLE_LatchBase(iobase)                                 \
 	vt6655_mac_word_reg_bits_on(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_RFLEOPT)
 
-- 
2.37.2

