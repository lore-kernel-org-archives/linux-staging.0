Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC63D98
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:21:00 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r4so1582386edi.8
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=4v6G96QLARZg9Gc1XZ9O/US7Fz7qZojxFxMbsbdJjOE=;
        b=oT1Kb8Qq6N4PoqN+E5kGFBAEBb3rtv0Q0UeRxVyO5fOGzHEY7J7nstvQxuCLUCNm/j
         WoxndF1Hgcrb5IwLf5CL8rKvtm2f95kdzRLLXl4VMf4zJ1pcHzv9d+24PEEfvkxe+Ekz
         Tyx867xQ5ODWXvpi8JNSJjYvqZhxlcMR4wu57M4eXjIHvCssNE+Q/B3KbOgVvT5xPB22
         dSH5URXLFFsMaJ2ieu3nudxvFR+jbx7ozzC6ci2MzwjsXqxl20fcusvKSXVCtkon5HNi
         FfQKukDG+RZcTYmNj+NbfkgKtJtDpIHnm+UmUPDv6WwRm3OQiCgY8U9kAc7plgNnh9vd
         cYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=4v6G96QLARZg9Gc1XZ9O/US7Fz7qZojxFxMbsbdJjOE=;
        b=dnBlghye6OO03Yx0lAwclLt+K/2gYvhEMJrI5GxysXRYN/0nXhfRfEoEpOyMXI/v23
         iNpFwziHYKwc+4BlfxEIhODuky9KcbUsctPWkJVt8xjKH9FzuqxxIyr/OQ4HDKk6wTiq
         Jvr5CQ9v1rexeK7rz0nKOAtEfqwAhrzEMuom0MADqb4XhAupUs4xnuqLX1u8xapQFSpa
         wDP59ba5dZ00dqJZrKyFmfOPdjl4BPBzrJ1d5CzAs6WII4GuOIjpIVKrV7UR6npn9HrU
         nqxL3iHXoPD/YxWqlY/Yw4effKmYtB6xzJP8clFBNJbUs1qTzAwxH25v8PpuNeN/waR2
         PEAg==
X-Gm-Message-State: AJIora/7QrCbCrcDmeeLMc4rrWtHAIZXv5F2ADzix7YjAJarWaDGr9VU
	3yWcfqr0gwWrtmklMoto9rY=
X-Google-Smtp-Source: AGRyM1ueTOKOuajFpMX31cpAHT/xoy+XzF/4fXzVbSz/fiMWxuzc5vlDSK3B+7ic188peIADaxrkxQ==
X-Received: by 2002:a05:6402:2d1:b0:43c:bb20:71bf with SMTP id b17-20020a05640202d100b0043cbb2071bfmr8807498edx.59.1659208859109;
        Sat, 30 Jul 2022 12:20:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id l4-20020a170906078400b00730453877b1sm1254537ejc.217.2022.07.30.12.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:20:58 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:20:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: vt6655: Convert macro MACvEnableBarkerPreambleMd
Message-ID: <dcd4209a52e9626bd552508372041dd502f3513e.1659192760.git.philipp.g.hortmann@gmail.com>
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

Convert macro MACvEnableBarkerPreambleMd to static function which calls
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
index c09d80effc3f..5ca8a302011d 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -238,6 +238,11 @@ static void vt6655_mac_dis_protect_md(void __iomem *iobase)
 	vt6655_mac_en_dis_bits_u32_reg(iobase, DISABLE, ENCFG_PROTECTMD);
 }
 
+static void vt6655_mac_en_barker_preamble_md(void __iomem *iobase)
+{
+	vt6655_mac_en_dis_bits_u32_reg(iobase, ENABLE, ENCFG_BARKERPREAM);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
@@ -1473,7 +1478,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_PREAMBLE) {
 		if (conf->use_short_preamble) {
-			MACvEnableBarkerPreambleMd(priv->port_offset);
+			vt6655_mac_en_barker_preamble_md(priv->port_offset);
 			priv->preamble_type = true;
 		} else {
 			MACvDisableBarkerPreambleMd(priv->port_offset);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 3a9721624cff..fd95f49aa739 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -546,14 +546,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvEnableBarkerPreambleMd(iobase)				\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue | ENCFG_BARKERPREAM;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvDisableBarkerPreambleMd(iobase)				\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.37.1

