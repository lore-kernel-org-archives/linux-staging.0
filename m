Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC7218AAD
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764688924; cv=none; b=djJB+ltmTn8rhbI13+PELJlRdXMcO8sF4Ohr98lYlc6eqtl4uIIQ0QNqnp23x4VeSYmYyZOSUQeQB0Q9zJxT9sOYw9BeWCXP+f7KxwdSRG02B5BMRVStH3E0sbAPiIV3QAUcVtB1D1BtC6zuFk+fkxE396cE38oh77jVjJpM6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764688924; c=relaxed/simple;
	bh=J0zHCTS9r3q3uR2GgqeppVb6P68lblrzhOFukqEmSeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hzVinuwg5IYPFSNGZz1Mgmuwbx7R8KghOG+6Gj+E/Tl/vjrECdv8feu/SfI8fiS+9AbznyGKrgTviVQQgqHiLBowdAcG0V47RaaVjnZ4wjBXYAqP0fUdShowC9HGRd9rQjivVJs4+gC4ViRvDF6e4qtELpVHtx1XXoeo4ZCQxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZgkTg+D; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZgkTg+D"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ba599137cf8so2069091a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 07:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764688922; x=1765293722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCLbvv3aPet/TfMem+qe18DQLQYqNA0ORoNPV+OzdZQ=;
        b=BZgkTg+DEDogj+Q8yS5YnIzWOQpBW/Mw1RvFVzMecYNqSEHtJ217NfNxnwooWfTqYa
         RD326dy5UvUiCoVRgHzh3PrSvH1PBMH/tshCedA6N43a5ovqFSlnbMxuaCr+sDzLtFoN
         EGBIuJQnErxQ6bDQjBOfKgPc2Ao5LBoDhfX4Jo1IX6HjAjxDl8pbOa7yfIe5hktsnWJj
         CO53tvNLc8YBFZtEeV4/c+NNb1Rf+3RRtYXmh/Bt0CjdidfPvGoAqhA4apPw4ig4Oyv4
         2v85MiuvRX4ro2HM1GcjwDotcqopD+HB+ogmI5TB9a8DiamxppQ04ShBCHeFaFvtnfek
         It0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688922; x=1765293722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCLbvv3aPet/TfMem+qe18DQLQYqNA0ORoNPV+OzdZQ=;
        b=B8aSFdtlFlOo7AJYBPcpT3J6+QsH54q5GyUdQxvvcjaSHwyKfLOcA2CLOqQ7azkOwx
         QkZwKhtjOrKiWefsue7PYOEgTCnPoQcuEOoW8HXaCWQd4c+5OfuGSZKHZ88yPWptWrEO
         HBLC3Rkg9+7ccy+X5HBxG/d93OkydsptZzBXYiH7qFGypbS3TPDGVs8awBinpZCdYmxn
         jNBSG53GIIDtgdhyJCPyyK41z7ZcpPRk186zWTh6zxGt/zjsII/6Sq8+qJWnfawepKFG
         xRA0Y/M20tuOvdEFGJes82z5smYqmiCQK6m/fugHm/LDnqJ0ta8TW4tVFSxW+8tSQHTq
         UhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1opq0oxYsGTXFDxI1TrGuHLb73uFDXs9tGVZQH/ejicbQQl/KqbUEtd1AxHG54tcf+uUaxCSvo8KeOWHm@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf1372qSqEhUP+IEGUsubNnaoGHs65rx180A+75twxPeFYC1wZ
	mPzIptMn6vCH349PbAkq1xcA7jaaLSRqIwueuv666Kvpbe9eX+hRlE57
X-Gm-Gg: ASbGnctH/yjLX1wHg6ze5PwvTJVLPwNonBT3TYpl3CWhbOGAc0hJLALDwe/tsvtzgmh
	H8IAUpCmPTKxewQO/wF1L2IzHTz2181pZ2/UqTcsTmhqT8FEW8yvV13SXEMr7ywVWPULitCXnot
	OhcTh2WIqwUfvPSyqTqNKgkZDcUzkXsa7vKASIbIjPZtmjBCgNwExjdn+J6pMuQkqUe2EqU26A2
	DykyNnXtakOIjE13Li7A+SrNMXs21ezfO4+qN93GTeVR0t3hpfg4JBLSGEnaX5t4Qe6zAIFo/Ol
	LNYmGrgaZuabpba3gAeZ8FKl3y1Bbih802Ibrtk2bOMD8tePbM1x6eHjlf1qf79isOesuoGv5mp
	7daxjx0DeX51InCBrK31fH94lzBXYQ5MX4Xsma39d9bTE3343a2ZYmxLtbcd8bxErPKW8zxoavx
	pgyAvBIoIHKjEzuXH3zHpPIihUKFuaGD4+a0rua/M=
X-Google-Smtp-Source: AGHT+IEVfmPLbtIGaLHaKB3ZkLi3IRVfVIEPYxjQixLfCOzRx2Tbw96M1XOMZDvlqg1MGiO0zyZ42g==
X-Received: by 2002:a17:902:cf41:b0:298:68e:4042 with SMTP id d9443c01a7336-29d5a5f0e23mr32211475ad.26.1764688922306;
        Tue, 02 Dec 2025 07:22:02 -0800 (PST)
Received: from pavan.localdomain ([49.37.151.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb450cfsm156934805ad.74.2025.12.02.07.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:22:01 -0800 (PST)
From: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-staging@lists.linux.dev,
	pavankumaryalagada@gmail.com
Subject: [PATCH v4] staging: most: video: prevent probes during component exit
Date: Tue,  2 Dec 2025 10:21:43 -0500
Message-ID: <20251202152143.13352-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When comp_exit() runs, comp_probe_channel() could still add new devices
to video_devices, creating a race and potentially leaving the list in
an inconsistent state.

This patch prevents new devices from being added while exiting by:

- comp_probe_channel() checks comp_exiting before modifying video_devices.

	if (unlikely(comp_exiting)) {
		spin_unlock_irq(&list_lock);
		ret = -BUSY;
		goto err_unreg;
	}

This ensures that all partially created resources are properly freed
and no new channels are allowed while the driver is being unloaded.

Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>

---

v4:
 - Used unlikely() for the comp_exiting check to optimize branch
   prediction.
 - Removed err_cleanup and use err_unreg for proper cleanup
   of partially initialized mdev/v4l2 structures.
 - Removed redundant spinlock usage around 'comp_exiting = true;'
   in comp_exit().
 - Removed explicit kfree(mdev) in comp_exit() loop.

v3:
 - comp_exiting flag update and memory cleanup for early exits.
 - Commit message clarified for reviewers.
 - Removed WARN/BUG as it becomes unnecessary.
---
 drivers/staging/most/video/video.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..21cb94250d93 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -60,6 +60,8 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);

+static bool comp_exiting;
+
 static inline bool data_ready(struct most_video_dev *mdev)
 {
 	return !list_empty(&mdev->pending_mbos);
@@ -498,6 +500,11 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 		goto err_unreg;

 	spin_lock_irq(&list_lock);
+	if (unlikely(comp_exiting)) {
+		spin_unlock_irq(&list_lock);
+		ret = -EBUSY;
+		goto err_unreg;
+	}
 	list_add(&mdev->list, &video_devices);
 	spin_unlock_irq(&list_lock);
 	return 0;
@@ -555,6 +562,8 @@ static void __exit comp_exit(void)
 {
 	struct most_video_dev *mdev, *tmp;

+	comp_exiting = true;
+
 	/*
 	 * As the mostcore currently doesn't call disconnect_channel()
 	 * for linked channels while we call most_deregister_component()
@@ -569,13 +578,13 @@ static void __exit comp_exit(void)
 		comp_unregister_videodev(mdev);
 		v4l2_device_disconnect(&mdev->v4l2_dev);
 		v4l2_device_put(&mdev->v4l2_dev);
+
 		spin_lock_irq(&list_lock);
 	}
 	spin_unlock_irq(&list_lock);

 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
 }

 module_init(comp_init);
--
2.47.3

