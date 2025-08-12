Received: from s.wfbtzhsw.outbound-mail.sendgrid.net (s.wfbtzhsw.outbound-mail.sendgrid.net [159.183.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112552DA74C
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754963770; cv=none; b=hubcloDiBDYxOe6kAAs8gscfi8txDHKuulIt0UsJyHtGZwlQ95AWqS3qJstaHZttCBHSpnvT6mJovlwA/r/rezUEK5WSe5bOb8TH8Z7C8pgz6XpriRDlsS7pgiq4lSFxau7b8UbdVV1j3oqr7ix0HUhu/pvhNrU/+HwaXHi7mcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754963770; c=relaxed/simple;
	bh=ptjaTb7dX34VvrLyNQVgaFO+MBHJfAMqQTH19NFY+2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=JOGVzzNAK56bwoLSsIkIq/BEexFaWY2/+enA5jf7RMo/Otex1jneLnrpkoVA2nY/zhcMSMcsFxfD8XabF6JZPlAGpkg85CP2iiRDH/QPg6Q8h9JOF2txCuVrSBnU0/hcArdgFQ04tcHBlJMR+Qy+nOjfrXU/hlZz1LiSiDoIwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=sendgrid.net; dkim=pass (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b=CiTZlOr2; arc=none smtp.client-ip=159.183.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sendgrid.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="CiTZlOr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=smtpapi; bh=4oBQmst1n3VEnFu+osicTK+MtNnZ0TgeYRbV1ZyKo8k=;
	b=CiTZlOr2Nh5F2GHR1UqaiXw2+2NEQ2Stf1KDTGxNbT3Eh0hEsM+FMJydUD784M8grzj6
	twHWpmQf5N+7ytc6HEm2t0NLa23SNjiLmtc4/kcOcOlWCiVUoK5IYvrkMym+ucYW4Es+b5
	dHT3Ewmsis1DXNd2vZdpHYCb/2YRQJzT0=
Received: by recvd-7fd96f4944-h2fdt with SMTP id recvd-7fd96f4944-h2fdt-1-689A9F36-5
	2025-08-12 01:56:06.369029894 +0000 UTC m=+5908321.600103385
Received: from localhost (unknown)
	by geopod-ismtpd-11 (SG) with ESMTP
	id 7-ojFJCcRE2MTrXuxMtA4Q
	Tue, 12 Aug 2025 01:56:06.008 +0000 (UTC)
From: Yuri Martins <yurimartins2004@hotmail.com>
Subject: [PATCH] staging: vc04_services/vchiq-mmal: fix typos in comments
Date: Tue, 12 Aug 2025 01:56:06 +0000 (UTC)
Message-Id: <20250812015524.64413-1-yurimartins2004@hotmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2E6ieiQIm7OvTDXtE=2Fxfw5eonpObpZ49ICwJQVMpAHgswW=2FbfUf0YOgwEO=2F?=
 =?us-ascii?Q?RoROFENTv55eS57JVaktoLd4pMnwF=2FfvlJPO429?=
 =?us-ascii?Q?MKyDQhniRHdRbs0K4etPP1ZwPhd+Fm4eWTNktbl?=
 =?us-ascii?Q?uKR0ruEtHd+uaDTa60N6ZnjS4cfZpez561L0k=2FK?=
 =?us-ascii?Q?7O4mm9KRu7tzuRPdIrQYS=2FfzqZByiEdAhW17z86?=
 =?us-ascii?Q?7BG+2mULpNlZMLi1b=2FcInsWvWtOtuO0IjI47Ora?=
 =?us-ascii?Q?Me1SzJUrw=2FWwpCaXb+JQCtL=2FJg=3D=3D?=
To: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org
Cc: bcm-kernel-feedback-list@broadcom.com, umang.jain@ideasonboard.com,
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Yuri Martins
	<yurimartins2004@hotmail.com>
X-Entity-ID: u001./v1UP53i8YyoizAUvofPCQ==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

Fix three spelling mistakes found in comments across the
vchiq-mmal driver component:

- recived -> received
- servie  -> service
- enque   -> enqueues

Signed-off-by: Yuri Martins <yurimartins2004@hotmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h   | 2 +-
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
index 471413248a14..1889494425eb 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
@@ -13,7 +13,7 @@
 
 /*
  * all the data structures which serialise the MMAL protocol. note
- * these are directly mapped onto the recived message data.
+ * these are directly mapped onto the received message data.
  *
  * BEWARE: They seem to *assume* pointers are u32 and that there is no
  * structure padding!
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 3fe482bd2793..c2b5a37915f2 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -326,7 +326,7 @@ static int bulk_receive(struct vchiq_mmal_instance *instance,
 		 * committed a buffer_to_host operation to the mmal
 		 * port without the buffer to back it up (underflow
 		 * handling) and there is no obvious way to deal with
-		 * this - how is the mmal servie going to react when
+		 * this - how is the mmal service going to react when
 		 * we fail to do the xfer and reschedule a buffer when
 		 * it arrives? perhaps a starved flag to indicate a
 		 * waiting bulk receive?
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 97abe4bdcfc5..8c3959f6f97f 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -115,7 +115,7 @@ int vchiq_mmal_component_disable(struct vchiq_mmal_instance *instance,
 
 /* enable a mmal port
  *
- * enables a port and if a buffer callback provided enque buffer
+ * enables a port and, if a buffer callback provided, enqueues buffer
  * headers as appropriate for the port.
  */
 int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance,
-- 
2.34.1

