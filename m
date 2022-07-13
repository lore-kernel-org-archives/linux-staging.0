Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0EB15A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:01:30 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id mf4so16672511ejc.3
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nZkAZqKnI9+H1H1kAWgcyuU85x37ne0/76d0ZYb5OL0=;
        b=Dj3JbH0fpr01t2rsa0FSL/y1PKwqvge/1F6UWBZXpXNfWEoz7J1X2v38H27Binop/q
         3F3wjp/aG+ssIPcwgvlPDEq3p6HbU7BN5OhDnDDDT+xEv5bHK97LQZDrThAD9cQna0qA
         9i0mYxhDmQ56tAaBB3pippqIvHVSi5UuC0roWAqdXLCS2O7yEe1mbSqFGqNAg2KlGap0
         aFGKs39hla2GMo+/EPt3XdpEzh1OS2h9WE1ago0uTbKiHuGRAN1wnq+JDxsu3oQWzUeJ
         rSC9YrDwfVmtTOkteD3Iho3TTBgxPkc864a8PPFQ8DGEPIWK+yzhkCoHKJhxOyamaRHH
         TSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nZkAZqKnI9+H1H1kAWgcyuU85x37ne0/76d0ZYb5OL0=;
        b=bMeiNZi1YM+UWJIWu3lwbhyyvRDLEeXOxYoFrGmOvLNldOkMX4D5dbVMpus+7hMzU0
         +PJ0mfGGOeQ5u1HBQaQHFztwfnulRcsxD/PLsQbcIZ1zhTO2CE5xRpokvGkHf5lIuxux
         3PBWD12SK9p/l9fA5DsEXchSxmJL6w8JKTf+ZLU1CpPhY7mc/RWyZHFUfUZBYWwTjKpD
         5vhoTJhati9jxozG5Xdu7CKITboPOyqe04A5plAH+l/D/d6IwVIZx4v/+mFXoSwnEvxo
         o4AdlYy5xmmEv3Gf3RwBZlUPhDNHO53E4J3fYYffDyfpswH/bcPyK/Aqo3lds9nFywvu
         hjJQ==
X-Gm-Message-State: AJIora8RBfg/MRoSociX2dpJOzKvFaiq/huAEg1tkdBmzlB19O88e7m3
	dsW3pkFL0r4uBMdwFbQZJUw=
X-Google-Smtp-Source: AGRyM1vt3+7GVjLQGpvstKyT4RfoRLldDpGOC/Eq4sMB6Gg3peL4p0eGi8qYIXbHVmoFFN92yQYzLw==
X-Received: by 2002:a17:906:58cf:b0:722:e4e1:c174 with SMTP id e15-20020a17090658cf00b00722e4e1c174mr1522888ejs.85.1657688488786;
        Tue, 12 Jul 2022 22:01:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id kz1-20020a17090777c100b0072b565507c5sm2870066ejc.203.2022.07.12.22.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:01:28 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:01:26 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] staging: vt6655: Convert macro vt6655_mac_reg_bits_on
 to function
Message-ID: <6b23869ec13b35359b135f005a81f3ed50e5801e.1657657918.git.philipp.g.hortmann@gmail.com>
References: <cover.1657657918.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657657918.git.philipp.g.hortmann@gmail.com>

Convert macro vt6655_mac_reg_bits_on to function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 8 ++++++++
 drivers/staging/vt6655/mac.h | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 688f7c685c97..902034a28c6c 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -38,6 +38,14 @@
 
 #include "mac.h"
 
+void vt6655_mac_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask)
+{
+	unsigned char reg_value;
+
+	reg_value = ioread8(iobase + reg_offset);
+	iowrite8(reg_value | bit_mask, iobase + reg_offset);
+}
+
 /*
  * Description:
  *      Test if all test bits off
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 4d328b724559..031316d42dba 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,13 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define vt6655_mac_reg_bits_on(iobase, reg_offset, bit_mask)		\
-do {									\
-	unsigned char reg_value;					\
-	reg_value = ioread8(iobase + reg_offset);			\
-	iowrite8(reg_value | (bit_mask), iobase + reg_offset);		\
-} while (0)
-
 #define vt6655_mac_word_reg_bits_on(iobase, reg_offset, bit_mask)	\
 do {									\
 	unsigned short reg_value;					\
@@ -666,6 +659,7 @@ do {									\
 #define MAKEWORD(lb, hb) \
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
 
+void vt6655_mac_reg_bits_on(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
 bool MACbIsRegBitsOff(struct vnt_private *priv, unsigned char byRegOfs,
 		      unsigned char byTestBits);
 
-- 
2.37.0

