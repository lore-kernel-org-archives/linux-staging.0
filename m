Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9E53EDAD1
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377816; cv=none; b=Cyv/TihWytoKbHp8fDJh7LbEM2UnO6bFUHrnq9gLuNGFoT/eekIAlJ8Kq4dea0JKezLtjAaFCnJ7Yiv9/MdryYayU7MwsivPYjQSP4xvydHH51h9TcitoRIAVhoz0PPV1awe5brxo/IZ0phH49byEx0eFazH2BPOXHxb8tc7ZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377816; c=relaxed/simple;
	bh=bwgcmHzwUQo/W/aZ3f7e3d+qB7PiBUeGlVv/4eVzg38=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=iIgShi1b+JtLoL3cNkDjOHeV1tvNjbv2/ioNB22suoFJzM6K17QvlY5sxQRevl1hXq7/1Hanv7zizMweHIlY7SY/SDjJQTDHkUuc+pedJsB4ow5s/tq2uInFgCSkO3OM1Xo2HP8u094U2+r019rm658qw38CfZA7wIMbV1ByMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr6DEK92; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr6DEK92"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a07738118so2330693b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774377813; x=1774982613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgQen54kl3I8J/aB1eTNwfnjYEnMIbfvbEgQrOUcwsc=;
        b=Yr6DEK92jm4r3R9tysiHJfOZMfn7FK3DWQ0Vb2rICcxmLRZVgwOy4GCs+39vM5oxG3
         BC+11x0Ii20EnLp/K0bXHxkC3ALY5bSWSFD9y36CMnv+0iQ25LUkfqAU4Vd8arll3est
         KLfXXlmfs7SCFB9UoWFMpM8Lv2v+YQxqS4WkxOCyA/6d7PYpCP0ZyQXD87RY6gZXNYrY
         r68SCoCbK//pZYE5Mnk6ybX61K/7xbbd810i8liG3tsGDy5/v/oGyYtAssKMnQ2nYJsj
         1Dk56Z1ZkU6OBTSSxE07k7ymz1pWKdEWFT6jT3ZkTuVuymSs/AkpFRlg+Jim9yNXsMdX
         srqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377813; x=1774982613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgQen54kl3I8J/aB1eTNwfnjYEnMIbfvbEgQrOUcwsc=;
        b=lC3j7LWjW1zEVswCS30HcJRVLIG5rZ7yDYNdnY+DcsUURuHKUXI5oNpHaVnwbthq4Q
         jJvi0CLza5WfOXmpuoJLXbY1t3yA5D8oCo4+QERNcTDYZwNXuKraANq44nEe//QQLi5u
         yEaXca7J6QPQp5l/e0b1zdYP2PllY1QVpYhceyHpTsYiXebg1VLJ1ZRCs8IzS2K2Y01X
         aq2+aRYXAUMrt7C5ubVnEIxKnnkmgUtIIF7ohBPBiau8u0lHjal0YGaF9f71T9ITls4W
         fnPYTTLnqTbA90ih9LZlns3nLlvMyLAO2RVOTUCoAjJ4LYGGholYK4Kwh72SzvAzbxe3
         yQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLRTgODS9OI71+Q6owB6aOa8fvzoWha9EvEatZGijQKu65srgfOSt+AjixJJN2ww/7nfOF8an+On63ZzzM@lists.linux.dev
X-Gm-Message-State: AOJu0YwDJhUJDl8lO0hcgbbMLs1GblRatcjgbKO6jRgG3vqv2mgT+O5X
	2FYREdC0ibUfxpVh+cjxgdGNXiPu+/x0uO7UeBH2ysYZhfqciQIR+qfq
X-Gm-Gg: ATEYQzwhGZDeDclNmdHEW0W/x2Z+RtUs7sAyBlCzyabjSL3hVepcG0r/i8KLceRqY71
	SgO6yolCiAe8Fyxgbs4AiPyT5EGhsy4w/KoAW+p1MDlyh7ZtTBreebmyTmkr6dYq96S2jZKQKYV
	acw0wcS/3lmZPrkcIfu4NGoQ4wfGDVRq4LPXb7aO01gLiI60iOtLSCb+ubpyNBqwA4G/uPF5yVY
	oD1rjMf4E4rGCK0vrxLVrTdRAeuWtczpN7F9lqhHDcoZnqFc9ZHlLgRKJz2vI8KfNa95dqZLlBT
	AP0T2DgrPDGw4HXGOvGjfPmT172FxOgiprNEgHoGzA3vAyqxQ08HVzIf4F8OLFvxCnDaVWcZCuR
	YCS1fTAmuVxwRIBlwY51p7q2jfJzgCQJ6GeUpsHyvlHeMmbIBOfHdzFWtGhmAItGRt4b1uc6RQc
	xeoIEzDDNO5I1hWfipB4l9KB+f8BdVDP+WgtQ2Rw==
X-Received: by 2002:a05:6a00:f8e:b0:829:7057:b99e with SMTP id d2e1a72fcca58-82c6e14675amr576998b3a.54.1774377812635;
        Tue, 24 Mar 2026 11:43:32 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:2084:974f:ec2b:72ad:38be:6404])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c11asm12535160b3a.30.2026.03.24.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:43:32 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chethan C <mail.chethanc@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] staging: media: av7110: fix coding style
Date: Wed, 25 Mar 2026 00:12:44 +0530
Message-Id: <20260324184259.694280-1-mail.chethanc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix indentation and alignment issues reported by checkpatch.pl.

Rename enums av7110_rec_play_state, av7110_type_rec_play_format,
and av7110_encoder_command to follow kernel naming style.

Rename wssData and wssMode to wss_data and wss_mode to avoid
camelCase identifiers.

Signed-off-by: Chethan C <mail.chethanc@gmail.com>
---
v6:
  - Rename wssMode
  - Group av7110_fw_cmd parameters logically

v5:
  - Limit lines to 80 columns
  - Add trailing commas to enums av7110_rec_play_state,
    av7110_type_rec_play_format, av7110_encoder_command
  - Remove unnecessary cast

v4:
  - Fix coding style issues reported by checkpatch.pl

v3:
  - Fix coding style and alignment issues reported by checkpatch.pl
  - Rename av7110_pid_command, av7110_type_rec_play_format,
    av7110_encoder_command to follow kernel naming style

v2:
  - Fix indentation issues reported by checkpatch.pl
  - Rename av7110_rec_play_state to follow kernel naming style
---
 drivers/staging/media/av7110/av7110.c     | 31 +++++---
 drivers/staging/media/av7110/av7110.h     |  4 +-
 drivers/staging/media/av7110/av7110_av.c  | 91 +++++++++++++++--------
 drivers/staging/media/av7110/av7110_ca.c  |  3 +-
 drivers/staging/media/av7110/av7110_hw.h  | 71 +++++++++---------
 drivers/staging/media/av7110/av7110_ir.c  |  4 +-
 drivers/staging/media/av7110/av7110_v4l.c | 22 +++---
 7 files changed, 135 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..dd62038dec56 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -121,19 +121,22 @@ static void init_av7110_av(struct av7110 *av7110)
 	if (ret < 0)
 		pr_err("cannot set internal volume to maximum:%d\n", ret);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-			    1, (u16)av7110->display_ar);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_MONITOR_TYPE, 1, av7110->display_ar);
 	if (ret < 0)
 		pr_err("unable to set aspect ratio\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
-			    1, av7110->display_panscan);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_PANSCAN_TYPE, 1,
+			    av7110->display_panscan);
 	if (ret < 0)
 		pr_err("unable to set pan scan\n");
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_WSS_CONFIG, 2, 2, wss_cfg_4_3);
 	if (ret < 0)
 		pr_err("unable to configure 4:3 wss\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_cfg_16_9);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_WSS_CONFIG, 2, 3, wss_cfg_16_9);
 	if (ret < 0)
 		pr_err("unable to configure 16:9 wss\n");
 
@@ -717,7 +720,8 @@ static inline int SetPIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 	if (av7110->audiostate.bypass_mode)
 		aflags |= 0x8000;
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, MultiPID, 6,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+			     AV7110_MULTI_PID, 6,
 			     pcrpid, vpid, apid, ttpid, subpid, aflags);
 }
 
@@ -785,7 +789,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 		av7110_p2t_init(&av7110->p2t_filter[dvbdmxfilter->index], dvbdmxfeed);
 	}
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + AddPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_ADD_PID_FILTER;
 	buf[1] = 16;
 	buf[2] = dvbdmxfeed->pid;
 	buf[3] = mode;
@@ -828,7 +832,7 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 
 	av7110->handle2filter[handle] = NULL;
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + DelPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_DEL_PID_FILTER;
 	buf[1] = 1;
 	buf[2] = handle;
 	ret = av7110_fw_request(av7110, buf, 3, answ, 2);
@@ -873,7 +877,8 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 
 	if (dvbdmxfeed->pes_type < 2 && npids[0])
 		if (av7110->fe_synced) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 			if (ret)
 				return ret;
 		}
@@ -1911,11 +1916,13 @@ static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status status)
 			av7110->pids[DMX_PES_TELETEXT], 0,
 			av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 	} else {
 		ret = SetPIDs(av7110, 0, 0, 0, 0, 0);
 		if (!ret) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER, FlushTSQueue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER,
+					    AV7110_FLUSH_TS_QUEUE, 0);
 			if (!ret)
 				ret = av7110_wait_msgstate(av7110, GPMQBusy);
 		}
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
index b584754f4be0..797dda437cbe 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -243,8 +243,8 @@ struct av7110 {
 	struct dvb_video_events  video_events;
 	video_size_t		 video_size;
 
-	u16			wssMode;
-	u16			wssData;
+	u16			wss_mode;
+	u16			wss_data;
 
 	struct infrared		ir;
 
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..148457d5ad9a 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -111,7 +111,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	dvbdmx->recording = 1;
 	av7110->rec_mode |= av;
 
@@ -121,7 +121,9 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[0]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD, 2,
+				    AV7110_AUDIO_PES, 0);
 		break;
 
 	case RP_VIDEO:
@@ -129,7 +131,9 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD, 2,
+				    AV7110_VIDEO_PES, 0);
 		break;
 
 	case RP_AV:
@@ -141,7 +145,9 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD, 2,
+				    AV7110_AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -158,7 +164,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	if (av7110->playing & av)
 		return -EBUSY;
 
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 
 	if (av7110->playing == RP_NONE) {
 		av7110_ipack_reset(&av7110->ipack[0]);
@@ -168,15 +174,21 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	av7110->playing |= av;
 	switch (av7110->playing) {
 	case RP_AUDIO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY, 2,
+				    AV7110_AUDIO_PES, 0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY, 2,
+				    AV7110_VIDEO_PES, 0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY, 2,
+				    AV7110_AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -190,15 +202,19 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	if (av7110->playing) {
 		av7110->playing &= ~av;
 		switch (av7110->playing) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_AUDIO_PES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_VIDEO_PES, 0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +224,14 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD, 2,
+					    AV7110_AUDIO_PES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD, 2,
+					    AV7110_VIDEO_PES, 0);
 			break;
 		case RP_NONE:
 			break;
@@ -325,7 +345,8 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 
 	dprintk(2, "av7110:%p\n", av7110);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_LOAD_VID_CODE, 1, mode);
 
 	if (!ret && !av7110->playing) {
 		ret = ChangePIDs(av7110, av7110->pids[DMX_PES_VIDEO],
@@ -333,7 +354,8 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 			   av7110->pids[DMX_PES_TELETEXT],
 			   0, av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 	}
 	return ret;
 }
@@ -551,7 +573,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
+			(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
 				return count - todo;
 		}
 		n = todo;
@@ -1168,7 +1190,8 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		if (av7110->videostate.stream_source == VIDEO_SOURCE_MEMORY) {
 			if (av7110->playing == RP_AV) {
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_STOP, 0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1207,8 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PAUSE, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1217,8 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_CONTINUE, 0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1248,8 +1273,9 @@ static int dvb_video_ioctl(struct file *file,
 		if (ret < 0)
 			break;
 		av7110->videostate.display_format = format;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
-				    1, av7110->display_panscan);
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+				    AV7110_SET_PANSCAN_TYPE, 1,
+				    av7110->display_panscan);
 		break;
 	}
 
@@ -1259,8 +1285,8 @@ static int dvb_video_ioctl(struct file *file,
 			break;
 		}
 		av7110->display_ar = arg;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-				    1, (u16)arg);
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+				    AV7110_SET_MONITOR_TYPE, 1, arg);
 		break;
 
 #ifdef CONFIG_COMPAT
@@ -1291,7 +1317,8 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2,
+					    AV7110_AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1330,9 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_SLOW, 2,
+						    0, 0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1358,18 @@ static int dvb_video_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[1]);
 		if (av7110->playing == RP_AV) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_AV_PES, 0);
 			if (ret)
 				break;
 			if (av7110->trickmode == TRICK_FAST)
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Scan_I, 2, AV_PES, 0);
+						    AV7110_REC_PLAY_SCAN_I, 2,
+						    AV7110_AV_PES, 0);
 			if (av7110->trickmode == TRICK_SLOW) {
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Slow, 2, 0, 0);
+						    AV7110_REC_PLAY_SLOW, 2,
+						    0, 0);
 				if (!ret)
 					ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 			}
@@ -1483,7 +1515,8 @@ static int dvb_audio_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[0]);
 		if (av7110->playing == RP_AV)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index 63d9c97a5190..24876c8fdc8c 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -307,7 +307,8 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetDescr, 5,
+		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+			      AV7110_SET_DESCR, 5,
 			      (descr->index << 8) | descr->parity,
 			      (descr->cw[0] << 8) | descr->cw[1],
 			      (descr->cw[2] << 8) | descr->cw[3],
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..3afe474da871 100644
--- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -21,12 +21,12 @@ enum av7110_bootstate {
 };
 
 enum av7110_type_rec_play_format {
-	RP_None,
-	AudioPES,
-	AudioMp2,
-	AudioPCM,
-	VideoPES,
-	AV_PES
+	AV7110_RP_NONE,
+	AV7110_AUDIO_PES,
+	AV7110_AUDIO_MP2,
+	AV7110_AUDIO_PCM,
+	AV7110_VIDEO_PES,
+	AV7110_AV_PES,
 };
 
 enum av7110_osd_palette_type {
@@ -112,19 +112,19 @@ enum av7110_osd_command {
 };
 
 enum av7110_pid_command {
-	MultiPID,
-	VideoPID,
-	AudioPID,
-	InitFilt,
-	FiltError,
-	NewVersion,
-	CacheError,
-	AddPIDFilter,
-	DelPIDFilter,
-	Scan,
-	SetDescr,
-	SetIR,
-	FlushTSQueue
+	AV7110_MULTI_PID,
+	AV7110_VIDEO_PID,
+	AV7110_AUDIO_PID,
+	AV7110_INIT_FILT,
+	AV7110_FILT_ERROR,
+	AV7110_NEW_VERSION,
+	AV7110_CACHE_ERROR,
+	AV7110_ADD_PID_FILTER,
+	AV7110_DEL_PID_FILTER,
+	AV7110_SCAN,
+	AV7110_SET_DESCR,
+	AV7110_SET_IR,
+	AV7110_FLUSH_TS_QUEUE,
 };
 
 enum av7110_mpeg_command {
@@ -158,24 +158,24 @@ enum av7110_request_command {
 };
 
 enum av7110_encoder_command {
-	SetVidMode,
-	SetTestMode,
-	LoadVidCode,
-	SetMonitorType,
-	SetPanScanType,
-	SetFreezeMode,
-	SetWSSConfig
+	AV7110_SET_VID_MODE,
+	AV7110_SET_TEST_MODE,
+	AV7110_LOAD_VID_CODE,
+	AV7110_SET_MONITOR_TYPE,
+	AV7110_SET_PANSCAN_TYPE,
+	AV7110_SET_FREEZE_MODE,
+	AV7110_SET_WSS_CONFIG,
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
+	AV7110_REC_PLAY_CONTINUE,
 };
 
 enum av7110_fw_cmd_misc {
@@ -452,7 +452,8 @@ static inline int SendDAC(struct av7110 *av7110, u8 addr, u8 data)
 
 static inline int av7710_set_video_mode(struct av7110 *av7110, int mode)
 {
-	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetVidMode, 1, mode);
+	return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			     AV7110_SET_VID_MODE, 1, mode);
 }
 
 static inline int vidcom(struct av7110 *av7110, u32 com, u32 arg)
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index 68b3979ba5f2..a033844d21b2 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -71,8 +71,8 @@ int av7110_set_ir_config(struct av7110 *av7110)
 {
 	dprintk(4, "ir config = %08x\n", av7110->ir.ir_config);
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1,
-			     av7110->ir.ir_config);
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+			     AV7110_SET_IR, 1, av7110->ir.ir_config);
 }
 
 static int change_protocol(struct rc_dev *rcdev, u64 *rc_type)
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 200a7a29ea31..aed7581fa8a5 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -556,7 +556,7 @@ static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
 	if (FW_VERSION(av7110->arm_app) < 0x2623)
 		return -EINVAL;
 	memset(&f->fmt.sliced, 0, sizeof(f->fmt.sliced));
-	if (av7110->wssMode) {
+	if (av7110->wss_mode) {
 		f->fmt.sliced.service_set = V4L2_SLICED_WSS_625;
 		f->fmt.sliced.service_lines[0][23] = V4L2_SLICED_WSS_625;
 	}
@@ -596,14 +596,14 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 		return -EINVAL;
 	if (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) {
 		/* WSS controlled by userspace */
-		av7110->wssMode = 1;
-		av7110->wssData = 0;
+		av7110->wss_mode = 1;
+		av7110->wss_data = 0;
 	} else {
 		/* WSS controlled by firmware */
-		av7110->wssMode = 0;
-		av7110->wssData = 0;
+		av7110->wss_mode = 0;
+		av7110->wss_data = 0;
 		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
-				     SetWSSConfig, 1, 0);
+				     AV7110_SET_WSS_CONFIG, 1, 0);
 	}
 	return 0;
 }
@@ -616,17 +616,19 @@ static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size
 	int rc;
 
 	dprintk(2, "\n");
-	if (FW_VERSION(av7110->arm_app) < 0x2623 || !av7110->wssMode || count != sizeof(d))
+	if (FW_VERSION(av7110->arm_app) < 0x2623 ||
+	    !av7110->wss_mode || count != sizeof(d))
 		return -EINVAL;
 	if (copy_from_user(&d, data, count))
 		return -EFAULT;
 	if ((d.id != 0 && d.id != V4L2_SLICED_WSS_625) || d.field != 0 || d.line != 23)
 		return -EINVAL;
 	if (d.id)
-		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
+		av7110->wss_data = ((d.data[1] << 8) & 0x3f00) | d.data[0];
 	else
-		av7110->wssData = 0x8000;
-	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);
+		av7110->wss_data = 0x8000;
+	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			   AV7110_SET_WSS_CONFIG, 2, 1, av7110->wss_data);
 	return (rc < 0) ? rc : count;
 }
 
-- 
2.25.1

