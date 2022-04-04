Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489F28F3
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 20:49:11 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g22so12597881edz.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HHEmg+fr5p/zbKaGECq76obXrCQuZc+PpCxxd81H4xU=;
        b=Cz54hptYqES688DjAAbK5czO5dvQwJXWybrVQUz2Hjpdayu4G9M+aKsH7cxy9316PJ
         U5WPwk6AVeK1i6n+mfHJ3fgkI3nDdpE09BI+O7d0ohSkx5ulHnWgLYlfzYqfjcMWndct
         Qj95V8Zo9hVqxFJ67G54ZJb3yXKA+AEF1+3RkEDPoG6NXkNxORQgUkf45FAOOcMVjnbT
         sDxvb6XKnn+mzi1/lmklPLH/oUCf3qaXfeTzlDdq3UZ8IcGBMoX5LBX7CR+gOhoUZNEa
         R9QYqtUVG7z11/VyDetgl3jWUS44DonGWFnopeCzI7rRvluX24Axc783zpChiPtMwUse
         qUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HHEmg+fr5p/zbKaGECq76obXrCQuZc+PpCxxd81H4xU=;
        b=fOF3PE4hv/ANY1abVNlU6akwg5y9r3V2zKlWUWf3ISUF2CD8WpjNEPsz3COcCo/LN2
         giUfPezRvFdPSysWZhxbplmO2eWUDfUhKF88z4tzntrwQuCQdicAT2JmdfEnBCKD8gI2
         JCwoW4q+FPY3WvKyKLkRT8QXFax9PkaswyFfjXl+1ipjOF37RjtklkcfqHGCDuXkewbD
         h0DP3D4sku5JQOAM5It+YJ/qE/C5NhvBUiB3tU4XkFOicpvd8UnRK32/kcZbpYIJ/+Ja
         QW/8eeHBLQw5UbEeHk7j+igrkLmlIRGVnSSR/83PeCBDf5hjX+XV7EOO1aOmgXSASzUY
         kySA==
X-Gm-Message-State: AOAM532Pc68PN4NoykxSuh6il65FYiisS9VcCjZoirFGxH7pvWar/xYF
	SVhwf4QTsN1wRXoafq+Wtr8=
X-Google-Smtp-Source: ABdhPJzb0rUG+QU53FfEw54N6apRT/DD8Nwd8qgh5DuPSeWrgOt5+lJkNPBtiQ8TL7lv8frvx1EFLg==
X-Received: by 2002:a05:6402:4248:b0:419:4583:eaa2 with SMTP id g8-20020a056402424800b004194583eaa2mr3706edb.376.1649105349707;
        Mon, 04 Apr 2022 13:49:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id p14-20020a05640210ce00b00413211746d4sm5799012edu.51.2022.04.04.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:49:05 -0700 (PDT)
Date: Mon, 4 Apr 2022 22:49:04 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] staging: vt6655: Remove macro PCAvDelayByIO
Message-ID: <af62ac8613e7c8ee236572d46137e8e202abf446.1649103348.git.philipp.g.hortmann@gmail.com>
References: <cover.1649103348.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1649103348.git.philipp.g.hortmann@gmail.com>

Remove do-while(0) and CamelCase macro PCAvDelayByIO as
it is not accepted by checkpatch.pl
As the macro is just used once with a constant <= 50 the
functionality of the macro is implemented by using
udelay() directly.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Changed converting macro to function to delete macro
          This patch was 7/7 and is now 6/6
---
 drivers/staging/vt6655/srom.c |  2 +-
 drivers/staging/vt6655/upc.h  | 13 -------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index 1612c9702e31..2719046f1ac0 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -80,7 +80,7 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
 			VNS_IN_PORTB(iobase + MAC_REG_I2MCSR, &byWait);
 			if (byWait & (I2MCSR_DONE | I2MCSR_NACK))
 				break;
-			PCAvDelayByIO(CB_DELAY_LOOP_WAIT);
+			udelay(CB_DELAY_LOOP_WAIT);
 		}
 		if ((wDelay < W_MAX_TIMEOUT) &&
 		    (!(byWait & I2MCSR_NACK))) {
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

