Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE727E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F1CC433C1;
	Tue,  1 Nov 2022 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302309;
	bh=qfPtwSHuxdqmU3RDuO0CxE1LqMmqchKl638v/0OFALY=;
	h=From:To:Cc:Subject:Date:From;
	b=fBQaZwFaHIjp2RhSGm3IQ0KZHMSpNypMF/3RAZ0p7WkA1d+PpdQdrANanYs9hyAXp
	 qcbbI6Ftuwj0kkMSjQgDCXBibt7WicGd/P4PoAsNoa9Eo3ZD8Pc0ssralBhEJuY7uK
	 aLLGYrr+hPj+IZyrkv4yVs/ztFO+VFPUrAQMZhOwT9/owuesz4r0oKd8HETkqvqnf6
	 MFUeWY3ff6G5W27GWxbSEwd7AWcMctMflSYOtvB3XxPuexZbeiITIsTgkoium4ETTM
	 BkPU5jfiWrf3NBzCzZjQrjKaaz44Xy6FaHCHCHiCTh5TqsxCo2UACoVwHp5Sr1gSsk
	 piqUq7jnjOyDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 4.9 1/3] media: s5p_cec: limit msg.len to CEC_MAX_MSG_SIZE
Date: Tue,  1 Nov 2022 07:31:43 -0400
Message-Id: <20221101113147.801048-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 93f65ce036863893c164ca410938e0968964b26c ]

I expect that the hardware will have limited this to 16, but just in
case it hasn't, check for this corner case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/s5p-cec/s5p_cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/s5p-cec/s5p_cec.c b/drivers/staging/media/s5p-cec/s5p_cec.c
index bebd44d9bd51..f6d1d98431a7 100644
--- a/drivers/staging/media/s5p-cec/s5p_cec.c
+++ b/drivers/staging/media/s5p-cec/s5p_cec.c
@@ -112,6 +112,8 @@ static irqreturn_t s5p_cec_irq_handler(int irq, void *priv)
 				dev_dbg(cec->dev, "Buffer overrun (worker did not process previous message)\n");
 			cec->rx = STATE_BUSY;
 			cec->msg.len = status >> 24;
+			if (cec->msg.len > CEC_MAX_MSG_SIZE)
+				cec->msg.len = CEC_MAX_MSG_SIZE;
 			cec->msg.rx_status = CEC_RX_STATUS_OK;
 			s5p_cec_get_rx_buf(cec, cec->msg.len,
 					cec->msg.msg);
-- 
2.35.1

