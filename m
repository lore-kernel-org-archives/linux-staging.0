Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9DD2906
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 22:20:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id y8so13093511eda.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=En7+TVW64zRoyWuupOH6lOq4ewhG8jBuFQhAW9bo4EA=;
        b=LGJfl36f2O5Bm4X8ngpgpR0b/dXKh54Pz+lSzrGO2ewRUh7MXkdn+lHpICU07SeFPr
         ka8Cr/uDsKpZsxiW+vXyqCLKN0dw4PGJ3kSR0AWJEcR+zqclLPu/c/byO73dnFCtwqra
         BGtMAT+o7NgoWvqopCgPoarEVOPxJ/kc/g4RYa4djeNVRziKAFxBze1q512kbmOJ1AIr
         aNFclHjg86p+9V7XIrYfAmdtuoQcuI1KED1zngJDJqP72eG3ONd+NrYPiJ4Ct6h6ksaL
         etp9pgDwoGzalpuwh++xHmpB/kxCnEqjT+ydvqJo+z2MLJTJ2zijSH+ek2ZubnIOGQSU
         GIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=En7+TVW64zRoyWuupOH6lOq4ewhG8jBuFQhAW9bo4EA=;
        b=h3ab0qUbLNRH/DSOyN92FLrK/TNs1io2RPp6leqV5FCSlNJTeLQIegv7a9IS2NnpkH
         /K9Xu6I5MI6O5s0pjQhwSFaN9kOOoyzJY+x9i1owr85saE0wZILpPs3AJeESmgtAJ0OS
         szgw0YUTUmvtLakY8GHucKX/OE0Za5B0Q9JNHno0TIGWS9P1a488CjPyJv925oVaSiV6
         guWh/LIHqn9Mx1SBB1+DJvgmfuU2tVjhgGHsuGu1gicUQawiSj/Te6W7zo+ZOdGQsajo
         Z3qfnw89qmJQnCeb026jx5BZWjMX7KBmS8r+8x+O91rTr6WVyqq0RuxmICP5qMbTOCsx
         DVoA==
X-Gm-Message-State: AJIora8tGnPeg982nVgRO5ZnoTkNj+cDQLaQGb40nmTzdg7kr7Px9qlb
	Np2FFn2ySEsCfE35FJ2sBg0=
X-Google-Smtp-Source: AGRyM1v9KGKOcZUbjxT7wvkb7MznOd2X7KF/hzjNuGyZ6AHfv3jmJsA5tpyoOmW97+uameJct4uwnA==
X-Received: by 2002:a05:6402:3689:b0:43a:7c1c:8960 with SMTP id ej9-20020a056402368900b0043a7c1c8960mr32930306edb.79.1658096419075;
        Sun, 17 Jul 2022 15:20:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id le20-20020a170906ae1400b00724261b592esm4723424ejb.186.2022.07.17.15.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 15:20:18 -0700 (PDT)
Date: Mon, 18 Jul 2022 00:20:16 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: vt6655: Convert macro vt6655_mac_dma_ctl to
 function
Message-ID: <d28553a4909dbe073237c779c2b234c59883256c.1658094708.git.philipp.g.hortmann@gmail.com>
References: <cover.1658094708.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658094708.git.philipp.g.hortmann@gmail.com>

Convert macro vt6655_mac_dma_ctl to function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 13 +++++++++++++
 drivers/staging/vt6655/mac.h         | 10 ----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6525b7baf644..cf25644f8671 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -125,6 +125,8 @@ static void device_print_info(struct vnt_private *priv);
 static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr);
 static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr);
 
+static void vt6655_mac_dma_ctl(void __iomem *iobase);
+
 static int device_init_rd0_ring(struct vnt_private *priv);
 static int device_init_rd1_ring(struct vnt_private *priv);
 static int device_init_td0_ring(struct vnt_private *priv);
@@ -205,6 +207,17 @@ static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr)
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
+static void vt6655_mac_dma_ctl(void __iomem *iobase)
+{
+	unsigned long reg_value;
+
+	reg_value = ioread32(iobase + MAC_REG_RXDMACTL0);
+	if (reg_value & DMACTL_RUN)
+		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);
+	else
+		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 60e0f980bcc5..5747de436911 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,16 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define vt6655_mac_dma_ctl(iobase)					\
-do {									\
-	unsigned long reg_value;					\
-	reg_value = ioread32(iobase + MAC_REG_RXDMACTL0);		\
-	if (reg_value & DMACTL_RUN)					\
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);	\
-	else								\
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);	\
-} while (0)
-
 #define MACvReceive1(iobase)						\
 do {									\
 	unsigned long reg_value;					\
-- 
2.37.1

