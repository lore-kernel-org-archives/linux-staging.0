Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2520E332
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849989; cv=none; b=K4fdK25mITTsxLsFQN4HwsLSqHBRc8oMibcgJkSFLc5eY6CNJ4dAFtYzXKdxMduHSYe50JxzWztvk18bjGNEAixODco6gmypBG4K54AolbeWeVh1GUpc/ZoNwGpgnNCweUcs8rsLwdZPXKHWHqqKgUJTHrJbtw+bSnWuTHdg80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849989; c=relaxed/simple;
	bh=r9FE5GpaFdBdPdJ/Zrxc1eYMAW56Ux07mT3KRwmjw48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5I75gsTbQx72CSQ+Gw10m8mtk2DiCO7pWcWqoeED4jx5c5+z5rvXkywEE/WGQA9VoxOWhreKAymaOeztaZYJRLLLH3tZAvTe4xGjFu9GCrqra+NTs/x5yoDUKN/0ZaJvGamLLdrfgFff+8HoNwU5/63Xpxz/x5UvW6z0VPNYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=dMU+fBMd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="dMU+fBMd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264aefc45dso4201285ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849987; x=1745454787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=dMU+fBMddj1cSEr0pgNo+38Z5YWMiUu5v7sXhqF64Na/JD1qrsAkBalVA2P79cA7Ps
         nf5YNcnAC44QSBOKy3H2R8QDCuNJWbhCQ7sgsaR/JDRJydjWCyJyAADw9U3/yBrWEGbV
         y8mzDdMBwadDt5yjENiBduudKlTqk+ZJJFUikg9LagdQBHHHiB09U8ZxEnBlr3auXg0I
         G6dEfdefN76yk7cD6LRF4p6vLonIQOB0iN/SKfyFn5t633/4VdvxdbWhw0jpOCC/cbUc
         JtHiEOOEhTBM397EUnIisXpOPC/90d5VSDotu0sjMat0s18C4QUjag2WVemTu8rzOojR
         erTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849987; x=1745454787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8yDc+KkTQrj/aA1tqJ3BKYXbav1Fvp+NFLeH1to/I8=;
        b=KC8dLbj8d3/nKB6tL/U/b0cayL2yRCfPoJJ9j28+J4cJYYcVqNxMqRQWKkObWVmIrx
         AzeeVc3tZkgsMXuBPCeld4KyvSjTiAl7XBtWiufR38csHvpEe/XKqqPrELdAMkdP/7xO
         8hgUBYjiXSVjsd46UXqGnBZlsFmtdRMj9SbFOW8wjvSYm9idORzCQJuJWuR4Mub800bd
         UMZyzJ1kSw5VbBftKDE+3PXqg31NPmIvB5jouYQsMm9cY5t0s4ze08g4HJeHFCmoffy/
         QWm9zbHgg2t7T2uLpQ5JvuU6pqfrTXiA7EiJtkzkJGfCAaVIKD7WDMiAsW8CM1gfXl8J
         sDJA==
X-Gm-Message-State: AOJu0YwnEe7falaofQsbm34jC7lgzVt55mtDA2MOeUFz1laBs393wLBd
	Zz2tFjwGrzgxrSUAu6U4zX+RIPGPTsSyAVjh/6Sf0caqVoJqUlis0eNvys6f9Mzd5CPfDAIGF/Q
	=
X-Gm-Gg: ASbGncuc5rzXJmemXg6jHHoxItTEmndfmpGDdppCpJC7Ih3ket3SvYsVp28rHGRXYPk
	kHEpWiFEZvPmon8dIK+0GN3NP3QoJsFf8Et4KaZWYUQrvaYnpQDe16lc+E/RSgN605VsLGGeGxj
	M8Ft+Yd8PoLLDNn+1QgfeMdY5wAgJuT7q/zR5jgm5ysjdcSWihbexbfHb3uGPP9bmzmhK0R4IgE
	RebA1OmyqKEZzrJNr+FreNOYVHQE+2k5M8ZQpGBIEwKi347Hjj1wcxZ57nwr33epCVgkEGznq+h
	O7SNA4kzwSKcfimg787By8GODS1KdADrsAboNg7aSmTe/1m8m/67PcJM6Ck0gk4NzJWwpPyclTB
	HKc2hCA==
X-Google-Smtp-Source: AGHT+IF22f9NKWSjaengdB/H/u7QwubeplY3S/KRzPgdZlcz0HAybXmkX0hNLsh3Kbn2Y+8KnSHX3Q==
X-Received: by 2002:a17:903:2c9:b0:224:194c:6942 with SMTP id d9443c01a7336-22c35973f06mr69024895ad.34.1744849987568;
        Wed, 16 Apr 2025 17:33:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e83sm20768425ad.35.2025.04.16.17.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 16/18] staging: gpib: pc2: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:44 +0000
Message-ID: <20250417003246.84445-17-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index ee4ea1f32dfc..ae265e2eb46a 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -519,7 +519,7 @@ static void pc2_2a_detach(struct gpib_board *board)
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
-static gpib_interface_t pc2_interface = {
+static struct gpib_interface pc2_interface = {
 	.name =	"pcII",
 	.attach =	pc2_attach,
 	.detach =	pc2_detach,
@@ -547,7 +547,7 @@ static gpib_interface_t pc2_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_interface = {
+static struct gpib_interface pc2a_interface = {
 	.name =	"pcIIa",
 	.attach =	pc2a_attach,
 	.detach =	pc2a_detach,
@@ -575,7 +575,7 @@ static gpib_interface_t pc2a_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_cb7210_interface = {
+static struct gpib_interface pc2a_cb7210_interface = {
 	.name =	"pcIIa_cb7210",
 	.attach =	pc2a_cb7210_attach,
 	.detach =	pc2a_detach,
@@ -603,7 +603,7 @@ static gpib_interface_t pc2a_cb7210_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2_2a_interface = {
+static struct gpib_interface pc2_2a_interface = {
 	.name =	"pcII_IIa",
 	.attach =	pc2_2a_attach,
 	.detach =	pc2_2a_detach,
-- 
2.43.0

