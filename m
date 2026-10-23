Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758740;
	b=M6WaHlAJ6bXwuKGOuOWWKA8NYKEDQuoNv57aNqlIIqjHHi8PSPpzw4vQPROJrptt7ey1
	 1SJn7xaREHb2NIr1h/pW4hG5B2WUFj67tBVay5cVhMGgKYPQqFjJ+AIiUAwfImTUbZZjT
	 03pDsMM4qZ9w2gPxzOlY7Swy8pLS3UpqFZNC4BHx2yQ0CVgePla40G/TkDeH+KiVo9fxV
	 375TfU0b5RD/sc8pidAE8e/seBcb9kU9/voYsXn7Lsyz1SlT056F5Mypg2KADQLcPA7Yh
	 j1SPw4EPbRBO1qttZQ2Y/NRceiyF9vnw3tFBrEucC3svjEYeaYzX49alX1vxLuC0ZGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
	b=KLQ4Wegva3XD+IaFbnb638BcKbhZ5OUHmCaw5Z/ddnKKnNpurzO6bftbLVdUGJyEw4Cs
	 eN/wFKO34YTgkXZjhGTfl7Pdtv2+c/a2QkblVjIr9r1kzki3T92DcgInUmHtT2SWZOoxO
	 DTCcCvPwzH2/mi8OXyjtuuPFP+ZlcML1gzVVj282V0TaDp94smN8o+Ip0unyGqgP4s1bk
	 VWylhEuuLDALOEC+tHRSRkcCgy1jx+HxAIhCUguv1HiAKYmOSxz/su16XREhIw88UKxZ2
	 5FOOc7ld7JMc3MTHMOyexZ7wnoGDRjcA3XXWc4gGRSJ88C1nKYrSOc6KTiUqEnwjJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IvslCOSK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678AC606A31A
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 12:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IvslCOSK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso8561455e9.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758738; x=1793363538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
        b=IvslCOSKsuiRpHgUhCoW2PrAPvoXvJvuBfZRt+Rj5FRSyGFFIdz+6lRFEfWsI2LnMf
         nZiUeTM7dUOjU4JwfZCDkLlGw+XaxrtxleJuqZq43POc0x+jIhCUODXB0eaYPoMNPdL4
         CIh1cv9rkMnvKa7F0zPeSrKq6byXxdkKY3t4SrWa9zUmdOtFFmKd7bKkGQV+yLjefE1H
         yQcr079vb82qJtsZeNDch5qWnAu3r/Ieqq7rmijaH7pOECwFpkzT690zFeTU+idMxy5s
         X/oiWZwm4YOtCaJaSvX7FP2UvWy5IRNvSxJih5AP857tiVmFE7OgRt66hLvnffA9vNSK
         0VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758738; x=1793363538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
        b=ZVIXcrCxQ0ldc2y2+aZo/7l5nXBY1jwFSZYA4i/ulbsIowz0Hjj0r2g+9NLowH6m0n
         S3cByyT2erLbvfZTWRy/XcLOC9fUTzW38IiWfYB20aa6OcqkQAPQKRgA1EeTej89qir4
         H+sagZ++ssucZjfOG91CHGjntaOqw0CJzQkLHdcMhT3GUFEaVIuOGNfm2VSqLry5e7Fo
         uqcl5friM08AUwBYbkkUjCflPOHWQNeuzvAZQBGomZbM4ovqkQuIg00Xc18zRfSlbqQG
         JD7AmCFEdJFMzj6GkUM8FZCvKcTFHnHlsaqK0jzpu12NS4CjcRBSi7zW81TkdZA/uW9W
         nJZA==
X-Forwarded-Encrypted: i=1; AKwUvBz+1IDHbRHv9TodVX1bobuYAPXg17rpLH8A2aGeNPuEZMTyOTqoxDGe8kEEabzFb7Fo76QXvIV51PAYu13n@lists.linux.dev
X-Gm-Message-State: AFq9FYKHrtfMdziiXskBWU88e8x1DUYbwe+ju7zlEj1Ehf94RojDu2es
	q7k6VODoEkZphAgS6WR153NiPdzvnvizF3wMeZKZ2lYbSkwcxY7GYrfD
X-Gm-Gg: AYBFou04WK9zbNyJoDGRZZB0lqNJdu+PNtEJjNgB+eF/3GfOijTk3HHaIFSlgFXfS4D
	336h1wAj40q4oMoD235/rX9zs5cVCmgbK/FJIXd75EWvsFgWUPQuQC6dy0bGt46bGvTGLz2nmFP
	g0ml0VZ2oyNPBxjAXxKp0fyRpTkd6dbZueCh/gDnW1n5tBbE8K718cnB3aDCBeFRkBNqiamtnXh
	iS2X1Jjjg45p4aQeoRRDeqZILyyUVwQsEauuJDnBMLJKKwMdEgYVpiIso4RzX1c2kgcOJuArG0u
	KCFHNk8R6ZU8gyQjz0unW95GEmqzYu56wzMc3KMDK3bJBSs3uZOVcVGHCEh38geXI0MidBdgZk+
	b/3QHdxDhl5g4FzoeyjV9g6K53fYCzb0Dt34FDthLqHGgNFNP/6zei/QzNhb5fxcW0NqGh0PwXW
	oCEnwmFJS/S3oslXThs9VCClC4uAFBRqbHX3pyq0jFUrgIvj5CdtsixF3b+R8VdjYw9xP6LetC7
	qwpWBCR/Kp6RS22wHtGzt0+CrmJcC4lM6cckgbJa5kktvWduPrSmYo=
X-Received: by 2002:a05:600c:1911:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4a211c9de53mr35206875e9.8.1792758737396;
        Fri, 23 Oct 2026 05:32:17 -0700 (PDT)
Received: from salem.. ([141.85.144.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b064084esm646595e9.9.2026.10.23.05.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:32:13 -0700 (PDT)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lorena Tanase <tanaselorena3@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] staging: media: atomisp: Fix double blank line
Date: Fri, 23 Oct 2026 15:31:58 +0300
Message-ID: <20261023123158.6176-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed blank line to ensure linux kernel coding style. Found using
checkpatch.pl script.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..66311ab4880a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_system.h"
 #include <type_support.h>
 #include "gp_device.h"
-- 
2.43.0

