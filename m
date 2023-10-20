Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DE91A71B
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 23:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edi2JnDx"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5210a1515so22006691fa.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697844225; x=1698449025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft8poZSombuD4W/Ja+9zHJlVT1MrHG6UJN71XEmxhrs=;
        b=Edi2JnDxmeAVsnu7JPINIro7xOZ4GWqBWlZugcvFamdebubC9G5p0L0Jm5EfKuCw0Y
         qbCb7B4iypKHYCip/3j6ogb59/jU1PKkKIkhKwDS8Hhhgc7Nyp9CLMnjCHqJVjLnbq7l
         u4AzldwzDQ0VwZiBuc78381WGVicNyS5+D4+fXcXZpnHWCSGBiMt/shjLaEGLwdl4Nbx
         CqjLfo5k361HoHdjRz08+pOsQw7dz6nYOMD/9ktsfh/BjqBFhMngvgUWpnvn1veG9OWF
         l2oqx92OwyusbtwcQO/jGmtQEkT0NH8M9gv2maU8pqedJIEOTzdOgUcN7r6E9oS8KFM6
         Sujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697844225; x=1698449025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft8poZSombuD4W/Ja+9zHJlVT1MrHG6UJN71XEmxhrs=;
        b=oWjBQ61SNVk1azlgazfHb444aRo180rMrbnuUAmnQ98aqKQI1lHnZ4ZgMF+aDIrXc2
         rK/215ajLO7E/A41shSmvL3DOgkisdIwxkgg0QQBtYdRMSjM0xvWDg8pnpmchpDJITdV
         Q7w6NOxnG/zLkGcbeQNUxw7wSJ8JyDUuz1CLmuxy4FjcbLPezwe6TOSD3iqLzuIOk23k
         H0yNdeec6KEuMok60JiDnbdIHiij+swB8ERgDRu/JWMahRjN6sj/LJZJZGl0JNrfZswe
         Yi0LAvh7hi1T68P7RQ8cjeyFu5hoxss+/xdWViapDuyXLdXj0LAB+FuCYHr9QqlF2xN+
         XL0g==
X-Gm-Message-State: AOJu0YyoUd+pVlWkxcBYNSLrjBXln3jF526rX6pUCf7/maFzatosF31j
	ykQVYZ6hlA6rPZj174XXlrySS3YxzXlDaw==
X-Google-Smtp-Source: AGHT+IH3qhg33gZLIJj1HkTZAlvQpIvBJf657LfTvsB7Eih1QmyOl5q1EkeSK6qH/+SGsoS0kavmCw==
X-Received: by 2002:a2e:a7c7:0:b0:2c5:1867:b0bd with SMTP id x7-20020a2ea7c7000000b002c51867b0bdmr1018904ljp.23.1697844224768;
        Fri, 20 Oct 2023 16:23:44 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id s5-20020a05651c048500b002ba586d27a2sm567571ljc.26.2023.10.20.16.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 16:23:44 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 1/5] staging: media: av7110: Fix missing newlines after declaration warnings
Date: Sat, 21 Oct 2023 01:23:28 +0200
Message-Id: <20231020232332.55024-2-bergh.jonathan@gmail.com>
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

Fixed the following formatting problem:
 * Missing newlines after declarations

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 00dd6a7fea64..af3845406626 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -149,6 +149,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 int av7110_av_start_play(struct av7110 *av7110, int av)
 {
 	int ret = 0;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	if (av7110->rec_mode)
@@ -183,6 +184,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 int av7110_av_stop(struct av7110 *av7110, int av)
 {
 	int ret = 0;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
@@ -320,6 +322,7 @@ int av7110_set_volume(struct av7110 *av7110, unsigned int volleft,
 int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 {
 	int ret;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
@@ -408,6 +411,7 @@ static inline long aux_ring_buffer_write(struct dvb_ringbuffer *rbuf,
 static void play_video_cb(u8 *buf, int count, void *priv)
 {
 	struct av7110 *av7110 = (struct av7110 *) priv;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	if ((buf[3] & 0xe0) == 0xe0) {
@@ -420,6 +424,7 @@ static void play_video_cb(u8 *buf, int count, void *priv)
 static void play_audio_cb(u8 *buf, int count, void *priv)
 {
 	struct av7110 *av7110 = (struct av7110 *) priv;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	aux_ring_buffer_write(&av7110->aout, buf, count);
@@ -471,6 +476,7 @@ static ssize_t dvb_play(struct av7110 *av7110, const char __user *buf,
 			unsigned long count, int nonblock, int type)
 {
 	unsigned long todo = count, n;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	if (!av7110->kbuf[type])
@@ -504,6 +510,7 @@ static ssize_t dvb_play_kernel(struct av7110 *av7110, const u8 *buf,
 			unsigned long count, int nonblock, int type)
 {
 	unsigned long todo = count, n;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	if (!av7110->kbuf[type])
@@ -534,6 +541,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			 unsigned long count, int nonblock, int type)
 {
 	unsigned long todo = count, n;
+
 	dprintk(2, "av7110:%p, \n", av7110);
 
 	if (!av7110->kbuf[type])
@@ -1039,6 +1047,7 @@ static int play_iframe(struct av7110 *av7110, char __user *buf, unsigned int len
 	/* search in buf for instances of 00 00 01 b5 1? */
 	for (i = 0; i < len; i++) {
 		unsigned char c;
+
 		if (get_user(c, buf + i))
 			return -EFAULT;
 		if (match == 5) {
@@ -1223,6 +1232,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SET_DISPLAY_FORMAT:
 	{
 		video_displayformat_t format = (video_displayformat_t) arg;
+
 		switch (format) {
 		case VIDEO_PAN_SCAN:
 			av7110->display_panscan = VID_PAN_SCAN_PREF;
@@ -1483,6 +1493,7 @@ static int dvb_audio_ioctl(struct file *file,
 	case AUDIO_SET_MIXER:
 	{
 		struct audio_mixer *amix = (struct audio_mixer *)parg;
+
 		ret = av7110_set_volume(av7110, amix->volume_left, amix->volume_right);
 		break;
 	}
-- 
2.40.1

