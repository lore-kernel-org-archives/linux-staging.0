Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB873205;
	Mon, 20 Jun 2022 17:55:37 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id s1so15686088wra.9;
        Mon, 20 Jun 2022 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jAE816XO6VphxEuAFtyQWbCCtJPUMXYblVqNrF0iAD0=;
        b=EjeBvCJQTY+EP5xtkOeq06z4jqZO6QnTRjA0gabAPlGhSRDpNsrn1q+fWqg6VbQZCv
         D5JS7lnPYgCf+q8DOQpXVljhTT1WJMU6a4hdMh+2OdrTyWdrzFTo8GEhr936m4L10koo
         qdxV//MmmPL5IjwdwC06oF3I4YghZlM2Nlnp3jAi9/xDA21fucQrDANY51ICxGaMqFE5
         9lJmKXFfVr6JpVAxp1scG4VTtwKTroTUNk2T8qAmchLeVCqslJNw2U/vf4KiB60BeOrk
         pHsOn9RErSosIyP1azI/AUjFu6UgHfrweLf+d5yYlAI1ZbCz9pwH2q4quxKSXdzq+JAe
         WR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAE816XO6VphxEuAFtyQWbCCtJPUMXYblVqNrF0iAD0=;
        b=qEQfIc7NltKF2H/tFwynDSel5MIZU3ntVADqhMpTjqBR6Td9m/yhXAP2fNIUptXY1r
         M7DE4x8IL3kjkeIpceePTtywpgcCI+86mKXGcX9rf70cITfQAaynUs4shWaY4GR7b/I2
         XGTtv9kJNfpXQ1rp8QrosDXaAyxgTLwDep+2hm5H3klmtoPghjnZngmzqbbA4n+KVVud
         rvYSzfAQ//vTWCSYw31JmrR9aC7BD9lh96zlWq8pm89P8nqbTPB436+tbBe2BZL9fuES
         eag8Ln3N4IV3Mxv3vhmcSeObZ19//uq9BPoIb/E/SHUB7d/KFNWIIcI6h6rJRp2AgjKi
         OxVg==
X-Gm-Message-State: AJIora+fqPx80eyW7J6i7Vrw1Rk+crHnrsQXNWuwHznaR0wZ+dsFXvp6
	DVuFGD15QR5fKDDiQOkbiiT+hZf9o9g=
X-Google-Smtp-Source: AGRyM1uzYFeRmPExq2bdZPq2d3BODGUt8CJhpH6WPmqRMAMe3MzAwr61mxnFobDHbuDcKZ/xOE15MA==
X-Received: by 2002:adf:f7c7:0:b0:21b:9452:e8fe with SMTP id a7-20020adff7c7000000b0021b9452e8femr2386433wrq.640.1655747735690;
        Mon, 20 Jun 2022 10:55:35 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 184-20020a1c02c1000000b0039db31f6372sm19620752wmc.2.2022.06.20.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:55:35 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	samuel@sholland.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 5/7] media: cedrus: h265: Add a couple of error checks
Date: Mon, 20 Jun 2022 19:55:15 +0200
Message-Id: <20220620175517.648767-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620175517.648767-1-jernej.skrabec@gmail.com>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have infrastructure for reporting errors, let's add two
checks, which will make sure slice can be actually decoded.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index cfde4ccf6011..99020b9f9ff8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -435,9 +435,17 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	 * instead of start of slice data. Padding is 8 bits at most (one bit set to 1 and
 	 * at most seven bits set to 0), so we have to inspect only one byte before slice data.
 	 */
+
+	if (slice_params->data_byte_offset == 0)
+		return -EOPNOTSUPP;
+
 	padding = (u8 *)vb2_plane_vaddr(&run->src->vb2_buf, 0) +
 		slice_params->data_byte_offset - 1;
 
+	/* at least one bit must be set in that byte */
+	if (*padding == 0)
+		return -EINVAL;
+
 	for (count = 0; count < 8; count++)
 		if (*padding & (1 << count))
 			break;
-- 
2.36.1

