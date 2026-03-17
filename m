Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20A2D063A
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763002; cv=none; b=RHSwX7LbABjXs+bE2bxvExo/KWCEqLUEpiStGA/VR4mCcNZU6xSpfUBoHTdKuUZJketl6vSf4Ef/dLhcE4uX9eOeDQq5XMczNHHx501ktgBJE0uTuX5Rw1gIc+nQzKbwFngmdnXYjrJXjMlWfSHtEaDOQycclYinpZrGEslj8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763002; c=relaxed/simple;
	bh=FqwVY+k3SGk8TAJDKHhTXtNvhQHrDRduwzSUo5VOmwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGcgcS9hzljBy5jX/wbs7aXOICK1bPpXnEVAJ1k7Hh0J9h0Pe9l/rbFvr/cnl6b9Ii7ecTpTI2iKHhacXxpI1GfSfxqlZYxUYqPcoFZiiLk2Iq83q+r3mr3n9nRoT7yQD/Ehyjn/JmO6sMlMWM+H/j435jNheuN5+7J7RNjoWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsTm/RBR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsTm/RBR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so11775085e9.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762999; x=1774367799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=focQCcFKweFm9YkNGVKAAlAzSn33WaBiPYVWwXWj8lw=;
        b=YsTm/RBR/IV+u6UaHQo+2tJ12IeaIY7mv0Xwl7R+OWJW59C04KQ9Yd6I/D2v04A9Ka
         BACfN53kJ2r4XVrJD8c5PX3c7VspqAMBbMopIFJS6DNysoNwJ86oLQJO+26cpwUhOkuU
         KKseKGlFLRJsMNdLiYL5jvPCE1Lsc8u155eKs8J+e/ovEBTZW60fwir3Y0MqQzg0wn7Y
         i6Wu2q6vQ3NTi05PZodqg+uOKfwKisWH34Bu6TkSEGGEolICnMq5PYUK4qS82Vplbfe5
         OH2hoi/g54m5ADjMlGS3Yp2kdQC3QSzk6JE+f8W5SNTcHhr4BPCixdqyIBrNdsAlzDqw
         DJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762999; x=1774367799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=focQCcFKweFm9YkNGVKAAlAzSn33WaBiPYVWwXWj8lw=;
        b=RNFpGsFO86GOdFzzVyX9ifNjXseCtSUTiYIG0BGIv3wjNfLF+G2lBxs72S9Zq4Hs2U
         miMgl5JBJcM1zMn1gZmV1HIhAbIqZPH5HyZgJ+v6fg9L7zEDP8OOq4inBPGMnLH2LeTP
         XjZY2Mim8KeihqssXeBl9s6zJUgVcg5Wf9qryzgMRtUwzXXGpZJyb0jg3XeO0fb05JMH
         fvBbZVqO/tP+Auz0mdIT/NCFnT1gNZ3qu2rcRzZrKhBrYMYaUunCS3vXh7XIGwnbuPvb
         KRg6AmS+OmMNeIE68Ze4AcQso8PdJ6MpgICmQutRxlxiK9/UeAg7O01pB/7iH7gneKsb
         s0iA==
X-Forwarded-Encrypted: i=1; AJvYcCVDQWum7GYH5kDUrjn3tsyYroEicugRMIEyMjOiiyCQ8UmtDFdRb2LZCQ9K8mEAZW8avKR9cpWPXGM90mUM@lists.linux.dev
X-Gm-Message-State: AOJu0YxqtgR/JVlh6LOC5RitRGBOs9p83ZdQJsSSNc6hysIOcOUTOdKl
	ZHdYtahn9ljGh97eU6B2q0BAb9o+8Y1NRlH8+lII+45zbmG9CJ2WQYiC
X-Gm-Gg: ATEYQzyx/w5eCh8VlhIDWMiEik4Q8NpJvMnfJOqFu3yoMKxo6EAqYTwnw2sM19wtgNl
	VwyEsBP5WjgpjVF59NVISNEuqKh5otuTlGYsNcfc2QyPE2hVcZbpSTasGvZ7AEsfUZuzYSem/Wa
	aGqXw+Y1mVIXiwZuwc4VxgTBMUI7V0EPrj2OSCR8Ns5JsZJ18hgDcItJocLkvg9I3yXMB48fYeK
	RRNzie7Y2d0HL1j2vq//00OnjNSfU0XC3YlbnbEuLR3p1c93KODEr+kogskJLrq10+sIPuWZGgm
	/2WGissULltMEDcPcN2Sb7DIVxM/e8Ir2DqjUP78xM9WiTpv51m9a8SLCGJFyQAtNAruqR7TKD8
	vYcaX9OuvERFOGJh3mZk+/Pf7iEhjKRBeRJrcPDzKtYahexoIG9jT1xKVj3txMGOU1bhhRus3P0
	lo3UqUrPjBJlax0SRSznYimmleYSdZh9BIy3mTE58Z1DthF5SbRhE3GR8SF1vgww==
X-Received: by 2002:a05:600c:c055:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-486f4476ad8mr179025e9.23.1773762998448;
        Tue, 17 Mar 2026 08:56:38 -0700 (PDT)
Received: from localhost (mob-194-230-148-148.cgn.sunrise.net. [194.230.148.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f420d7b5sm2797485e9.2.2026.03.17.08.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:56:37 -0700 (PDT)
From: Teng Liu <27rabbitlt@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Teng Liu <27rabbitlt@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary parentheses in return statement
Date: Tue, 17 Mar 2026 16:56:36 +0100
Message-ID: <20260317155636.99844-1-27rabbitlt@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around the return value in
ia_css_pipeline_get_pipe_io_status(). return is not a function,
so parentheses are not required.

This addresses the following checkpatch error:
  ERROR: return is not a function, parentheses are not required

Signed-off-by: Teng Liu <27rabbitlt@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 0470871f8..fba567de4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -446,7 +446,7 @@ bool ia_css_pipeline_has_stopped(struct ia_css_pipeline *pipeline)
 
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void)
 {
-	return(&sh_css_sp_group.pipe_io_status);
+	return &sh_css_sp_group.pipe_io_status;
 }
 
 bool ia_css_pipeline_is_mapped(unsigned int key)
-- 
2.53.0

