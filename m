Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB57A
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 07:29:53 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id pv16so10255789ejb.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GQIynQ3bcr2B2Ezgs0ZsVUHSLQcz4dHVvcopVnG+tyE=;
        b=QD1SWZVErB3vqYcXw/ZCfyN4gLad2PktALbBk2X8iiJKOEupoptF3Lxf3rx/yr+sOY
         7jzkwvya/qORHs1Crk9jVLFbPHHeNuDthdVDuGuW27JGgtB151KXXL3aFcZMuWT689cW
         24xt8uWIV1yCjmSwNuw7QOuj+4WR9c3dbFuxRfP8a+mswcirtIZZpiwzU6h7SvR4OuAL
         6P/ywHRlbSRp/bCthL/itKDB+2p27Q9orJDvR/3GbaU9SXee2QLHycgwNQ1Mtm0Oy/Vh
         SmxNszRBZ6mOg03VP+pAvIavIPLQMxsCH/kNxczrd/geX2gXCFa0R7IJ+irnWbaAuTr2
         5XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GQIynQ3bcr2B2Ezgs0ZsVUHSLQcz4dHVvcopVnG+tyE=;
        b=kLCD2YyBFDuxj/WSOvS3qm1ubYpgIos1wD33H2DEPVYC3/NJIEUEQAeJIW00u/zBTs
         0Fxr/hMcaC5nmT2paX/wDCYr6yxcv9QHAczboMAXrkoTWNODDf0uErOaCNL/O6XzU55k
         lk7nOzlv9XhlZ9F9KMrTQwym5lXxHLeuPSaTHK8nepF7FhXja2xyfF/Q1NfbDh1UHhTS
         HwFzaM64FZlS98YCb5jae4FCKYZP3/ABoyoLSWvy8NFlgWfr0YNadtzT8T89D9gIiV4s
         UBZlRiQhMu6SCjqKNPSjG/CpEA0soI9K+kSszwOgJC3eekovRLiI4WcJu/ZN4OEGoU/U
         P/7g==
X-Gm-Message-State: AOAM533b+PwqUxsHQA/orpiQUd4SUC3u59CJ6B5W+rvpIRzbYrp9p2N8
	mEO7JE1z1xl6Je8V+rqMOw4=
X-Google-Smtp-Source: ABdhPJwPCRB53/y4teq4/3Q59TCXEeANxyoBE5/hQoHZfLgq1iPRvzkiFI0BeNWHfyax77j+lSF3Ow==
X-Received: by 2002:a17:906:8a6d:b0:6e0:68ac:7197 with SMTP id hy13-20020a1709068a6d00b006e068ac7197mr2996202ejc.703.1648884592132;
        Sat, 02 Apr 2022 00:29:52 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b0041952a1a764sm2114882edd.33.2022.04.02.00.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 00:29:51 -0700 (PDT)
Date: Sat, 2 Apr 2022 09:29:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: vt6655: Convert macro PCAvDelayByIO to function
Message-ID: <b7551e92f42d60ff3bb74b5e28467f09781e3d06.1648882847.git.philipp.g.hortmann@gmail.com>
References: <cover.1648882847.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1648882847.git.philipp.g.hortmann@gmail.com>

Convert do-while(0) macro PCAvDelayByIO to function and relocate.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/srom.c | 13 +++++++++++++
 drivers/staging/vt6655/srom.h |  2 ++
 drivers/staging/vt6655/upc.h  | 13 -------------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index 1612c9702e31..8373aa783d76 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -139,3 +139,16 @@ void SROMvReadEtherAddress(void __iomem *iobase,
 		pbyEtherAddress++;
 	}
 }
+
+void PCAvDelayByIO(unsigned char u_delay_unit)
+{
+	unsigned char data;
+	unsigned long ii;
+
+	if (u_delay_unit <= 50) {
+		udelay(u_delay_unit);
+	} else {
+		for (ii = 0; ii < (u_delay_unit); ii++)
+			data = inb(0x61);
+	}
+}
diff --git a/drivers/staging/vt6655/srom.h b/drivers/staging/vt6655/srom.h
index b03073ffa18a..c34523c77d02 100644
--- a/drivers/staging/vt6655/srom.h
+++ b/drivers/staging/vt6655/srom.h
@@ -82,4 +82,6 @@ void SROMvReadAllContents(void __iomem *iobase, unsigned char *pbyEepromRegs);
 void SROMvReadEtherAddress(void __iomem *iobase,
 			   unsigned char *pbyEtherAddress);
 
+void PCAvDelayByIO(unsigned char u_delay_unit);
+
 #endif /* __EEPROM_H__*/
diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index 7d5075ec3162..05e0cf2e7d97 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -38,19 +38,6 @@
 #define VNS_OUT_PORTD(io_address, data) \
 	iowrite32((u32)(data), io_address)
 
-#define PCAvDelayByIO(u_delay_unit)				\
-do {								\
-	unsigned char __maybe_unused data;			\
-	unsigned long ii;					\
-								\
-	if (u_delay_unit <= 50) {					\
-		udelay(u_delay_unit);				\
-	} else {						\
-		for (ii = 0; ii < (u_delay_unit); ii++)		\
-			data = inb(0x61);			\
-	}							\
-} while (0)
-
 /*---------------------  Export Classes  ----------------------------*/
 
 /*---------------------  Export Variables  --------------------------*/
-- 
2.25.1

