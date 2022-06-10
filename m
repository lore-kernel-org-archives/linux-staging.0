Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785117A
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 12:52:42 +0000 (UTC)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45E776601723;
	Fri, 10 Jun 2022 13:52:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654865554;
	bh=p58BGLd7hMm8p/2ISuy3Dy0LlqXqYJNmYcWNBWGs/eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/12mt8TUAGfUMKdUILYc1U9Q0mcOKvYLKWOvKQehdBhmZwNiUxJswfiOfpoooU6Y
	 K7SyrWEXe2qjxHIqPHedkJ37gilThxf4XJm1pghTKSzfqIS5CJyy/DGRM6cwux/56x
	 BJC76p7e5Fq2jAX5N9L4Q+7mVubr9Jjllr2y0C1llKCJP6kL7yxELDiubw4W84nWK5
	 y2J3cAIz0OPwwKlQj8IYtTfQsYgJi0tzCounvyIkiAzE3Nbynsh4HGqqJjeLMjn96a
	 wnXDKPIFQARXVZqpvN92Lkf+CAUBKMooUOkILCPvyNcXkpfILLtadGlIz7x/dGu5lp
	 QNoDgEhEwkwOA==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	kernel@collabora.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] media: rkvdec: Disable H.264 error detection
Date: Fri, 10 Jun 2022 08:52:11 -0400
Message-Id: <20220610125215.240539-2-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quite often, the HW get stuck in error condition if a stream error
was detected. As documented, the HW should stop immediately and self
reset. There is likely a problem or a miss-understanding of the self
self reset mechanism, as unless we make a long pause, the next command
will then report an error even if there is no error in it.

Disabling error detection fixes the issue, and let the decoder continue
after an error. This patch is safe for backport into older kernels.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 2992fb87cf72..55596ce6bb6e 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1175,8 +1175,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
 
-	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
-	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
+	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
+	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
-- 
2.36.1

