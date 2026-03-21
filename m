Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A4450F2
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079200; cv=none; b=iNHzWlqTBDiCkE3K/VWPqR0jqel7s5lQXv5MmOk1JTYM3/JwfVJY/0QoC1adeK4Qzb+qa5e8b7fubY3/TxyRAFUP4Hsjci6SFvrXOfsvqJ4/7GZN6urOG4iSmoZl0o4fxaxQm50svOTg4cyDDe3dJtmZbXo2f+vLB4wC2lw0pbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079200; c=relaxed/simple;
	bh=HTTzzWrIl4zx53aLR94EyTUZ8BpQg0s1G/DkLalCqa0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=pEAUBzhwpLH7VEn18ZTERo3hEkTP1GwkUHQfUDyh7iPDaTN9jxpQ0SUa7QIMLtfXp8oV4GUdV/happ5McWJlBzavgFWt4YnUDx7N8LBYqJBiX6t/Ab9kyCQaFHWeTsceGpPqtugCL7tEhTnHDOcVoiis81LZS8g8vMoOYNNN4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJHXQoXp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJHXQoXp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b062069f80so9458385ad.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774079198; x=1774683998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/X7Q82dE1RrBEg+ccJv75bdKI5EufdXZ33cwI2X690=;
        b=ZJHXQoXpDR3kwZu1YzdLGIBBiFe86aJEeqg+2SW2d9E7dBMxN65o2DK7t+Isnvc9VH
         fpn45rE+OaHl63mVKJve8Lood2ADdNv9rSEyCLESf1in+O2Rj75dUQv/GNsOhAqnY136
         e+BYUtl2IKNqGjnLUbEn1fUZHlALCD6+AcILtSlBNSCyibheg6OzotSohKoMzzejAjG1
         R9DgU+s6ycr4w2UckzicxnP9d9SU7pvJBPdHFN2wdxdpVbBZjvSjoM0tBSKHXjGpjD4d
         1AWKFqSrXU0JwXIYXJwenrJELbE1CysCVoDH11yQFlsaD1Bo1FTL9F6ab93vatuHMjrp
         SzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774079198; x=1774683998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/X7Q82dE1RrBEg+ccJv75bdKI5EufdXZ33cwI2X690=;
        b=aw8FDAwiDbzlJDu97wFRZ/MakTsfvjjk2WQJLNxcfl+FwOZ1H2VI1yMF2H03YSiNIn
         r+mm1dzlAaen6XN1CxLZlOGH5sbJVaD5drpVzu6fQQJTJFrjwp/S2zTQAPAhh9EHYXwh
         aXx5N4Vr0QqkgYmfRpQDcTNZTvn4dPipa10sUCN+Pk1bj6HdDMXvj9IBap59ULFxXWpB
         VQ49QlaXrst2yjnNTQq3oBjKWTDHE3rPZqadtDKW1Ft2ITEnsvTLRTkbRQknk9lohQPY
         O23FqiaKizsam9cmRxrXMmTinR+kUfJCnw+membq4WcNJjkCN64nRYdVp8RnnQZh6UlQ
         Mgfg==
X-Forwarded-Encrypted: i=1; AJvYcCWPYlPykiOGGH3NS4HHate/j0xm1LQtUD5WYkTS4Ju+YhqX3PXHyYCRylZ2NtXlgIwb6rbTowl5s+zpCTW/@lists.linux.dev
X-Gm-Message-State: AOJu0YymeX1XIn23BTvFcJtruQ9Lfb88Q3xC1SIFNhNQYEzPtUB7qB15
	dUc6yUvG8x3TntU3fgI12hWG/2zXoos+6x8okiHf3X3dhj6P0FQsH6xK
X-Gm-Gg: ATEYQzyqOve12olk2xpRiYPga+N17ZzOvQwjIT8ObWbxAzbN2nVMn2aUiNcddvc+cmh
	WCNB9U3psUdl4tvqxc/koIgQZ/HfT1ZbzPNnkL6nN/y4Ogf91i2MWzP0cVv17pd7NznnwXqxQVG
	x8SX6jMMH5l6jdGgqSo9BcX8gpH/gdZap7YTjB0FhrL81zCpe1AK4mfG/jzoL2d1PtgdE44xKpH
	4FhblNwjfYHJtgCrS5JTEux9YMTJzlzO3CmGC343hNrQ6ufpotuK0cF2Ji2H3sIQiyD8P1Fqpnz
	SBoOd2c9OtfMvWKNdrcxcVPIgpjFviKzYH97ACei4r29L4Y58obiRbkGcv1ceYXnbcJ7nGGw4nt
	V3TiP631WQgzSZKgDGuRv/eFEbvu87B/W6aomKypMmn2hh+YjMLu3qfD/kFmwg6yAnp5N1C4qkU
	Fb3Uzq1kY9DA6hTx4eQ0jw1xU+66S3yC7OEU13yw==
X-Received: by 2002:a17:902:f610:b0:2b0:61f8:9f00 with SMTP id d9443c01a7336-2b08281865fmr51907095ad.50.1774079198244;
        Sat, 21 Mar 2026 00:46:38 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:209b:b746:6d85:49be:963a:330e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836ace98sm44043675ad.80.2026.03.21.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:46:37 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chethan C <mail.chethanc@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: media: av7110: fix coding style
Date: Sat, 21 Mar 2026 13:16:01 +0530
Message-Id: <20260321074614.541740-1-mail.chethanc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed Indentation, Alignment issues reported by checkpatch.pl.

Renamed enum av7110_rec_play_state, av7110_type_rec_play_format,
av7110_encoder_command from camel case to upper case underscore
style to comply kernel style guidelines.

Signed-off-by: Chethan C <mail.chethanc@gmail.com>
---
v3:
        - fixed the coding style and alignment issues reported
                by checkpatch.pl
        - Renamed av7110_pid_command,av7110_type_rec_play_format,
                av7110_encoder_command to follow kernel naming
                style
v2:
        - fixed indentation issues reported by checkpatch.pl
        - Rename av7110_rec_play_state to follow kernel naming style
---
 drivers/staging/media/av7110/av7110.c     |  20 ++--
 drivers/staging/media/av7110/av7110_av.c  | 117 +++++++++++++++++-----
 drivers/staging/media/av7110/av7110_ca.c  |   2 +-
 drivers/staging/media/av7110/av7110_hw.h  |  70 ++++++-------
 drivers/staging/media/av7110/av7110_ir.c  |   2 +-
 drivers/staging/media/av7110/av7110_v4l.c |   4 +-
 6 files changed, 139 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..86a654cc2b63 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -121,19 +121,19 @@ static void init_av7110_av(struct av7110 *av7110)
 	if (ret < 0)
 		pr_err("cannot set internal volume to maximum:%d\n", ret);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_MONITOR_TYPE,
 			    1, (u16)av7110->display_ar);
 	if (ret < 0)
 		pr_err("unable to set aspect ratio\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_PANSCAN_TYPE,
 			    1, av7110->display_panscan);
 	if (ret < 0)
 		pr_err("unable to set pan scan\n");
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 2, wss_cfg_4_3);
 	if (ret < 0)
 		pr_err("unable to configure 4:3 wss\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_cfg_16_9);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 3, wss_cfg_16_9);
 	if (ret < 0)
 		pr_err("unable to configure 16:9 wss\n");
 
@@ -717,7 +717,7 @@ static inline int SetPIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 	if (av7110->audiostate.bypass_mode)
 		aflags |= 0x8000;
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, MultiPID, 6,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_MULTI_PID, 6,
 			     pcrpid, vpid, apid, ttpid, subpid, aflags);
 }
 
@@ -785,7 +785,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 		av7110_p2t_init(&av7110->p2t_filter[dvbdmxfilter->index], dvbdmxfeed);
 	}
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + AddPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_ADD_PID_FILTER;
 	buf[1] = 16;
 	buf[2] = dvbdmxfeed->pid;
 	buf[3] = mode;
@@ -828,7 +828,7 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 
 	av7110->handle2filter[handle] = NULL;
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + DelPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_DEL_PID_FILTER;
 	buf[1] = 1;
 	buf[2] = handle;
 	ret = av7110_fw_request(av7110, buf, 3, answ, 2);
@@ -873,7 +873,7 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 
 	if (dvbdmxfeed->pes_type < 2 && npids[0])
 		if (av7110->fe_synced) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SCAN, 0);
 			if (ret)
 				return ret;
 		}
@@ -1911,11 +1911,11 @@ static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status status)
 			av7110->pids[DMX_PES_TELETEXT], 0,
 			av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SCAN, 0);
 	} else {
 		ret = SetPIDs(av7110, 0, 0, 0, 0, 0);
 		if (!ret) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER, FlushTSQueue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER, AV7110_FLUSH_TS_QUEUE, 0);
 			if (!ret)
 				ret = av7110_wait_msgstate(av7110, GPMQBusy);
 		}
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..c666fb221179 100644
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
+				    AV7110_AUDIO_PES, 0);
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
+				    AV7110_VIDEO_PES,
+				    0);
 		break;
 
 	case RP_AV:
@@ -141,7 +150,12 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD,
+				    2,
+				    AV7110_AV_PES,
+				    0);
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
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY,
+				    2,
+				    AV7110_AUDIO_PES,
+				    0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY,
+				    2,
+				    AV7110_VIDEO_PES,
+				    0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY,
+				    2,
+				    AV7110_AV_PES,
+				    0);
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
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY,
+					    2,
+					    AV7110_AUDIO_PES,
+					    0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY,
+					    2,
+					    AV7110_VIDEO_PES,
+					    0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +247,20 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD,
+					    2,
+					    AV7110_AUDIO_PES,
+					    0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD,
+					    2,
+					    AV7110_VIDEO_PES,
+					    0);
 			break;
 		case RP_NONE:
 			break;
@@ -325,7 +374,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 
 	dprintk(2, "av7110:%p\n", av7110);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_LOAD_VID_CODE, 1, mode);
 
 	if (!ret && !av7110->playing) {
 		ret = ChangePIDs(av7110, av7110->pids[DMX_PES_VIDEO],
@@ -333,7 +382,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 			   av7110->pids[DMX_PES_TELETEXT],
 			   0, av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SCAN, 0);
 	}
 	return ret;
 }
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
+						    COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_STOP,
+						    0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1236,10 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PAUSE,
+					    0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1248,10 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_CONTINUE,
+					    0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1248,7 +1306,7 @@ static int dvb_video_ioctl(struct file *file,
 		if (ret < 0)
 			break;
 		av7110->videostate.display_format = format;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_PANSCAN_TYPE,
 				    1, av7110->display_panscan);
 		break;
 	}
@@ -1259,7 +1317,7 @@ static int dvb_video_ioctl(struct file *file,
 			break;
 		}
 		av7110->display_ar = arg;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_MONITOR_TYPE,
 				    1, (u16)arg);
 		break;
 
@@ -1291,7 +1349,7 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2, AV7110_AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1361,12 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110,
+						    COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_SLOW,
+						    2,
+						    0,
+						    0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1392,15 @@ static int dvb_video_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[1]);
 		if (av7110->playing == RP_AV) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV7110_AV_PES, 0);
 			if (ret)
 				break;
 			if (av7110->trickmode == TRICK_FAST)
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Scan_I, 2, AV_PES, 0);
+						    AV7110_REC_PLAY_SCAN_I, 2, AV7110_AV_PES, 0);
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
+					    AV7110_REC_PLAY_PLAY, 2, AV7110_AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index 63d9c97a5190..9413a6a7f387 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -307,7 +307,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetDescr, 5,
+		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SET_DESCR, 5,
 			      (descr->index << 8) | descr->parity,
 			      (descr->cw[0] << 8) | descr->cw[1],
 			      (descr->cw[2] << 8) | descr->cw[3],
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..f9557c4245ba 100644
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
+	AV7110_AV_PES
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
+	AV7110_FLUSH_TS_QUEUE
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
+	AV7110_SET_WSS_CONFIG
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
@@ -452,7 +452,7 @@ static inline int SendDAC(struct av7110 *av7110, u8 addr, u8 data)
 
 static inline int av7710_set_video_mode(struct av7110 *av7110, int mode)
 {
-	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetVidMode, 1, mode);
+	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_VID_MODE, 1, mode);
 }
 
 static inline int vidcom(struct av7110 *av7110, u32 com, u32 arg)
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index 68b3979ba5f2..16b8ac5ab5a1 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -71,7 +71,7 @@ int av7110_set_ir_config(struct av7110 *av7110)
 {
 	dprintk(4, "ir config = %08x\n", av7110->ir.ir_config);
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SET_IR, 1,
 			     av7110->ir.ir_config);
 }
 
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 200a7a29ea31..959bc6f98bd3 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -603,7 +603,7 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 		av7110->wssMode = 0;
 		av7110->wssData = 0;
 		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
-				     SetWSSConfig, 1, 0);
+				     AV7110_SET_WSS_CONFIG, 1, 0);
 	}
 	return 0;
 }
@@ -626,7 +626,7 @@ static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size
 		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
 	else
 		av7110->wssData = 0x8000;
-	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);
+	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 1, av7110->wssData);
 	return (rc < 0) ? rc : count;
 }
 
-- 
2.25.1

