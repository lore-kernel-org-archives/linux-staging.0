Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD13D90
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:20:51 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id tk8so13739508ejc.7
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=ScMzAp/iFdVUbCt1AUeqrEtgtq+mwTLWTpajmOZrSE8=;
        b=kw7apWRHd1qsweoWZOf4sEKh6YKInX3oUpMyjAwBaHeKrM1Hca5jZF+PLxj3xXb74n
         x5jTx6InS2xFdO3ySVIrIo0wLSP6/Pd0Ci/Yvs410KbNhqhigJR8uhsjAY3M5F5ihvEc
         bTiTO4e4KKHVQP4cxFX6h8o58skcYYaIFkF9ylKEOhiwSxoc1A+ax5tbFkY2lCYc7yM6
         H0cmXu8LUpnDo/E5ZgsALa8pxsY9DT5NlISsxRHe/gk/ol1rdp4ILAa++IjgnYQPqnyJ
         XQ7tKBB+5l92Iiu2OznIw8CgJZ1hFuvtNL4HXmfvP8/VLjwtBc53vknJuePxPC9DOMZZ
         TvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=ScMzAp/iFdVUbCt1AUeqrEtgtq+mwTLWTpajmOZrSE8=;
        b=epUef0d6bC7nrij/IED2mKPf3BqK8S3Kclk/651vdHZQTmxSICa6egrHq14nFsbudj
         XxPd5BbKBqLFG4uUW7inLeok/uQFILRN0bSzip/vqwop7PIUy/viqCXVSsrL4gtevaFl
         R2Zh2/khydhVdj5ND4jr+KzIitxcHzuqcs9aDT+wb1pYfMAz6Nn26Ubf/cs35/8UJTN2
         aEIPojahDxS+GDAZKctkk2EHcogzOy6ApYqoICOY5Ry2MV96xMLE3o7wWSWVxrJ6/dRd
         UIppi3Jl8rI4L0G772NVsOeiylpZ5wmSYBhehlx9O6P0+KMtRIVLUK+JhYZk9VHpo8S2
         ztog==
X-Gm-Message-State: ACgBeo3/D6Aoc3wWpA75orHtFi9AdwiIcBSqSjpRkbORvy4AoPzTjQ6F
	zdp0Kx0swPrQMKyut6bHcYw=
X-Google-Smtp-Source: AA6agR6kzaM60NLPi6oOwYzcSDu+S7cv78/ZeLtg9RrjAAgYKfZK7PZRkNMt5HbUWF4ZhJtGzDuIpw==
X-Received: by 2002:a17:907:2c74:b0:730:61c8:d80a with SMTP id ib20-20020a1709072c7400b0073061c8d80amr1026445ejc.702.1659208851375;
        Sat, 30 Jul 2022 12:20:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id u1-20020a170906408100b0072fa1571c99sm3262462ejj.137.2022.07.30.12.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:20:51 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:20:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: vt6655: Convert macro MACvDisableProtectMD
Message-ID: <a04c74251d82a0f8eaa1e92990cb215465aae41f.1659192760.git.philipp.g.hortmann@gmail.com>
References: <cover.1659192760.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659192760.git.philipp.g.hortmann@gmail.com>

Convert macro MACvDisableProtectMD to static function which calls the
common static function vt6655_mac_en_dis_bits_u32_reg. This saves
codelines and multiline macros are not liked by kernel community.
Function name is also changed to avoid CamelCase which is not accepted
by checkpatch.pl and to clean up namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c |  7 ++++++-
 drivers/staging/vt6655/mac.h         | 10 +---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 7633602e47c1..c09d80effc3f 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -233,6 +233,11 @@ static void vt6655_mac_en_protect_md(void __iomem *iobase)
 	vt6655_mac_en_dis_bits_u32_reg(iobase, ENABLE, ENCFG_PROTECTMD);
 }
 
+static void vt6655_mac_dis_protect_md(void __iomem *iobase)
+{
+	vt6655_mac_en_dis_bits_u32_reg(iobase, DISABLE, ENCFG_PROTECTMD);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
@@ -1480,7 +1485,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 		if (conf->use_cts_prot)
 			vt6655_mac_en_protect_md(priv->port_offset);
 		else
-			MACvDisableProtectMD(priv->port_offset);
+			vt6655_mac_dis_protect_md(priv->port_offset);
 	}
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 66e03e8173ea..3a9721624cff 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -12,7 +12,7 @@
  * Revision History:
  *      07-01-2003 Bryan YC Fan:  Re-write codes to support VT3253 spec.
  *      08-25-2003 Kyle Hsu:      Porting MAC functions from sim53.
- *      09-03-2003 Bryan YC Fan:  Add MACvDisableProtectMD & vt6655_mac_en_protect_md
+ *      09-03-2003 Bryan YC Fan:  Add vt6655_mac_dis_protect_md & vt6655_mac_en_protect_md
  */
 
 #ifndef __MAC_H__
@@ -546,14 +546,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvDisableProtectMD(iobase)					\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue & ~ENCFG_PROTECTMD;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvEnableBarkerPreambleMd(iobase)				\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.37.1

