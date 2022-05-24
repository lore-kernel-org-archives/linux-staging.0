Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C0A7C
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 11:52:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: benjamin.gaignard)
	with ESMTPSA id 77A331F43D78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653393142;
	bh=ALAqMrfW8Y9IKBszQmPYt8RTPIp0NQCV0UbgRyOpuc8=;
	h=From:To:Cc:Subject:Date:From;
	b=Om7aAl9CKiGbjRYF0vV47sdFVmoVIiOOnYKWD51j3BX5Qu3kJo7s/lVW6dP9PKjyH
	 0Ht6OZx34gUywRVmJyhQHZEDF+3tTT0syN+Q8KF9TS8XwTQYSbJHjpIZGoKRDzUUkE
	 Q3WHA3UkZsmYSP0rDUFRExKUbERFxXE8PI+CE9CpzJhe3zQxvj5TsPR1Oci/mksQU5
	 0Ppgf5/sO0uRM7ZrZMdNYy9lM4rYJ4+IKojoZMQ6vc+4HSZxIeIkWEbiagiR5mXj/K
	 F4nnJc9osgWPUOPjUuScs4TJMjPO3DV5tvKhppwhu4R9XgWkZE67rsaZ+BZ42JV7BJ
	 mDxFgBJZRFBxA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: Hantro: Correct G2 init qp field
Date: Tue, 24 May 2022 13:52:12 +0200
Message-Id: <20220524115212.2284908-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation said that g2 init_qp field use bits 24 to 30 of
the 8th register.
Change the field mask to be able to set 7 bits and not only 6 of them.

Conformance test INITQP_B_Main10_Sony_1 decoding is OK with this
patch.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
With this patch and the patches needed for 10-bit support
Fluster HEVC score is 138/147

 drivers/staging/media/hantro/hantro_g2_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index 877d663a8181..82606783591a 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -107,7 +107,7 @@
 
 #define g2_start_code_e		G2_DEC_REG(10, 31, 0x1)
 #define g2_init_qp_old		G2_DEC_REG(10, 25, 0x3f)
-#define g2_init_qp		G2_DEC_REG(10, 24, 0x3f)
+#define g2_init_qp		G2_DEC_REG(10, 24, 0x7f)
 #define g2_num_tile_cols_old	G2_DEC_REG(10, 20, 0x1f)
 #define g2_num_tile_cols	G2_DEC_REG(10, 19, 0x1f)
 #define g2_num_tile_rows_old	G2_DEC_REG(10, 15, 0x1f)
-- 
2.32.0

