Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6402D8632B
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743561613; cv=none; b=Cyi0Z+4Rn6LpGAfKcmkfdgjoK4lgSEzlfebWpNN8gHwnDQfKYt2QV4HGAOcroRGzjCxPEjbJjW7nDAkMrohKX77wR9Hjs3tssI/txh1dZ1gU9ekHGjIggi3k5r7SAXfgTq/KuZezpapLTNQltbCJG6I2ZAySzvdA92UtPCDsytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743561613; c=relaxed/simple;
	bh=a/Dm+u6pjuizxHvTTkTB3tGMpeDmkV9MptDSw5z7NEA=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=scjO4V9O9rzEPqnUeCCy6EgAp6im1Q+8Ar4wkhHAty+GW6zuJTUylRNLJg2pPhexZIX3HJsELq3ZBP1cj7h5dNliyupRIZ+D1jte5AWmYBMzhNyWFLfWAMLVZdAYH1jWNxK6O4bIqlC3vtpX0O3/Ipud5ZeshjrkgyrE5y7wHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di5JQAVm; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di5JQAVm"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fb83e137so52846546d6.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 19:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743561611; x=1744166411; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9GE2K19EwxzhRGjXGYJR11XLLTVZECnfrYRAnlaA5E=;
        b=di5JQAVmXsIWJ2B9aU4uPoYoAoRKP0J8AGbb/fo/QsSbejBcjZU+3Hz5O195tTVQiz
         yZmNEC8VOPQZRNRFsy9LkCXdZv0DdH9H4FvoEFYVmQ0shl8yliJdDxpTzv7JPrJ3D7G9
         ewOPdjTazEBrJ09kVvMA2xPbGGnDYIdgZmhff3ZhCMXbmofAolnW7hAhj7tdicEi85yP
         uGsOlwjSK1ZOdi3+pnZ8+iDGiqE4TEz+w1QKYkcntj1d5+FfHZ4Cg7CbkXLEz846UGza
         hLXogkq8/Ikzu87F+oZ6DApwEAD8fd800RLQ9WJHdP3l4Hwz2ZKKTpNzmh2T+3Yt/Avw
         rNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743561611; x=1744166411;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9GE2K19EwxzhRGjXGYJR11XLLTVZECnfrYRAnlaA5E=;
        b=s2GryQoROtI9xSdOKmn2CMwShpiwqoLWVehlEVIwKDJidI4KZBbk78/N9D10TzqQg0
         uybnPr7xCHB0hCGnnGqv0BDYgp2URAHcpBPAGrToZ/KRT7LvQiG32q7k9XOtIEU56bmJ
         UFwhovRQf6SGkPF9C6B5XL4NK4y415Rz0fd5LLDrPoI6OKKYMq2Mf95pWW6QHOqGlhd+
         l723GsG4YuKKEZxKjCkE1lH7FuDlBtDCtdxLMl9a/DS9nNvZWYQiGvdyvIobs0OS6uCx
         asp3/zZvtKJyh3qM54TUiiYQBT0Y1hO0oTxynM2EZNW7G2P6p+wJvpTb2ZnoVOeYrVJK
         7yvA==
X-Forwarded-Encrypted: i=1; AJvYcCVhJYBCn1KqOCJuwTRtPNKc8gBCjwh5GxA0MfnFzK/XR4WgX0tYrPVvuyO8nADiu3+6JFQnoSrxhBGO06DG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0+1XZpBEEcY4ylR7HNMCWM1BMFg5lk1aLgDxKFL2Q1h2KGY2N
	kEIXym7qWe4/++zLDIo2l6mpvReL4vgxytU5aAYmbJh854Lk1D+/
X-Gm-Gg: ASbGncurEy4rg8dXdUWZu+ZguYlkJp8A+b7kEKUA1lAW6YzslwztmSEtpmEa/6APBiw
	8BVR1z7L2+niOT1ayNc/bQXGEOO2zvjfHo4rlMgG8D5S43QY7OmpbBDtlLYmNMeX5CMcNrPD59B
	NiKJN5Brdi/2FW6xt73N9WmjtRleFV6YhxsOjxMGrVlQC9i2SrkHh2dOi+IHl1EAVNpyIgIySmy
	UDd8es6k2v0/GnNgkgtlQhZRgPWfIzmWWRJOhq+nmivr0mDD3mmZzDIPj+29uHv/UmE5jWiUfaI
	Gc61BTtULQMT+uBpx3/YJvEg9KzkdalIrbCvrl5dzptS9CHGnDE0marrawvxjiFvg+ePIRWQ6rR
	yjkrXaNcSxA==
X-Google-Smtp-Source: AGHT+IG6oBRbFTU+JNE1XfUccc29qRR2X6E2rPN3IJOPLpWVzZ+2Jtmw9GAzmXQJYrQTeGlRpNKD2Q==
X-Received: by 2002:a05:6214:268f:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6ef02bc43c1mr14855456d6.12.1743561611219;
        Tue, 01 Apr 2025 19:40:11 -0700 (PDT)
Received: from [127.0.1.1] (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771dbcsm69163526d6.87.2025.04.01.19.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:40:10 -0700 (PDT)
Message-ID: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com>
Date: Tue, 01 Apr 2025 19:40:10 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============4398481999678097914=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-media@vger.kernel.org
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: Fix indentation to use tabs instead of spaces

--===============4398481999678097914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 1 Apr 2025 22:04:25 -0400
Subject: [PATCH] staging: media: Fix indentation to use tabs instead of spaces

Replace spaces with tab to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da34ee..127f12ba2214 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -114,7 +114,7 @@ configure_dma(
 }
 
 int ia_css_vf_configure(const struct ia_css_binary *binary,
-		        const struct ia_css_frame_info *out_info,
+			const struct ia_css_frame_info *out_info,
 			struct ia_css_frame_info *vf_info,
 			unsigned int *downscale_log2)
 {
-- 
2.43.0


--===============4398481999678097914==--
