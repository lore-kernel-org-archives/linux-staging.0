Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3E399377
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682089; cv=none; b=Gh/6TR/9sFdLZ47zg/KdqLj1FJzb0aHNUp5x0IlgKFRg32ETVWkTj2mGWNnlstsYi+CYCkP8YsuFGLY6mPK4OpkgsXEFZhlSp60HEvljrISsagRky65xP+Rzs5beESq6uYvYPmp+aC/psAvRMx9HlfMHCXzV8FgzS8bV2vEHOb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682089; c=relaxed/simple;
	bh=VfvN2NB/wnjHyZfBZHt+ChcGGwIjmvnR6Eg88MC6Nvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOIDFxX4i04JxWKaFZXQd+rsGpmNkuaSQFDhhtxXAme5nYP/VcU9KBIBPs1wlPY3z+xuNUmEDKckOH1TUl7Q4QIGlz6TVtE7Ga286xzm2/+LU5K3o8iLWs+NEeaTS/gTBN+ZUW0DBj6HdqTP50mcMd/Xf4Dp3E3x4lAWrKqgRvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=G+4ombb0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="G+4ombb0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3174874f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781682086; x=1782286886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=G+4ombb0MILppRGfvcas/Yfm4Pr3i14pejCHyooyO5xpZRdniuCr4CDuHrIXMKjUTj
         doASr06sosNGkrFkao03kyBmKBPmBahEn1fQGObLKrJk6wqOMQJ4UUZQnTbYA+Wcps+7
         ez4kQBEmaLKOfnurufaM9RqUtJMreMm7KKhaR5EhcebFCNBpw3mO1pkbqFNFJzjuQPCC
         N6sZKLHWa6/uf+ZjXBYNV6oO7KlaZRhyjXuI7pkfUWiktK+zSVzcmFUcMW5lR1zFWRoK
         vaIEy6V8oKo5KSnaBrPk9rsDgI/5CbfMHNJL/YMKtqZWxb3Yc7Sg/dBoY0likA41FywS
         i2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682086; x=1782286886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=YRG7Oj1AKzfSWr+/AkSmjQN5HlmyGlFOUwDmyKdNS45JU+Z58/0oqoGl77d2LwspUs
         Pt/xMSFds9+3WV4AwPJJbarAZrSqUeQyH+wpKs6yJIoqk+x3Rvzb+M1Q9gFz6ipI4y6F
         jHhnC+Ot8sf5xVPXtbG0yoe6Y61ZTMS92573U2FVWP75+dvI4s0koAAErkKnqWIYtmOe
         MaDMMNktBdFW+6UQ0RB0yjM70yGQ2HAsCCRm9U3ulOkXcGqicrIkKTFxVsgGRdK0W6lV
         SzXGS0ZBLpdbbvrBZG1B9b73370/6vKfvdqfCzhSGvvio6H4NURVPw6BjpqmPOf+6OUU
         22zw==
X-Forwarded-Encrypted: i=1; AFNElJ+rjiL8luYUoGl1lDQKyN93ZQhi0hXae8ObrROailUw+tVlWe85viGAJc8Y6IZVjmwPFcUXfxrv2rvYFcx9@lists.linux.dev
X-Gm-Message-State: AOJu0YylmSqrnsM11tceamNp+KJJqlKHiG8+rHkZXmxOiqhfohRicsaC
	HCgV4B5fZamz4tSZmNLRqgJxpU/NtGDzLiwvRKhfwEE0nVtxnjYvOoVT+tJFi+BqDkp1
X-Gm-Gg: AfdE7clbLgC8M7A7ONJXzjPodlzKXOIoT5X3cS5L2n8FbenkzpG749cYqIj3BGCBeT5
	2Oo+pJZm68ujTgRUztj4y/bHeqJkpoEs1mfKkY6BLSXvW9SjhYq0LAwOzoj6l2ktpsxa6PMGew+
	Rz7//jI01d87TlfbCG/KCVaKDckBvB4FnXkadYuzorRRxLfTVZQARKSUYusT7ji0uKWxtkI62rI
	62M4UGxKNcScuWAa5j6vyd5ecbYjup4aD7VJL24WalyWcqBizR0BftZHfVTl1FkZACbsvu4x3h6
	FTe3rf8FqWkkPkn72302lHtvTOmcpyH74SQjQGHZeNUtYEG1Pd8nt44eZVg8Kyd9cfoHRxQeWSk
	/k1ehniC3eH5n3Be6jcQSslgFXRklRCOdVnNDN1mFPZUo81e9Uhjrh3lgE2Y4yx1rNMNil4xh1N
	HTtDTkf8ArAV2TS1eJ5Rh7il6hnzKTGat2RpCUO2bGNXklVPLrL2fYBzOfJCfEG0izZSARcTSmf
	Y1saZq3kLMolFnJ7ImkVVqadT0SkVdiZaI=
X-Received: by 2002:a5d:6a87:0:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-46238f980ccmr3573765f8f.34.1781682085876;
        Wed, 17 Jun 2026 00:41:25 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm52677098f8f.1.2026.06.17.00.41.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 00:41:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 17 Jun 2026 09:41:23 +0200
Message-ID: <20260617074123.32464-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616074952.93076-1-doruk@0sec.ai>
References: <20260616074952.93076-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop v1 and v2 -- both are wrong, and the sashiko review was right
about the deadlock.

The underlying bug is real: vdec_close() does kfree(sess) (and
v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
sess->esparser_queue_work, whose worker dereferences sess->lock and
sess->m2m_ctx -> UAF if it is pending/running at teardown.

But cancelling on the streamoff/poweroff path can't work:

1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
   takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
   across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
   runs under sess->lock; cancel_work_sync() there waits on a worker blocked
   on that same lock.

2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
   power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
   register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).

The only deadlock-free point I see is vdec_close() (the ->release fop, not
under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
schedule_work()) able to re-arm the worker, and there are adjacent teardown
issues (esparser_isr() vs the dos_parser_clk disable;
vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).

I don't have Meson hardware to validate a corrected fix. Is a
vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
the direction you'd want, or would you rather take it given the HW testing
and the surrounding teardown concerns?

Doruk
