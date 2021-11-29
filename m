Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211A2C9C;
	Mon, 29 Nov 2021 18:26:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u1so38778602wru.13;
        Mon, 29 Nov 2021 10:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfAAyurwbMN8Wc59AsqGd+iq2BYgkQGpfgJfPJ1lW7c=;
        b=fLt2iFzUdSChTr/aTeldb9kjU60F46BE43DvUyjznt5ELtiK96hsZ10RUuslx7bqEb
         u5FmjI/zZ/xHZjKI/lmTzGK4k3SyK54Y7j38OxNHM7VblYS7ywAr3YVumRiMD/AIAQPE
         nB+fyJlmBmpoF1/ADF6MZWDNHkCy5Hm+3pcAMST4d6R4G/4IcR8UixVxZ5IY7sLAXa7S
         wqbP/SLYIbLM1QrCuto14PR9h+qNVTlpYcpXYUYC3xB7sGryPv15sGDUW4LbUfMcztC4
         Omb4ABKSnHumX/cCIICxETDIinB1++F0Sjkzx69/BMR9IExepaUYrNxJUO0TaIaZilfz
         lH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfAAyurwbMN8Wc59AsqGd+iq2BYgkQGpfgJfPJ1lW7c=;
        b=2/Q38d55XpI39Yuf+S0XVyvjx/sT4iQOf5V5uP6FNPS05apuW4AalUfpfvlbl9CBId
         iakQoVeeptzIgyLpYqGq4Ekq9ykOyI+vXBnctWC3T7gfaeflXsaJH3gzeQ36QEeHsdOK
         huMKNo9g9Ox4C9UskJ4i0RImYN/q+ydjO2fyBWxY4ZJlitGrvsHJXry0C1HXMsyFM3JL
         9aAzIe+uJC/6CcoghSkGfNtgdP/2tgoFrViq9vN3AoIR5krmIu2EQRwONENgD/Pa0ZRO
         PmWrEHg6apRi0rduG+MpYZb4ZWGIEyD8A0frIX33RK2iFS0vh6fEgxmcGreSY4ez9ImI
         X/OA==
X-Gm-Message-State: AOAM532xD+okvpuL2tVJk/MgLrU6iO2+jRbookTCWQV3FX63ADvx+D2U
	9qvQdlmwGK978NnUEUg0lSk=
X-Google-Smtp-Source: ABdhPJzfTwh2g5WVNC332WqhJS6YiHqknDrm94kLGyptSuUtiKwlqNGHB6BzHGMR2MpBNhVitm8PBg==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr37291036wrd.105.1638210406497;
        Mon, 29 Nov 2021 10:26:46 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o12sm85907wmq.12.2021.11.29.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:26:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	nicolas.dufresne@collabora.com,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	p.zabel@pengutronix.de,
	andrzej.p@collabora.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 6/9] media: hantro: Convert imx8m_vpu_g2_irq to helper
Date: Mon, 29 Nov 2021 19:26:30 +0100
Message-Id: <20211129182633.480021-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129182633.480021-1-jernej.skrabec@gmail.com>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that imx8m_vpu_g2_irq() doesn't depend on any platform
specifics and can be used with other G2 platform drivers too.

Move it to common code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_g2.c    | 18 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h    |  1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 20 +-------------------
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2.c b/drivers/staging/media/hantro/hantro_g2.c
index 6f3e1f797f83..ee5f14c5f8f2 100644
--- a/drivers/staging/media/hantro/hantro_g2.c
+++ b/drivers/staging/media/hantro/hantro_g2.c
@@ -24,3 +24,21 @@ void hantro_g2_check_idle(struct hantro_dev *vpu)
 		}
 	}
 }
+
+irqreturn_t hantro_g2_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, G2_REG_INTERRUPT);
+	state = (status & G2_REG_INTERRUPT_DEC_RDY_INT) ?
+		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, G2_REG_INTERRUPT);
+	vdpu_write(vpu, G2_REG_CONFIG_DEC_CLK_GATE_E, G2_REG_CONFIG);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index dbe51303724b..c33b1f5df37b 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -413,5 +413,6 @@ void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx);
 int hantro_vp9_dec_init(struct hantro_ctx *ctx);
 void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
 void hantro_g2_check_idle(struct hantro_dev *vpu);
+irqreturn_t hantro_g2_irq(int irq, void *dev_id);
 
 #endif /* HANTRO_HW_H_ */
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 1a43f6fceef9..f5991b8e553a 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -191,24 +191,6 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t imx8m_vpu_g2_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, G2_REG_INTERRUPT);
-	state = (status & G2_REG_INTERRUPT_DEC_RDY_INT) ?
-		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, G2_REG_INTERRUPT);
-	vdpu_write(vpu, G2_REG_CONFIG_DEC_CLK_GATE_E, G2_REG_CONFIG);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
@@ -280,7 +262,7 @@ static const struct hantro_irq imx8mq_irqs[] = {
 };
 
 static const struct hantro_irq imx8mq_g2_irqs[] = {
-	{ "g2", imx8m_vpu_g2_irq },
+	{ "g2", hantro_g2_irq },
 };
 
 static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
-- 
2.34.1

