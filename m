Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40741A71B
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsMKMWzL"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so18487311fa.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 16:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697844228; x=1698449028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xhWAgGK0TG28Y9dbvSoZSMOb85wa6hi070VtZ0aDXM=;
        b=RsMKMWzL7zcwuGO/oLhy7ZQF+IDZCdsTKizZM+AFk/FRGL9yxVCri0DrW7rwfbYqFd
         iO+SDdbZA2H2ps0pggqFK3bApcfTllRZBf03AZFZOaYm4CxL7BKzIM51nRKbZpWtsvhp
         obxXm5tHh445vNM2k6/9okpZgRRziiYlUg5mHSBPbD1wm20UJNktLjnmt6+N0pgPtukZ
         JzTebG4N4dfX4wyhETKyBVZ28qmkaHgZ6TdN2khZg7+tY7EAli2ejPS1K1LtWE8C0hUM
         Uo/Qp2iubhKU27gR2VYumROSHfQjeQMfUiSPaJVg4VRr/oXB+C4VO8tnodqtxQFl60y0
         tQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697844228; x=1698449028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xhWAgGK0TG28Y9dbvSoZSMOb85wa6hi070VtZ0aDXM=;
        b=fIEHRJ2dS1/46WtoH1/p8qxdVbo0HfYoXYdC/pgNyEHUPoAnziAQufa/aHiJut2ImX
         /iumkoB7o0p1UGs/AWgcLCZaVymr4959mM+dFkYuwE5qer0ewGbu2CRAU5zpNCDgQhlB
         HT3U5Pg9n8bXMJPzKhp/3CoIU6BAYz3YUcg229vDb4+6+thGmqvouutKR9MMl9DdoNZW
         JQ54T9q3NjOb6h1qyX+TJfcsvu/ivAFEhwG+R1x4irlic5ePBUu82XkbXJdgpo1Oo/b6
         yOEPuzvhWzbUzFoWQ/Ni1WfcfYGZq1SxFUFSAPjhSJswJoVMhoDp7GYxVOpawCsgcyHy
         AUKQ==
X-Gm-Message-State: AOJu0YyOv1s4SzaE6QdaqsrOvS/bi0ci72iltUkHhiWN6uS6jwJrT6Ze
	d7+Rg2lBUM4YVVh5+p8vzPSOq3kpf/Fcvw==
X-Google-Smtp-Source: AGHT+IHrjAeBhMYFWXCuO9SFqEudVERTl67HkWwFQZR6Ixb+Eu6iGapsOJfS46ZJQHfoT7mKR9xDig==
X-Received: by 2002:a2e:7c15:0:b0:2c5:5926:de52 with SMTP id x21-20020a2e7c15000000b002c55926de52mr2231584ljc.53.1697844228180;
        Fri, 20 Oct 2023 16:23:48 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id s5-20020a05651c048500b002ba586d27a2sm567571ljc.26.2023.10.20.16.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 16:23:47 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 3/5] staging: media: av7110: Remove unnecessary whitespace before quoted newlines
Date: Sat, 21 Oct 2023 01:23:30 +0200
Message-Id: <20231020232332.55024-4-bergh.jonathan@gmail.com>
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

Fixed multiple instances where whitespaces were placed before quoted
newlines

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 40 ++++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 482dfc548b16..880fa8a314ba 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -150,7 +150,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 {
 	int ret = 0;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (av7110->rec_mode)
 		return -EBUSY;
@@ -185,7 +185,7 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 {
 	int ret = 0;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
@@ -272,7 +272,7 @@ int av7110_set_volume(struct av7110 *av7110, unsigned int volleft,
 	unsigned int vol, val, balance = 0;
 	int err;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	av7110->mixer.volume_left = volleft;
 	av7110->mixer.volume_right = volright;
@@ -323,7 +323,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 {
 	int ret;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
 
@@ -358,7 +358,7 @@ static int get_video_format(struct av7110 *av7110, u8 *buf, int count)
 	u8 *p;
 	int ret = 0;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (av7110->sinfo)
 		return 0;
@@ -412,7 +412,7 @@ static void play_video_cb(u8 *buf, int count, void *priv)
 {
 	struct av7110 *av7110 = (struct av7110 *) priv;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if ((buf[3] & 0xe0) == 0xe0) {
 		get_video_format(av7110, buf, count);
@@ -425,7 +425,7 @@ static void play_audio_cb(u8 *buf, int count, void *priv)
 {
 	struct av7110 *av7110 = (struct av7110 *) priv;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	aux_ring_buffer_write(&av7110->aout, buf, count);
 }
@@ -477,7 +477,7 @@ static ssize_t dvb_play(struct av7110 *av7110, const char __user *buf,
 {
 	unsigned long todo = count, n;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (!av7110->kbuf[type])
 		return -ENOBUFS;
@@ -511,7 +511,7 @@ static ssize_t dvb_play_kernel(struct av7110 *av7110, const u8 *buf,
 {
 	unsigned long todo = count, n;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (!av7110->kbuf[type])
 		return -ENOBUFS;
@@ -542,7 +542,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 {
 	unsigned long todo = count, n;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (!av7110->kbuf[type])
 		return -ENOBUFS;
@@ -847,7 +847,7 @@ int av7110_write_to_decoder(struct dvb_demux_feed *feed, const u8 *buf, size_t l
 	struct dvb_demux *demux = feed->demux;
 	struct av7110 *av7110 = demux->priv;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (av7110->full_ts && demux->dmx.frontend->source != DMX_MEMORY_FE)
 		return 0;
@@ -937,7 +937,7 @@ static __poll_t dvb_video_poll(struct file *file, poll_table *wait)
 	struct av7110 *av7110 = dvbdev->priv;
 	__poll_t mask = 0;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if ((file->f_flags & O_ACCMODE) != O_RDONLY)
 		poll_wait(file, &av7110->avout.queue, wait);
@@ -967,7 +967,7 @@ static ssize_t dvb_video_write(struct file *file, const char __user *buf,
 	struct av7110 *av7110 = dvbdev->priv;
 	unsigned char c;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if ((file->f_flags & O_ACCMODE) == O_RDONLY)
 		return -EPERM;
@@ -989,7 +989,7 @@ static __poll_t dvb_audio_poll(struct file *file, poll_table *wait)
 	struct av7110 *av7110 = dvbdev->priv;
 	__poll_t mask = 0;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	poll_wait(file, &av7110->aout.queue, wait);
 
@@ -1009,7 +1009,7 @@ static ssize_t dvb_audio_write(struct file *file, const char __user *buf,
 	struct av7110 *av7110 = dvbdev->priv;
 	unsigned char c;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (av7110->audiostate.stream_source != AUDIO_SOURCE_MEMORY) {
 		printk(KERN_ERR "not audio source memory\n");
@@ -1034,7 +1034,7 @@ static int play_iframe(struct av7110 *av7110, char __user *buf, unsigned int len
 	int progressive = 0;
 	int match = 0;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (len == 0)
 		return 0;
@@ -1516,7 +1516,7 @@ static int dvb_video_open(struct inode *inode, struct file *file)
 	struct av7110 *av7110 = dvbdev->priv;
 	int err;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if ((err = dvb_generic_open(inode, file)) < 0)
 		return err;
@@ -1540,7 +1540,7 @@ static int dvb_video_release(struct inode *inode, struct file *file)
 	struct dvb_device *dvbdev = file->private_data;
 	struct av7110 *av7110 = dvbdev->priv;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
 		av7110_av_stop(av7110, RP_VIDEO);
@@ -1555,7 +1555,7 @@ static int dvb_audio_open(struct inode *inode, struct file *file)
 	struct av7110 *av7110 = dvbdev->priv;
 	int err = dvb_generic_open(inode, file);
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	if (err < 0)
 		return err;
@@ -1569,7 +1569,7 @@ static int dvb_audio_release(struct inode *inode, struct file *file)
 	struct dvb_device *dvbdev = file->private_data;
 	struct av7110 *av7110 = dvbdev->priv;
 
-	dprintk(2, "av7110:%p, \n", av7110);
+	dprintk(2, "av7110:%p,\n", av7110);
 
 	av7110_av_stop(av7110, RP_AUDIO);
 	return dvb_generic_release(inode, file);
-- 
2.40.1

