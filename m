Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5297352FBA
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770477036; cv=none; b=izvZO+PvMthUh8KE47g+DlXKWiHkK9x/bTZokyBc0Eo1N8yXe625qBGWtzDFYrE5lK0UYln/bmEofc1XbflZ5j9dSwxTQmYDddUbcUl7GxQDtZLah+ti7XxArDXLeZJey0qvcWLpmTRsFf1B1GoQOvir3t6PyJZ71GbWlqAXdLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770477036; c=relaxed/simple;
	bh=qc6OCx4Kislm0wyk0amDu1QZgRFQRBRaR7RclOJMlNY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bexVIuGXchiW1w8Ys+XRF7kDaTGt/6aEpcUoJc7mNwIgRhuS6cExKD4kXEUo6QYSEQhVjloWn+9vHPr6ZQeny7rz4g+1VHp2yPTIBWpRPHDpqFvsPSutgR23k71F8miBadbBc0ibq7iw6k7fB9fSzqlpleVHZ12y1jsF9YbEOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=nna5XvrN; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nna5XvrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1770477033; x=1770736233;
	bh=elPcySqM8SQ/m5D1yGRtD/gds0vFjO5AXLY1AjS8CYY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nna5XvrNIt47alo37cSe6NJmLTQRYAm3Uxrm8UqaXLOtoNApQANRa8x1IUtZw8KJ7
	 MLz1Nde0ULgvddhi0ByBKmMNru5ULq1F3ghW7oHuSGdzveVekVzjQTUsxywx5Bj0kx
	 qb/ACI1wfv8FnR0wJUH9f0g7Qd5zf+hVZvSfqif7gUJKkrKw/phgBDreZyZGEEc7py
	 gqF1PpBWDsrXaivXvzfcXMoQkXx/+L0enRHugM1/tNYGHpvJrLIO0ycQ6WP4QdP71x
	 ScZedfunVdH4peIgGkh7I6h2Ak70FCSMUvmOxDKMvK5gLQ0rGrA3rabsrHTx61zzyb
	 1i6Vg6vcu4a9A==
Date: Sat, 07 Feb 2026 15:10:30 +0000
To: gregkh@linuxfoundation.org, elder@kernel.org, johan@kernel.org, hvaibhav.linux@gmail.com
From: Bruno Martins <ehanoc@protonmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bruno Martins <ehanoc@protonmail.com>
Subject: [PATCH] staging: greybus: remove unused apb_ctrl_fw_flashing() and apb_ctrl_standby_boot()
Message-ID: <20260207151026.118681-1-ehanoc@protonmail.com>
Feedback-ID: 4792375:user:proton
X-Pm-Message-ID: c3b242fd3bdbc1a218a7abe6ecb8b330220291c1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These functions were left behind when commit 921dbe52b40b ("greybus:
arche-platform: Add support for SPI bus sharing for Mihi") removed
their only callers in 2016.

Signed-off-by: Bruno Martins <ehanoc@protonmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 10 ----------
 drivers/staging/greybus/arche_platform.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/gre=
ybus/arche-apb-ctrl.c
index 90ab32638d3f..6a50b79bb787 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -230,16 +230,6 @@ int apb_ctrl_coldboot(struct device *dev)
 =09return coldboot_seq(to_platform_device(dev));
 }
=20
-int apb_ctrl_fw_flashing(struct device *dev)
-{
-=09return fw_flashing_seq(to_platform_device(dev));
-}
-
-int apb_ctrl_standby_boot(struct device *dev)
-{
-=09return standby_boot_seq(to_platform_device(dev));
-}
-
 void apb_ctrl_poweroff(struct device *dev)
 {
 =09poweroff_seq(to_platform_device(dev));
diff --git a/drivers/staging/greybus/arche_platform.h b/drivers/staging/gre=
ybus/arche_platform.h
index 9d997f2d6517..5d0692af2533 100644
--- a/drivers/staging/greybus/arche_platform.h
+++ b/drivers/staging/greybus/arche_platform.h
@@ -21,8 +21,6 @@ void __exit arche_apb_exit(void);
=20
 /* Operational states for the APB device */
 int apb_ctrl_coldboot(struct device *dev);
-int apb_ctrl_fw_flashing(struct device *dev);
-int apb_ctrl_standby_boot(struct device *dev);
 void apb_ctrl_poweroff(struct device *dev);
=20
 #endif=09/* __ARCHE_PLATFORM_H */
--=20
2.47.3


