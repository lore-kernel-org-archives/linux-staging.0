Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2419CC14
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776032603; cv=none; b=n+TBYlk4GRhc3UPAT93BHjstQFppfmYzNKlqUqSuP44B7GasPTOMtA2OGp87IY/2OCJsaq8nMuXiVZEne+wPXMLD6MFahskLE+1UwsIPfkUisz76SFJxh2kcConMPcb4LgjpfmvGIRRXFnL5IVt3X2T/gxopXleIPa8ZJUUd1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776032603; c=relaxed/simple;
	bh=T64TpRZBA41DEg/wfVctlRr721wwtVyqIF/IwfaxjSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNmzc2qVP22oxks0FRisJAPjcWgDY35m4IprhU5F2lRmcaPKaRP2vCtwtML6lFvFg7rEKWWaetyUb79Zzfn2EbS9tPO5DTYl8anYVywDnGf9mH4+p97U37o1dCA6G4jmJ6oRUQ2TjPUOhGFk8J6Mau1EoE6a1198DI6al8A0fBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDFdq63S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDFdq63S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ba840146so35992965e9.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 15:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776032600; x=1776637400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYvN4jrk/CUbJx1nSdCPQaZt228zm3wxlCIscdqWqbo=;
        b=LDFdq63SQov6bR9QlUyEMP/pBAzdJaFlyfyn0jg3/VMWvkztvGI6+GIs+Q/loHp7VB
         m3gvTc7727gydE0RFQGVc3wayyHCUlhk6JsnM3M5p3QdzMa+p6QIjoxDapJI0pe8uxkc
         VPA/cSEF2XXQw+CXUSVZYkLxX4eHXzP54OVOts/H9RMMniR/bpluXfWy6ssAshKfH1v+
         6TSqoKyfEgjDXo9QndOf0InAE4BUOg88Cezg8jwMkA+Gc9e0+ErJDLNRGBiLvkkzy2GP
         dOSqytPic3Z68UgV7+I+dn2QziBae9FOjdlivowPWCEHYvg7pprXTtyCIWmm/hcLvKK0
         oUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776032600; x=1776637400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYvN4jrk/CUbJx1nSdCPQaZt228zm3wxlCIscdqWqbo=;
        b=qLdkBYdwj9uG4yZBDJ+GLK0NzVSTFW8j1yaY50NuF7+YOK6HNEbwtmEld+rc8Gw+yK
         ECCyk8mzW0ZWxr8PM6ATZ0fJekcaEYpG1TMP/RdQpyeD2bRGkOe9qz49qKJYoavVjnq/
         BxT2hl1el0uW4I9tnQNH3xRmkQWYlWzmp5iJ7fotGO+Dk9ATyAdTrbxXP8F5D9GsMbhy
         Yvx/4M30VJgOk5N+Rt5KWSQKn+cvveieeny+pgPHj7+Z2+zX7AXNiU4bZvs97sHRq3u8
         hIrqcM51C09OAmFXTvxf9q3Dj8DrXlHD7beBIzSsbGfirCJG1cX2aNoKq+RpBfvgKg2D
         IbbA==
X-Forwarded-Encrypted: i=1; AJvYcCW176w7GTWkOdOfFkke62CIl4XDVhmlwHmbB8kvPbtLW+pYj4crqY1cxs4sdlYG+xfx2Del/jmjhDU2Y8q9@lists.linux.dev
X-Gm-Message-State: AOJu0YwzR6Uo0qbgTlNPZWsXJcg/ZZtctUReIJ9DsWDwGTgXCprl96ma
	UUu7lbBkG8T+MXak/60UNc1L4ycf2Umny0zbmJdso7Io4MRzahqFQ29h
X-Gm-Gg: AeBDietAgXrt0wEDxWaurXRIqEteFAetgm3INKqZhAcRrqVx4JXkl4pPHfLegBPkLcP
	0LnIBE2W99LMzblIuQ4aW097Pa3+RZ1YZOnryiMdc/jao0Jy29BZaUpnHdiF7GrpEpYk04xiDcg
	nBEZiElQtYngZXkrE+89xCfPkvLojRU9wwRQH3GZpLVCX63iFPF34gdPIgF7Ih33qsxpjGxGK68
	a6AvIZ5021cMPX7cVTaz8FUNR0NV9DAdE37IJuFu1Y4bQQaOWyGdpscyahMJEg84EMVLacRhtnz
	0p5UVjSrTgeZEpUYzGh38k4c1GlQfjktrkvcbFazIlCc4SdkN8v6HqXp7DUksJDTOotqJtEXKr7
	jZF4NlcH/LP7J+1MgvVEmLGygomoqGYBeq/9eez2e6h8OBI28WFQYycYu1avlP2Vy8W9K/qoG3G
	BknLR/GtSAxC04eyEyPdib48v2KVQZW5kWzrAhyg7ODglP72MP8CnpGF99Pg==
X-Received: by 2002:a05:600c:8710:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-488d67bbd1dmr162322955e9.4.1776032600295;
        Sun, 12 Apr 2026 15:23:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:20d3:ec44:33ae:6a91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm10528536f8f.8.2026.04.12.15.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 15:23:19 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: most: video: remove redundant cleanup in comp_exit()
Date: Sun, 12 Apr 2026 23:23:18 +0100
Message-Id: <20260412222318.65045-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <2026040838-washbowl-handbrake-ae03@gregkh>
References: <2026040838-washbowl-handbrake-ae03@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

most_deregister_component() already calls disconnect_channel() for
every linked channel via bus_for_each_dev() in core.c, which invokes
comp_disconnect_channel() to remove each entry from the video_devices
list and tear down the V4L2 device.

The manual cleanup loop in comp_exit() duplicates this work and is
guarded by a stale comment claiming that "mostcore currently doesn't
call disconnect_channel() for linked channels" — but the core has
since been fixed to do exactly that.

Remove the redundant manual cleanup loop, the outdated comment, and
the BUG_ON() assertion that checked for a condition that can no longer
occur.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
Changes since v2:
- Remove the cleanup loop and BUG_ON() entirely instead of replacing
  BUG_ON() with pr_warn(). most_deregister_component() already calls
  disconnect_channel() for every linked channel via bus_for_each_dev()
  in core.c, which handles the teardown. (Greg Kroah-Hartman)

Changes since v1:
- v2 used pr_warn() instead of WARN_ON() to avoid a crash with
  panic-on-warn (Greg Kroah-Hartman). Superseded by the v3 approach
  above.

 drivers/staging/most/video/video.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..98988b0d9330 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -555,29 +555,8 @@ static int __init comp_init(void)
 
 static void __exit comp_exit(void)
 {
-	struct most_video_dev *mdev, *tmp;
-	LIST_HEAD(free_list);
-
-	/*
-	 * As the mostcore currently doesn't call disconnect_channel()
-	 * for linked channels while we call most_deregister_component()
-	 * we simulate this call here.
-	 * This must be fixed in core.
-	 */
-	spin_lock_irq(&list_lock);
-	list_replace_init(&video_devices, &free_list);
-	spin_unlock_irq(&list_lock);
-
-	list_for_each_entry_safe(mdev, tmp, &free_list, list) {
-		list_del_init(&mdev->list);
-		comp_unregister_videodev(mdev);
-		v4l2_device_disconnect(&mdev->v4l2_dev);
-		v4l2_device_put(&mdev->v4l2_dev);
-	}
-
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
 }
 
 module_init(comp_init);
-- 
2.33.0

