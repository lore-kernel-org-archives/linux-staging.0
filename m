Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AE39A7F4
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903281; cv=none; b=N5/Fv0+Y4/GxeaixcyQwpNKWur9Qf8HtsjLzZpp79sXYM9EK97mtniXrG0sGgRPMrN2plgi0ov6x4llZyGYSGHhxFKvEi1M2PR+X0E2yqGRW64Evmh2gRKtezY2UNUHbHNKghzO1T/g/Mdi9yq4RsucSPOWi9LSlXkb0xr4zlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903281; c=relaxed/simple;
	bh=h2Y7hBwDqJlVlqsoD2kdysFT1E3Rpe9taVIjJ4DrbUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fraNHWVIn+IaLfSitJCZM1oseDJbYj4HN8YXAwo/XAmRHyy03Ez/6THzTL5wOCznMHnpOYsrz+bfa9ARGA4y3spLpsdOatiVBXkU9/sLYYLMW32C+NqPmSZEmZTOcTAdCvjmzO0QHaVqBK733WXHOPWaqb51EePWNEZZBhKuGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI0MPU96; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI0MPU96"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so2995521a91.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774903279; x=1775508079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4ElIH0M0rHCyGbmK8ZHM2z6I4vEqFy/h6gjPeV4VGY=;
        b=jI0MPU96rp+fy+VFaIh6B98SEH/0BRu8G2l8UJP0b1b0KPv1WsYV2jccUKpoyVxXyM
         xvicvYHOSeRlASl7lwTg6lNHlWTkP+yXmiFP9tKT3ON2HCXb3f1belqxIFcn2O1EwLO9
         BI1xnNdofrwc4A3QG0IaUd6PNX803LeYtPRLUBWQ22RNkGcYQlNWX1pdIckNxNod02z3
         LHnagWSFSFPnAETtwQHjn0xOppmbbJsyiBTVNrGWtuWV9F9F2f1zD7tRIdVzCMVUnBI7
         qIqE5uASsjg1owCOvyMyK0uZvOU/5fauOq8+9MO4y6zfXX+E89evmW4Vz9TjkbFKuVXR
         LoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903279; x=1775508079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ElIH0M0rHCyGbmK8ZHM2z6I4vEqFy/h6gjPeV4VGY=;
        b=q9L4rZzaE+zeZ0VjiWEbLj3YWt0coS3vmbZakKjM3KGGsS/CnanKx79s9lkoYRgKqy
         MhyrrSov6CXMR9C4SSh/IpxbSdm9gomV5kzx53rFdseP3QfHNQSrSZNyodSgYRYG8MbV
         UdlYWMMwjBxLb5JLK4IWG+a7tsCcXWQ8GyG5eUCOjyX8Ul+DCkCh5HegtGTOogibVJNS
         GZrcVyR/PqMLv0jJHTRhipuNtbKXVI+KSS+PZvDbeay6+XQNr0jbYH/4kDl5zYeRyvtF
         uSf1peoEDvgXyWmE7RfKKc+9u0h0ps8601r/9Knfb1Ix5snljYlmeJh+6SennRX4BD0B
         rgEA==
X-Forwarded-Encrypted: i=1; AJvYcCVoi/ngGB864zp5fpOctXklNunFptHi527yO4/tGZ6EXX1Ydjuojf/y573W9n3AbYeLGNodXu9GbwWQJyAT@lists.linux.dev
X-Gm-Message-State: AOJu0YxoAChTRtoFdfpSQfsLmTNqMMXaMaFArQzSZ3VSv1QNEFgzB6Yd
	PonYQqvRy6im6ER7Z1CU49e4U59BjrWXPoiNFpuvSCERZI8DM2z+8dG8
X-Gm-Gg: ATEYQzwx9eokYv3rF6dNoBOnhsh8JLDFJjS0qJN92DPTXO91tOgmL9xPjkn95RcaPZq
	rvjs+OCvChXUQh+RZRBuYBEZqtU2QJMr2ck006GfBuYcBk1XYmwFwaDYnafbUoSp/eA4e/LVwC5
	Lt7TJL7EyI3pE209TuXv/YFLtSdsCLxL6J89RnPNmlWmnlsoIrAa298GZo15itUVDEm42fklkti
	wGIC/5uhIQ2brcHIHYwI2Z0VH7T0H4ZPMhOklRaCzpi/40Swn7ZfITmRFL5XX9pR/ddZflIDAnX
	n31OVIzS/zy97FDdk5y5aY5idfvYiVV6rjX3bpWScoR2D2OGSXZxxc5SnJMJ7gWvjg0PuLrjLhG
	TOpweVJxVpxmisr4bNH9eWG2i9nP7lLwIjhnqgcih0I7vdWYwNMnKNxjOr0AybTvZdlN00kmyuc
	wCSjBFI5/ZSuxsb2UP/kLaa9tG
X-Received: by 2002:a17:903:37cf:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0cdd104e6mr138195835ad.46.1774903278726;
        Mon, 30 Mar 2026 13:41:18 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm78081095ad.65.2026.03.30.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:41:18 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: media: av7110: coding style fixes: too many tabs
Date: Tue, 31 Mar 2026 02:10:24 +0530
Message-ID: <20260330204035.22074-1-ss22.kern.dev@gmail.com>
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
PATCH v3 consolidates and addresses review comments from earlier versions.

v3:
  - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
  - Retained the original code style as suggested by Dan Carpenter
v2:
  - Refactored change by adding function handle_ts_memory_fe

v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/


 drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..35f7d6bb8c74 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,28 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	return ret;
 }

+static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
+			       struct dvb_demux *demux,
+			       struct av7110 *av7110)
+{
+	int ret = 0;
+
+	if (feed->pes_type >= 2)
+		return 0;
+
+	if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
+		return 0;
+
+	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+
+	ret = av7110_av_start_play(av7110, RP_AV);
+	if (!ret)
+		demux->playing = true;
+
+	return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +973,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
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

