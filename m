Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98838F938
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542371; cv=none; b=CRqB6139PQHbvjjT7/lK2JizDhFkTe3PGIPHFZzEF6AR7FWvSNLd8kuBJRMDUrYG+xl3QuoUkPBuo7pJhLrur78jtXMjR+t8S8qPNGV9BirxfQHNKLzlO4EMYx7lMVejFKE1vSuJl0xXOnc7wYEbbsmCHa6/98iJb+Jjdhfq+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542371; c=relaxed/simple;
	bh=nSlLGYfTXHiil+e5l+ZK86hJckYlS/qWdYrNzrVBQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNcvWc8Pw7BeO8SiKaVdtufgjvu8nLUgJGFKrN4ED7HbNwwOdwNNXJ7LQVjcUtjGLKrkMA5UCHN1D1lsNdOqOYm6PlJ7NlmCyiVtXrlw4kq8z5u6MzHyOEKferUu1m/5qBTdEY+KcCQmk49necwtH30vKZxlEvGNXcr8vl/TTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=Tzi/qA2c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="Tzi/qA2c"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49263703c6eso15754425e9.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542369; x=1783147169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmQtpoRxRoFft31BE3DslHpMhlaHT+PPi7N5MeuH6Pw=;
        b=Tzi/qA2ckfPV2RMkO0cefdlNgYE8sfJNVpyc4P+IMHF12L6YXftRenmKttFqNX6sqF
         sWu/+aTrZVqcn9/+0pclwE+0LY4GbNdLah+2v6Wzw3NIpHXj6mMjiafCd0LN7cOLdcZy
         kNdM8ZqjtQfubyxe0DNWUqFQDzyGBTl7kR90xF+ik2+plwYdXOYupZ7kEejNTKidIzfH
         2B0UvYmfnUW3QsEplXBMwkRPo6+YbHVqGiVFcbXtdVgLLEJ5R1aK99TX2acjVwMC7b6Z
         qecCONQQa3+xEC6+LuXJmtl/iQM0b1U+mk4zntNOoxxqMX7HYrQ/hBAkDZM07OLukn/k
         Nl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542369; x=1783147169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmQtpoRxRoFft31BE3DslHpMhlaHT+PPi7N5MeuH6Pw=;
        b=JV/JZhXCGMg2U3QO8hnM1+WcvFedctcVAq8nTxL4+mf+mIBRBesJSKaIuKnjyPmgpp
         H9IyEoWkRoxkX9b1CwzuMuefspJM3zrY+epp/FfvIlud5gb+D2im85N4FEWq3KpXVilN
         IrY7xp3sLawlZwHhaDN2wHgiufoCcUrEp5NCU/g0kqAQtJx1brjlkpXUSck51+RWCBre
         2RTEVe6ciQ4m6lqvSqLblKV8lCUVPJolLHJ0kz1MJR81fkSGpBzKpNbqDIBdgdZnJbek
         b8A4jIKmvyeWIx+yNWyzse1ch+PnPidM92Y3qXyD/WtnvHrd6AilrhvpRmHlC3BHtoJk
         c8Uw==
X-Forwarded-Encrypted: i=1; AFNElJ/XrWX6mYjnHEFJhoSuinqBPkvrQKTQCnFRqi4hAIX9u5dWq86EBHF4jQ5gq248xhmQryU4VlpmwmAYsUfP@lists.linux.dev
X-Gm-Message-State: AOJu0YwNrsoaNHEtHcyB+OXrSAY3/h5VgJdzSoKjkOW2FhS0k9kyKOIV
	l9LWq9r8V+rWaQndh1fabKRrGQuSSMHaircxOKr4pnxEJ9uoNlBgbOjlb/OoqVRMX9qk
X-Gm-Gg: AfdE7cmirmr7MKRp0QXMISxar9cQOtRAaR2u4gKcsOTKy3ocfInVRfeyoqPHcv0oljh
	KY0vkyaPmTRmVPtViLbwubSoBKaovwkHTC0Kjkl01ZHIIqVowq31JSbYhJDRR+XL1PzjtDWsZ0Z
	78a9OJApvNjDdJicIgquBvtZZ2ZHQlB+LSqMnq6+eGsu9BZkSEDEQA2STct1029rDge52vEoQZV
	JMQHzhKu4SvHkKNDmDyiFb4FY2j/ZMwUud4VpqnQSJil2JYbCrZmQ+nKrniaxGPwC48YsF73cNm
	6cg8Ed/8NLyTxvu0p+ne56yu7NaE90fd0VgLykcrPhtmefknpp/F+rk5DKDvFy6wzzXvTy9q7i0
	70HQ9BdFYfQjcVPKsQD6YdF6XO3kvh5qzdUH1oS1hRuSePhLWaYvFjXF8Ab3X91viHxZmsHkEv7
	Dj+Crq+dAaWJMbL6h1lhdzcWqdKsLrtddobcxruaLbcHf8GiiRNB3I+dFjGoa47YQaQAxcaR6Jl
	b1p37RgTqjLLwmEYcwJTjtyXUPnpMQBY2o=
X-Received: by 2002:a05:600c:1551:b0:492:686f:372 with SMTP id 5b1f17b1804b1-4926918e379mr103522875e9.12.1782542368624;
        Fri, 26 Jun 2026 23:39:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm79198785e9.1.2026.06.26.23.39.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:28 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2 1/2] media: atomisp: validate sizeimage against the allocated frame in framebuffer-to-CSS
Date: Sat, 27 Jun 2026 08:39:22 +0200
Message-ID: <20260627063924.79491-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627063924.79491-1-doruk@0sec.ai>
References: <20260627063924.79491-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame from
arg->fmt.{width,height,pixelformat}, but then copies and stores
arg->fmt.sizeimage bytes into it. sizeimage is an independent,
user-controlled v4l2_pix_format field, and nothing checks it against the
allocated frame, so a sizeimage larger than width*height*bpp overflows
res->data in hmm_store().

Reject a sizeimage that exceeds the allocated frame (res->data_bytes)
before the copy/store.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5046a0ec8bba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3323,6 +3323,17 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	/*
+	 * sizeimage is a separate user-controlled v4l2_pix_format field; the
+	 * CSS frame above is sized from width/height/format. Reject a store
+	 * length that exceeds the allocated frame to avoid a heap overflow of
+	 * res->data in hmm_store() below.
+	 */
+	if (arg->fmt.sizeimage > res->data_bytes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	tmp_buf = vmalloc(arg->fmt.sizeimage);
 	if (!tmp_buf) {
 		ret = -ENOMEM;
-- 
2.53.0

