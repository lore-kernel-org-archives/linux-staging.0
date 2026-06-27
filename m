Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390D0390CAD
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543341; cv=none; b=HkDfr8+/OkJIOCvLjpo+21s7h1dYp4DH8oTgQRDjIO5NR8MObE/vOfKspBr8p+IFjtzAy9g6V1bEZfe5e4KVzrEkSqyTRb8XA+6gFTKh62QOTIK/vOa2lKNYt0CqoQDjBQwuZw2Tpxq5lwCpwLfcspZde6pfAC1h6qKXEO8l8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543341; c=relaxed/simple;
	bh=/9Jmmg7n/1wL8dwr1mXSnzfdn3ik6xwgtLV28dDJ2H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0Bbu1qYrVn1t+ePGMJcJh0nyAiZIDZGqYhogZwdPWWOw74aFNfO8PiFHVJLT2R5glqlYfk5NZKrp2d1sSDEs3FqhAo6ho6yc+sO/Wi5S7DKnyVT4hon7YV01xvIA3qSNQt62lc9l5Wqh/ofYoKxQEVzgUazEIe6BxDTscG4H/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ppmISOwO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="ppmISOwO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46f27bd4c45so1199010f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=ppmISOwOf6LZ8lP8pmRhQga2awG/IHDts+/Wd0MhohRVYmCXZ3uXQzM6fyeFH0L/h7
         7wRQOKKt3q2urnofclN50pBUwj8+/cKr4r7z0JiM+nZu0IKpSdtoTMOQ/2Lv1slTzXMv
         57QEqeRjBsU9uJbCcpngwrySXGFaicW8t3adxewUph2u1InV8wBi5UFsnxEc0BK3XPXZ
         EBixqaYBEUKKohNAEHQhZflW3gFv6DyUJZ+lSu6kpuVrwFonSDg9ubCf2dGIOv9LGalY
         PzqVtVxQ6oO7nANp254aciPaEmQ4JuAa4pf4R7GxLLjl90Y5ubrr8w62oNfUjz+FWJzY
         OcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=EAQ5YZ7p4ta899yCLHD5vp9HTzSNhOVJakcMciA/MRTTSZA8XAy/3VLqqxm/liKcOq
         Ln7mbvL3BrRBWp1qQeINTEcVlWZ2Co//6daMZiZfFOjpXE77O18qmYbQTALCqQ2wx2Y2
         BtCSLj32nxiv/fdpxipvolZNOHT0XPKI+XD47v/kxnqxtRMvZsGKJxUKcRwTkZGcmhxF
         L5j88LEnanL5H6jSOumajXLU1gCcq7xujXydAOpj/JnFWrGXzHXSiXI9GUFQNvIW29Ec
         zSt7sA8hwXwbktigNYxqRE2KdPA99GyjUcK+OZ+9xxGuS9lJH1hUV5k6KNnS2zoCxf9W
         /40g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/4W3MZmrtRnjJE/kkl6W60wZmjIeV765m0lijlDapsHhmPN8LwiMZAdMoA1W11IhNm9/Og7ofCPNdjnOU@lists.linux.dev
X-Gm-Message-State: AOJu0YykhAdbqGs2jjTsIefM2jcMJznkAy6Ml7eKVm8fnRH2q9lslixM
	HorBs99DtNsvLc/HHSveQknQfYA7PCmv36MZ9WqU4C8I60+mAO4CFFei6qqfv7cejMco2QR0eZq
	BzNZkagY3
X-Gm-Gg: AfdE7ckx1LoB4s8nby/o5V1GzxzcFhgdOPGzlPwoAclOibPXG2xqc/xytd/Med8ifEr
	XZMchJblO6JFanSoK0mKM1KwRznpVNWAXQ2ScHXd+UMlgj59StumB6SfOsR3c/QAXuTMkQ65WIs
	RGpSwkGIDv4vXPg8yX8uC0R0ZX0d6ifGvEu/p+yHsy4n+P3zDz1Zze1xW0VcPse3DBxQmBXiO7E
	bzb81j2+oFMV8n6/jVMxRRdEadIi/XXrs/EPfRphhq30hJ1PmX5/n9FuzHk7e1fQivJvbo2INc6
	odE3vonn986X+zqSO7+5pu6Rp9iBCVGeAlVDsxXP4uoKm55kRWAYhfxJcdWJf4nUjIQfUvQBIpZ
	GlMbIuIYI5D2SXVHDtJVteN+yes91Ec8pYCyxWfsYPRZ7iOM68E8i1FIxvJuF5I3qEBwWHBijbs
	gZOXhsOktEPNEy79Y8umHM5K/GxlzhryGbbcKYSwUDrDFJKZsWLMwI71FDzs7btlBREnZub5Ssd
	KOH9A46JP51uoW3cl34IdJBYABHqRmOhf4=
X-Received: by 2002:a05:6000:4204:b0:460:30bd:4dca with SMTP id ffacd0b85a97d-46dc12e056fmr15051536f8f.30.1782543338095;
        Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:37 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 1/2] media: meson: vdec: clear stale prev_frame/cur_frame on flush
Date: Sat, 27 Jun 2026 08:55:33 +0200
Message-ID: <20260627065534.88527-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codec_vp9_flush_output() (the .drain callback) walks ref_frames_list
and kfree()s every vp9_frame node, but never clears vp9->prev_frame
or vp9->cur_frame, which alias nodes that were just freed.

If decoding resumes after a flush with an inter (non-key) frame,
codec_vp9_process_frame() calls codec_vp9_set_mpred_mv(), which
dereferences vp9->prev_frame->{width,height,intra_only,show,type}
and feeds vp9->prev_frame to codec_vp9_get_frame_mv_paddr(). With
prev_frame still pointing at freed memory this is a use-after-free.

Clear both cached pointers once the list has been freed so a resumed
decode starts from a clean state.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..5ca27930239f 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -681,6 +681,16 @@ static void codec_vp9_flush_output(struct amvdec_session *sess)
 		list_del(&tmp->list);
 		kfree(tmp);
 	}
+
+	/*
+	 * All ref_frames_list nodes have been freed above. Drop the cached
+	 * pointers so a decode resuming after the flush (e.g. an inter frame
+	 * following a drain) cannot dereference freed vp9_frame memory in
+	 * codec_vp9_set_mpred_mv().
+	 */
+	vp9->prev_frame = NULL;
+	vp9->cur_frame = NULL;
+
 	mutex_unlock(&vp9->lock);
 }
 
-- 
2.53.0

