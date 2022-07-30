Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1933D90
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:20:42 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id c12so9298640ede.3
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=zEv3y3d4lNBhF3QA9eeB4K5jO3MyXebCpviRLBi5Fd8=;
        b=ETK2IwoiqFreK+LdBxvQp69R8sQXA7iT2jSauG/Go+LOLNvH2LrtrDW+QryRnXLqWu
         vGLLEjprU1sZ+4pWM+PT4/ycb0IZON13ja8QO7rr5TLo1ETPZ7FgUp1G3PT3msHAwBDh
         8AiiJ0nQuxnlhezW8En0tMLR5Whjs5nic7imP41lURhGnYAh27/JWhRsAVXyaLItboOY
         MkhJofGZHNNiNM73eJYf7ylfBDzG+BdSq+YrCEgO3Hll2ErWRFW3xUjkCITfuiBFoWES
         G6FRQZbp2mvLLaa+60IiL54E3Bxu4SsZXX2wqPGh5UkyDulYpnxOnO202ZripDjsVLUz
         1IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=zEv3y3d4lNBhF3QA9eeB4K5jO3MyXebCpviRLBi5Fd8=;
        b=Oe05/t7+RgRtI4vZmzGKjG4fiN00fud2sym9q/s5ZukCtrW+9ZRK2SW1FGSfLvc2AY
         uJmPgI2oD5l5fNtOdZ9drcmesh8J/8eBskFtUStySkWA8IoH2EiP0TL16TyKi/ioGtgw
         V6avovN0MMm/L2yWino/4U+9wlOWtBdz2wXCgUuGFYtI67lE796ZbM6lCMr6Tcyolhc7
         nIUoihuO0rdGiZWSsQZPItMrzQ+1JJfrLm4d0Qn0hlRGLAcvP9JY9DHrexHvpSbvx5/r
         Y1rartKhEMLw0ZnWO2lCoXUcq+H7BL5+LhmHcFP9tEQDB3ipkYrUUUJ1TXXPq07G/x1V
         cW3A==
X-Gm-Message-State: ACgBeo2eTImh1YKZ8xs2448VRLm5tkjWmtrLu6isjs5N0RY8SfZKRLY+
	+H4GmXoPGfw2xPC03ZRhyECkJ/D6ih0=
X-Google-Smtp-Source: AA6agR4JYUmtMB6i+qWDdcsOlKx+QbqKkxm1aWgSfzDHDl9XxBVV8Q6wZcvxCw/FMcTKb1ziFfB3+w==
X-Received: by 2002:a50:bace:0:b0:43d:370a:e1c1 with SMTP id x72-20020a50bace000000b0043d370ae1c1mr5947702ede.193.1659208841143;
        Sat, 30 Jul 2022 12:20:41 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id p27-20020a056402501b00b0043bdd401cafsm4214506eda.47.2022.07.30.12.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:20:40 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:20:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: vt6655: Rename function MACvEnableProtectMD
Message-ID: <3e5edc9a6a0cefa5474d125321a8b6d6caf58e19.1659192760.git.philipp.g.hortmann@gmail.com>
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

Rename MACvEnableProtectMD function to vt6655_mac_en_protect_md to
avoid CamelCase which is not accepted by checkpatch.pl and to clean up
namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 4 ++--
 drivers/staging/vt6655/mac.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 5f64204dc312..7633602e47c1 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -228,7 +228,7 @@ static void vt6655_mac_en_dis_bits_u32_reg(void __iomem *iobase, bool en_not_dis
 	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
 }
 
-static void MACvEnableProtectMD(void __iomem *iobase)
+static void vt6655_mac_en_protect_md(void __iomem *iobase)
 {
 	vt6655_mac_en_dis_bits_u32_reg(iobase, ENABLE, ENCFG_PROTECTMD);
 }
@@ -1478,7 +1478,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_CTS_PROT) {
 		if (conf->use_cts_prot)
-			MACvEnableProtectMD(priv->port_offset);
+			vt6655_mac_en_protect_md(priv->port_offset);
 		else
 			MACvDisableProtectMD(priv->port_offset);
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 31e75df5f02f..66e03e8173ea 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -12,7 +12,7 @@
  * Revision History:
  *      07-01-2003 Bryan YC Fan:  Re-write codes to support VT3253 spec.
  *      08-25-2003 Kyle Hsu:      Porting MAC functions from sim53.
- *      09-03-2003 Bryan YC Fan:  Add MACvDisableProtectMD & MACvEnableProtectMD
+ *      09-03-2003 Bryan YC Fan:  Add MACvDisableProtectMD & vt6655_mac_en_protect_md
  */
 
 #ifndef __MAC_H__
-- 
2.37.1

