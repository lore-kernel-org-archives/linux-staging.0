Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DCC390CAD
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554487; cv=none; b=C4xAfUFOrmAXwCvR/Yjitskb24064yX1UC98+0+a159/hTSwUZMP4yDuyj2IZ6x6EtZPE/GhwHacG/rJ1GVyBL8q/GeM2cSZ/moWpTFcfr9awnA3UPsaVEG3Sn/a6ZMwPQVvPR8bJI/DWI/Ctbf75/Vvzgaxu1RQUy8uff4yn6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554487; c=relaxed/simple;
	bh=vKQ0tFRaNgyCQPPW7FV5oOwk5g1uCMnAXYZmzILRviU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdyFRBFaOGhufp7IQpbrfoPjub64xJclN8jAAtwmGh3eYUp3SEMxeJT22ePcjgP960aZdR4dQxJan2rbFOomNBAUQUjV4ERU8DFJ2IlLgF6RryUPHyk83BmbkNEDsMDKHLo6n9E6vwFKrjKEYF51VRfLa4HGLuyzUWhRgB3HLo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=RvvAnOtO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="RvvAnOtO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso8636765e9.1
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782554483; x=1783159283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Dv/Mm0JfcC4346InPEi7M99NfG9WPL/LtSaq5m0Xv8=;
        b=RvvAnOtO9mhEyL2yrbIxID782ea/SP3y+0AAuWEtNHQf4fInkEPiEg+UHMruammw4L
         +rLfjIXXsbAJY515RKqd8cNXFOux3uoW/ajjib0nGelNtDfbAHd6CfyTxrrVhdupWT//
         Zi2dcZmPa75Tq2f/vQ5CNOdqlneMHNG3chGskgGpZ4cZCVA5y/kRjxRgyORMuzgDM5LJ
         HNb6E3Ge+ABxgXdR5l4MANVNoGfk41GACtBU0n93Ndo3J6ITh9Ha+B0MdyRdxWsbTtlO
         nQZ89PPkrt3wAQKiqXXkWKhC/frN4S2UGJempBvUs4DxBFvIJCykC0pO5o+nN6PvFp+j
         xcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554483; x=1783159283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Dv/Mm0JfcC4346InPEi7M99NfG9WPL/LtSaq5m0Xv8=;
        b=rkgL7zr1NNrdXlrFRM2U4KYcM99NNQa29qj8xti19pK/PeYDEcH47ZhLQEdpepu4jI
         MZbiBQbCOBrsz2zYd7Tr763/+Snz4rpBp/Nn20sHHCupBZEHum2SmuIIn6Zd1Oyud25R
         H3CMvq9x+felXnNsyRVDx56VZJM6D8hMu65HzToiylKEuVEO1mOQgyxMHYzN7Xk/645h
         AawcnY4gqzHVsTEGSD4ztAKHyUX6mn0Y1KUAzc5Q3ClYdOX9NqdBXrc/2uYnxnfy32bI
         UPQVfy4yqFyrIjWhuSmvSgr5WP1q43r5/AEu5UJIZPmzRUoNhd3dQTma459MnUg+MMc3
         S7Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+xo/KIEhLa3hvuLKmhWXQ6U1827LUdciW9MTCZHcGn4aqSNQKG1sFZlThqAS0Z7DDvfcDm4ehPfyB2Vnn0@lists.linux.dev
X-Gm-Message-State: AOJu0YzqBQKl5sgILe+6tU9lr3MSHyRXVXRbmCW1QCXEFPlne/yVvWn2
	64v/Ym0ZlyP2wrB8NyqZj+jhPiGW0vRcxyt5QRFJxTAcrnGgxtQA/fug11+SoAqD/p/l
X-Gm-Gg: AfdE7cmbaKX57LDIcpfaWqom+FKcpMdRc8vDkQ9WVzkh3vcTqK7g9QTLxQPdQEUSlhm
	IhK6T+RQGJnPIgtobQUu8ECWsPEOnb/hbyRXmBWEkjtzGnsB6kDsntV9A8mDgnyL18g9d6vQy9n
	PKCPEj1+VpKFVI4mma1JSPLyETmYR9bQn/Ru/nSSPCT/2LK7m1C+YuitScy7s9CcpLp4NCc8fRX
	WeMkxcS6m0Mopb+Lyor1i1vRlM9RYwAFyknIz8FHCgsnEEJVGfWQQ4vUJUkKMRoG/HJkYVnkd0s
	e1KN8KhD5dumiUd8xBJ8iKjwNKpBXtE19jbl1wAL75yGgFWzPSr59QHVVDCbklMqgEaCVWsuFpy
	SmdCgckgthT01TQGl9SBm04tkNnJM2QWD5kkP1FnbzilybKn+NdrsNgo8u6sA7wW4yQj7Do9kNo
	6eI9WycdSrhy90shJvykCc05GoeL+riMQA+0dje6Si+NId2ZcKECZGiqIv89wF0wdN0WSLfU2iK
	q47jL8kqCwTdXcY8bgi4560AtyYC8hg/vU7QeS+6Fw4Bg==
X-Received: by 2002:a05:600c:4e8c:b0:492:425b:c773 with SMTP id 5b1f17b1804b1-4926fc3a548mr68637505e9.10.1782554483095;
        Sat, 27 Jun 2026 03:01:23 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271465f35sm69047735e9.9.2026.06.27.03.01.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 03:01:22 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v3 1/2] media: atomisp: validate sizeimage against the allocated frame in framebuffer-to-CSS
Date: Sat, 27 Jun 2026 12:01:18 +0200
Message-ID: <20260627100119.97650-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627100119.97650-1-doruk@0sec.ai>
References: <20260627100119.97650-1-doruk@0sec.ai>
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

Note this ioctl path (S_ISP_FPN_TABLE) is currently gated off by
2b7eb2c5dc72 ("staging: media: atomisp: Disallow all private IOCTLs"),
so it is not reachable from userspace today; this hardens the
disabled-but-revivable path.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..04e7b2e03f34 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3323,6 +3323,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
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

