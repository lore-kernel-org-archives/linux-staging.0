Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0D1DF247
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180752; cv=none; b=sUyJB+oBbl2P1VkbxxOKk7hRplD5HyfjnmVJSgD9ybgfoL02pcdMEKtdBKVuaETigKG4IN9t29PmIwceWF+A4SEO9Cmz9eMtFqxSBH2mjOpdFJUGQs1EltA2jYLSSXO1EywQ0+Km07o7QuHw9p3A9Gf2XFw4kAh0DRAJOtoGqJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180752; c=relaxed/simple;
	bh=0Q5O7UQsiBVnVsqF7W8yngWVlshFq/17CRN5KnUm60s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naGJzJ6pjWI1eqfxCSWNWl9YxfnEAw9+xPMBhaKFqYyR+uD2QiA0BQniDfAQTLa5ITqJzKRc5pFdpiRBlEeGTohZL9MMSsIOXJy9X8pBzBt+Zet7NlVZH/lcqCDlLi0+zKhdKFnenRtoPNMkAtyu6H7sE5IfGZMCriMoCOjeHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=apvettOy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="apvettOy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2255003f4c6so57877585ad.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180750; x=1744785550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mfER+n7/L7idQ+a2wuuFUDMLorTKvXF93KmEre2UXw=;
        b=apvettOyZQ3TL4sfjp1CrF3SkxLV1TRZxCPTK86y0TjZ4qwUKrGffm8fW9ozP89u7B
         5bBuJTLZzwDmEWFT3L3VwJ7VFfXEZd2HcXhBjr4B4E2z3PzvoOv9Vd8h8PIWA0BhRKnA
         4i4WT36jWAxFcIrtLPBp2MQS7i+FWzZsu6/6UaSFh4CgK2douErugQWgCJomF/B4+HVo
         V9DN+qVShh3EByFSGxU2MKiDAR08zFl0o89KFDAa1A5DSHUqhTS4xgHC+BitFu3J9o+c
         u6+5W2vEE/iEPtmkgGQGR3Qmal5X+3DHxhNNg+EFOyElrtZxp/W76BJk8uGqZqTPY9bq
         y/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180750; x=1744785550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mfER+n7/L7idQ+a2wuuFUDMLorTKvXF93KmEre2UXw=;
        b=kt8QWEea3c6ARsLS3Y0w68FxU0p0k8FuYHre2GFYI2XCh9MSD5YqIykPZyQmGXgqGB
         9eujnyYJMNpPJ4/rN6Kn0LAm5gWsLu24hv2YRHsorndbZelWmTwqNZMBSbI7TlNwbWWJ
         51sHh2Jnv85pz3h6ooYm89mL4hwhGxewLZ6P8UqJn68JitGlyO7Mjpf3cGPjDpmY5yHl
         8HrKgRBca6sGW6VLIFCQmDq/eYlCLaViuu5LAoJpPH187xAw9NFCwEsYhQoVLpuxCfnl
         /tl1Nl5Ur5diq0kHXAusOPIx2Ti3ddeOfPurz53ysfEQr/A7vpHXiTCwjcacPPreKtXr
         jUGA==
X-Gm-Message-State: AOJu0YwfwuLzxMfjTdQDlrYkZk0sgwZA50W4E75tZAH9kzVxXY+IX5cE
	BDCE88VV+5OVWITPZAy/pBhGfeUs8H2yJtEz4hX/9FZU9m4kDkeCxpM3bV//vVwH3PwNmglkbDY
	=
X-Gm-Gg: ASbGncvVbMTa07V96C9cuut+Pq1NgayjbptrsO6FI8yEiOyXYNqxCj2+8S/JkS8Pw58
	a4sIM8vW8TaSmXa/kJrfPSC6bNiUa/MITDgKxZ3V2qQq+WLutI4EsgXb6lQTlyEhE2UAWVwN8mg
	255O4QPdCwt6ZnlpRZUHx8kZqjeDJW+IoFpcGVgSZL3wc5ONZSA+6hY4K0oueWVe/lE3X3+n9MW
	rdRFZ6SLbwXYQ7gATvZBtovQotqINBAAf8L2OLNRnUFRfBvA1ni2y4n4RBRTfFlXHo3Pr92mFAq
	+SzZmkMaGUCFRB9XHxbkGsiTcqqMAGVTXmV4RXi/4DpFshP/t3vGxrPAYRhk3FTBSFXmG6Qrx71
	37V0B8A==
X-Google-Smtp-Source: AGHT+IFG6f0tP9Ckhmlz6RBcupeUK3SMS1K2wRDayJ25xnQ58PlLcuIL0rV5oPD6wPcsYYrkqQh78A==
X-Received: by 2002:a17:903:1a6b:b0:229:1717:8826 with SMTP id d9443c01a7336-22ac29b0e16mr36695675ad.28.1744180750192;
        Tue, 08 Apr 2025 23:39:10 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c3c1sm4206735ad.60.2025.04.08.23.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 2/6] staging: gpib: Removing function osReset
Date: Wed,  9 Apr 2025 06:39:00 +0000
Message-ID: <20250409063904.342292-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <osReset>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 43d655ee324a..0b32404d699c 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -8,7 +8,6 @@
 int ibopen(struct inode *inode, struct file *filep);
 int ibclose(struct inode *inode, struct file *file);
 long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg);
-void osReset(void);
 void os_start_timer(struct gpib_board *board, unsigned int usec_timeout);
 void os_remove_timer(struct gpib_board *board);
 void osSendEOI(void);
-- 
2.43.0

