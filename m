Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91C670
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 13:36:38 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id o11so6206251qvh.11
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=HFLBwpH7bnJqRpBXV3LZM+eIf2wqGdsU526G+Z9OgrU=;
        b=XYLX8Shi4RLk9DI1jD3w47/7MIzpiCqHhzNKrsRsHFhrOJUs5vRtrHUcsOdB62p685
         71OM0XXU3JHwK6+0c6TP0I7twL1HiKLVTPK0mx+vJgq4K1P2urXIy7l+26wPMzIbZJgQ
         lNiCD7jlSiPq5AFhqgiXAzIzNaN7zYyNXsYI1dg7o8EP0hLNFwxTyUVrK1M34G9IiiXU
         wiS14CpnmH88v0InxYj9Vg6Fy3wEOqXj2qeb5vPpE1m+XIO4o4NBMlxaJq4uUccjWOfW
         Xe89ZEZ4gqLuGtU/7R3cvyTq1GTinSjYfX37pje+XWF3KRDp2HZGFN5bZvizL2Yxu/YL
         F/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=HFLBwpH7bnJqRpBXV3LZM+eIf2wqGdsU526G+Z9OgrU=;
        b=trqjl6wsET4Ot9SK6vf3R+KCHR0Z02zvG+n2CrF6QL4moWXTqcHGxSndLsqso7YwOr
         hjaTaDXH2h+/Ulqqzp1BnQFZXMsFRj+2jTI6qvAAsFXz4F/Tn9W5WMqOmxz9NkTz8H1j
         KX3cS8zd58KnWJ5mGxjTnQ9Yo8xjiDHAM/MB1n4t4/4AhYJfuL7i9b4tSM4CO/kq0wsB
         i1hQNRvAjhjB8T1FtZAg2I0izf/mDo8ixO6Rf8v25A39F+WWmi88wVj5esmsQyJbpGmA
         ne+B/WIOlpNddyEwM39H5j2gSHBraQQu1BJYUAzJ9A8Nq3a1IE8FXbpdntOEqY4fP/35
         mTxQ==
X-Gm-Message-State: AOAM531fxUzN7HlQQWELiirYv6WKoFxtzBQ3+jf4+CNUnC2U/4LsNjzl
	BCKD+0D5JiLQGHDZl8UiJkk=
X-Google-Smtp-Source: ABdhPJyhwqbpDxJEqURyhnTserSFuV7XnsTLZjpKfCPJMLXshFRaBPkg6pUAXHOyMEzrHjw9JCDIcQ==
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr9852472qvp.0.1618234597739;
        Mon, 12 Apr 2021 06:36:37 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id b15sm3419566qtg.82.2021.04.12.06.36.36
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 06:36:37 -0700 (PDT)
Date: Mon, 12 Apr 2021 10:36:34 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: omap4iss: Replace macro function by static
 inline function in file iss_csi2.c
Message-ID: <20210412133634.GA1791@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss_csi2.c | 49 ++++++++++++++++---------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index a6dc2d2..cbeba44 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -597,9 +597,12 @@ static int csi2_configure(struct iss_csi2_device *csi2)
 /*
  * csi2_print_status - Prints CSI2 debug information.
  */
-#define CSI2_PRINT_REGISTER(iss, regs, name)\
-	dev_dbg(iss->dev, "###CSI2 " #name "=0x%08x\n", \
-		iss_reg_read(iss, regs, CSI2_##name))
+static inline csi2_print_register(iss, regs, name)
+{
+	dev_dbg(iss->dev, "###CSI2 " #name "=0x%08x\n",
+		iss_reg_read(iss, regs, CSI2_##name));
+}
+
 
 static void csi2_print_status(struct iss_csi2_device *csi2)
 {
@@ -610,26 +613,26 @@ static void csi2_print_status(struct iss_csi2_device *csi2)
 
 	dev_dbg(iss->dev, "-------------CSI2 Register dump-------------\n");
 
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, SYSCONFIG);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, SYSSTATUS);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, IRQENABLE);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, IRQSTATUS);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTRL);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, DBG_H);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, COMPLEXIO_CFG);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, COMPLEXIO_IRQSTATUS);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, SHORT_PACKET);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, COMPLEXIO_IRQENABLE);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, DBG_P);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, TIMING);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_CTRL1(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_CTRL2(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_DAT_OFST(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_PING_ADDR(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_PONG_ADDR(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_IRQENABLE(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_IRQSTATUS(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_CTRL3(0));
+	csi2_print_register(iss, csi2->regs1, SYSCONFIG);
+	csi2_print_register(iss, csi2->regs1, SYSSTATUS);
+	csi2_print_register(iss, csi2->regs1, IRQENABLE);
+	csi2_print_register(iss, csi2->regs1, IRQSTATUS);
+	csi2_print_register(iss, csi2->regs1, CTRL);
+	csi2_print_register(iss, csi2->regs1, DBG_H);
+	csi2_print_register(iss, csi2->regs1, COMPLEXIO_CFG);
+	csi2_print_register(iss, csi2->regs1, COMPLEXIO_IRQSTATUS);
+	csi2_print_register(iss, csi2->regs1, SHORT_PACKET);
+	csi2_print_register(iss, csi2->regs1, COMPLEXIO_IRQENABLE);
+	csi2_print_register(iss, csi2->regs1, DBG_P);
+	csi2_print_register(iss, csi2->regs1, TIMING);
+	csi2_print_register(iss, csi2->regs1, CTX_CTRL1(0));
+	csi2_print_register(iss, csi2->regs1, CTX_CTRL2(0));
+	csi2_print_register(iss, csi2->regs1, CTX_DAT_OFST(0));
+	csi2_print_register(iss, csi2->regs1, CTX_PING_ADDR(0));
+	csi2_print_register(iss, csi2->regs1, CTX_PONG_ADDR(0));
+	csi2_print_register(iss, csi2->regs1, CTX_IRQENABLE(0));
+	csi2_print_register(iss, csi2->regs1, CTX_IRQSTATUS(0));
+	csi2_print_register(iss, csi2->regs1, CTX_CTRL3(0));
 
 	dev_dbg(iss->dev, "--------------------------------------------\n");
 }
-- 
2.7.4

