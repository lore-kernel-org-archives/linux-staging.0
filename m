Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE313F7A8C
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492048; cv=none; b=mXxnwDQ5ZwHEnQ82gFq66nFjpRBBU8reXG89QpyhGv6duw1ok3qCxsBKBRR6Hq2q1J/b6nThDvLTAd6rvoKf2S7RgbKo7JujcBlHgAm2q5Cx9T9dfz4/t7QQQQTJmQCAsCJMjtugVt9enI/iwXN0VnsM3l/B70CQDPBYBCcMyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492048; c=relaxed/simple;
	bh=wcDFYdMEdRELPX75oazeC1gMDwgGL1B5HrcZmyU1N5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBVJAepFCA4aZy3+rgt2OkhPjd9yXPKcdfkKjcz5zWmUIBVYXjyPFS99H+wdfclvEeU9piefaKiajSQz0ZqW0Ev8HaFsnfrMnM7wfLcUxUeFIHIwzS3r1HvoOOqzi3OFYItLS91YU8gvEhrMpxL3zPN8RoorH2TGWA72oMLVvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ySDE7nAR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="ySDE7nAR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49230a567a9so6073005e9.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492045; x=1783096845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScBn68mQ55F5HD7Mh91TBJOJlFnEu0XWSeO7Pi9GAes=;
        b=ySDE7nAR6GJre+m51e1wyr7UKHpjVp6ZweG1qy6+TeZOILp6DXOzVjU5sUHeuoZxKt
         fMgNK4zsdY1CcjOvSFlnhOVDKBIzB8EC8y1olC136zTiFu+WNfry+kzXS5qKzxP6XOTW
         0hIrQyOsWgGVqnt8Y7tXcHqilMhhb5DNVMly6pSoJfjMNOum4ppprwY2Xe6wrDaADLFF
         SLE4SRZQiPmtYFezVQQyLr1MAylgeOfR811TMcppEaLlMynIniicx9ibBDzja6+IRJ5/
         3ldMt7tJYBw+oPm5ql/bKHpnzd7dabLBXjhfMERhqD9Tco1APXCNxyyLqM3FNIHH/x7W
         Ov0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492045; x=1783096845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScBn68mQ55F5HD7Mh91TBJOJlFnEu0XWSeO7Pi9GAes=;
        b=irWNl+xKPFWuT2i1eZL2CHKIf490lZBXN0pWv49smPOxHtGvbx3HUIfRn5tXGZX9Lz
         ToJ4/0jXdpFmgJ2AVtiiFEMbh8d+eYae1bIqlssZLB/q00JVAatgTf92komuVB5NAIlC
         AP7cjErEL7Tfuy8wX/t44SYmwG9EQQju+GAv8q7NBXwl7UL8sx3hak1jTPQ0RcqrW6Z5
         B38OF0hZfEzWwyJAj3kuz3g0ewumvofjtIEOXiII+XxcJa9YNhtYopNfryKUOS7ZRX78
         Z1NODkN2rEmmtHpPwKiTrATAFDKa4n6NJS5D5iiKu6QJgkFSs4E5CK5h7RnifhBFMv0q
         +l6w==
X-Forwarded-Encrypted: i=1; AFNElJ8RRZ1h7Ij6frpXnh3XPyTz8Ac9Z7piFgRA1CcWKwQUB84e04HQGpsSI7CH001sn2N8yXrK08EEyuNXbffw@lists.linux.dev
X-Gm-Message-State: AOJu0YyeH3qHat/F3vzsqZXBVykM9oP+vamBjNZIcaGQ1E+oEyUdZS7M
	x524uzJKZbzJYakSJPB3SZYQu93CamSoKHg/JJiVjlHnA/IrpjJQ3Z88Xyo67ME3aCPT
X-Gm-Gg: AfdE7cmp0Jw8nIhmS2uNhc7iEsNTcMP8vG5rjqy9daFzjYpID6WFC4veQ0JcIlI6USS
	Cyd/MKHtnyTV7RTWCqi4ysZvknr9wBQffB6Ibow3p7Ll2u1gyja3Wr92moqFFOvTLFr6pv/iibE
	gqiVk1eiov97nu6nnDoTXayWOFtGO1zDd9SHX098nAAwrlszm4NZ9dlcobc2l3sFBquPT0GQraa
	D3Oi3Tx9El2FzIVa84hI71MBoaEn7EBUmgr5YrpbAfOEZpOOwCs9rOpRflcD/plUX8TZs74A/55
	t7qvxXcyTkVrC8sD9gdJQXOiIemuD42/LCSM5YhFB9iLnonmKVVPPYPaMSrHj3h5GA8fLE8XXDn
	3Xvsmxvxk3pO4QH5h1vdO1+HCEBXhnw2kTAJfeESpS+Vnbex7iArPTfHeTkZ8r2vTqh9YJ1HtZY
	RKNlJUr4dBhVRvjEFwLI3CcEyEl9JDcGH+K6hMilfLEwg5AovWzkPPpcbFmkxPnEMZk7j6Zd2vr
	0U/pmr9Ula3XLI3rUd6yx8UCG3q9ZHigZ0=
X-Received: by 2002:a05:600c:3b9f:b0:492:6d16:6317 with SMTP id 5b1f17b1804b1-4926d166478mr46785845e9.1.1782492045638;
        Fri, 26 Jun 2026 09:40:45 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm25393443f8f.24.2026.06.26.09.40.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:45 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 1/2] media: atomisp: validate sizeimage against the allocated frame in framebuffer-to-CSS
Date: Fri, 26 Jun 2026 18:40:41 +0200
Message-ID: <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782484857.git.doruk@0sec.ai>
References: <cover.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame
(res->data) from arg->fmt.{width,height,format} but then
hmm_store()s arg->fmt.sizeimage bytes into it. sizeimage is an
independent user-controlled v4l2_pix_format field with no cross-check, so
a sizeimage larger than the allocated frame overflows res->data (ISP/hmm
memory). Reject sizeimage > res->data_bytes before the store.

Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..966b84402 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3331,6 +3331,16 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	/*
+	 * sizeimage is a separate user-controlled v4l2_pix_format field; the
+	 * frame above was sized from width/height/format. Reject a sizeimage
+	 * that would overflow the allocated frame in the hmm_store() below.
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
2.43.0

