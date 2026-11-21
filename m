Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296843;
	b=4hjZjgNJ+ha9Wpt6Oxa6Klj6NBO0YemrHIVlg4zdCCJSxCSvM+dfGA2lL5wvJV8h3Bg3
	 BW9Em7J4UzOf4p9o/VGN98Ja5jSDFGgHrrfJCRI+DUPYv6O/7Sug+SttnbrUEaQMa8mPX
	 vGLVaDFbNj/fYVPs6ilKwV54v9QNPLk4bNFCjPRFHlwMPEkQhdgNEd+ngQYXSmqwKxN4A
	 xnt/YZlTPu5w58PbZTS4+I3BlC28FeGXE3qr6yeDCBORjB/XmaR3dE/R1iDfxhFv1qA3P
	 GiJ6BBqJ1oT7hy991wWQmrC502ynXgcfaBF2+cQDlQApzrUCYF10guZld0iP+bOllVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296843;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FkaXPf8QOXi7LYn+0nvNn72NKohLwSSexoM4aATIgL8=;
	b=i0BVG/DNBC1EL4Y6Pl+J4ucGBXguMlAV+uSC20ZcVYmSzcwDOshfIYkDuvGIHE7zfTKm
	 KNTS3l1zwzUTadr/G6qlTGdahlaW1WnRDTaiiIFrTd/nuiXyhcZewmG99W1MBAM/YYmQJ
	 73w0iWuub+JHQAERnbCwnQ+w92P6s+hWM2Br6o6c1eWGJhGQZXfMshhwagCJ6C4cEZaKl
	 pmTyWz5aN78ItfLBpaiZzQJjTL8W2tMCBryJui2/J+O3zXUXrotq9XF1Te5TR81Sebz7E
	 l4hHhQJ8MEJP84vLYHmNm4v6L5w3cQFEh9m/MfYT1ZIzbtPMefJmRWzt1nE2aE3FmSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMiPfqv3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF7606A320;
	Sat, 21 Nov 2026 21:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMiPfqv3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296842;
	b=1bMZz3U/IsQJGiXjnEeLbJ9BP3rU1xoRyOKJSq0TAQs0CYxjSiBnldgQFyE2rwpCYh0p
	 FLgQG7F8R8VnZm2i1q2+ndxBrQMbmRqLxaLiAnMyEAgFL4mcMPlXz8GWs65+xT/r61NxS
	 znUwLC6tsPQ32LoHcmKJZ1um6FUGFq8mqiv4wdSgj5trcasTPZ95oIaXx27jbLK7W/S8m
	 uJTdItg4IJghOw2Ds5eUyUFURtDCggYQby79PL89jT9HervUsr7oFr9fjfe4sylBiyV7z
	 FSVvaPzY9cIBPgoWVauFwnYp0cCTunlS7fU6LscpxicX69IpwAJq0w9m5RlzNQFplfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296842;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FkaXPf8QOXi7LYn+0nvNn72NKohLwSSexoM4aATIgL8=;
	b=vjC8e9vQD/RgDpQFsG4JICsc6Wg+Acalb06dJAopxOR2lccQ3l4q+lKrzmVbdehntssb
	 HUzSQQlLGo9/D5DtNELp8RgE5Tiw3eWmu/76exJNXZeSDGPSM2jSpmoPQCOfWcA+Ngcg3
	 VHWrZOBS5PfSMuT2CupXo1l9YhXyaGHn3ocZUWXidZAzD/K8QJK/Ho6lXqR8gB7p4AIy5
	 loVVfSavIe3x7qLe0gFh/apZObUjz+23hh/tP0bXQt2PBxT/FEc4hWL8L0bdnvVXot+aJ
	 qxMBuYkMsCcJK1PB4GcGecRNhYNvK7gRI7HleEpe2Krjrc3o3s+IJotW7kgrSxi8SsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52FBB1F000D1;
	Sat, 21 Nov 2026 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296842;
	bh=FkaXPf8QOXi7LYn+0nvNn72NKohLwSSexoM4aATIgL8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TMiPfqv3xwOhirnUtH7UeoD/5n67h7MkbGGmHXXuJ/pM0RmvpPXa0s2/BDQk/IXMy
	 UTM+cRMBJoXWhrGAGsKj7R0yN5nJb5RbMS7639NsWJz+nNPw74ucbVYBQX3fNVDPc6
	 mcqqD0SKFPMZt2jXE/E67HZi951ELowQYhNxqegTX+ubmRt7XMITxtJ/nmD5rIG8vB
	 0QOUQ9lyastHr7EwIFoERsq37jDvyIJs/eX7f979ywepvREr4afnUgz9vaJtzpm4DA
	 M/y1I1g6JTfFRiGTucVVrX7oY+fyeiaOl9hGYgV05gVO1vlVNc+1orU9Bu2NXQAemj
	 73SAxprnf6zkA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AA4D14BDC2;
	Sat, 21 Nov 2026 21:34:01 +0000 (UTC)
From: =?utf-8?q?Omar_Yi=C4=9Fitcan_Meng=C3=BC_via_B4_Relay?= <devnull+menguomary.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:34:01 +0300
Subject: [PATCH] staging: most: dim2: remove unused sysfs.h and struct
 medialb_bus
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-dim2-remove-unused-sysfs-h-v1-1-369ee2d0e438@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBAF0KuEWXfADCIlVxEXNfNrR2gqGVOU0
 ruLunybt5GjGpxS2KhiNbelUAqxC5SnodzAppQCyUFOMYqw2ixcMS8ruJXmUPa3j84Ty3HIuVc
 otKcu0KNitNcvP1/+9na9Iz+/I+37B8qm7SN+AAAA
X-Change-ID: 20261122-dim2-remove-unused-sysfs-h-24acc8deded8
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
 =?utf-8?q?Omar_Yi=C4=9Fitcan_Meng=C3=BC?= <menguomary@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296841; l=2263;
 i=menguomary@gmail.com; s=20261121; h=from:subject:message-id;
 bh=demJ0NhC0KXqJH5CiCWgQMWo8L6R/Fj2vHfQlkO0inU=;
 b=kZJ8PxJvM/fRbHAkjbJdCSpO6E0LJc4Ah9PRNio4BnnHpz5oWT+yGsiHSV8ukRpVHPFXxI71D
 HlvlqhR+ck+AGdkGkR3SL4cf4wz9Zw6mkE4LL4Mz9/Arjpi1rtV17Wo
X-Developer-Key: i=menguomary@gmail.com; a=ed25519;
 pk=dgRbAFBMBZdJfvBTw9RBcE3WxXn6Yt7GOZFPRpQqpkY=
X-Endpoint-Received: by B4 Relay for menguomary@gmail.com/20261121 with
 auth_id=1595
X-Original-From: =?utf-8?q?Omar_Yi=C4=9Fitcan_Meng=C3=BC?= <menguomary@gmail.com>
Reply-To: menguomary@gmail.com
Content-Transfer-Encoding: 8bit

From: Omar Yiğitcan Mengü <menguomary@gmail.com>

Commit 4d5f022f3a66 ("staging: most: remove proprietary kobjects")
stopped using struct medialb_bus and replaced it with struct device,
but left the unused bus member in struct dim2_hdm and its definition
in sysfs.h behind.

Later, commit 2ab189164056 ("staging: most: dim2: do not double-register
the same device") removed sysfs.c and all remaining declarations from
sysfs.h, leaving sysfs.h with only the unused struct medialb_bus
definition.

Remove the unused bus member from struct dim2_hdm, drop the sysfs.h
include from dim2.c, and delete sysfs.h.

Signed-off-by: Omar Yiğitcan Mengü <menguomary@gmail.com>
---
 drivers/staging/most/dim2/dim2.c  |  2 --
 drivers/staging/most/dim2/sysfs.h | 19 -------------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d16..06d5f17e0 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -20,7 +20,6 @@
 #include <linux/of.h>
 #include "hal.h"
 #include "errors.h"
-#include "sysfs.h"
 
 #define DMA_CHANNELS (32 - 1)  /* channel 0 is a system channel */
 
@@ -93,7 +92,6 @@ struct dim2_hdm {
 	unsigned char mac_addrs[6];
 	unsigned char link_state;
 	int atx_idx;
-	struct medialb_bus bus;
 	void (*on_netinfo)(struct most_interface *most_iface,
 			   unsigned char link_state, unsigned char *addrs);
 	void (*disable_platform)(struct platform_device *pdev);
diff --git a/drivers/staging/most/dim2/sysfs.h b/drivers/staging/most/dim2/sysfs.h
deleted file mode 100644
index 60405cd47..000000000
--- a/drivers/staging/most/dim2/sysfs.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * MediaLB sysfs information
- *
- * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
- */
-
-/* Author: Andrey Shvetsov <andrey.shvetsov@k2l.de> */
-
-#ifndef DIM2_SYSFS_H
-#define	DIM2_SYSFS_H
-
-#include <linux/kobject.h>
-
-struct medialb_bus {
-	struct kobject kobj_group;
-};
-
-#endif	/* DIM2_SYSFS_H */

---
base-commit: 4f618bb81ea5403c0922bda75411c4669b8a4641
change-id: 20261122-dim2-remove-unused-sysfs-h-24acc8deded8

Best regards,
--  
Omar Yiğitcan Mengü <menguomary@gmail.com>


