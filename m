Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207813EB0FA
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783526; cv=none; b=ELGBFWLRjF+R1uZSmgVjZ7khtGTqFsW4qh16aW1a4tes7FuMJy4o0r5OrlgcxXhJCHgKK3L95sT3y/Bn2aXbE3/Sd2vvF7vN8J4riO5XNU+yE3FEVbe/xmCPJMjn/MRBPy1XDMe6hZQfe92Ov0g+hHCM1EzwWUiroi+biM4gpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783526; c=relaxed/simple;
	bh=zd3hFI8TxtPNUi2Ob+QMI81se/5GGTJPQ9N94j32els=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZEqrGHbPW5CLVYt2aGl3/i0EZ0rMvS5fQZfghTORG4HyFaVdXqFf0djYVq+6XUEql/dLjMOrx69zuguRdRr6D1KLh/MbJ/JhGUAn5nBJtYhMj0+Ox6Q4VB1e0SRGPrbOUAf58Tfxec9LYCIcKPEKK3Qzuf4seewWfbKMW6s/rr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEhf1gGU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEhf1gGU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so603608a91.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781783524; x=1782388324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68gXZfD1gBuTwbquY8yba7YhjUaYXF2kbvv+sF5ZODs=;
        b=GEhf1gGUmHv5RDLJ8wNWm2O6NUYD+dObas/f9HpvPRmMcmPoQdJVFz94fmwJXNYN4l
         3NszDd5GdgFnx1qWQVU84d93f4NNxkGzeqfBwdPpyf/2nm/t6djXphvDslPdgEA/tLQq
         d9A3FDaYKpTvL6u99qllt7Hrt+1vXZvOF0t2s7Y3vfzLfomPR4fYw07coeF8bjeTslkZ
         UX6KxPuglwIiEcSEg5SrpmU5RPDwmZu/wp6ZcDgfZa8Xsw6kQ2Yw/L8/Cjrrosbd9pWo
         Msp90g0KwbPwKkzu1vhaY/L7FqQfWgH3DV6wggobDM9E1PeX3MiCE2Nra5bR22mItJtJ
         l18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783524; x=1782388324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68gXZfD1gBuTwbquY8yba7YhjUaYXF2kbvv+sF5ZODs=;
        b=ah6efwggon6EfrlRqJcQgjLOwMhfdMn6TmQT+Np5CyTPUM5rXawASbZ65lYoHy92TD
         JazO5OHWmXwqiqgIN0qJi8ldeSHypX1X6BoPqSA8Z5tkRuR9dR7VTFNBLk0173bDgRWg
         /Mw3eCIrNMrJmxklr5FCDw8CyYxSOe4pfx0vlKl2qAU9HdZUP6jDqtBBtzScU/FFTzHm
         K5bYOxmRRD9Z5rKPzCR2Q3P3AmKyh7wLrSmPXHMlQvgt8LIw6YpOxytsRRgh1HnlQ1Od
         QDESCVlxEt2WepL7Oh876bD5JD5ATapf0LQuVq75ARrvZYF6cdAIbidkIPOU60RInKQW
         EBiw==
X-Forwarded-Encrypted: i=1; AFNElJ9qFAnlnO8ttmfalUa5H2U+pY0TaJvbRtUkPeKvSAykXrIVb886wgKOIoxDI/7uW6Iqb+qJoa4CtEC1fsB8@lists.linux.dev
X-Gm-Message-State: AOJu0YyyJBGHlXFjWKPpcz9HxZJAiZezrbNi8Ye9EKlDyDhZWqYZ2Vse
	rws5JQcZeP47TYIABkzlyGBlS5x/QcHsiiY5LXXteSaFj+stW5SAOBr5
X-Gm-Gg: AfdE7cnU9MMvdZkVFvja37H0SZFcCjbcZZ6LxJMDwLQ/6iOoKGp4/kcKhaCzjPebcWv
	VJoOHZUcW1tzuDC/AiprOdYQS18TDN77QUc3NnCmOmyqrvzAzX4m9MUk2lWfRLtthBtJkSXYfWt
	14BC/A+QyUNVPe0+cxxNUeYYAl4pFRoLaL5+MefVp4vrp4ndcekW4bQu0U0BS3AkwwdmuXh/7+C
	0MLtON8dAACOIYDwoxzc9DZPW8XlAxdcBT6GWqYZ6YxuPqAci/wexEYCVDxc/Skvo7+4nw4NdY3
	EVfY4eFKstY3nck1I5uaBTGwWNNLUch2fhKIDI/WXZIexpVX5vNWIxt9tc8rPZG5xQ+7x9P27gH
	0fJl3oG8GLTTo2uXW6VcrMV0lIWGfkgUD4ZyVI3vIP/9QxA5Jf2tc9EIvCNj4hyM7Fj6IWTAFiz
	Ay+Gz+IN/3vSBafHL9QD8JA+14necVu4vOzgR9S3tDyPK4GI4sDIAC6o89NwO+H16L8q57alnn1
	Hqd6PkCYb7WcbSbl2dFOMvy1CsJb0ZXfkG+CA==
X-Received: by 2002:a17:90a:d44b:b0:36d:e051:7b6a with SMTP id 98e67ed59e1d1-37c9366d76amr8306915a91.12.1781783524330;
        Thu, 18 Jun 2026 04:52:04 -0700 (PDT)
Received: from localhost ([103.170.55.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c70aa47f0sm6346133a91.13.2026.06.18.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:52:03 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: elder@kernel.org,
	gregkh@linuxfoundation.org,
	johan@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH v2] staging: greybus: vibrator: return device_create() errors
Date: Thu, 18 Jun 2026 11:34:39 +0000
Message-ID: <20260618113439.569-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_vibrator_probe() maps any device_create() failure to -EINVAL. This
loses the real errno returned by the driver core, such as -ENOMEM, and
makes probe failures harder to diagnose correctly.

Return PTR_ERR(dev) instead so callers receive the actual failure reason
while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
v2: No code changes, resending as a single properly versioned patch.

 drivers/staging/greybus/vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 0ec4d317c9db..763c234fbc03 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -161,7 +161,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	dev = device_create(&vibrator_class, &bundle->dev,
 			    MKDEV(0, 0), vib, "vibrator%d", vib->minor);
 	if (IS_ERR(dev)) {
-		retval = -EINVAL;
+		retval = PTR_ERR(dev);
 		goto err_ida_remove;
 	}
 	vib->dev = dev;
-- 
2.53.0

