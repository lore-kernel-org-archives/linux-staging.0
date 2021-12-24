Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9722C9D
	for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 08:43:22 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id v13so7313905pfi.3
        for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 00:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sV79zWvBxTOqiRZPPrLUHjZwFpDP1ZUgCFSQrPsf5D0=;
        b=BLVFhC+h53krTnpc+WG9bIg2JTuQleaJrdnZ5YXjAD3Ln3kK/uLw9Pt4feMO/A4CCQ
         g+9vSojwHSMRX29Sxqozsxs5oTBoXmGz0fDPBDyuNyhSxLKEvK7/Z14FTqYhgiwCZSr7
         RXx4T/BqM3kwo8PWegvZox7nbr48TjLAFPpfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sV79zWvBxTOqiRZPPrLUHjZwFpDP1ZUgCFSQrPsf5D0=;
        b=WZfrpsfv4MLyKI+Mn64ILAZGcnqY0pKYrFHUAFyleYsquo0hV/E5c6lwyCFlOu+3Rn
         FusO4qPD35lOmC/LlB6MG9GNyL+HTgYmNxilNf/vYY71KaHIl9BKHBRNhBsPH7Pnqcf9
         NhEZAFLBshG8Cc1Dqg0GOIYlJ3qz6hXFzNgL9ytzq8sm7mExIUJuAQZMb3ktLxJL+HkV
         jj7JwMa5ZyD4PVz0M21V0h9BUd1fn+ZZe3yB2Zpuk4HlBwBzkDyaOoaWEQYbJ4SsSqHL
         a0ALAfAt2nb0s5tXCTz4VtjVYDcp0LJVUpuRjepw9HeRgzWPRhNogmUcAIM+ghEA2b/D
         EvTQ==
X-Gm-Message-State: AOAM531cAQ5EE20tNBeesM/C8Xzcs3m12OISAoxCFcLBQWwkxYeIVJBR
	SwhvOvIhkTm3VCJ23YkLEajWTg==
X-Google-Smtp-Source: ABdhPJy3lka870xa8XlfbNt22sIwH0/xXExdqyGdWA4JxBQGedOAgCWjbfJVSbfkPnLbjyVrgC8Plg==
X-Received: by 2002:a05:6a00:21c8:b0:4a8:125:de32 with SMTP id t8-20020a056a0021c800b004a80125de32mr5969607pfj.49.1640335401680;
        Fri, 24 Dec 2021 00:43:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd40:cbd0:c42a:3c26])
        by smtp.gmail.com with ESMTPSA id p13sm436369pgl.23.2021.12.24.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:43:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT 2/7] media: hantro: Fix overfill bottom register field name
Date: Fri, 24 Dec 2021 16:42:43 +0800
Message-Id: <20211224084248.3070568-3-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211224084248.3070568-1-wenst@chromium.org>
References: <20211224084248.3070568-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hantro H1 hardware can crop off pixels from the right and bottom of
the source frame. These are controlled with the H1_REG_IN_IMG_CTRL_OVRFLB
and H1_REG_IN_IMG_CTRL_OVRFLR in the H1_REG_IN_IMG_CTRL register.

The ChromeOS kernel driver that this was based on incorrectly added the
_D4 suffix H1_REG_IN_IMG_CTRL_OVRFLB. This field crops the bottom of the
input frame, and the number is _not_ divided by 4. [1]

Correct the name to avoid confusion when crop support with the selection
API is added.

[1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/ \
	heads/chromeos-4.19/drivers/staging/media/hantro/hantro_h1_vp8_enc.c#377

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Fixes: a29add8c9bb2 ("media: rockchip/vpu: rename from rockchip to hantro")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c | 2 +-
 drivers/staging/media/hantro/hantro_h1_regs.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index 03db1c3444f8..96153c755fb8 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -23,7 +23,7 @@ static void hantro_h1_set_src_img_ctrl(struct hantro_dev *vpu,
 
 	reg = H1_REG_IN_IMG_CTRL_ROW_LEN(pix_fmt->width)
 		| H1_REG_IN_IMG_CTRL_OVRFLR_D4(0)
-		| H1_REG_IN_IMG_CTRL_OVRFLB_D4(0)
+		| H1_REG_IN_IMG_CTRL_OVRFLB(0)
 		| H1_REG_IN_IMG_CTRL_FMT(ctx->vpu_src_fmt->enc_fmt);
 	vepu_write_relaxed(vpu, reg, H1_REG_IN_IMG_CTRL);
 }
diff --git a/drivers/staging/media/hantro/hantro_h1_regs.h b/drivers/staging/media/hantro/hantro_h1_regs.h
index d6e9825bb5c7..30e7e7b920b5 100644
--- a/drivers/staging/media/hantro/hantro_h1_regs.h
+++ b/drivers/staging/media/hantro/hantro_h1_regs.h
@@ -47,7 +47,7 @@
 #define H1_REG_IN_IMG_CTRL				0x03c
 #define     H1_REG_IN_IMG_CTRL_ROW_LEN(x)		((x) << 12)
 #define     H1_REG_IN_IMG_CTRL_OVRFLR_D4(x)		((x) << 10)
-#define     H1_REG_IN_IMG_CTRL_OVRFLB_D4(x)		((x) << 6)
+#define     H1_REG_IN_IMG_CTRL_OVRFLB(x)		((x) << 6)
 #define     H1_REG_IN_IMG_CTRL_FMT(x)			((x) << 2)
 #define H1_REG_ENC_CTRL0				0x040
 #define    H1_REG_ENC_CTRL0_INIT_QP(x)			((x) << 26)
-- 
2.34.1.448.ga2b2bfdf31-goog

