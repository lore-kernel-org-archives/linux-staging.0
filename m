Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6853E31
	for <linux-staging@lists.linux.dev>; Fri, 24 May 2024 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716563786; cv=none; b=h5YztgG9tpes3TDAe1iZ/j7XybIXToodlZUIiG3w1CMFMKk0+N6hrEfZ4FwlVxk2pSS3U1aC55Ld/ZEbai2DC9xZo9/EOlU5AISEXecXTYmPT6GIccBP+K6mTcfRETvVFDW2RnkkaNY1f20u9OeipeLUkif1A3Ns6r/VSiFETq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716563786; c=relaxed/simple;
	bh=FFdy67FNc38YIKQSk0Wh2FiWZUDFCZNmIWQIdmtu3jE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GvzWbUElDEJXgwhCywmrHJI2eWoW1GsVfrjHDs2jHiANitimCWfHmD8WVGnmtgAbfRBE8SenI6Ikit5qxpFgjs7XAMyBZVk7RZNUB4d98/UbRMSkF0I2FqP6wdwTbayjINhXfmyDRC9oACkntn2Tg4LZ3NOwgiPN1YKzuH0WiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bAtkxrO6; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bAtkxrO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1716563772; x=1717168572; i=wahrenst@gmx.net;
	bh=RLMkn7lgZyfKKgxdUzdYd3qjD1x+AdrYBSTGmC4yM7w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bAtkxrO6yZDoEW5Y3JZkZKE0OE/a+YqhI+txl+raqwoS2El3jeGifTWWo0SW971u
	 /6/fnI4izOiNp/KL9EpmdPlFSIHMtIuH1Pw6GQmej8fxm6iSfZir9O2uaCK+mdM+W
	 1dGMKzIFCId+6b3V1oMdQi9T1ZV905xTVZtGkNDCw6+QqFu5NrvG/Bec0A944rOFU
	 JverLXAQD5Lp4o1PVR6w+t4eotodGpZZrWEMj8dSvhf78/DLZjNg6hIFyr97tGRR6
	 qe444Mb++bLrP/Z4ZEiQlU3rltBkimgYZGdP0USR081y2dMQvUdMJHaI/NqlKfAqw
	 xlzjijWXx8IjFEDmwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1s22Cz0SWn-00Qnpw; Fri, 24
 May 2024 17:16:12 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] staging: vchiq_debugfs: Fix NPD in vchiq_dump_state
Date: Fri, 24 May 2024 17:15:42 +0200
Message-Id: <20240524151542.19415-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lO1n2cBHKSUZX+4dlOWSByjNLlXLRMBuv+j1Cuwz7ym4FTlfTbN
 jg5TzkaaSNLMKKAhvY7zhtg9j+ti6TWNd/2Wd+zn16d4NQyAwOp8zuwX4LBJ8HqXDpF4j5U
 iGYcnJ5SYCSFTZHCfk4UDyEWZeh2kbAUQRrKv3AQCRno4ZI93FzfzaVgMMaDUAaLXUi6ggW
 4m3uxjBH+gaP5S/d0+cuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ir+K2GJMytQ=;5AyWK/h7khCLQ6a+iTbl3FQ4xyV
 S9dOHMLpVoJ/S/Kdbh6UX+6z5c2HIOabJ7OKbT0C72aEWNi37rbeaMBF1N+NzsQ81leE/5qY/
 S5KSyDH8QMcv5c3m4TNdGwMJC24stYYthg3SeHUClPZwGGI1Lai2sKhjKdkAX6XwlL+qrrB66
 QfrJkckVliyu70u9RqI0xxLOL3Jb6tJLw7eTGvEcrU/0IHgGPApH/VIW8E4/jElQIP0NNaNVI
 qWMdJuNcv6NQaimBMgbckeAMr/rsJdWFVbRxQE1H8/snRxOCxq9lqBe7ZiKM9H4s3QrM9ayzh
 jVKIcf970mOSTlalzbjI5ZUFZAwESfPdWEDpVU/vh7SH9TxAqWl8Uu/EDdHDobQGNpdJIkbTv
 xvroIcyQVPVFUCpKcbOoIOQhTqvgnzYrPC5myyomYc9QgdRG0JfcwyjdoeTlmYabv+QAe1vel
 7lsizlzt42wbjxa6EOaNAL4RVttijO2SSdbNzkkhagTHay62f9uXA7iuIKszUXcBDUEbWDsGb
 f5JCceL169ZFrLQXVGdmUgwADBwTLN5Csk+E9ONWtC73Dih1qKA41R6oJmf0yhCiH+lW5b3cf
 0cbirW2ffrti0VNX8Wv00S0wyHZn/o3RKsVOcHsZ7bz1qBYu7hunTKmDnbPSpzHpBLey6Qhy5
 ED3FIu4QQo6SSRiTsSH1nsIRnvwkr0aznJeX5kjnYlQ7fBG/525tJbxjWx7AlsQ7PRpWceY82
 N1JbUW9yp19dylaaCPUzmdQbNatorzifxtSDKXdof1P9yyEtMpKCivxlAA9Vf8MZU3+/lyZvF
 l/jXtvn4N+zVcKEGeA47+oJunRIetT6LAx/8CrDtaL3zw=

The commit 42a2f6664e18 ("staging: vc04_services: Move global g_state
to vchiq_state") falsely assumed that the debugfs entry vchiq/state
was created with vchiq_instance as data. This causes now a NULL
pointer derefence while trying to dump the vchiq state. So fix
this by passing vchiq_state as data, because this is the relevant
part here.

Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq=
_state")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_debugfs.c     | 8 ++++----
 .../vc04_services/interface/vchiq_arm/vchiq_debugfs.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 297af1d80b12..69daeba974f2 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1759,7 +1759,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	if (err)
 		goto failed_platform_init;

-	vchiq_debugfs_init();
+	vchiq_debugfs_init(&mgmt->state);

 	dev_dbg(&pdev->dev, "arm: platform initialised - version %d (min %d)\n",
 		VCHIQ_VERSION, VCHIQ_VERSION_MIN);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debug=
fs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index 54e7bf029d9a..1f74d0bb33ba 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -42,9 +42,9 @@ static int debugfs_trace_show(struct seq_file *f, void *=
offset)

 static int vchiq_dump_show(struct seq_file *f, void *offset)
 {
-	struct vchiq_instance *instance =3D f->private;
+	struct vchiq_state *state =3D f->private;

-	vchiq_dump_state(f, instance->state);
+	vchiq_dump_state(f, state);

 	return 0;
 }
@@ -121,12 +121,12 @@ void vchiq_debugfs_remove_instance(struct vchiq_inst=
ance *instance)
 	debugfs_remove_recursive(node->dentry);
 }

-void vchiq_debugfs_init(void)
+void vchiq_debugfs_init(struct vchiq_state *state)
 {
 	vchiq_dbg_dir =3D debugfs_create_dir("vchiq", NULL);
 	vchiq_dbg_clients =3D debugfs_create_dir("clients", vchiq_dbg_dir);

-	debugfs_create_file("state", S_IFREG | 0444, vchiq_dbg_dir, NULL,
+	debugfs_create_file("state", S_IFREG | 0444, vchiq_dbg_dir, state,
 			    &vchiq_dump_fops);
 }

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debug=
fs.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
index e9bf055a4ca9..fabffd81b1ec 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
@@ -10,7 +10,7 @@ struct vchiq_debugfs_node {
 	struct dentry *dentry;
 };

-void vchiq_debugfs_init(void);
+void vchiq_debugfs_init(struct vchiq_state *state);

 void vchiq_debugfs_deinit(void);

=2D-
2.34.1

