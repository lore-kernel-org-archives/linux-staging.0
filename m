Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B73D98
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:21:11 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id uj29so601598ejc.0
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=uoHNcIjYvVZqJisWxXcOOSOxiOgF7GrC4J54f5gJBt0=;
        b=Qmk/bNckYvraHA1It20FdjHfRhkySURaZkEScXU9hi5lyg16rH4MHOQA70PN3MitxV
         yEgulGP06o+nEpBuKpw34g7j70Lb6yk48HbgPNSSS+SWQhQ3k1vSal3WI8DrDZz6WRir
         ++6XzMh+sxzmEWr4Aa2j4922Nak20vr0iiKF5mmexArgByS7pPQEnBAD0nPNpO3Rbi/0
         NdJJ5YNEkfGb0icfpX0BNyOw/6CmlpELcGRJOor8EnJZndA+5OtUb7eMqvQEhEVdxM4w
         +OrcAJ184YfCW1PTR72eptaCuu5tyrmECWLXdKMwfTW0KAJoOHM7l8LBK07x0HjQvI8U
         XJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=uoHNcIjYvVZqJisWxXcOOSOxiOgF7GrC4J54f5gJBt0=;
        b=QgBlMteMpkZljUmlCpBvNmp7v5b6TRVCtvJ8FwZjR7sBnBZ88vnf4nA278xrFUFXJQ
         Lbtiz9wIbtgkKn2lpuik9OQPnZIJhZQNuo7r4m26f33KzthWAaFJbX2g9rs+14OuRvtk
         xc+yVppnVh8ZpGRnuhBOa9r0EljVbg3O/TgoJyn8ZokmOSZeuXDHzsO+t82qVVtelii8
         mAyRvfymLkY6RP7+cP2MLafCyYxs9lj2fMz2UtqGao517num0PejvdOU8Je+ETZPTOYA
         b4eNMwnRhPzOReA1yly5GF2ifJqQ7nVEDTv9Ajm3D4aUJCk6TLxK942XSxqSkdR/Oqj4
         fytg==
X-Gm-Message-State: AJIora9TUeNkGpB9xM6IaKQqh4f/cq9L/QgAu3tLHPQMqrwGndvmQIj4
	2UzlbooSrUVF/5k4pcdw360=
X-Google-Smtp-Source: AGRyM1ucG/gRuy6TcFDN4BHzu6BNmw9kD+voS1BGi4wDDQ/N0XbOhwY6/x9N8exRPo0+7o3AJ6AjPg==
X-Received: by 2002:a17:907:2d08:b0:72f:1dff:edf5 with SMTP id gs8-20020a1709072d0800b0072f1dffedf5mr6999117ejc.391.1659208869899;
        Sat, 30 Jul 2022 12:21:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id i13-20020a056402054d00b0043ca6fb7e7dsm4158626edx.68.2022.07.30.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:21:09 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:21:07 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: vt6655: Convert macro
 MACvDisableBarkerPreambleMd
Message-ID: <e5bc3828530d711496368a3bfed34e75fdb65887.1659192760.git.philipp.g.hortmann@gmail.com>
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

Convert macro MACvDisableBarkerPreambleMd to static function which calls
the common static function vt6655_mac_en_dis_bits_u32_reg. This saves
codelines and multiline macros are not liked by kernel community.
Function name is also changed to avoid CamelCase which is not accepted
by checkpatch.pl and to clean up namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 7 ++++++-
 drivers/staging/vt6655/mac.h         | 8 --------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 5ca8a302011d..6efa79e8a651 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -243,6 +243,11 @@ static void vt6655_mac_en_barker_preamble_md(void __iomem *iobase)
 	vt6655_mac_en_dis_bits_u32_reg(iobase, ENABLE, ENCFG_BARKERPREAM);
 }
 
+static void vt6655_mac_dis_barker_preamble_md(void __iomem *iobase)
+{
+	vt6655_mac_en_dis_bits_u32_reg(iobase, DISABLE, ENCFG_BARKERPREAM);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
@@ -1481,7 +1486,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 			vt6655_mac_en_barker_preamble_md(priv->port_offset);
 			priv->preamble_type = true;
 		} else {
-			MACvDisableBarkerPreambleMd(priv->port_offset);
+			vt6655_mac_dis_barker_preamble_md(priv->port_offset);
 			priv->preamble_type = false;
 		}
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index fd95f49aa739..012388bf8d3b 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -546,14 +546,6 @@
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

