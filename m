Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0562D23BC
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034130; cv=none; b=Mtr3s27pWB1MFHFOc5VLlY90w/h6ZR3/eoT8tuGGv+chcvHAz8xBjMwvnzyUMg7M1wuNBGUqg9HxpeMY3q2einJwepqBRaQGqxD522Z5XKc+DdhrAbVhYTeYwdZbP7Izxpwn/QsaoGQoCJj6QzYmGOyP2MdlikocrguvtuirbG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034130; c=relaxed/simple;
	bh=K4AbDxiPtFtHSpGdGDtx7OdA8I3+c3fZMd8RDCScu78=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=as4gSJ9XgOgKR3Tqv0SeF12XemYwR91kj/PCnRVDjxqWvrITZoIL8PcUjf839KAJNxgUdmvVR4cYVZOpZN1r4PKX9xIuMMkQ0a7SgYfL9oTwTcz5p2EhomJULEgeaaQn+U9FE/jfo11yXM+b2MwCaO0VUrqZlI0QMaLRn3uxHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLuh5rGe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLuh5rGe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ab232cc803so4143235ad.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774034129; x=1774638929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLR2ZkG6bg0iShqg1gNOyekotcqpmX708u+9fcbgzN8=;
        b=mLuh5rGedb3KmbVg4MAr5LilkFJ8G6FvZmWUvGhndko1tMslP03ordLY8wBYhKe4ce
         ZaaSeBjliUmH908NQG2fdbpITVoEcgSaxmMZ2OCiJ1COsKqECOiV6F8hvQZsbj3voJ7H
         1gp6n/ovGorx2fyKz8dlCWXZzws1kajq2oU1DdWhVDsAL8EG5SAAe/q6k956bYn7plYu
         mbu+6bC8fEqlFXbdE0C7E9smnKrjB2MmYx8cIJjNR3itl6N0pRLLL9L9sILl537y+xVc
         4Vgh538CKTJlIbcZrJlBBD+J04u0ypLtBCbsWaAdn0AAhBGeovICFcSk3u1YD33N0XFZ
         ZB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034129; x=1774638929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLR2ZkG6bg0iShqg1gNOyekotcqpmX708u+9fcbgzN8=;
        b=SSSrZlSAQ9T7QW1kcWLYw755k/QGNIQJBQoT4IBdzoHM3DMjVclb1Lqco+h93Xjqfc
         VyjEwqxo2+hJXYWRDgdOyg7JWu8UfoK1IKDOHLKLQ4k1Me9sXPF3qBTBhBrOTrjTCiwo
         Udlro4JpS8b1cLG87bk/8nE7vAyKARcDQ646G9wY3uQ9Iuh+89Xf4Qa/q9ptYenLd4J/
         NYGFIb1ryiweIp7ZTsv1oqIoKtYppXLQXAwZqeHJFGyGqUWaqVRhH/EN7dSqihMn/zAj
         7QmUiczQx7TxKFlsMljEMyRTJwcvedaL1RigM1sdZGYBuoadMjG7tAWQ6AGWHNZwvIj6
         opzA==
X-Forwarded-Encrypted: i=1; AJvYcCVqbCwetII85I4mHGu4ElNpHDtf23IaoXvjXq/1meHEoO9KqVyIPWVItauXHXKBnIMkUMfbXfp5jJnTkZHE@lists.linux.dev
X-Gm-Message-State: AOJu0YwMDvHoQYwBe52xm5KPoitjA9dS1oWSVPob22iHUbvuCY+vv0Pq
	SUkHp+cvKE20cEQt9Bhmxbs4sNtJg45BIBEx9rLiVLiWCnYT3FGHKRmC
X-Gm-Gg: ATEYQzz2vWCZpW+i9+5XauPxeslXbpARqpBe6KgE9o335ITM9Csn76ruopLDtAXU6N+
	ook8zoYeTQXSQj7B5T9mHGlDF9hpwEiiZzoLb/0fGJ2//6XCaynabjhPCmFXSdE3gsC/Id+CYlL
	lFp1GBnHU7g5s5BfGZbb6ZBHrtl2tR4spZMU8Irmu/z/AmgePD5TX3eFvJJ2tnfe4ZjEIbV4T1I
	kwGPl2nPBzYZMIBXqt7v4JOBqu2eT6+mF7fO09MWJPPOG0oKZPXOmiW9jaIU4mlvAVKphk4ZgfS
	Gtsc+/VWx/4uTZC4v0b1cGDLpOUcM0vkt1hrCAXwjGkKmESeFbMFRFWpuwMO+j2BUsceH2Z2F3b
	YutGkSm3FIVQEBvRE9u8DCf3IRhMLHLp7wwlZxKvKLxVg1BqqdD/ELR1qSYfTwhouJqr/xs9Apg
	Meg6ovQuGr7qwV2C3KBWdj9J4H7sBkguHPK/hXXCE=
X-Received: by 2002:a17:903:38cf:b0:2b0:6961:150a with SMTP id d9443c01a7336-2b0827d7e20mr37600295ad.38.1774034128858;
        Fri, 20 Mar 2026 12:15:28 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:2080:22bd:b0c0:3626:1867:c290])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836b97fesm28973025ad.84.2026.03.20.12.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:15:28 -0700 (PDT)
From: "Chethan.C" <mail.chethanc@gmail.com>
X-Google-Original-From: "Chethan.C" <mail.chethan.c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Chethan.C" <mail.chethan.c@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: av7110: fix coding style
Date: Sat, 21 Mar 2026 00:45:02 +0530
Message-Id: <20260320191507.511560-1-mail.chethan.c@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed Indentation issues reported by checkpatch.pl.

Renamed enum av7110_rec_play_state from camel case to
upper case underscore style to comply kernel style guidelines.

Signed-off-by: Chethan.C <mail.chethan.c@gmail.com>
---
v2:
        - fixed indentation issues reported by checkpatch.pl
        - Rename av7110_rec_play_state to follow kernel naming style
---
 drivers/staging/media/av7110/av7110_av.c | 109 ++++++++++++++++++-----
 drivers/staging/media/av7110/av7110_hw.h |  16 ++--
 2 files changed, 94 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..a7d76348318d 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -111,7 +111,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	dvbdmx->recording = 1;
 	av7110->rec_mode |= av;
 
@@ -121,7 +121,11 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[0]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD,
+				    2,
+				    AudioPES, 0);
 		break;
 
 	case RP_VIDEO:
@@ -129,7 +133,12 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD,
+				    2,
+				    VideoPES,
+				    0);
 		break;
 
 	case RP_AV:
@@ -141,7 +150,12 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_RECORD,
+				     2,
+				     AV_PES,
+				     0);
 		break;
 	}
 	return ret;
@@ -158,7 +172,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	if (av7110->playing & av)
 		return -EBUSY;
 
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 
 	if (av7110->playing == RP_NONE) {
 		av7110_ipack_reset(&av7110->ipack[0]);
@@ -168,15 +182,30 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	av7110->playing |= av;
 	switch (av7110->playing) {
 	case RP_AUDIO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_PLAY,
+				     2,
+				     AudioPES,
+				     0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_PLAY,
+				     2,
+				     VideoPES,
+				     0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_PLAY,
+				     2,
+				     AV_PES,
+				     0);
 		break;
 	}
 	return ret;
@@ -190,15 +219,25 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	if (av7110->playing) {
 		av7110->playing &= ~av;
 		switch (av7110->playing) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_PLAY,
+					     2,
+					     AudioPES,
+					     0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_PLAY,
+					     2,
+					     VideoPES,
+					     0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +247,20 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_RECORD,
+					     2,
+					     AudioPES,
+					     0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_RECORD,
+					     2,
+					     VideoPES,
+					     0);
 			break;
 		case RP_NONE:
 			break;
@@ -551,7 +600,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
+					(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
 				return count - todo;
 		}
 		n = todo;
@@ -1168,7 +1217,10 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		if (av7110->videostate.stream_source == VIDEO_SOURCE_MEMORY) {
 			if (av7110->playing == RP_AV) {
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+				ret = av7110_fw_cmd(av7110,
+				COMTYPE_REC_PLAY,
+				AV7110_REC_PLAY_STOP,
+				0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1236,10 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_PAUSE,
+					     0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1248,10 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_CONTINUE,
+					     0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1291,7 +1349,7 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2, AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1361,12 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110,
+						     COMTYPE_REC_PLAY,
+						     AV7110_REC_PLAY_SLOW,
+						     2,
+						     0,
+						     0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1392,15 @@ static int dvb_video_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[1]);
 		if (av7110->playing == RP_AV) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 			if (ret)
 				break;
 			if (av7110->trickmode == TRICK_FAST)
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Scan_I, 2, AV_PES, 0);
+						    AV7110_REC_PLAY_SCAN_I, 2, AV_PES, 0);
 			if (av7110->trickmode == TRICK_SLOW) {
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Slow, 2, 0, 0);
+						    AV7110_REC_PLAY_SLOW, 2, 0, 0);
 				if (!ret)
 					ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 			}
@@ -1483,7 +1546,7 @@ static int dvb_audio_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[0]);
 		if (av7110->playing == RP_AV)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..1b17f1f2ea42 100644
--- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -168,14 +168,14 @@ enum av7110_encoder_command {
 };
 
 enum av7110_rec_play_state {
-	__Record,
-	__Stop,
-	__Play,
-	__Pause,
-	__Slow,
-	__FF_IP,
-	__Scan_I,
-	__Continue
+	AV7110_REC_PLAY_RECORD,
+	AV7110_REC_PLAY_STOP,
+	AV7110_REC_PLAY_PLAY,
+	AV7110_REC_PLAY_PAUSE,
+	AV7110_REC_PLAY_SLOW,
+	AV7110_REC_PLAY_FF_IP,
+	AV7110_REC_PLAY_SCAN_I,
+	AV7110_REC_PLAY_CONTINUE
 };
 
 enum av7110_fw_cmd_misc {
-- 
2.25.1

