Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FD3446A6
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998164; cv=none; b=U7HwnVNh9jH/7/enAi+HBpYpnzVyUrIGFmEnqQUC4s4+mSNS+CKt1bTYoMXsthvytBrnbvgPQmi2E76QGHYLh4/g6mnpHxRBWODBz99x1NHN1CIe0/YGuGXxAYsRFze63vXlniMG4YF/PR6fV4rh3X8xE4Qfk+haCq2f2lMV+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998164; c=relaxed/simple;
	bh=1fHPK0LJdWO8WW4envSJVm4HfRZHsE4NEb5sMRqaNpE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=WU0csAMplYN9NwH36Z3lTOGadgfJB1ACvtWIx5ZpBqfRgq1DOW+eHgpsFRlSyhvsiFhSWp7YeH5JELrRKld8p8uI41gqGw05k/W2DnR1P20+fXoRhrvs6e1Cdt+SyZlewNKaAhBALjMCudjF1jBjF1Q0Ft5wErMciWgAz2a7Zec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cd7cbBS2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd7cbBS2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so287363a12.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998161; x=1774602961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tbOZx4yz8ileREr6jCN05BM9SGas0cEq/HP1eaWDecQ=;
        b=cd7cbBS2go/SwNg0kgciU2MH2Op89G4XmUuFSKfaY1yaQDvFfCzU/QskgHQjxSmwQw
         TxvtH+dbDn0NTFp96EKRLGh1syq1uNQdvQ3buBJ5bBgsNOJLQXdgTHumEXEIW1q2ccML
         1NORqKQKXhK3Wx7Bt2e7zZ7EcD4BcVddG1B8Kw4UfoKtvgLvKkgtLYtZJY085McCq2lU
         sblMDyZnP0ptIyUnz+t1p52koaknazvUeEoJ5zOJa+C6nWhB7QJd+CDE80MrnlP53z8d
         oKOvKRyhZ/lcZZsYWoatkpQJD9O5Nh7z4ZBC7O6waSx0Kyj9Rso7h4t2ZYWJP10LybcG
         I5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998161; x=1774602961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbOZx4yz8ileREr6jCN05BM9SGas0cEq/HP1eaWDecQ=;
        b=mJHVQ2TBsZUYI8cLKK8L5yOXoA8bXNNpCoHzBb68/aCbJe1IEaNM57cC5fVGDI+i4d
         5xe3cIq3ZXvmgyNoURVPgw2ygbRBzgnc1k/rVOA3dfOS3DTDrMzRMT1o8Chu964/so16
         rFEEATcJgtx+yhsGB+MprVZJdr3GPEM1CLmrbtqyaVD0u59igtNLTSidCugD3h8BU31Q
         Sz8nbBMo8XMJEYjzl41c5BXmrWXfI/98LsHTbwuh2qR2ILQFA75t7Q3xpTHBIbNGuOdr
         nDZjyndZT0C4eB2mS373C5iTMTmX8UWJm8aO3cQRic+v5bTzjNadNZ/F/s/XRN6CtbzZ
         I2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNw9KqGPaWbvO/N1QJNEuBRmAvy5ipb2j6XqnVt2gQMPQJxlDClyQKRWfvDm2QSiCPkpl5HfYoVh5taS50@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2JduGTwJWflxXPvPaQN7w1q9rvqEEM3z7Jr6SqqV9FfkJDvT3
	qvsCUMveycCO4FoloFOD/jVx2AHqNoVUe/gm+DN6eWMueCL3chRqi7/6
X-Gm-Gg: ATEYQzyMRBLHAKJ2H02IT02yPdzOmJbCINaL+F5ijoFd/IIk78HcUCeZwOJaqIVQCBI
	pRju3vrfHG+J+FTGK91/AALr7MNAq37L65memhWk9m1Gazg92/I1FbiUkywojMaJejkCmG7JNeS
	WRDXme7N8uP4JSVaoiawhRE67eXJUly3ohBdc9H6y6HgA+DIDxgGpcoAMr9S2395hW0AZpJfCKe
	7gSM0F+VKxC5+A3p5m4/RJvX4Z0I2hpTpSuXJRsGejJ/NkgHY20DtiZPdxUfetF1XqClsJ1zNXu
	mHD+FpS+B3emY7cVKh0deVUjsgx3F1v3k/7y2qTWXTNFq8PRskhBcBe+LGw/66CxHzSp9PTBFez
	gTPtgRgO+2sIvgOUfc5SwWYaihkaBx3ZpVr3eh+zoySN/lGQBCzkDlCZmDCyxJZZMgEP/lwG3h2
	GfIde99osvchqBU3A76mSm+KkAlZNRZNqIxHMdpA==
X-Received: by 2002:a05:6a20:a10c:b0:398:8db5:40fe with SMTP id adf61e73a8af0-39bce9dd376mr2195543637.7.1773998161064;
        Fri, 20 Mar 2026 02:16:01 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:11af:af99:bef7:9003:423f:a6ad])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a814548sm1357077a12.9.2026.03.20.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:16:00 -0700 (PDT)
From: "Chethan.C" <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chethan C <mail.chethan.c@gmail.com>,
	"Chethan.C" <mail.chethanc@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Renaming camel case enum values
Date: Fri, 20 Mar 2026 14:45:25 +0530
Message-Id: <20260320091529.496641-1-mail.chethanc@gmail.com>
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

Signed-off-by: Chethan C <mail.chethan.c@gmail.com>
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

