Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6783C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:13:59 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id e13so8890286edj.12
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=vMHi6yjR8K+qFLdzbL1qS1VwBovHqrZTSu9kJ2npcA4=;
        b=LCyoBZP90E+9ObSdPhnohQL4+qRXAFcyx+5ucHnVgxvNxlRzJttmiInnAJCeFhMWrJ
         sAYDRPSn3P0y9EUsmvtvr7wswB7/eYYRjCq1kA+Mr3+8jXCiInLmF1wLJeVszjr3Arxz
         eq485gWizpqmAe7WAtdCcC37bmKt8inIBhNGkzbY171RDvFcQtpO5M78HwSi5Fj+8DQb
         ne4xgm3zpZp7+4lj0WsNnlqw6nkRyzQJv2kg36+id7wzEWS8ntjddcHlCfOh8KSYBjVK
         12jwZZc7Au0IjJtn5a/2WxNxL6U8q7BDgn5iKSsox1VYkk2DIEhz7xwGjQ7+QQD4VgdJ
         LJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=vMHi6yjR8K+qFLdzbL1qS1VwBovHqrZTSu9kJ2npcA4=;
        b=pWLvbiDrXEZsvNRsjUn1/DbezoJhyPOdAFpPF1yJrqEXraC+iCryEbHCBvt0Vyw70k
         aXItj2hCJmJcHqcOrB6AxiA9iNPaiaavQadUZCFk1Z5Qp+19loCt8gqB8qsU8m7q5guU
         2K1u36MWw/YuPsJ2lmLAWJJXUIVLO5Ii7dDRl6dHSN6FeOHit2GP8+G6jdMSSxcd9PJq
         K04KqUigZoa4mJoduc3Iq7yEgyJ5s0+rqHtkkYHI2/7wv0XJ6xMYX0Z76TA7Z2ggF4oa
         kOnR7SYiWHoEAwz0x/NKG52PZaDpZtCv7zZO1/l+qVDf3LZSweh5TbP/3cIEFagPi/WR
         w6MA==
X-Gm-Message-State: ACgBeo1QQ8Kvfo2YMxi089FiyZqy/0cuV88/UNEIyX/brTyRE1oos9ku
	LRmwG1PpP4YAdxeOvqX/fWA=
X-Google-Smtp-Source: AA6agR46EgO+2eepxhX3z5DGowcKmMPWYCnnyQzdj/zHuozdCf99GIjeXiJAFxyLWE8nAVbyDj/uWg==
X-Received: by 2002:a05:6402:348f:b0:43d:e568:97bd with SMTP id v15-20020a056402348f00b0043de56897bdmr14845164edc.279.1659896037459;
        Sun, 07 Aug 2022 11:13:57 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id qk27-20020a170906d9db00b006ff0b457cdasm4053477ejb.53.2022.08.07.11.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:13:57 -0700 (PDT)
Date: Sun, 7 Aug 2022 20:13:55 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] staging: vt6655: Convert macro
 MACvDisableBarkerPreambleMd
Message-ID: <2a1d67762d9ecf3f30f3e293ad6ab997ad278b84.1659892671.git.philipp.g.hortmann@gmail.com>
References: <cover.1659892670.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659892670.git.philipp.g.hortmann@gmail.com>

Convert macro MACvDisableBarkerPreambleMd to static function which calls
the common static function vt6655_mac_clear_bits. This saves
codelines and multiline macros are not liked by kernel community.
Function name is also changed to avoid CamelCase which is not accepted
by checkpatch.pl and to clean up namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Changed used function to vt6655_mac_clear_bits
---
 drivers/staging/vt6655/device_main.c | 8 +++++++-
 drivers/staging/vt6655/mac.h         | 8 --------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 46bd88ee4668..8e2a976aaaad 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -248,6 +248,12 @@ static void vt6655_mac_en_barker_preamble_md(void __iomem *iobase)
 {
 	vt6655_mac_set_bits(iobase, ENCFG_BARKERPREAM);
 }
+
+static void vt6655_mac_dis_barker_preamble_md(void __iomem *iobase)
+{
+	vt6655_mac_clear_bits(iobase, ENCFG_BARKERPREAM);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
@@ -1486,7 +1492,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 			vt6655_mac_en_barker_preamble_md(priv->port_offset);
 			priv->preamble_type = true;
 		} else {
-			MACvDisableBarkerPreambleMd(priv->port_offset);
+			vt6655_mac_dis_barker_preamble_md(priv->port_offset);
 			priv->preamble_type = false;
 		}
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 3400ea15b673..a75cd318ee25 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -543,14 +543,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvDisableBarkerPreambleMd(iobase)				\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue & ~ENCFG_BARKERPREAM;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvSetBBType(iobase, byTyp)					\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.37.1

