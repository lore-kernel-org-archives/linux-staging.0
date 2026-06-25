Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE33C343C
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371657; cv=none; b=k559dFEQ0fOgIXiw9o9ENg2qfzEzIq2AWQZo0flaiBcHNSDxKZSVfTBAxsNaP2DXhG6coxhokFzeoCuu/CYsZuoBLY0lLCVe+3fadV7wTuhHkdTfQkpBWWaoHw1pV4RAucwhqnGmJBrytEO0o0gTQXCt8Qg0tWS1+C8VdGRt1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371657; c=relaxed/simple;
	bh=Ia4RiXS03fNUqUgeYq+bf5XDNWlaNgZTlVC3fmTNuog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XL4RptCqacCWuhuyIsrKb8aZah7KgfFXkfTlLXAMr5M1Ykv8UdDlsw8fC3wgmVwlurGDTE44Z54D3BJrutzVLhYDOeifj49yyQVlYniDYpSFWJCy8aO7P4M8g8bQfu0meF1i6ITV//Tph//JuneMAf6P5WZO7+IKKETnyv3oEqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/VvSO9S; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/VvSO9S"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4077351eec.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371654; x=1782976454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tbErHUfzMZ5CyKFjAOUkSxCPxb9UPhRmSccdsVpeOug=;
        b=p/VvSO9SSbMmmgVx0CpaiB8cxE5YUEky4/vbNYPItzCgP5JfckcYRkIPQBGMGEvTh9
         MRDM9AwJOx+W3fld3MEiswXB+rNvQYDoJYv24YFKHMOzsH9TsBAQdKkpeIDRIVrJ7GMz
         WH+NmcVcUGlW+O1Q9W7KgbpRpZpDq02HjAAWNrXQ+EB7iRNBIoW7WE6F7u4CYGqv7Jpp
         KFvqpx1Y0vIAns7cotoKethdlOmkBDJUo4QkdxtCyN+d+AZvdNkYOFHoAZAxmPZpr4fx
         XW8JWOClgEgnQjllxbtnQ3LxRuyuN/5BQPjv0k8FH9B70jAtceQSeo1PQ432Bpaokc/H
         gOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371654; x=1782976454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbErHUfzMZ5CyKFjAOUkSxCPxb9UPhRmSccdsVpeOug=;
        b=S8qgl3XXWsLqxnUCmi9eWYKcn1yUs31QI+ok/S86UOimL80DgBY+8J3PscvCWeePvW
         6OlldSDk9RV3kzuRn/ceUFaiBQc9a2pRdLlmKtuU3RjjaDu8UxNSE/5jiW9K5uU1te52
         xMymZtZr39Yxb5m9z+wjWMc2PPH+YOQi2AHGFnPpUnFHMFKIc3KKz3sJ6SIZie+8Itui
         8hvmUwAIeAzeLTruYbDjgy4fbDengBidz2Xz8fMet5LQd0QNuX/yR/mqiDHjleQen8ZV
         yUOeEAsNQeDF1uWLQUiITxf05UNCH9A/wVkRKil3T80xmwNzHhR3LkD1QBVBBFoiQ4d7
         p+QQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRZs9DTtmxdrmtBcxUYUg2R1OyBe/GUpCbtt6Cek3kBO71YQ9+4xtIJ733HylicUsy/vHKgdswzLzl+erv@lists.linux.dev
X-Gm-Message-State: AOJu0YwXkPv40fs8nFVoMb66PiOt5gKOFObseWctCn/pPS807KKHFQNT
	mmJeL7HKazYca37PQsk6HWFlTvL2POTxxg4YZiBtOeB3kaoxQ1cZCoN8
X-Gm-Gg: AfdE7cneF2YqEOluGssDsF5/Zw9xSNDUXWACCrMDne6sq8W7tnVvaeFBpHwEKSDIM1r
	PtrjTMTqPrE5ouYJBA7u1YeuZzir/ZHgDgu/VrsLy1EXi3bCpE3JhelHl5i2vBGfsdAHeLWD4Se
	/3eSXqf5gNZ3u5eVLgFiea9QWkurPA7flPQiDmqwAN6EZ/iO9A7SkcKxnPest+022ybdt5do7MO
	xVQg7GpxiUAhblpQ4IN1DHf+VAbFr3KYicqGTU0v7RgBM4HqbYAfGMJz1Q0uNJG9slS6+kiUv8T
	Kn+OOW9JrRfvtS5yht90Q4RTqgSeNKYJZnECtKNoBZnpqBdhkSuYxFB5kAlBZsOVcIEHKO9S7ka
	8VeP6w6tEx96Ms1H5hhSTWU0w7fmCoRfg3ULhbwrBOVli1MkNXqQE57oBtlGOLon0iLOKCv3GgS
	vhAKxZNy5r92ZcJN+BtCkm7aFilakdsy6Zww==
X-Received: by 2002:a05:7300:f691:b0:30c:528f:edcd with SMTP id 5a478bee46e88-30c84d9ba1cmr1978509eec.27.1782371653766;
        Thu, 25 Jun 2026 00:14:13 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm5353401eec.18.2026.06.25.00.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:14:13 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: sm750fb: fix const pointer declaration
Date: Thu, 25 Jun 2026 15:13:48 +0800
Message-ID: <20260625071348.132880-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make g_fbmode a constant pointer array by adding const qualifier
after the asterisk, as recommended by checkpatch.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e08..8f533f3b1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.47.3

