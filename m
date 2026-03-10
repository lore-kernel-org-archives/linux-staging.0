Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9133E8C5E
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173199; cv=none; b=FTy8aInESyuvdoKOJ1G+sr5n7g/OzERrhQFy1HYyyuy0QYBkyQFBJwF1PO2R5t4kskgEgTI7JlMdgKl7kr4ETs7eTxAJ25HU7K8ZhexwBm4rvgYTmKx5KJbnV6jIMlSyBIv682NWUvvPn5uABjI0rCZycroN/IZuWZnAWrqxgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173199; c=relaxed/simple;
	bh=/7JruJpa7ywq82KD85xOZTvhatrgKy0BagtYB7uZ79g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJ8tU3Jgy6CRkUjyvOxhv9hugMYJUy8gfNyoLAcx9pYeBNlU6AN6BzvDo4/JXiYlfSbw5bnmN3gR66NDYN3prqQjpJpccBsbcExRtlYtBneCmVvXxTgrNQ+YcHFkalCotarW3jyY2qVpeKumNaXuAQ0H9c1U0d4ffweTgMVpBeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUV96y/f; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUV96y/f"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-829ac8d56c5so3915808b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173198; x=1773777998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=;
        b=dUV96y/fHnIFu/twGFIJ7NxDSCju1k4kl/rUggv3BS52olCvZ2kR3aOMAt5mk24eOx
         T5sPqlk1Zx84mAiYaWV1mNYF0Mncio3hLRkoFToAZ+yfGXDHdsUfRtSz5+g1pytOooFi
         UTkogAuzchgfrhqtbJfMT1gCg5+yNk6Co+GEoVf3yFs1C6QCQDD026lGFrdSWsClGFN6
         3hiLvyG/JIX+l9UGZZTAnpFpaIaiS3SQq0FnBzL0Z005MSm8D7rPANooFR0KYPHswj9v
         KliYSQ5bH/50gxtPuAjrnx2+4KBfCFG6KbHyzQll7+DvEAZz57ud0er77QFCO2dbwNOC
         wXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173198; x=1773777998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=;
        b=X6aHgFCL4n4VkcwUHKKamewEyQ0uimTO6cBYDAk7z5PWDqqdTv0nG+0d35YOyynPNP
         OoT58xuphCgK2jLcBhLRBx4D6Q2GKEjLkT1cwdpF/mlzoHnsr5is82gdX2Ld8TgriawZ
         vZyWJoZDXShbO2ryrbhmYJQBGBWLk8BpjCXOeX6ALqLIro5OVIvb5JeBHt0Ww7JIaXmz
         So3e8xeijsyjV/jNiZeCqUjHH84Zc4FvJ6+dwozBhDr89ko1NZKBxbstoeUToGH66JK3
         2BvI7I8TK/YW+OZvzhuxE8LFATCZHeh97gvY4ZJ8co6JORA2pmALVDEKh54fzV1ugkuJ
         UUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJaFsRGskbcG3j3Kdx52PoH3ZtqiZ5toEzmb3c9ZcTr1Bloe5UdxlLohRulkdRDPsVgfYU3pjBxD61v7T+@lists.linux.dev
X-Gm-Message-State: AOJu0YwzKX/iGUES0Ts7Bz7uOa4YzOM04yyVP5zhpLiWSVRli14RC48v
	WlJ/gxyHTBFMbL/96oXq/oJrwBd3jUmTyYAQkVosYjlr8HXFnxklvMMv
X-Gm-Gg: ATEYQzzPgmZiyUfHtiZmkyf9nQ1gCBIfoESOj+jJNhW53BKazCqsE7zAMWDlVlsIIC5
	Cd+i+AIE4dzYSSza7GOES+cAjq2CPZBctOuY7H6yr+BYgR5c1C8ugkuECGJ3nHzfqkcSJ5JfLVe
	YZNk6I+zUcOGmw6z5AkIxQYHVtxV4TgXW/ZrM3BhzvhesQ+qgTS5jNnFWiZIBmmQmCBvSF9+G/y
	O4afgUgnPWlvuqna+Q8E76nzRPCmpOSw3ugUTJqN9l2U+YEkfwBSDBnexYw9fAUxQwP0himOG4A
	us1FBtDxltQJeIybu15Z/lQNjrKLfGZoL6WwrtVfQ4pFbvldMnuI6WlZPNTefCJmQD+PSxkw4bN
	Zb0thxu+I0m6zRiFQ7BdqzOP49jXCn932B9Hjdok1xbLlTCgpKlgwSRRYlkTeXEWEJkU7Qm/Ox2
	ROCML0n5YoHpG779xEdrenZWwx9V05o3EARuDKYzZdDQQ0ULcj
X-Received: by 2002:a05:6a00:2d8f:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-829f6eed76dmr146730b3a.7.1773173197615;
        Tue, 10 Mar 2026 13:06:37 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:37 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 6/7] media: allegro: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:12 +0530
Message-Id: <20260310200513.2162018-7-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.
Remove unused variable e.g. ‘size’ after usage of cleanup API.

No functional change intended for kernel memory allocation.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 1 file changed, 24 insertions(+), 71 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index eac3bc9af990..197a368fcb57 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -934,25 +934,20 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 {
 	struct allegro_dev *dev = mbox->dev;
 	ssize_t size;
-	int err;
-	u32 *tmp;
+	int err = 0;
 
-	tmp = kzalloc(mbox->size, GFP_KERNEL);
-	if (!tmp) {
-		err = -ENOMEM;
-		goto out;
-	}
+	u32 *tmp __free(kfree) = kzalloc(mbox->size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
 
 	size = allegro_encode_mail(tmp, msg);
 
 	err = allegro_mbox_write(mbox, tmp, size);
-	kfree(tmp);
 	if (err)
-		goto out;
+		return err;
 
 	allegro_mcu_interrupt(dev);
 
-out:
 	return err;
 }
 
@@ -963,36 +958,29 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 static int allegro_mbox_notify(struct allegro_mbox *mbox)
 {
 	struct allegro_dev *dev = mbox->dev;
-	union mcu_msg_response *msg;
-	u32 *tmp;
-	int err;
+	int err = 0;
 
-	msg = kmalloc_obj(*msg);
+	union mcu_msg_response *msg __free(kfree) = kmalloc_obj(*msg);
 	if (!msg)
 		return -ENOMEM;
 
 	msg->header.version = dev->fw_info->mailbox_version;
 
-	tmp = kmalloc(mbox->size, GFP_KERNEL);
+	u32 *tmp __free(kfree) = kmalloc(mbox->size, GFP_KERNEL);
 	if (!tmp) {
-		err = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	err = allegro_mbox_read(mbox, tmp, mbox->size);
 	if (err < 0)
-		goto out;
+		return err;
 
 	err = allegro_decode_mail(msg, tmp);
 	if (err)
-		goto out;
+		return err;
 
 	allegro_handle_message(dev, msg);
 
-out:
-	kfree(tmp);
-	kfree(msg);
-
 	return err;
 }
 
@@ -1480,13 +1468,11 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 					    enum mcu_msg_type type)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct mcu_msg_push_buffers_internal *msg;
 	struct mcu_msg_push_buffers_internal_buffer *buffer;
 	unsigned int num_buffers = 0;
 	size_t size;
 	struct allegro_buffer *al_buffer;
 	struct list_head *list;
-	int err;
 
 	switch (type) {
 	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
@@ -1501,9 +1487,9 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 
 	list_for_each_entry(al_buffer, list, head)
 		num_buffers++;
-	size = struct_size(msg, buffer, num_buffers);
+	size = struct_size((struct mcu_msg_push_buffers_internal *)NULL, buffer, num_buffers);
 
-	msg = kmalloc(size, GFP_KERNEL);
+	struct mcu_msg_push_buffers_internal *msg __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -1521,10 +1507,7 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 		buffer++;
 	}
 
-	err = allegro_mbox_send(dev->mbox_command, msg);
-
-	kfree(msg);
-	return err;
+	return allegro_mbox_send(dev->mbox_command, msg);
 }
 
 static int allegro_mcu_push_buffer_intermediate(struct allegro_channel *channel)
@@ -1621,8 +1604,6 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_h264_sps *sps;
-	ssize_t size;
 	unsigned int size_mb = SIZE_MACROBLOCK;
 	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
 	unsigned int crop_unit_x = 2;
@@ -1632,7 +1613,7 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	unsigned int cpb_size;
 	unsigned int cpb_size_scale;
 
-	sps = kzalloc_obj(*sps);
+	struct nal_h264_sps *sps __free(kfree) = kzalloc_obj(*sps);
 	if (!sps)
 		return -ENOMEM;
 
@@ -1715,21 +1696,15 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.pic_struct_present_flag = 1;
 	sps->vui.bitstream_restriction_flag = 0;
 
-	size = nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
-
-	kfree(sps);
-
-	return size;
+	return nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
 }
 
 static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_h264_pps *pps;
-	ssize_t size;
 
-	pps = kzalloc_obj(*pps);
+	struct nal_h264_pps *pps __free(kfree) = kzalloc_obj(*pps);
 	if (!pps)
 		return -ENOMEM;
 
@@ -1752,11 +1727,7 @@ static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 	pps->pic_scaling_matrix_present_flag = 0;
 	pps->second_chroma_qp_index_offset = 0;
 
-	size = nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
-
-	kfree(pps);
-
-	return size;
+	return nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
 }
 
 static void allegro_channel_eos_event(struct allegro_channel *channel)
@@ -1772,15 +1743,13 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_vps *vps;
 	struct nal_hevc_profile_tier_level *ptl;
-	ssize_t size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
 	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
 
-	vps = kzalloc_obj(*vps);
+	struct nal_hevc_vps *vps __free(kfree) = kzalloc_obj(*vps);
 	if (!vps)
 		return -ENOMEM;
 
@@ -1800,29 +1769,23 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 	vps->max_dec_pic_buffering_minus1[0] = num_ref_frames;
 	vps->max_num_reorder_pics[0] = num_ref_frames;
 
-	size = nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
-
-	kfree(vps);
-
-	return size;
+	return nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
 }
 
 static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_sps *sps;
 	struct nal_hevc_profile_tier_level *ptl;
 	struct nal_hevc_vui_parameters *vui;
 	struct nal_hevc_hrd_parameters *hrd;
-	ssize_t size;
 	unsigned int cpb_size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
 	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
 
-	sps = kzalloc_obj(*sps);
+	struct nal_hevc_sps *sps __free(kfree) = kzalloc_obj(*sps);
 	if (!sps)
 		return -ENOMEM;
 
@@ -1913,11 +1876,7 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 
 	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 
-	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
-
-	kfree(sps);
-
-	return size;
+	return nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
 }
 
 static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
@@ -1925,11 +1884,9 @@ static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_pps *pps;
-	ssize_t size;
 	int i;
 
-	pps = kzalloc_obj(*pps);
+	struct nal_hevc_pps *pps = kzalloc_obj(*pps);
 	if (!pps)
 		return -ENOMEM;
 
@@ -1960,11 +1917,7 @@ static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
 
 	pps->lists_modification_present_flag = channel->enable_reordering;
 
-	size = nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
-
-	kfree(pps);
-
-	return size;
+	return nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
 }
 
 static u64 allegro_put_buffer(struct allegro_channel *channel,
-- 
2.34.1

