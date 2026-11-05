Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892329;
	b=hC7uWL3YSK5bV5e2VhbVMlBOuD1YwM7+K161/lVgoo38Sj0jpzNFdcVI1YorWc9VfAuZ
	 iIJRTLcfUo2u6egwIbqO469fdgsRtZ2p5CgJCRkuBMnjT6TB/C00yamSwAx9INJ7+PprE
	 zP7PW1VY0BNixEuCaTaSjDjKBF46Vb9HQhvovCx+Xq/ld5trYBgTyzr2FV1ca8xa/vfA/
	 /HTx/H+XFB8bYCais88X8FeLBnbnzmA2eOtAbdYQUHrGHhVJgjg+4V5V/hi8pN8g2i/3z
	 QMWXmpSgeGL+xuhAIpYl7TefOsq26FPN3UiERcigF46wdgPrvcSPbyruPihR3u/KUxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fUq2fGxSb2/NcTlvV1YtV3DNYmmgnliEIRSPS9wFg44=;
	b=uW+gpeYTM82j+3qwmCDZs66w5rZRs0xkoCkLFPsDJ+ldT3AggS7FoyqNzPHQ8X/YCwqr
	 6belW07SI8NtQaszcO8+aX2ieICFnt58+SFhzMj/UaIt/cqQgQwJ9v3XlU3Z2NobM7gqN
	 VQ62wlwZux/KlGLu4Y74d5f5TdCSJo3+sZgt4gS3DpX63p9xSKCi+XVmNVWMLn03ROHa5
	 RqZyTRuuLcl0rlC3jA829T2U2b5nSOfXNmMXj64C1riewbuRQWiwl4IZsk0vojtuHf0dE
	 aCY2/jAZUxvlEPCPNiorc5RDdSvR0aJzYxqAPblfS98qa5Ry+HN85Ntec+W/OFU0lLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e55sfc3A;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2A606EE90
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 15:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA2A606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e55sfc3A
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5436505eec.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 07:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892328; x=1794497128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUq2fGxSb2/NcTlvV1YtV3DNYmmgnliEIRSPS9wFg44=;
        b=e55sfc3ArbzOYKcPt4tZDgizkUewl1RoMqiEmUsEumqavJbj5pEv1avvZMjuj/ACmv
         wynJTPWN82k6THBHcv7AmBaBuyUzsJvIsMaD2z2Ti7qkuJ5IJ7mnpnhBxaYZ9lX68lDu
         AIu39Y8S2PcgDPliQsAbTMQhgqbs0X8e24Ti2lEdZim/cDF70Z7J2lqDufWY3Bl3+CCT
         EwBiQNH+xX9vhbsKn33sQy/0ul1fR3zlOqQr8eakWxVEsVYzmn+uled42U9ycmYvEVOL
         eXxUe3cJyzGvjA5M+26opkHSymaAbZg/Sxgqkj6C3AvGfdPYdlqhzOJbVbQFsr4zejNt
         vpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892328; x=1794497128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUq2fGxSb2/NcTlvV1YtV3DNYmmgnliEIRSPS9wFg44=;
        b=R6+3+lR3Tc6GZsIAVODTRgkGYwgys/PpKsukpcOViXjvYpLDVmVsA2hMlXpF+3bs1V
         Cieb43J7BLMk2ax9KiqBAQWlOaKDELwa4me760jEnd8QahAdSK8I3gh4a48GpqKO/gGa
         VUfr4Ie5l+bNG+UnLIuZKf9dc8F3xUov4fS+oVkwsCUkEbuPLZmRJ2AiMH8SyoZVo/69
         cEsFjOX/taQee9BW/BSYTbCCUAfKqRXZf1DmObQgRE7qnXyvgPPJyXvq62yhhmIozMlY
         xaBJeuiBSPfmYovomJyWpn01EZl4dsFcmcI7mnodWMw2pgn1gs8qso9aPliOW7PO58gy
         oxtQ==
X-Forwarded-Encrypted: i=1; AKwUvByUv8dH6jwefonys3NtMSbr21uhI+2rKM9Xweu2fFgQIRKMWGzWlbj34VUF6+KsFLi9BE6bHNpOuV4EixY1@lists.linux.dev
X-Gm-Message-State: APuU4Z9tJHxWpJU3z+mFjCu9/t7vfrQ7/+0dqlvmmnj91HNokdF5uEUR
	Wd9FFDysVja2EaxcJIJaYqCpT05fcURFMra5ruZtCXfweeDLzIGUeGJr
X-Gm-Gg: AYBFou1Pes4z0DaGhb1T4RyiVdkojg3Mhkw1CDEvyRS5Pq8Q1LvZXMUIMjt8dbkzVj6
	hsp3c7WvTuZvPu6DaQ7PVr7lg4bCoI22TRpq8IINHZekDfYni+p1kIY7NntZ4vTAZyJ2v56RiXG
	bplOOLdlfO3WfpiryZYkPyVgAu4hDJoZsbFEXOWPs4AijqjrOOcazbQKQYtSAWoJnUU41CfSFou
	SuKbcjEM584ZSJCrf4W7J/eC00zjeTZHF6r4Cufum1fKEbr8jHg4ZUyl4NT20JhcZezglPDSTwq
	Sh8/pbHt0eagBeBtQ+mFJo6WCrwv5hKnAg1rZu/IHnBFZFqlF45mTAO+zepz7F5mfNoTKHDBt86
	LZT+fJ6YL0fDKmeoXdbznYw3vBQUjY/oHOvYrM82u/dCGw6vteERQ5Yj3sNJrSUfY//tUjpwrK2
	aPp6IiVwpZtcHCSRgfJtdI3+5ZU0S2VZb8D9VrviKvuCQBtR27GrQdkHANmKyPYQyYq+qPU4rdJ
	KXvGW63QT/79BlrTN2G64dDR5KaYKGQUDlgcgc6zHYac5mmrxV/Xa5osqgS2iRTKVTbXTGxX+2g
	mTu5DGHhLz/idrktZ8Q0cjuPAaOxM5qGHcBv5SOld02Q8UHS5B60IcA=
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr30743988c88.22.1793892327393;
        Thu, 05 Nov 2026 07:25:27 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.63.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm17432491c88.8.2026.11.05.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:25:26 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH v2] staging: most: video: document lock fields
Date: Thu,  5 Nov 2026 15:25:14 +0000
Message-ID: <20261105152514.11704-1-husainsitamuwala21@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks:

CHECK: spinlock_t definition without comment
CHECK: struct mutex definition without comment

Document what each lock in struct most_video_dev serializes, based on
how they are used. list_lock serializes changes to pending_mbos and the
mute check in comp_rx_data(). lock is set as vdev->lock and is held by
video_ioctl2() around the ioctl handlers.

No functional change.

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
Changes in v2:
 - Replaced the short comments with ones based on an audit of how each
   lock is used, as Dan Carpenter asked.

Audit notes:
 - list_lock: comp_rx_data() takes it to check mute and add to
   pending_mbos. comp_vdev_close() takes it to set mute and empty the
   list, and comp_vdev_read() takes it around list_del().
 - data_ready() and get_top_mbo() read pending_mbos without the lock
   in read() and poll(). Only one client can open the device
   (access_ref), so this looks benign, but I did not change it.
 - mute is cleared in comp_vdev_close() without the lock, after
   most_stop_channel(). I assumed the core delivers no more buffers
   after that call. Please correct me if that is wrong.
 - lock is set as vdev->lock, so video_ioctl2() holds it around the
   ioctl handlers, which covers ctrl_input.

 drivers/staging/most/video/video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..94f1dc994217 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,10 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/*
+	 * Serializes additions to and removals from pending_mbos, and the
+	 * mute check in comp_rx_data(), which runs in MOST core context.
+	 */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +44,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* Set as vdev->lock: held by video_ioctl2() while it calls the ioctl handlers */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.53.0

