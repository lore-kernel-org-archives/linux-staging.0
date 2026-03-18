Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F0311946
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861140; cv=none; b=aL9GFnr+IOzuUfRSpgMRE2EzIjzT1LvMVwP4YSQC2/jMQqX4Zh3oMEhs5cLgFay+K/Ryy+N/JAQIEmdeoFqSmoqfARYkhGyHzYQ3jyBSw8/4uPV+ssInZNJRF5jzQDXZLqbE93QrUDu+fwsxmOv9gKd2hhKR8AZrSt33LNeDETw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861140; c=relaxed/simple;
	bh=Ke2jPk32BmZfMKuOc2wbyhXwQbB58vorjkeaSPb14s0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcN2kjHY6KoP75Qb72MX0COIrUS0oZnuuEGaPiWskBU5gNKU4OEbX0LXeOmdO6sk3HKTU1/2w+hAw+/cBwephHNJi6Sm9Lm1jKxahuZ+aKE+ygcFhvCRvaDieJbMlPz3QMzeVhyozAMMomnaQvUzYAv5p+d5tYrwN96ln+9xo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6eFZppp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6eFZppp"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c736261ee8dso65561a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 12:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773861137; x=1774465937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rtyvqAyOmQpfFoytdsaHk5qiw++19zV7NVycqJvGPgo=;
        b=g6eFZppppHtoliZUq9rw2D0SOpCliB1t5PLZ2LiEmQMmwC236HRuRO3s5y4nSLtRse
         AkwV0WriRzDc0YYRkVo8uvh97ANUVN0PMTlVIvC1R/wDoGdRL9v+LkWA0/8xh7NGfQ/m
         eAz2S8vv+hUgGMTBxg2bh2sf6MvSM4vYZJCYnXtDOiJ7BB6969vImWd14o/qwsyO6ESD
         em4tXp/XViPfJkvEz4HJisNlQ08IANt7elNf4if3nej9rULM6b3/0A4F+v7Tf81Joon0
         VqMErZ7Wib8jh5z8+3q5DBFy9aZqI+/9OyG2gYnY7WOOYda1zv5ikQQfRLB7E5izJKCI
         kMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773861137; x=1774465937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtyvqAyOmQpfFoytdsaHk5qiw++19zV7NVycqJvGPgo=;
        b=bsQBFaINXhv008kX+yEsmC4eYspcDCF4q8KxGCBreLKzjZ8EdMPRHgXxc/pxZssJFG
         LtBLuFOTjBP0/JVVdKFK8/EarvZeWB+p18W44fp5UqGfTya5Uq5KmxomemRUNijau8YZ
         CTPCYP06pFQf5Q3jEdi7r9Mk4zWCreGhb8mHWIezfGP3cW/n7LMujMrOoh9kWKt7pZXa
         6DdMSCbKsCtsDnrhr3XlnPeD+TSXGge1GZRy+hG1I3uhSJeTIpTRXJjtgi4ukP5YwCV0
         OnAecTxQhd0ic06L5voKXUUvP++6rF64b1LAOsDo3zinI/F7g1JfsoC6SLwYL7ebzgDV
         sfug==
X-Forwarded-Encrypted: i=1; AJvYcCUyB5DWKKu+BN05RH/v2cXaQAbl47vcnhb3NUvz4vc771sWGtyplil4s5oPmr9LIICoVwkZ0n0UaOAzEw0k@lists.linux.dev
X-Gm-Message-State: AOJu0YwTMBS20QarQyt0mFoj/dY/UZyLJA95R4gn207tadq+Y2M2EuGS
	b045IDuaQs84NqNZ8Xf77XW8MPsDo0A1ME1SV/dZZPg4+cXfe2xeZBID5oo+RqWr
X-Gm-Gg: ATEYQzzWX1Ci8yHDoBy8tlCVtktpFRfdR5qoEUNeH1xDdDTtumwpkjzSpjudQqgMwv4
	cBZ/a6Hv3hZ6WlUP3i6fRVQGEjs/v+zFBfCBGjziNwu2WssBJch/rKJQ/U0/uQLmbk1eU5/fvwc
	amfHANQreYQPULUk2tTG8qr0JUkL6sh3U0fH4kAaVaXRT7yVuzY9yVk01HkKHAa8uok7/GMqBwy
	ccUMvZmYyLRCZn6S2i7nWX/z/vqIeEigfhGvN4nalmzBUmYMbAM2KID0ilQiZpkNuPrZleB5Xct
	EKmCWL/qapSmQY8wbThFraUTB7dI1RS2JFaHooLoPxNrG25Mf2S9NJ8mq65JCjj2xsvhQOTLk++
	Hbr7vH7jjKM7HjrVAhxDqJ77aRHVW7pW4PKPmThlxa6t+EI8+nhXNqaXBrSoKWuOUj3ddymNhHl
	LSYZiyGeycSKjX12/0I3O/EYpo
X-Received: by 2002:a17:903:b85:b0:2b0:5661:e10f with SMTP id d9443c01a7336-2b06e43f61dmr39596955ad.53.1773861136974;
        Wed, 18 Mar 2026 12:12:16 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e615f88sm35495855ad.65.2026.03.18.12.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:12:16 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Date: Thu, 19 Mar 2026 00:41:47 +0530
Message-ID: <20260318191149.109616-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes below warning reported by checkpatch.pl
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 32 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..970343c4ec51 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,27 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	return ret;
 }
 
+static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
+			       struct dvb_demux *demux,
+			       struct av7110 *av7110)
+{
+		int ret = 0;
+
+		if (feed->pes_type >= 2)
+			return 0;
+
+		if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
+			return 0;
+
+		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+
+		ret = av7110_av_start_play(av7110, RP_AV);
+		demux->playing = (ret) ? true : false;
+
+		return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +972,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 		    (feed->pes_type <= DMX_PES_PCR)) {
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
-				if (feed->ts_type & TS_DECODER)
-					if (feed->pes_type < 2 &&
-					    !(demux->pids[0] & 0x8000) &&
-					    !(demux->pids[1] & 0x8000)) {
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
-					}
+				ret = handle_ts_memory_fe(feed, demux, av7110);
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
-- 
2.43.0

