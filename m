Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2602DAFAA
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201971; cv=none; b=s4ZS8j4MYupVoknssYt2LlcNm9TTM2OTKA1cKQUoTJJN0YV8zM9gOu1yAC9JTo0y0SY/orGRyxglPLBq4s2DjqlH1tCwWi7QwF1jW7gu8FjLHITpFAOesSIhsGzkuXqo4GRdYJo73OfQJ/2NXKwubDFQ3eyAsU8OPDEn8lhSHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201971; c=relaxed/simple;
	bh=jgzhhF7Keel4cEaK7LO+bapRO0+vfbBepKs0SYr+Hj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZyQArRJCYylOhSQHHFdWqO/FG68Ev74xtO5eqIiPLEdD0ADWcix0T7iUJu6VqibSBrJcC8jMI5JHn45YOW6DiTRu58M7/B9tbesTeArMLbzaIZ/yGg4z3Fxgjg6cz+0lUB9/EdzDCxEpU/xbPtEUZ2uZKXPMzDx3oJOOxoLiD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgrNxTeF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgrNxTeF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-352e2c59264so1949521a91.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769201969; x=1769806769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+u1YHYpCXQ8WpIgCxJ/SHPgC4uJw8zAtCFGTmGbHbtY=;
        b=ZgrNxTeFJwkYfW6+A5aOrFSksCoZ64MwE5sk2celE7yIN/hhuwhXNRvO1ym0vzsyye
         tZC+a2ncaY2IaTzeHwcWlDpbsYLFkuOM582wIrF6e21+f+cwFxVVeWV3VWwrzfDmSZ/b
         y/b4KwVkvuI7DWCFAoPkYV2B3YfLTrXxmuMKG240Bh9XQghvMQBr/vl+bFCO+X2mQB0Y
         0eoxcat0xodojFEd3DqCtIwC7g8HzbOQS0FkJJp5eUl1zzoX1d75CLEzCdDBzESY9AN5
         OS++Kz7ugI5oGrBH5BIHiVxSAFGNWrtQV+HzveqonOG3/EupJPQqEOcGCpFoGYUEtGPM
         DnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769201969; x=1769806769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u1YHYpCXQ8WpIgCxJ/SHPgC4uJw8zAtCFGTmGbHbtY=;
        b=HWL5isUTnsqVjWuFZzp2qF+R4AGxDWg5LvFCwAtEs8kZVMP9y6Ca2MRi0hOtjB0p/L
         jQhoC4vjVCgw7OjtAlM7FJmM7DWfq5LUnrUiAxCpGMZ0ujkQaVI2m9OMqvwFm4quArDn
         MHB/zxyczqgmMCnU3p2XuhVIjPoLL7+tZlxyHsBWDPWFTWklds/7JJ7sZ5ZB7uxi5ftJ
         lfcLGOHCFgwQgVv8ujK8+fq0YR3Wngv8Wxv+XsabAQR88N/BZQh/HEqUoDo+olTxx5eh
         N6VX6QQrbBNiZ2aNySzs6kmCp5tAVY984g5F0OcwCx7+LG2pWiyE9DVwWHbbDPf3Cv31
         ZChA==
X-Gm-Message-State: AOJu0YyrCYVQndgSEzClz9YrqKkzzp74grW+qz2kRRyV3dBuZdbFTOAi
	Mvfd526FNP+wGHB43V31NoM0Qdeh3jNiF0La3SURgxQHFMR703yKGLVdww9G8Q==
X-Gm-Gg: AZuq6aKRjWaTcl0GObVYnmJupZETs29ultOfxnwNXahFaaifDYq9Go0QmfaSJbEg2WY
	+RfBHmKioXYWjz3QcrpNG/gZiCmwLpAnuiZUMUEsTqGzujrQES1e9O9L/WqWaJd2c6jIAO/t+jC
	ciiKyVY+4yu3t6C+tV422q6VIFj2Wy/4IxKDuK58hqxe++lQKdkLaYYIx2fNw6dvRKeTefpoE7Q
	Fx1thgA/RlY2V4aiowpmuGTLkf0nL7MqbJQzY1NqRzlol+cDp0r/hoxdwdfFGy/p/Pm6xFiMpCk
	TVKNFVNdy8yiUpmNpnSEo2FekH0r1IXxFoQ1lai3dNNGFXcEosiFGaj1HCblDqra7/sdEXb9gIf
	/o2HduESxo+F6FGCdg8oYaKgTTuQbXuJNiDnPCp0BqQRNFd4zz7z0AmT6KUTK5QE9pq+ekywmhh
	hlEBwFzCyLCEeQTV0FKlLFh7p7cdIbL8MKpXKVhWI=
X-Received: by 2002:a17:90b:58ce:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-353670151b7mr2941045a91.5.1769201969596;
        Fri, 23 Jan 2026 12:59:29 -0800 (PST)
Received: from localhost (125-86.iitb.ac.in. [103.21.125.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc50882sm2802325a91.16.2026.01.23.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 12:59:29 -0800 (PST)
From: Geet Singhi <singhigeet1729@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-kernel@vger.kernel.org,
	singhigeet1729@gmail.com
Subject: [PATCH] staging: axis-fifo: Fix indentation
Date: Sat, 24 Jan 2026 02:29:05 +0530
Message-ID: <20260123205905.37717-1-singhigeet1729@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check reported by checkpatch.pl

CHECK: Alignment should match open parenthesis

Signed-off-by: Geet Singhi <singhigeet1729@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 63221dfa5698..aa90b27197cf 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -141,7 +141,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		mutex_lock(&fifo->read_lock);
 
 		ret = wait_event_interruptible(fifo->read_queue,
-				ioread32(fifo->base_addr + XLLF_RDFO_OFFSET));
+					       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET));
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.52.0

