Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0351D63D6
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849979; cv=none; b=YNG1dCQJB1R/Ep9cBD5qhiWMgt4HPyADBpEUJzjNAaNEysQF0epFDf3vQ1v0j7yYJ5IU2IC6W4eHBgeuPxTk907zBr4HRlhF1WtPTVVkk5RUcJBbkIgKr879uA5EPtfCdF7749wA1IkpxmKOlxKZnDvzmg0AO8ud96b09t7bUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849979; c=relaxed/simple;
	bh=KQ+QquYMBIqqRibT0ze5+kVkj49lKLUsMiQ1kpVHVo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bxiqn7XCyVi2cW6Zz3peruNRj3w6/J4AzfP0gff0HfB4AkFJhnZ5zyjm7GVZdwPLdaXuyKJx/kjQ0fdEpn7+C7z5SU1Vl1P7TVDLS3ZjekCmJS4M48N1p2DFwM+0darWqIJTawpHHW+P2R7XuJ+8t9hxa6vRS8uYEfZbpSVyoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=CPbt0UsX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="CPbt0UsX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22435603572so2609185ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849977; x=1745454777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J13uXJRWM0moEsklwKwSqEYQ8UWHeXvw7Ls9WCbeq70=;
        b=CPbt0UsXFC7hHCtmbKC6pgKJY4V2UTDdlAHYF05bC/gfBohijjla1ScRSjr/dFjqSV
         4syrqCqVQMmZtpapLpE15TGPuhM5yFPO4gJRV9mYy1XJnDuYYFRsDr58XHboX12rCSDV
         57dKiRQmEEP2eHl/J54MZkomd5rbi6qVq4IgjgpXU+SAtV5EKgNQsLl5Xe8Dj95WU/1q
         CLt1+NpUEpccUXGFjaSM13+wH2rtyEF2LIWKkdSJMryVygVHEjpW0VD9mxPb976HjL1v
         hvFeTTFEs4GDPnUtUjGyaaG2LbzoSeuBUaUoA3x0ufYRpA+rhxeq3QbHdNgA0jhHgEYG
         NccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849977; x=1745454777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J13uXJRWM0moEsklwKwSqEYQ8UWHeXvw7Ls9WCbeq70=;
        b=DJSPbfrPVwSlCCu0pNHhvUCqbgqTslyVMQFGz9ddFtYBkIGanF3kckgAVHfUOZatlh
         XqzTzCV4rACAGya0G8F2uP1UwbVjBuB09WGa1p+WTZ6JWeIHVw26Qc+OuLAUc3UpZz9l
         JQ3tCbaVlxfBbw5B72Y5aK/jn3HghWl6bEgT0dEJhxD3dcU/ToM7fpmXmI57PTfzjRhy
         ssRzKhoczaqHWytvyalkQ1IgBxhcW/CV0hTAgF77ESs5jwIGDghk/MMVtHHqH8gP3uhd
         KuzTlWdk0SM4LxncXQjbYTq1Xz61R9zkZXlF5c/gg6Mge3O76uBLzspIbNe66DIFUsgV
         8tiw==
X-Gm-Message-State: AOJu0Yzl81dng25GCphasqC9s9yoN8n0rubLhnnbNQAq2w6cJJYp0doQ
	qJBENdlMLq1CM0ZGVHOVGWELODanKeRSGBEavuFZW0ydeHITmO8KI8btRHG9kw==
X-Gm-Gg: ASbGncvPlvq/SwUfFCYgqEOpZyFu8coV2g0dgDskHSVXTeDeoO/8HLOJWq1SyX7phhn
	YcPFNia8UaAQkCxMN07wDSPsvh4yE5Mp62ul1jnLXxqmMpWGZ0A21eyf3CScFnrwxUwgk0QKL4B
	VHkAGp+6ZHyIUFdsciEkw9btv3KvNQWUuQEyy2MYTOowScXynh65EFOmOw8YeJZTdAMC71GP2VP
	JELFg9mPrXnOFvR/hJVlX4xL34fX3lEEhlI5KMKpYD9Uy/SqozTtZXF/3rJm4DPyWTgP36nALEu
	bJJBVZnVmM2TOcyVjf/w179LsISR/Wph0ZtReqHY5F+WQHl5yKbKdNLU2H0SJZBhjsVn8ijonqQ
	cGyVJEw==
X-Google-Smtp-Source: AGHT+IELXGI5nfNb1JGGFd0TXtfxoydnNvgxQFjdrUy7B4TmFWpVuVQZuyyGeKtBcECtNET7gjACFA==
X-Received: by 2002:a17:902:d4c1:b0:223:4816:3e9e with SMTP id d9443c01a7336-22c358d7039mr47655315ad.13.1744849976841;
        Wed, 16 Apr 2025 17:32:56 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc451fsm20855325ad.159.2025.04.16.17.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:56 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 07/18] staging: gpib: fluke: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:35 +0000
Message-ID: <20250417003246.84445-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index bca3bb8a3d28..a45befcf003d 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -712,7 +712,7 @@ static int fluke_accel_read(struct gpib_board *board, uint8_t *buffer, size_t le
 	return retval;
 }
 
-static gpib_interface_t fluke_unaccel_interface = {
+static struct gpib_interface fluke_unaccel_interface = {
 	.name = "fluke_unaccel",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -748,7 +748,7 @@ static gpib_interface_t fluke_unaccel_interface = {
  * register just as the dma controller is also doing a read.
  */
 
-static gpib_interface_t fluke_hybrid_interface = {
+static struct gpib_interface fluke_hybrid_interface = {
 	.name = "fluke_hybrid",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -775,7 +775,7 @@ static gpib_interface_t fluke_hybrid_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-static gpib_interface_t fluke_interface = {
+static struct gpib_interface fluke_interface = {
 	.name = "fluke",
 	.attach = fluke_attach_holdoff_end,
 	.detach = fluke_detach,
-- 
2.43.0

