Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A4A3B52EA
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383520; cv=none; b=LRz0W9nBKFbhKWdfAwSuPNB3R4lL5tPt0SUqUZSgxPhccwtZFN4Itq13gzm05S062nQzU9JSujp96F5OS0TlPBxKVJbfH0DiwM7R4otKmS6OE2+WlLYm/egoUXLplFQmVq3YbDx52ekN+JVF3z8oyAsJjSU5A/K8/Oa6EmSNqNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383520; c=relaxed/simple;
	bh=zLe8YPVGtEm735zQ5/84d3c2e57a2WTS6Cc0G9vqxcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFcesBs79evksCnoKj1iObr36BljBVOusAFi8ld0HQ5TFs5VqPUsT6vz24oC3EohHlmwh1P1O2qCPF6rPAco//ydSL9iF8hy1SSs1ulWXeJ0kdwtdEcy7VfNO8VMUKgMsblVOK28cDARRVoi9vwkCsFAEoCkWJzyp7c5jsTJzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrMEqC5j; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrMEqC5j"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649ba412b8dso1976599d50.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770383519; x=1770988319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75r+vLv29nvZ3dM+W+pTo1X4ga8rRb9wG3DUEW4UJ1w=;
        b=jrMEqC5jxXKcnMjZEpCMVAQ0wjs97FSANd8nEQG+LoaVuJ9mOpYUfwI3ahYKWqg5Mj
         0e4hCXF3aQUW4xZirwU/Ezv/tm02EcFdHn0i5e4UGrWQL+v4MDVpXaYr/B6vu28Sglhl
         0HSFVq6Gfql/6kUXNpJotQ66ytawU+7OQwYLtqftBMSYoNFLUhmA3iChlhKG78Hrf3YZ
         y0Tjt88Dm0O7nileIg6PsxqjucjT/RF02V8BP/XYl7kxhLY5XVsORPWfFCf+IDx0Dmb5
         xmZ/paXfTJHKAEE+okek+5qtNV50iwVfrwYmiLMqwiKHfiImRtK43hpFsrnP+x3iuqXq
         850A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770383519; x=1770988319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75r+vLv29nvZ3dM+W+pTo1X4ga8rRb9wG3DUEW4UJ1w=;
        b=ja7QkJACZIAPVg9LuQq4afLihf3NX7dcoEqir20E4reiVV6eqM71R5JScj8w482qeb
         uWD+kB8c24ONYkwXOEU+SurGOCp5p1wQQJFVxyfzAPUQR8Y7VJh1R/2+hYagm/Jllc5R
         j0tXhzYD+4Piu1xZ+17pOKFdPbjsWGE7Sj9Jx1ttrOKiUPWnRVHfPpHG2JUoj9VL1zQF
         vVNmFvLq607n3k453Kut+r/a9SkM55mmsdYBAy7hh1q6rK9A0ULzfLPgo8GxDGyCq4VP
         KCg4naRrfyfNG2tPYDw74qss+1uBg2iYLPxfmXol3qfmomDboi8kopuw+HoSUZwe/l6k
         As6w==
X-Forwarded-Encrypted: i=1; AJvYcCXD1QmaunPRQQU3qwXLJRXyC+jgB1ZPxmq8cOCWgtddj5xkFokBHSUcFvc/P2hiomV5CPJ7KLbgdWOszxAt@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxn6aPrCzTPs1gYdVtcbW3Bgu0DFNGtJ9WLu6vTLQX6tWtpVDH
	5ljwhkLWbrZcpofgpLBYN8wanH/i4YSBN5MOaN3Ig8a8fIkIjS/x7+4w
X-Gm-Gg: AZuq6aKIuEFdhAFT9glKsyK9RCBW8vsaJsi1MpZdEskU1s+zmZKNekcsZ/K6GbEw46Z
	0lXPd4q/+L28kwHsLcBoMTflh7aVylEh3Npow52dt0lNHVD/e6PpYqWHHlBQSm5z1wPE9gO3qtn
	ZXqLfk9YpZhSpNAPMO3mhuXC79zheY940QTImBFraKaH9Zw0PHEbsJbSPbeXQs6SksO+uTpVJup
	2A4pMzriUHxIkJcp0zUkrWvYfHgD+sRVSDG1nKEq1lFkWKbM+2TFtxMpYjJDqHH8YvwyjirUzDD
	5UUCbJZDFxv/r6DZfshvqjOtf8vkOzidq016lsHXtU/bG4YS+sOBZ2KLbqUtCBA3u2FQ8gPMtqM
	cM1Af4u7dWsiKlYWzAMlqX/q8KaYc8R/v83rQUmQpdoxafJ5S/x4jh/X544TKxCrC442JjuSJ0D
	vVN6PJ8/YfvEZb7zpNAqQhfWREJVBmF4V6wnwrp1zIJ3m1xbSmPLLJG3nV4y54UYZf
X-Received: by 2002:a05:690e:1686:b0:640:ddf5:254f with SMTP id 956f58d0204a3-649f2058f4fmr2772452d50.62.1770383518787;
        Fri, 06 Feb 2026 05:11:58 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f255ea1asm2160559d50.18.2026.02.06.05.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:11:58 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v7 1/2] staging: axis-fifo: use u32 for fifo depth flags
Date: Fri,  6 Feb 2026 10:11:47 -0300
Message-ID: <20260206131148.13643-2-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206131148.13643-1-gustavopiazdasilva2102@gmail.com>
References: <20260206131148.13643-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update has_rx_fifo and has_tx_fifo types from int to u32 in struct
axis_fifo.

The of_property_read_u32() function expects a pointer to u32. Although
the current code works correctly with int, using u32 aligns the data
structure with the Device Tree API and prevents potential
type-mismatch issues.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
Changes in v7:
 - Rewrote description for better clarity and explicitly acknowledged 
   that the original code works correctly.

Changes in v6:
 - Added missing "---" line after Signed-off-by.
 - Updated subject prefix to staging: axis-fifo.

Changes in v3:
 - Split from a single patch into a two-patch series.
 
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..7bc7bf191250 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -121,8 +121,8 @@ struct axis_fifo {
 
 	unsigned int rx_fifo_depth; /* max words in the receive fifo */
 	unsigned int tx_fifo_depth; /* max words in the transmit fifo */
-	int has_rx_fifo; /* whether the IP has the rx fifo enabled */
-	int has_tx_fifo; /* whether the IP has the tx fifo enabled */
+	u32 has_rx_fifo; /* whether the IP has the rx fifo enabled */
+	u32 has_tx_fifo; /* whether the IP has the tx fifo enabled */
 
 	wait_queue_head_t read_queue; /* wait queue for asynchronos read */
 	struct mutex read_lock; /* lock for reading */
-- 
2.52.0

