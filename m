Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153A354FE
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR0jKehd"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c5071165d5so6861331fa.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 16:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697844227; x=1698449027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2cKCGbV0vjVRHvgIodkiCSt+6sE3RRNYirzep6QnKc=;
        b=fR0jKehdFM3Y7RMpdh89/GQyeAlgTjp+kx+/vqvAQakiKDBnr5LfgQOLGyJwaf8CAn
         /hUkEGKTyBmhqI50gGPT+a9q+d//xVKqGWvMMlAsUCpAE3tsZGHrdCymlUDkX97WnFSY
         ITlF8m2+CFvH/xntglCm97GUrVweSzYJZTCnHqgL8V6IYEpKdxhIRXfwNHqWR+ZYW4ne
         Z6ecJSqeBM04tqpP+o+otDPo9c2yXMX6b/d181GqAbYUwirdV9fOpOgDyAJQNtbBV0Lu
         nboazzUsP5MaSNclB64xUgPJxtImNBMa2QZy9LRZr4iX9WwvomZAKK4jwU45rTTpb7T1
         8dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697844227; x=1698449027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2cKCGbV0vjVRHvgIodkiCSt+6sE3RRNYirzep6QnKc=;
        b=Y6AubbUZRTG7vyehKEfH7IItj2/tyxGdt9u7/ezak3jTQK2EtFvWdAX9u7nHby+M2i
         +p48Xdi5CenOIorQL82PLTYBNo1C1aCDTuWoMZWE6MX2FTRXG+++DkPWFs9OsvFGspWP
         /8n6srL1cGYjgAPoNnIAXvd2m6gNtJ4jZxAg3p8utZYohrP7mX2MFwElozluAgqN9BoE
         alkWwvypYjhg5cSZ0RSQdUPqyMQlcUwsNgQDdmuZujj/1DcxAPYO//yfgvjoiRHaB7jC
         eeRW4oZewWWkwF4A8+PdErmk/zhpXyQXrtTlSzdxxOBpfTcqBukS0Q6arh2eQ0071/xD
         KsAw==
X-Gm-Message-State: AOJu0Yy6vHncraWn3FKsKe+A48aPSy6HvoIxaTEGOUBogqrFDP2o3Qu3
	D/kEw2e7kOpdigNcpZlSGyE=
X-Google-Smtp-Source: AGHT+IFcn7s7tuoU0sEQV2uEqN5iFp1iooMeOLw0apoa4WejNIcewDVjx69zk51z+QHdQHwzZ44Vog==
X-Received: by 2002:a2e:a167:0:b0:2c5:12ae:adb3 with SMTP id u7-20020a2ea167000000b002c512aeadb3mr2257618ljl.44.1697844226406;
        Fri, 20 Oct 2023 16:23:46 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id s5-20020a05651c048500b002ba586d27a2sm567571ljc.26.2023.10.20.16.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 16:23:46 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 2/5] staging: media: av7110: Fix various whitespace checkpatch errors
Date: Sat, 21 Oct 2023 01:23:29 +0200
Message-Id: <20231020232332.55024-3-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231020232332.55024-1-bergh.jonathan@gmail.com>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the following checkpatch errors relating to whitespaces:
 * extra whitespace after '~' symbol
 * remove whitespace before/after parentheses for switch statement and
   function parameters as well as after switch keyword
 * ensure whitespace before '{' braces
 * remove whitespace between function name and '(' parentheses
 * ensure whitespace after ',' commas in parameter lists

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 28 ++++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index af3845406626..482dfc548b16 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -241,8 +241,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
 		sync |= DVB_RINGBUFFER_PEEK(buf, 2) << 8;
 		sync |= DVB_RINGBUFFER_PEEK(buf, 3);
 
-		if (((sync &~ 0x0f) == 0x000001e0) ||
-		    ((sync &~ 0x1f) == 0x000001c0) ||
+		if (((sync &~0x0f) == 0x000001e0) ||
+		    ((sync &~0x1f) == 0x000001c0) ||
 		    (sync == 0x000001bd))
 			break;
 		printk("resync\n");
@@ -599,7 +599,7 @@ static int find_pes_header(u8 const *buf, long int length, int *frags)
 	while (c < length - 3 && !found) {
 		if (buf[c] == 0x00 && buf[c + 1] == 0x00 &&
 		    buf[c + 2] == 0x01) {
-			switch ( buf[c + 3] ) {
+			switch (buf[c + 3]) {
 			case PROG_STREAM_MAP:
 			case PRIVATE_STREAM2:
 			case PROG_STREAM_DIR:
@@ -644,9 +644,9 @@ void av7110_p2t_write(u8 const *buf, long int length, u16 pid, struct av7110_p2t
 
 	c = 0;
 	c2 = 0;
-	if (p->frags){
+	if (p->frags) {
 		check = 0;
-		switch(p->frags) {
+		switch (p->frags) {
 		case 1:
 			if (buf[c] == 0x00 && buf[c + 1] == 0x01) {
 				check = 1;
@@ -712,7 +712,7 @@ void av7110_p2t_write(u8 const *buf, long int length, u16 pid, struct av7110_p2t
 		c2 = find_pes_header(buf + c + add, length - c - add, &p->frags);
 		if (c2 >= 0) {
 			c2 += c + add;
-			if (c2 > c){
+			if (c2 > c) {
 				p_to_t(buf + c, c2 - c, pid, &p->counter, p->feed);
 				c = c2;
 				clear_p2t(p);
@@ -798,7 +798,7 @@ static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
 
 	while (c < length) {
 		memset(obuf, 0, TS_SIZE);
-		if (length - c >= (TS_SIZE - 4)){
+		if (length - c >= (TS_SIZE - 4)) {
 			l = write_ts_header2(pid, counter, pes_start,
 					     obuf, (TS_SIZE - 4));
 			memcpy(obuf + l, buf + c, TS_SIZE - l);
@@ -896,7 +896,7 @@ void dvb_video_add_event(struct av7110 *av7110, struct video_event *event)
 }
 
 
-static int dvb_video_get_event (struct av7110 *av7110, struct video_event *event, int flags)
+static int dvb_video_get_event(struct av7110 *av7110, struct video_event *event, int flags)
 {
 	struct dvb_video_events *events = &av7110->video_events;
 
@@ -1135,11 +1135,11 @@ static int dvb_video_ioctl(struct file *file,
 	unsigned long arg = (unsigned long) parg;
 	int ret = 0;
 
-	dprintk(1, "av7110:%p, cmd=%04x\n", av7110,cmd);
+	dprintk(1, "av7110:%p, cmd=%04x\n", av7110, cmd);
 
 	if ((file->f_flags & O_ACCMODE) == O_RDONLY) {
-		if ( cmd != VIDEO_GET_STATUS && cmd != VIDEO_GET_EVENT &&
-		     cmd != VIDEO_GET_SIZE ) {
+		if (cmd != VIDEO_GET_STATUS && cmd != VIDEO_GET_EVENT &&
+		     cmd != VIDEO_GET_SIZE) {
 			return -EPERM;
 		}
 	}
@@ -1367,7 +1367,7 @@ static int dvb_audio_ioctl(struct file *file,
 	unsigned long arg = (unsigned long) parg;
 	int ret = 0;
 
-	dprintk(1, "av7110:%p, cmd=%04x\n", av7110,cmd);
+	dprintk(1, "av7110:%p, cmd=%04x\n", av7110, cmd);
 
 	if (((file->f_flags & O_ACCMODE) == O_RDONLY) &&
 	    (cmd != AUDIO_GET_STATUS))
@@ -1433,7 +1433,7 @@ static int dvb_audio_ioctl(struct file *file,
 
 	case AUDIO_CHANNEL_SELECT:
 		av7110->audiostate.channel_select = (audio_channel_select_t) arg;
-		switch(av7110->audiostate.channel_select) {
+		switch (av7110->audiostate.channel_select) {
 		case AUDIO_STEREO:
 			ret = audcom(av7110, AUDIO_CMD_STEREO);
 			if (!ret) {
@@ -1642,7 +1642,7 @@ int av7110_av_register(struct av7110 *av7110)
 	spin_lock_init(&av7110->video_events.lock);
 	av7110->video_events.eventw = av7110->video_events.eventr = 0;
 	av7110->video_events.overflow = 0;
-	memset(&av7110->video_size, 0, sizeof (video_size_t));
+	memset(&av7110->video_size, 0, sizeof(video_size_t));
 
 	dvb_register_device(&av7110->dvb_adapter, &av7110->video_dev,
 			    &dvbdev_video, av7110, DVB_DEVICE_VIDEO, 0);
-- 
2.40.1

