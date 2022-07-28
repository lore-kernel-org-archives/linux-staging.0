Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0742110F6
	for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 05:59:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c12so882001ede.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 22:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rH1rWR5ceTocR8VYoz9QhZ22rfTktTyDsu+u/jdxD/Q=;
        b=jzHtRPaAaJDnpz9SiuozBQxsMBqdeJjMfVgqccRSJ+MblMg7rHVBhDZ4UE9478uH4O
         z/EA9vkBxik9lBdxRsPyVZhvCMMtlmo51p/Il0Aryrh7H4HApIBsYLMjhhFaAA+05A5J
         l4gX+6bbiPv2mP4DWUukI9aV1Gp4dRhqbogTJv6htXYXKgXAlsFAdEvlneq2jssNRtwJ
         yWLI9V6GdjrUOlrEblpSiitXvOWbZ2Zm1T2+HPwdRlaC4Pr/pEdsmFN73Z/dNXZyydOT
         ee0eBg3/5oq2BszaE3buaDIj2fO/kdrevm7T2sj2V5a03q2GYkx32iWl15Hy7YyQvZLG
         q2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rH1rWR5ceTocR8VYoz9QhZ22rfTktTyDsu+u/jdxD/Q=;
        b=pjCucV1Tw561snofUvVEKJjAcrlHQLhsayiAHc/kIOhoEJ0QwS0DAfFfvf7u63yxt3
         6bBGSMp5WXDHCVl/WCbnu00Kutpq7gPjAiO6E7UGZd6maf8i2ZJH0xaB612iS/NdHR1L
         ZD/I7vnQIEweh7EM97II/Wh2F6P89YKkgVGfOz60GaCudJ4VpzWhVtT1GOxp3a97cst0
         sG4XgkcXpaWVSZ4sZHCbAbTNeQ5ta45A7vCNn6C4zL3ArOftsx4Qd40y3Iewkzh6GgCh
         V3vGYvNGxpZDtirTV8P3PURlE8rlukl6W/QK/bsFwd6EHYkw69w1HrXFoINDC7E4Plf9
         BS/Q==
X-Gm-Message-State: AJIora9rw41O2htFuDvjWgCXeOhQRfZNIIPXzvZ0azE0zK/YdnKZLdGZ
	Qr6vQUp5n7cPLjCSS5Kzve31kwxZtBs=
X-Google-Smtp-Source: AGRyM1tNRoBAGcwHk4I42NrE7AFYYHSvBxuMDhDuUsRdnvfCvBHD/tpsn0YsNBYhExzd0QHq/FAm9Q==
X-Received: by 2002:a05:6402:11c9:b0:43b:b905:cb88 with SMTP id j9-20020a05640211c900b0043bb905cb88mr26000024edw.102.1658987995255;
        Wed, 27 Jul 2022 22:59:55 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id bx13-20020a0564020b4d00b0043a75f62155sm73395edb.86.2022.07.27.22.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 22:59:54 -0700 (PDT)
Date: Thu, 28 Jul 2022 07:59:45 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: vt6655: Convert macro
 vt6655_mac_clear_stck_ds to function
Message-ID: <cbfe5cc170b68564ff45bb7f45c63de241c2a664.1658986804.git.philipp.g.hortmann@gmail.com>
References: <cover.1658986804.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658986804.git.philipp.g.hortmann@gmail.com>

Convert once used macro to static function. Multiline macros are not
liked by kernel community. Rename variable byOrgValue to reg_value to
avoid CamelCase which is not accepted by checkpatch.pl. Change variable
declaration to u8 as this improves readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Combind patch "Rename byOrgValue to reg_val..." with this one
          Removed function declaration
          Changed variable declaration
          Improved patch description
---
 drivers/staging/vt6655/mac.c | 9 +++++++++
 drivers/staging/vt6655/mac.h | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index d7ee42df7062..dcc649532737 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -70,6 +70,15 @@ void vt6655_mac_word_reg_bits_off(void __iomem *iobase, const u8 reg_offset, con
 	iowrite16(reg_value & ~(bit_mask), iobase + reg_offset);
 }
 
+static void vt6655_mac_clear_stck_ds(void __iomem *iobase)
+{
+	u8 reg_value;
+
+	reg_value = ioread8(iobase + MAC_REG_STICKHW);
+	reg_value = reg_value & 0xFC;
+	iowrite8(reg_value, iobase + MAC_REG_STICKHW);
+}
+
 /*
  * Description:
  *      Test if all test bits off
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 3d6d53d5b383..467c599a3289 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,14 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define vt6655_mac_clear_stck_ds(iobase)				\
-do {									\
-	unsigned char byOrgValue;					\
-	byOrgValue = ioread8(iobase + MAC_REG_STICKHW);			\
-	byOrgValue = byOrgValue & 0xFC;					\
-	iowrite8(byOrgValue, iobase + MAC_REG_STICKHW);			\
-} while (0)
-
 #define MACvSelectPage0(iobase)				\
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL)
 
-- 
2.37.1

