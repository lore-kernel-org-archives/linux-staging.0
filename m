Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DE82BD5A7
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945421; cv=none; b=II4+qPXPoodObMNPyOVqN/dCl7P570JJ8/aptYIhwJoVwsMWwnZOBGs1mY62LWWQXA7n9ay11Y99v7xm4Hy0VxKN0e0q0dLUQaKEjsMxl/YLzjcwe9ujeayRHRGMXt004a6xdv7PSfiDAznkqdchrG4zTwEVkHW4CLxju45Tgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945421; c=relaxed/simple;
	bh=rpPEks5QNJCMSrpzg2CvB8cyF0f9J2/soVDQmCBekTI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=LpJ+NZ2E22kmHU8itXaKjRgZZlhB5UOgK9fsyYWoS2WnAEAjCibGs05KTw84wdfJ4AeYD5g8iLlSh1uUb2TTUG/jsjGRxOIhksVYPJG1NjvjUm7jx4/bTtjYj+Yf6mTbUH8f4fV481723Vfe26mg6h8YI9Q9mKpmu3yaxRuIrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUi0vApt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUi0vApt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35b95a7444bso875035a91.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945419; x=1774550219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv/MHTOj4w76L3rSBf/0rJ89xOX3RsgrHsuj+og3r/Y=;
        b=OUi0vApt/tMdk1oE6Sk2x7byGlJVKAxh2GJYNhyJ3xRjyyHYQ9x9GrPGP9DADdxGON
         mxgsfWIrNGlhEKaEdr60zD8G19uJNuEt3zJYkKtNkcHGytYz+6YkOXGQmKXD/ItvgY48
         MrwhYjflU9/lkFKAmYzqVtx33FtH83dR66A0veMBJSTP2g6YGoCY3HcCLLxAIcWHSVW5
         OT9ugM01YzS9Qsv3UyUCRySffaToS2P/MceRJYVdkmvaiCD4LGfBYEcs4Z8e0dJxqFhz
         Tph4L1+voi63isHXdppbVPq3XDXV9CgPRWvNJKNiC0UyXjrOILRb9yQYSB2vKbWWkq4b
         7ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945419; x=1774550219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vv/MHTOj4w76L3rSBf/0rJ89xOX3RsgrHsuj+og3r/Y=;
        b=sicdRVulCW9+XItvgDhzZiw42Gh967JIHLVi/wzntugpMMopFSDpbToQR6UcSLXOI8
         lB9IY19CDYH/Qo2ZOYcWO57BSAlNEGrbmR+sFSmmZoV2uaZbQrFFHwqOx/Ia4SzMRJ8+
         gzFi6fz460CgPcGi3KEt7OLhahcEfxwK57la2v4s1lgA9Vu9Z1uFyUe/UwMNTYB27cgx
         PGJnG4mqGac8pHJzB3p0PWBo7zK5wQmcFkSVb57jDHdEE506q0myYXRR7MPmicq3ehi/
         /abqSXDeWoIaaD79WFZsNLpuzqxBz7wFJuAxyXr4elPHpsp4rw08mxROTix4+gcC19hV
         NQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuHN+ZYN/sWUjXIYhtZgMh5YYrk4SIZyMP9/VTvFyU+DNiEbaXyn1bpTeH3JKHABNMr7/ARLKZTJx03U0a@lists.linux.dev
X-Gm-Message-State: AOJu0YzbBEmZ8CH9hBYWx9KG22dRZbG3Xoo41E7pIaeJSPfezESKDUcO
	TQN25MhiQZmkNWZRaegQsKABU3m7K4ceS088XjnrA6wcQNw2/vvP5T0j
X-Gm-Gg: ATEYQzyGS27ccQn9ZDVq/gJMqw4xSTeWtwm5kx2CVrDbOB2YvWYq767N8wDpu+kNhrv
	k3eQUGUX+NSIZs43vdXWEPJNcPIUqdstMh94MYkzGleFz+PMM+oduwGhm1bSo39Ng0UAx03pSZ3
	7VpgT2NEJwu6czi8WMVA7M+OJGaYMn26+ElTzFBylqQNd7IcTN86OljjnL4xApEVrMpoR8yadsg
	g4StvPVKE4Py2pn0qfWvm5fQoY+mZUFn2xukz0BwNYHShLWTw9641tTDoBSJTD5nKu4mu2vjy/b
	RcKKUdIdU7WzMVHrbFsSQljH4uGMDMaaZ0oSuyeDBsbVE1mpIXfNf9amY+L+2yfh3Ys8IiT/i1I
	g+lOdorAPPPNmLnJkqBD4yXV9QladXWsgmH1BdOkX475h9Ifj1MAkQoranfoo/ThRw3coum3AvX
	d9YsQDaT1ixQhuLuedMgaq4zZBAT25SIhTCn+J4YD0uw==
X-Received: by 2002:a17:902:e850:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b0827dda86mr2797375ad.39.1773945418561;
        Thu, 19 Mar 2026 11:36:58 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:1185:6d0e:dd0c:ac77:d9d4:e83e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e605108sm84588455ad.60.2026.03.19.11.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:36:58 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
X-Google-Original-From: Chethan C <chethan.c@LIB-LAP-0152.lan>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chethan C <chethan.c@LIB-LAP-0152.lan>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Renaming camel case enum values
Date: Fri, 20 Mar 2026 00:00:41 +0530
Message-Id: <20260319183046.489914-1-chethan.c@LIB-LAP-0152.lan>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed enum av7110_rec_play_state from camel case to upper case
underscore style.

Fixes checkpatch warning

Signed-off-by: Chethan C <chethan.c@LIB-LAP-0152.lan>
---
 drivers/staging/media/av7110/av7110_av.c | 46 ++++++++++++------------
 drivers/staging/media/av7110/av7110_hw.h | 16 ++++-----
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..376a53e182fa 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -111,7 +111,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	dvbdmx->recording = 1;
 	av7110->rec_mode |= av;
 
@@ -121,7 +121,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[0]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, AudioPES, 0);
 		break;
 
 	case RP_VIDEO:
@@ -129,7 +129,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, VideoPES, 0);
 		break;
 
 	case RP_AV:
@@ -141,7 +141,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -158,7 +158,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	if (av7110->playing & av)
 		return -EBUSY;
 
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 
 	if (av7110->playing == RP_NONE) {
 		av7110_ipack_reset(&av7110->ipack[0]);
@@ -168,15 +168,15 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	av7110->playing |= av;
 	switch (av7110->playing) {
 	case RP_AUDIO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, AudioPES, 0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, VideoPES, 0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -190,15 +190,15 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	if (av7110->playing) {
 		av7110->playing &= ~av;
 		switch (av7110->playing) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, AudioPES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, VideoPES, 0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +208,10 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, AudioPES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, VideoPES, 0);
 			break;
 		case RP_NONE:
 			break;
@@ -551,7 +551,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
+					(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
 				return count - todo;
 		}
 		n = todo;
@@ -1168,7 +1168,7 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		if (av7110->videostate.stream_source == VIDEO_SOURCE_MEMORY) {
 			if (av7110->playing == RP_AV) {
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1184,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PAUSE, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1193,7 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_CONTINUE, 0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1291,7 +1291,7 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2, AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1303,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_SLOW, 2, 0, 0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1329,15 @@ static int dvb_video_ioctl(struct file *file,
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
@@ -1483,7 +1483,7 @@ static int dvb_audio_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[0]);
 		if (av7110->playing == RP_AV)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..1aab39bdb23c 100644
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
+    	AV7110_REC_PLAY_STOP,
+    	AV7110_REC_PLAY_PLAY,
+    	AV7110_REC_PLAY_PAUSE,
+    	AV7110_REC_PLAY_SLOW,
+    	AV7110_REC_PLAY_FF_IP,
+    	AV7110_REC_PLAY_SCAN_I,
+    	AV7110_REC_PLAY_CONTINUE
 };
 
 enum av7110_fw_cmd_misc {
-- 
2.25.1

