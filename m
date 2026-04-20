Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5883845A2
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684917; cv=none; b=FGsfAHcd+/KKKo9wTqs69otBmiAjOjORQHUAzlz+KeivpGBuUQvNWvb94riSC6YaunrGmw/EwSighdUxnFbegEaObOCRB0I8my0X+8bS6jv6RDUkrdWd7Q5QWSnuZsZwP8JyaGoPHok+VpwIPxs84dEfJUNz9ts+PtgPn0vV01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684917; c=relaxed/simple;
	bh=DDGdvMzLS8XW7qHg8AG7HnPuQGwiO6wX2u5TuI/1nMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UKrUkf1lTmoooHDOVVCku2ULYsLAZ12DUpgAoZYxyAaBXiPqsci+VY72OQeuvReiY8UKLTxoHhafmy3Pi9boNKkkCuVqDYRygk7COThgLKx0L8hMH0mEynpBqG9FfmPvI3Q903bQB++PUfcHEcBX6ztAAq2AUxRNTiGm4tpoQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matanco.space; spf=pass smtp.mailfrom=matanco.space; dkim=pass (2048-bit key) header.d=matanco.space header.i=@matanco.space header.b=CF/wzkrh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KHkSBXV3; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matanco.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matanco.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matanco.space header.i=@matanco.space header.b="CF/wzkrh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KHkSBXV3"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 105721300DE7;
	Mon, 20 Apr 2026 07:35:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 20 Apr 2026 07:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=matanco.space;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1776684913; x=1776688513; bh=VG32H1hKoI
	bSZwoNAmMfvDTfKjzI2QTKgaYoaG6R9rA=; b=CF/wzkrh74aAm+Zb1wm1F1zSUn
	qjlPTh9nq1XloHivpRtbPJeBYmKJbeX3GE2fE/S4QPBXf3eQkQLXHv/REXRgyQDf
	50Wl0bUGOPiSG9kqtovT63h5MWguY/ePgrgXfJyOoJM9ksNCi+9TcGimwJ1NExMU
	JrrTSjmK5DGbkxIx9n521uEZa4D5xzBRU3eybXEqwnagvyXaeyWyjn3r7CYUr23J
	2A47hJyAUFif65xxkfpOMz5kmV00dv8Lw74Gh4es4sf9SHFhgmw1sfxAeZmJE10P
	GqS0qKkWTO56HsuhQIgHpoHI6HHlDhYK+nj9r3iIqK8mvcsK4AjGYfHKRBrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776684913; x=1776688513; bh=VG32H1hKoIbSZwoNAmMfvDTfKjzI2QTKgaY
	oaG6R9rA=; b=KHkSBXV3RnChtt7isIrP/af2kH3/SBLM0sLmLnk1v/vE7s7XHOm
	lfPfN3hcrOPmEgnYgQWlfksuw2DmI/btpvohg9bUB0Y5NC02zkkTTKB0VL5BdR/S
	oIZZnS2jteAwlu2GHKgpLG7m7LzYQtZcZSszNxgXa/wESSCo5dj+HucYC9g3ftFT
	3B6rDCNgPWcJTscdu44gq5P1KGGNTVH6+QO4uG92yZobhGNDkeswbeAv3hU73jxZ
	/a/aiKu5wzLxHqwtiBfV3w2a7ux09CJDBiAEkUnxHSOjW9nKiPY2DHTz035oCBcp
	h5ntYwrgivQBgCYAV9FcyJHJ/7uB3B8rBFQ==
X-ME-Sender: <xms:cQ_maUWcVFcql9piWXkpmto3tSkS1_1vT5ub6z_xaS0tN3fmMWNi6w>
    <xme:cQ_mafdtNTTP6SISqgOBEFvPYA76LOT-FGt3Bcl3Pu8yKrjIBPoahhmjtJEn4HTEn
    pohU2GfvKUBwdzkYU-jy1_khTgcGUrQSPiwukjtVlyf0Mitx0vZxg>
X-ME-Received: <xmr:cQ_maQtPUnD0ncpXp03iEp9271C5F5qzXq3mF_MPSLoJSyV5DmamDpott_llkFY2uiRAEIGZjwY6V2P33UKoo4xaOxMaPnWAXAmCCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehkeegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomhepofgrthgrnhcuvehohhgvnhcuoehmrghtrghnsehmrghtrghntghordhs
    phgrtggvqeenucggtffrrghtthgvrhhnpeefkefhheehgedvuefgvdeuhffguedvvdehke
    eugeefhefgudegieffteegjeejteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghtrghnsehmrghtrghntghordhsphgrtggvpdhnsggprh
    gtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhs
    thgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgrrhhthh
    hisggrnhdrvhgvvghrrghsohhorhgrnhesmhhitghrohgthhhiphdrtghomhdprhgtphht
    thhopegthhhrihhsthhirghnrdhgrhhomhhmsehmihgtrhhotghhihhprdgtohhmpdhrtg
    hpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtohepmhgrthgrnhesmhgrthgrnhgtohdrshhprggtvg
X-ME-Proxy: <xmx:cQ_mae-z1LMJFRLkBRc-jrU-Tt8b71rI4D5r09CliUVrxj7o05hZuQ>
    <xmx:cQ_mab0TowLrcOrVrVuYEL95weu1cOMuuvTeND2IzTJDbTAtC-tBQQ>
    <xmx:cQ_maTCPY7-zhtHgknqEO7Pc4Hn0V5KJ1_OxXwOEdSCrni7at8lXhg>
    <xmx:cQ_maXdfgubw7BPnn3R0Gba_PE-BCgXhZfyEDavDe52YIj47uazMFA>
    <xmx:cQ_maXDMQOt6eI30Tnt2Hi1IBmDA03VzSRoAKqgqV6I2GL1q6YU1O3Uf>
Feedback-ID: i07264b6d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Apr 2026 07:35:12 -0400 (EDT)
From: Matan Cohen <matan@matanco.space>
To: linux-staging@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	Matan Cohen <matan@matanco.space>
Subject: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE and add recovery
Date: Mon, 20 Apr 2026 11:35:03 +0000
Message-ID: <20260420113503.62552-1-matan@matanco.space>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BUG_ON() halts the kernel unconditionally. The check after
most_deregister_component() guards against a bug in mostcore: it
currently does not call disconnect_channel() for linked channels on
deregistration, so if that ever changes unexpectedly, video_devices
could be non-empty.

Replace BUG_ON with WARN_ON_ONCE so the kernel stays up, and add a
recovery path that drains and frees any remaining devices to avoid
memory leaks in that error case.

Also document what the spinlock and mutex in struct most_video_dev
each protect.
---
 drivers/staging/most/video/video.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf1..4ade49569bd63 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,14 +33,14 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
-	spinlock_t list_lock;
+	spinlock_t list_lock; /* protects pending_mbos and mute */
 
 	struct v4l2_device v4l2_dev;
 	atomic_t access_ref;
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
-	struct mutex lock;
+	struct mutex lock; /* v4l2 device lock */
 
 	wait_queue_head_t wait_data;
 };
@@ -577,7 +577,20 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+
+	if (WARN_ON_ONCE(!list_empty(&video_devices))) {
+		/* clean up any devices unexpectedly added during deregister phase */
+		spin_lock_irq(&list_lock);
+		list_replace_init(&video_devices, &free_list);
+		spin_unlock_irq(&list_lock);
+
+		list_for_each_entry_safe(mdev, tmp, &free_list, list) {
+			list_del_init(&mdev->list);
+			comp_unregister_videodev(mdev);
+			v4l2_device_disconnect(&mdev->v4l2_dev);
+			v4l2_device_put(&mdev->v4l2_dev);
+		}
+	}
 }
 
 module_init(comp_init);
-- 
2.43.0

