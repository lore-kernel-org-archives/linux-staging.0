Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F72B32BF5C
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292940; cv=none; b=Z9MHgUfB3xKHJq1HavrOJTCvo74JL+Ehu2F407VmfIf44WaByDJkVmrs6kcHsLWWvO6RKkp2jFLWeMpEW+4me02jK/n84AQpVl5piM5wS+Qf5y0K678XQdi6aMPWH8dTHwjMDtp5Yg7jbXx0841mgmUzJpkwl0GT7f2rpiRvxiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292940; c=relaxed/simple;
	bh=fmRT4EveGTJ6heqogpX78TueSdyQgGIYjahRE9RY4Fg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=smXc7V22LDvcgu96Up0ojOFTLuNsVA9WmwSYcxSrT7jP096W1xK/lCKDdjyNDF1ZLVygscJwYgyhWPmXUc6XinZ9ssRXvJuPAVBvr5+luV/gUuEKXkcQQPUdgV9Ld6r1z+2m3SJHLhiWrxm92NhlZk/oxB8aWDQqYpMT/nq9+oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIP9ZXKJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIP9ZXKJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so1231162a12.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 12:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774292938; x=1774897738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSDA9zB2bvBRj+Lwg+Aznn/TC9/oEBtpmMDjMAqAzhw=;
        b=JIP9ZXKJq25CKnerCrKcBeAEfqMHQkMHyNx4S9qArhtmlkV0CFzCJqy4zEVNroM2rk
         5PcBoLo5b3DeXoFIJPQNbtSlloud8c0qWjusa5v9HXYnpIveLzNMzAvVJFaowy2yW+Z/
         7A21MVnVhO27rwXfjIsmp4hkZKABmpj6yJrB5K9eDVGVYUXu2b1qgSbKz6K/CpoIO81e
         9pJwS7pgbp5dCQV3cbgKyD6fuMDErOcGRxOhh6noYdngGqtPmSku0+Ox2bZ8Bxq9iyb2
         S6ya1eAiPbIAUPjSB9QQ6IDZ0GDR5w6P3gNcuqblD7i/rPIG2c9No5BmWDTwLpwO6Crx
         Zebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292938; x=1774897738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSDA9zB2bvBRj+Lwg+Aznn/TC9/oEBtpmMDjMAqAzhw=;
        b=J0XjB3RufBh7Tm/uApnFMOef1c0nXHtyvc/LbLjjO87Yj/2aLq7Hstp1SiAB3UdCj5
         AzX+iHr09saNvGbVB25uLXY//4QmfbsA5corM9z30E+s19mJwArK4ZA0mtpzXnNdSeYG
         lSCbnKY9cmBgUV4GiyHEQkvY8jRWiXfLZ/ffmo5kZTNZ7yvPXVToiXxE4sSqMq5JZQHG
         8TCxbDhP1OXC+zGm6FZRLsJakqu+Kpus3JPlfgBK115mabxg3lWtHzMeFwPfpYnjbnC8
         0r+b2i/UYZfPzBZqjTTWy8oDpl60owaQt+lEHCwK6oOcq5JP/0u+GsKgawj2RlN4Q6dv
         Dp0g==
X-Forwarded-Encrypted: i=1; AJvYcCX7cU+ay+YYgMEhdQe36egkNKLii4AmmEjZUj5GO+s+pdHZ0gG7Q1sIG3ygE7XCxtw+nwxbQm+w48GRhiOC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5PNl4CmhO+m7vZZZl9U9DsKH2TCgjD+oNpbcNK755BmLPmc58
	Uq6tWKo/5H2/BSKV93RzUNBOYNE7aZCIN5KecbzrVFe5lQkEeEzJmce4
X-Gm-Gg: ATEYQzy9qsViu30JTA8sh33kNaj1J5LCJqd5Tl4XyPyZOXCDkLBKR5q1sxBefpZrJx7
	8BnCPcfGPipXVwwpJosERvXbASxt/7tKA3esq9k3ADm8sb5fu0UCeD0Bn5lIjdNKfr+G6ZOtBDL
	Djf0yYplGGlXgBfkV8QZKH0ixF7moI7bhA7FzwKGlgiSRXsJ/UDaHN0ylccOoegyv+Ae2I7f6XZ
	HNK0PA40gVNvoIyxkmtsSK766nnDdPysgXC/L8SSAHhnEuGoXkREI7H1EHzfesb5v+SLOmrEywf
	VjWzT1+G+yEt9A8hi4B+tQaps6q1kJcbTEuhv4rVqPFu5zGSl5R+1t7Lgm7T9OhvvwaVSNoeauh
	BnO+TUYogtNuTh+P7fmcp1PxfUykXL+q/uYUK+s39M8Q9imtRXJ+JBSiS6xnLuZ+5QEDi5V4+ph
	yCbL/XJuT4u2YAVJ0wMo+yTEbFMLbqgfLe9KFV
X-Received: by 2002:a05:6a21:6d94:b0:39b:abdc:4215 with SMTP id adf61e73a8af0-39bce9b4de2mr10585318637.10.1774292938257;
        Mon, 23 Mar 2026 12:08:58 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:149:cb5c:b28b:ad0b:8706:7fa6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbf050sm9682695b3a.16.2026.03.23.12.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:08:57 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Chethan C <mail.chethanc@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: media: av7110: fix coding style
Date: Tue, 24 Mar 2026 00:38:19 +0530
Message-Id: <20260323190835.660111-1-mail.chethanc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed Indentation, Alignment issues reported by checkpatch.pl.

Rename enum av7110_rec_play_state, av7110_type_rec_play_format and
av7110_encoder_command to follow the kernel naming style.

Rename wssData to wss_data to avoid CamelCase identifiers.

Signed-off-by: Chethan C <mail.chethanc@gmail.com>
---
v5:
        - Limit lines to 80 columns
        - Add trailing commas to enums av7110_rec_play_state,
          av7110_type_rec_play_format, av7110_encoder_command
        - Remove unnecessary cast

v4:
        - fixed the coding style issue reported by checkpatch.pl

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
 drivers/staging/media/av7110/av7110.c     | 27 ++++---
 drivers/staging/media/av7110/av7110.h     |  2 +-
 drivers/staging/media/av7110/av7110_av.c  | 91 +++++++++++++++--------
 drivers/staging/media/av7110/av7110_ca.c  |  2 +-
 drivers/staging/media/av7110/av7110_hw.h  | 71 +++++++++---------
 drivers/staging/media/av7110/av7110_ir.c  |  2 +-
 drivers/staging/media/av7110/av7110_v4l.c | 13 ++--
 7 files changed, 124 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..9a361227ca60 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -121,19 +121,21 @@ static void init_av7110_av(struct av7110 *av7110)
 	if (ret < 0)
 		pr_err("cannot set internal volume to maximum:%d\n", ret);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-			    1, (u16)av7110->display_ar);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_MONITOR_TYPE,
+			    1, av7110->display_ar);
 	if (ret < 0)
 		pr_err("unable to set aspect ratio\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_PANSCAN_TYPE,
 			    1, av7110->display_panscan);
 	if (ret < 0)
 		pr_err("unable to set pan scan\n");
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG,
+			    2, 2, wss_cfg_4_3);
 	if (ret < 0)
 		pr_err("unable to configure 4:3 wss\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_cfg_16_9);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG,
+			    2, 3, wss_cfg_16_9);
 	if (ret < 0)
 		pr_err("unable to configure 16:9 wss\n");
 
@@ -717,7 +719,7 @@ static inline int SetPIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 	if (av7110->audiostate.bypass_mode)
 		aflags |= 0x8000;
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, MultiPID, 6,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_MULTI_PID, 6,
 			     pcrpid, vpid, apid, ttpid, subpid, aflags);
 }
 
@@ -785,7 +787,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 		av7110_p2t_init(&av7110->p2t_filter[dvbdmxfilter->index], dvbdmxfeed);
 	}
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + AddPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_ADD_PID_FILTER;
 	buf[1] = 16;
 	buf[2] = dvbdmxfeed->pid;
 	buf[3] = mode;
@@ -828,7 +830,7 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 
 	av7110->handle2filter[handle] = NULL;
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + DelPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_DEL_PID_FILTER;
 	buf[1] = 1;
 	buf[2] = handle;
 	ret = av7110_fw_request(av7110, buf, 3, answ, 2);
@@ -873,7 +875,8 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 
 	if (dvbdmxfeed->pes_type < 2 && npids[0])
 		if (av7110->fe_synced) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 			if (ret)
 				return ret;
 		}
@@ -1911,11 +1914,13 @@ static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status status)
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
index b584754f4be0..20776809e2f3 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -244,7 +244,7 @@ struct av7110 {
 	video_size_t		 video_size;
 
 	u16			wssMode;
-	u16			wssData;
+	u16			wss_data;
 
 	struct infrared		ir;
 
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..6fd9ce377ae7 100644
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
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_LOAD_VID_CODE,
+			    1, mode);
 
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
index d4579f411c56..ade8fb1c8e66 100644
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
+	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_VID_MODE,
+			     1, mode);
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
index 200a7a29ea31..b427716f48f4 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -597,13 +597,13 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 	if (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) {
 		/* WSS controlled by userspace */
 		av7110->wssMode = 1;
-		av7110->wssData = 0;
+		av7110->wss_data = 0;
 	} else {
 		/* WSS controlled by firmware */
 		av7110->wssMode = 0;
-		av7110->wssData = 0;
+		av7110->wss_data = 0;
 		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
-				     SetWSSConfig, 1, 0);
+				     AV7110_SET_WSS_CONFIG, 1, 0);
 	}
 	return 0;
 }
@@ -623,10 +623,11 @@ static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size
 	if ((d.id != 0 && d.id != V4L2_SLICED_WSS_625) || d.field != 0 || d.line != 23)
 		return -EINVAL;
 	if (d.id)
-		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
+		av7110->wss_data = ((d.data[1] << 8) & 0x3f00) | d.data[0];
 	else
-		av7110->wssData = 0x8000;
-	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);
+		av7110->wss_data = 0x8000;
+	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2,
+			   1, av7110->wss_data);
 	return (rc < 0) ? rc : count;
 }
 
-- 
2.25.1

