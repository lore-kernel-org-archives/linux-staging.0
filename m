Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897C1A01BE
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775071073; cv=none; b=kZiGUfbGrQV8HW3UphZbbSJ4cOuY/coDztk4or9Q76F12xRUxquWUTZvUbK0F6TnBmDoLNlfYCRsK2IL9KZIoNeNyPm/KSM/lDiWuKK6FTnHBrlHC6WxzJ4ePZxvgcjcq4VStv5MrZ7vYrFGkLki8OMIarW70YXYsnXwKf1OyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775071073; c=relaxed/simple;
	bh=WVp2ddejS72pCQjGiKfyMEp3r12FjUVCqSOQQN8vZ68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jc/1mYV27CF9UZJSKo39OvDSqKjUD0yi5gaz00ODAyGrPDy85jSSE2H2rA3cejW9KqwIVLfaOF672j/16/rY+EYo0oqhblfYn4+vPFyQ4DmrKV7UY2F6ysLHWlZFpHDinm5k5twWRLS9ftZWsalzSE4ZZC19x1nD9JHqU5ngrWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGlYzJcB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGlYzJcB"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82a893d289bso60821b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775071070; x=1775675870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFGgYlat78QlHBf17jTWXfuiJFHZzeYKJ7RjiLS7B90=;
        b=cGlYzJcBpM5TcGZRWbK3dB3LoAWU97b3yNnt0ZrdrbhMRxegO9KGlVP4E0fyzE+QGj
         9VKUu0qF0J8n0ekiY6VJIb77tobA/aStB7nDU6MW9tYPDJQm62dj+LMYvofvN+WpS0+N
         SiklY3VCTlApj9eHjXiaMADiMGJTzHlsF3a/bBmRp+nOhpqY//iMpikbg9f04voHoVtj
         D/T/S+DnCmMw1lua+JSJWHhYyi/O+ygV/QorC2jdIKC2qbIoRZ52buvLrc7md9awtS7Q
         Tl53ijrOHedqn6MEEkIXHGA0E9pwg62BEzSFpVyzYtFwiC5wzpiM/0Lzw/tfJTEy4kLR
         i6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775071070; x=1775675870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFGgYlat78QlHBf17jTWXfuiJFHZzeYKJ7RjiLS7B90=;
        b=GDVVixbY09ychnuSn7Q2vxb/q2rdzInrfUVYmQZwwZ56bl7PUI/TW3YfsPWrvQAKZu
         PjiLDlEUsYJ9TZEjsHKMCbThowfDbQyFC9ctMnBp3aTdsWCDsheqzxGpydKPjllZFa7S
         0tsy2eAlSQXLNHAklJCilMir3+OgSINOauCq3K4SGjRYo6cH5uwJs4gjM0XGbAKFk3IT
         t+rpNl6CGHmXIrn5+73NuRlUFTyVsrucFMYQ3TD1X1r1OdrI7dXr4Rxa+Nmwk8WbqLO6
         WUR7q93c4D1e+WdE1i3hGiJEcZ8F9+KoewcucxuWzQx2It42rqLxgopEzvIaY0q0e8Pm
         Fv3A==
X-Forwarded-Encrypted: i=1; AJvYcCWCEel/6AQKBPvZkxJAmGsWVT6WE5GugxQaEkITRpEzQ7JXRy61im7/1sMe/tyZwsV836HmwHbXlh4i9tpw@lists.linux.dev
X-Gm-Message-State: AOJu0YzhXWWiCUm35IlCPHOYz+1np7RuziLhzEWq/Bs9WPnA0pGNEfOk
	Jd9SS8YkhVtdr646/4Pw2c6DDIwZPyYuU4nyQ/2Oay6xlLLtOLZ8BVgi
X-Gm-Gg: ATEYQzyChnQgTKmf9lzrlIGjQepuNLxgNVuYmZmCOGt2oizKnElnqGIkRyF7IfcNdIL
	dmOle4IT9lDQmOJRigPktqBMHYnZi7LzwXPldCRtEdnurWnIg6IZW/KyN8+9/2SwBn7p0cXZjKY
	qPrlTQoMqajbtncC1AMvBCfaUuO4MaR1zT+/LkJ1pEDnUhxYsI+faHx1i8qXGFcErUFBwnnWCJ6
	Uxh2rY68fZoVckxccuoC8V4XrHJdI+ODgBr+v+N3g8EYXKHMjpegDpbrkE8zYxAkPJgQZ/gXRGG
	Kr9hykujUUZgADP2G3WYaL+yTUhgGtHScgdRzOTidWFGAjs6vSrIOMAf/qWZPNhb1V7canT0a1E
	CzMMEMd7dxoS+PsfJtonvPH0qCSegSXzQLjZxi/NS7CyTrLyjb9GYvuDQyQ+NV0+paVY0NCtw9f
	hK8uAXyUqNZopk0FsEectxwWstu4sMrVNjiEA=
X-Received: by 2002:a05:6a00:3010:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-82cfb901ee7mr688533b3a.27.1775071070238;
        Wed, 01 Apr 2026 12:17:50 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c706f7sm689490b3a.47.2026.04.01.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:17:49 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	error27@gmail.com
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: media: av7110: coding style fixes: too many tabs
Date: Thu,  2 Apr 2026 00:47:42 +0530
Message-ID: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix warning reported by checkpatch.pl
"WARNING: Too many leading tabs - consider code refactoring"

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
v4:
  - Added the missing check for  "feed->ts_type"
  - Removed initialization of 'ret'
  - handle_ts_memory_fe() accepts only "feed", "demux" and "av7110" extracted thereafter
  - demux->playing assigned to int, instead of bool to maintain original style
v3:
  - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
  - Retained the original code style as suggested by Dan Carpenter
v2:
  - Refactored change by adding function handle_ts_memory_fe

v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/

 drivers/staging/media/av7110/av7110.c | 36 +++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..486dd8010e7f 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,31 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	return ret;
 }

+static int handle_ts_memory_fe(struct dvb_demux_feed *feed)
+{
+	struct dvb_demux *demux = feed->demux;
+	struct av7110 *av7110 = demux->priv;
+	int ret;
+
+	if (!(feed->ts_type & TS_DECODER))
+		return 0;
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
+		demux->playing = 1;
+
+	return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +976,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
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
+				ret = handle_ts_memory_fe(feed);
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
--
2.43.0

