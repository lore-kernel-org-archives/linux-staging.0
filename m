Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AD2363C43
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862364; cv=none; b=uVMjQFmJv6qQmE6Z+jIxVYsCEMjVF06XJNqFQaLIm5OQ3llbkmMH2KkwR9BnHvsQSY2QBgigkmdYcuqAUA58EM3KdP5O4AK/2dj3ZeXD9FwYz1AQOXRJ3SgsfMxusKyeSFCmd/SlEEu7OVgnycQ/3hwFML4SE33eHSVju/OOx0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862364; c=relaxed/simple;
	bh=Sa9LZMmYnHSAUw8nvBcoHZqtGdkkPiUKkR8E5qnbbB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UH0YzlAqaCZoszwFbXmi33NDTNcnIlJofg2ov43dTXCdV6dEEiy/wl9pIY8dTZBFZMpEFPp/hlDDAeG3myg98xST8cjYEZ/eoawnqxK4YCIByJzDqySWSB0SDj1r26lN1D67lD2Yx0Ko5Fk7gnVdIBFHDrbANpdal4HxcSzqu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD+vKwmI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD+vKwmI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35b90d6fe14so207624a91.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862363; x=1774467163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbU4+BE126IsvD/jRxcUr/l8T7vCwh3ERJ4LHLwRlcE=;
        b=RD+vKwmIRpgK0y1gyw1M7DSOFtSMc6oHUEZ+42TwVgxRdPiWKis24ccExVpx1cuJnb
         qY696CaDXf9oiGgaE5k6TfM6U979caC77gZL9knpr5K6sDCzXIaNQkHIUBoJb2+1pEJz
         vvb9p3zh3CJUv27aWTn3iHgXomgdmNLRuKfUgH2fcRDU5XKa0ibTqNmILtrPnPtHMNJi
         fhxmEBIQOxwtIDKoLIwiPUIMRGO/Q1zuBCrtmM/CEDsc6AfSHep0R/JjREX4Y9Lpponw
         twFCOJRt8sGDz4xseMn/ZORBh3vFkX8sF5FzN/MrqlitkjiMfp21f9Tw6Qm8IxG7B1Gx
         ULzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862363; x=1774467163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbU4+BE126IsvD/jRxcUr/l8T7vCwh3ERJ4LHLwRlcE=;
        b=SJpfpbKz27SdVUi9+8GwqQ6SDYIftWjavm/rUdU38aOAj/V2jGE0lmHE5muzaEbytL
         FQZLMFlGCzrJkVop6vATwnEs8IXpjh8LzH4gjEIMEabLzncevsoglOTMC1advMw2qdIl
         3raKomzMJGe2EAz7bpbLitXkidryUYEthhAXROEgSDGrPs9bnBJsbiVUep+w/clJkDgr
         +KVckdvPjXIRcOLOs7JoFtYPfiAyqoVtNj843ex2ajQ2Ip3fEimJ3myPfAA1fNXoZo7r
         vmg/ZY4g8RkXb1PwKnKv83GN2qyO6diFUgg+DcjTcTsoIR46SnS5a7m3K9FC0V5Ic/8k
         Rr0w==
X-Forwarded-Encrypted: i=1; AJvYcCW2EBDL3hELYcLbFOSXTnbBUaH8OY5s4SebIKFvATAtS1RN26L3zNQlZQzuqI5ON4FuN9O5qunkJ4vgSXtP@lists.linux.dev
X-Gm-Message-State: AOJu0Ywag7QGX+E67IL3rkw4Ql7N0K7HTG14JHOluOG5BpgyCh4Ug3Ux
	q9UgEL2E0y85WGea1+5xaiESi3a0dVVc/ox3tQaI2+Jb0cqVrvIDiQKS
X-Gm-Gg: ATEYQzxQRI6DRJhvVHis2KkeIMev6aGqwiV8S6noEwjS555E/ERcKEJC30nB/2xi51X
	mROCKjjXT/El5xeU7qx77hXtxyyTAZVLvQFYDzV8PkleGmcI+fkZ/qdn7wBATa1Nnzpy0j+/QkI
	hjGqdTszEt8PxvPbRD45rtE1ZV9KTQ4e9/bYTRDyw45lFe9yPWOoGwBAlESX8D/03qHD1KQsil2
	tg4WITXbFwtQOMJDFcQwKDb5XI4FnjBJP1lzvEaRb/IIuQ3mxlo8FDz6rQhJMHXFHr4xWEP0Xpz
	FHAAxxQieJ3+V1EU/YV16u9A7o2dlBDw6gdjbyIg9m/3Tebqe+vhTQw3befyUDtYsIEujdVjDoU
	0frf2uS8JHS172Rjhu64419ygaHFhlNIv8l2BSwfrnNhggHqITPx1gy1XZKR/j+GEOat4Lxlbd1
	g2xWq8gUFSorm3eIvKQrIZwJ1e
X-Received: by 2002:a17:90b:2791:b0:359:8c9a:fde9 with SMTP id 98e67ed59e1d1-35bb9e7d3eamr4819178a91.11.1773862362849;
        Wed, 18 Mar 2026 12:32:42 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bbabae770sm1668455a91.1.2026.03.18.12.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:32:42 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: av7110: coding style fixes: too many tabs
Date: Thu, 19 Mar 2026 01:02:29 +0530
Message-ID: <20260318193233.110451-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
References: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
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
 drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..15460ca026dc 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,28 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
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
+		if (!ret)
+			demux->playing = true;
+
+		return ret;
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

