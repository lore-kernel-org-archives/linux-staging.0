Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1A3C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:13:36 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id m4so12899851ejr.3
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=AN1zVwKUXEz2V3Gkaa20oR+ncHTmapAurqeiNEnFlvE=;
        b=psqh4H1CDUWrtpWNIaieHeb4g77hr/WG3ZPjvz/nmEuWgZ7+zCtqiXOTu98qQeeW68
         8F7ay7GI+/UqaOyqucKP3J9dRnM4/g+CeogJj+EOcAXRKFirCS0gSTgpRglXPy/E97sV
         kcajyrljmxc/IrhCKl+N9qMP99ImnE70YVKr3IKYqKf8x3NSyjPh2amOtYSYDk5g9Fut
         sfQB7i5yukmLkBwvWb25MBvzLsz6Z5N1TO9KFAKLBnSDZsSGHidP/kPMuF6AJfq8svdr
         c8/MLhFbIm6m87be3MvgW2hdJnuBErEBczQ10xwWVmDoOa3Jwo++WAifjUkP5nl7Vqo1
         hl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=AN1zVwKUXEz2V3Gkaa20oR+ncHTmapAurqeiNEnFlvE=;
        b=V0Ts+J583ItR0cOACkKbBhAfzuoZzfgwRwN/NXwvf5xX5Cqbxk0f05hrkGfuA5qjwl
         r7jux162CPi0LvsYfn9NT6Q5gZApIdQ8i8vn8pYBNMbfBvO0gHSzM7F4pmJOJL+31WAF
         wl4RvAodYSWNr6l8q8lZQZ9uxuhOj31VWzkqKTAwufEtDqYii5DtOEN2/cuf+Om4tvG1
         OvmcCy+FCNOQr5rj3bxDQp739LVSig0dsmpsbNf3h2/MuF9CmKmiLc0ta3T/VZd3el4p
         VmEEMC303eMT5+INMefgLAX7uUJQiui4RVzoYabufFnwLB6DTO1Br2S+PGqNbggT0DLo
         cRjQ==
X-Gm-Message-State: ACgBeo2N34955Hwe4wyXz/5af0VQ76Z1at7gQMJqX49HKSTsbC5m9Zi9
	YfiJ/I90tYfJ4FvxrMEehYU=
X-Google-Smtp-Source: AA6agR7JjLX0OtZogUv+gm0tyk8HgnyPc/CVtzUJs04tXoMd7OhARgwKPDQLbnboZcpjFJfIjt5bAg==
X-Received: by 2002:a17:907:720a:b0:72b:549e:305a with SMTP id dr10-20020a170907720a00b0072b549e305amr11111101ejc.691.1659896015249;
        Sun, 07 Aug 2022 11:13:35 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0072ee7b51d9asm4082722eja.39.2022.08.07.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:13:34 -0700 (PDT)
Date: Sun, 7 Aug 2022 20:13:33 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] staging: vt6655: Convert macro MACvEnableProtectMD to
 function
Message-ID: <f3a5ec5352346f1dc4bf3afbee25973fdb47d7e4.1659892670.git.philipp.g.hortmann@gmail.com>
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

Convert macro to static function. Multiline macros are not liked by
kernel community. Rename variable dwOrgValue to reg_value to avoid
CamelCase which is not accepted by checkpatch.pl. Change variable
declaration to u32 as this improves readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: No changes
---
 drivers/staging/vt6655/device_main.c | 9 +++++++++
 drivers/staging/vt6655/mac.h         | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 8db655742bd4..ab6456fc2b3f 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -216,6 +216,15 @@ static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index)
 		iowrite32(DMACTL_RUN, iobase + reg_index);
 }
 
+static void MACvEnableProtectMD(void __iomem *iobase)
+{
+	u32 reg_value;
+
+	reg_value = ioread32(iobase + MAC_REG_ENCFG);
+	reg_value = reg_value | ENCFG_PROTECTMD;
+	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 467c599a3289..84d203c56b1f 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -543,14 +543,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvEnableProtectMD(iobase)					\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue | ENCFG_PROTECTMD;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvDisableProtectMD(iobase)					\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.37.1

