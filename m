Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67BB15A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:01:02 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l23so17844256ejr.5
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J60Rmir7dSGsldLQfgkvKBUxKvKSm5Gzr4J1SAOmK5U=;
        b=JX2G6QvdmHYEry9ztvQ0t9LMZSSolwIgpsrpzXtir81krUCl0IYMB1JiycXMrY8ylj
         Pl+pRHJytw4iP+Je/VpS810EJOEL1clBC3xYGEnrJwXBQgkmz4zpa8qbdCwAxBbtDeuN
         0jAkc9innJmuUqpIIgrL4RG5See3SyO7onALBWdfYf8+uabuoESL2a/+bFm4KdJAakj1
         zffwhAabqWd1XN4CNvtAhZBnmIbScc4ybJZByXxkuof+G1ForJLaf8qn1lX4t8dYPpD7
         BKiwZoYkV0ZWy2su0UbYR0yJ9tm0ML2yHosEgaYE+EKxXGsoYCxH9N+oTcs+CdXXCjYG
         e8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J60Rmir7dSGsldLQfgkvKBUxKvKSm5Gzr4J1SAOmK5U=;
        b=bylTpp0IFHxaZLgOpeokNjjLPjO8bywYubbzP9iwuM5We5/j/tq/EB/xgavdU22ywE
         DKxOQ3Bzo5902q2fghsheC3So1ZnVEwTlp0XTkSlfxWYdp+yZqFOev7p7bcZ7HpbvQKw
         I4eUHj5HLZz+UhgdelgdmCcnS2IV9Bolph+CuyUXbnesd8+Q/qPsmjjENPBd7rOlByFh
         qs0cPzrY3R5CKAwZDr+eD54ICio8xP5JUWT7RdpWPmiJz220ueZto/lBrZicefpRqcQn
         UK+N4L9xnPs9hEYzHp8r9RuP0C4LXZDHkvu0apH0/opM1ek0O7sPIc70tc2FbMDS4uJi
         S8QQ==
X-Gm-Message-State: AJIora+hamwv9jaUpX+JmJ4hXqGxh2W7dLMSXFoSUueJ99xpR+cN3mJ6
	qcI7VLSqeij3BA+CLTySdNs=
X-Google-Smtp-Source: AGRyM1vGQMK7US3OWpP6uHM586Znd8FlSDd2lLKAhBh28Hjc/P7dEV58L5WtlyewsCX1RQD4oR8Bqg==
X-Received: by 2002:a17:906:9b93:b0:72b:8fad:6cf8 with SMTP id dd19-20020a1709069b9300b0072b8fad6cf8mr1510599ejc.415.1657688461017;
        Tue, 12 Jul 2022 22:01:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906c29400b0072ae174cdd4sm4518015ejz.111.2022.07.12.22.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:01:00 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:00:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] staging: vt6655: Rename MACvWordRegBitsOff
Message-ID: <b8d4b72ddfdefb6b8a73fb95f6851e0f365118ba.1657657918.git.philipp.g.hortmann@gmail.com>
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

Fix name of a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 12 ++++++------
 drivers/staging/vt6655/mac.h  |  2 +-
 drivers/staging/vt6655/rf.c   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index ec70a1f611d4..846469cc06bb 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -352,18 +352,18 @@ void CARDbRadioPowerOff(struct vnt_private *priv)
 
 	switch (priv->byRFType) {
 	case RF_RFMD2959:
-		MACvWordRegBitsOff(priv->port_offset, MAC_REG_SOFTPWRCTL,
-				   SOFTPWRCTL_TXPEINV);
+		vt6655_mac_word_reg_bits_off(priv->port_offset, MAC_REG_SOFTPWRCTL,
+					     SOFTPWRCTL_TXPEINV);
 		vt6655_mac_word_reg_bits_on(priv->port_offset, MAC_REG_SOFTPWRCTL,
 					    SOFTPWRCTL_SWPE1);
 		break;
 
 	case RF_AIROHA:
 	case RF_AL2230S:
-		MACvWordRegBitsOff(priv->port_offset, MAC_REG_SOFTPWRCTL,
-				   SOFTPWRCTL_SWPE2);
-		MACvWordRegBitsOff(priv->port_offset, MAC_REG_SOFTPWRCTL,
-				   SOFTPWRCTL_SWPE3);
+		vt6655_mac_word_reg_bits_off(priv->port_offset, MAC_REG_SOFTPWRCTL,
+					     SOFTPWRCTL_SWPE2);
+		vt6655_mac_word_reg_bits_off(priv->port_offset, MAC_REG_SOFTPWRCTL,
+					     SOFTPWRCTL_SWPE3);
 		break;
 	}
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 16f2b77e1371..4d328b724559 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -558,7 +558,7 @@ do {									\
 	iowrite8(reg_value & ~(bit_mask), iobase + reg_offset);		\
 } while (0)
 
-#define MACvWordRegBitsOff(iobase, reg_offset, bit_mask)		\
+#define vt6655_mac_word_reg_bits_off(iobase, reg_offset, bit_mask)	\
 do {									\
 	unsigned short reg_value;					\
 	reg_value = ioread16(iobase + reg_offset);			\
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 6953afc0be34..1fadc2fc4412 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -212,7 +212,7 @@ static bool RFbAL2230Init(struct vnt_private *priv)
 	vt6655_mac_word_reg_bits_on(iobase, MAC_REG_SOFTPWRCTL,
 				    (SOFTPWRCTL_SWPECTI | SOFTPWRCTL_TXPEINV));
 	/* PLL  Off */
-	MACvWordRegBitsOff(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
+	vt6655_mac_word_reg_bits_off(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
 
 	/* patch abnormal AL2230 frequency output */
 	IFRFbWriteEmbedded(priv, (0x07168700 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW));
-- 
2.37.0

