Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888991DFE8
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524631; cv=none; b=V+NGE0GkRgG1prDS7kFbv1H93H4RqxOshcAQT/QABx1ObgiMGNHzWzOrWT4sr930kBqJWnhNB252COqiHWSIpcyTwonnqllpve38WB/zNkKLSdVnP9FnCVbU/k/XZD3sqyQnFnu/OKbBl6lJCg5a7wXDxuPNHU+EajFRHfXzfIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524631; c=relaxed/simple;
	bh=cqAN1gi0PgQHW+CGQGc48+3XOjm/3QY2QoB+OJtYfBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n8rpMAKDQM3YJ9LMAQMl5cPsJU800DnAqPXN6F6WqHJMmfn4fB96v58vGY4PodPQicsAs8Qr0hdOF9Ajn1FXTmXw/OvsV7MsURIjW0JyON0TQebFCC7oE+EATsFTvzvybKfMnPM77K3RMZ96vZW/YB/F7DMSrpcnXo9+I/zBtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=e5hsBrOY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="e5hsBrOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524621; x=1742129421; i=wahrenst@gmx.net;
	bh=L81Da1fwz3YhZrikm7gOGIYqhJdk4hwp55sdoIZ0BJk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e5hsBrOYwtTfJCvhnKKEuwJLWUoUnNqI37yRzfA+2pTYao6pVmmkEKVDP/oX4B59
	 JeL77DR7KyceKaCnWhKfa7KGlvhUrl+mwJNHaXkHiLZUO+lbWqVMgnybdTTesbuNA
	 dDcMqAA8R+0ZSFJdFCCRA8KHEtrjO792EhoF0Ixlsr6nAADMpDFj3e3QXy5mLd4jI
	 mOeu1xAFx3pR8Ji8WvgI7kO5BvdXfqXp6/zQrV32sEq0mftu8mPyvb3L8STOUJPPB
	 Mb06lxNA1vkbIZNNuprq7/N7ResNETMoLGV2lxkZEEv0F4RidOtb83DHrEeYIZfLD
	 eCX4i7iQ14oragT5mw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZkpR-1tm9Kl3VbT-00U6QH; Sun, 09
 Mar 2025 13:50:20 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/5] staging: vchiq_arm: Stop kthreads if vchiq cdev register fails
Date: Sun,  9 Mar 2025 13:50:12 +0100
Message-Id: <20250309125014.37166-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309125014.37166-1-wahrenst@gmx.net>
References: <20250309125014.37166-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kS7DLLj2vdWuPI1nrmfS3oHbOvUv+XHxzXuEpzaDvzVe55MhS7D
 CBtHOtBVrkEYJj8QgrsZhvy5MPNFtk8EU980pmJiojb8SX5XME7j3lMixYCV765e9r7SB49
 xSawcq4CVzLCQFsj3FNSBY68RnGhWb6XShaAbrhFV1pzNQWwiMnsC6B7AGxAJ0oHDCMGi3M
 HHWcWFQxp3THsW9lBgbkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KlqeDkoNN7E=;fZbia8Tl4jXYgfeTQK8fcqMwgH4
 KCwrGPphznyY4bJAp+lFO6TbE4MvMidpU2fYFoHiLAujLDG4wiVSkPlvp85KDjb0vbi5Essu3
 6lLwPzfzPFzGkDcsUaITukxEhDNMVfNBWzpsQC3DLRUX3Fu5AS5H5gbAYnjt/DvNpTyhaxokL
 RU9M5Ba52zSItrxnJlwGVd4A2PSPr0hDOl34S/uWCa2nji9B1iZLhCtif2/1YA+jtsTb3srR9
 xptitbHFFsPNJDi77Y8nrWa4ulmshtsJOXbhZ4Ucojrw1cx9Fg6mMIRlvNisQiIwuaI2rsIhI
 BlOrf8yU06XgLTI4O/5w1E00nsqmgM7GNGMvopkZvRcRP2PeNZ3HtpJn19xSiFPT1NGlGTelD
 o3Ku0pymlkpZrFQlSERjq0Vig056q/qQGZ63gFoyIW5/ife9wnP6ZsRB3jHD7Y609brkzl0rs
 yU3Lq1nNwwvKG7d50igEilMPY9WT9yrZwHXYQvYU2KdRic8KoKv27HZgi7zSi/TIX8XaIPzTx
 3+FnDJP5M7MPS07CfRmXzeNRIcw7k8gkp2S3uqJh6PSwBL8tJnxzCX7DySNfgBtrk1JKySd4P
 PiNuNMGqKjPc8MafAjkrS/ReZUsODJoO6Z4gID9lm/1dMD6KdadaUO8TZMZBqfYayz9Uzfzdy
 Z1Vqu24TuAezw1PwONvz9uJEzqhUu8fb1GeHJnBfXIj4IZlHLUNfEDAoJbxckoytumkX4bksj
 U/LtGDFJi2+15TT+7PXFWs5Kug24BAk6XIqMV1ja7M4xKffc4EGzXXHbmW2pmmnzkLsnHVrjD
 bnc1hNaqs6L/G0avFt8JKRcYZiJvW3s3aQJi3gx0R3kLKjM9Ldn03YKEoqXYq7ro3p/+GvMOH
 p0nMgaktDTpgLPMU8yT6Xl4cJ7Vljkt4+/Fn5dOwgaYrN9M63SArpG/i99bXeGeE6CAYJPPmV
 GEIKr4pNLOJyrRPOy8rv/e04a8GW1MCW7hNX1UFiaUwLm9vEziQhmCTfVSp9K18ioBcThsLnB
 C/TdnK1jAOt8M/pkYETxWKLVHQ4sABHMqI+hStbko9ZwTwVsE5MCRudFNFP5rdbQVcnk3pAep
 1YE5x7lxou2Dsf20YJp6OMdCfnRNkWT9zkiI6ZhMClAvhXyA0S+c+RCq1Ut1DZJxYia+dVeQG
 T0C9+vyvg5vL3IC2F6TEiBfpdMeSczhrDzW063hngcW8rdAkh7w+/epoNY/odR3cbxqL4lmsO
 pyh1qbM1pxHtNuY548N9ca8WnvAUoxxgZDGfXX8XE1uh8wXDcfqJLv9JBsgj5eX1d3SLO/dwq
 kp3iqGAtWFUEbFY6hU2fANZY5GyH1sWEtSht3fyZkDH5wd+5Eiziuem9emQzkE3NAxiciBC/w
 LWM21x6P0m1GGGkhfwMdA6EQT6AMBigyrwsPS06VIv/457dqYHQhYZac7l

In case the vchiq character device cannot be registered during probe,
all kthreads needs to be stopped to avoid resource leaks.

Fixes: 863a756aaf49 ("staging: vc04_services: vchiq_core: Stop kthreads on=
 vchiq module unload")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index d3b7d1227d7d..0c7ea2d0ee85 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -308,6 +308,20 @@ static struct vchiq_arm_state *vchiq_platform_get_arm=
_state(struct vchiq_state *
 	return (struct vchiq_arm_state *)state->platform_state;
 }

+static void
+vchiq_platform_uninit(struct vchiq_drv_mgmt *mgmt)
+{
+	struct vchiq_arm_state *arm_state;
+
+	kthread_stop(mgmt->state.sync_thread);
+	kthread_stop(mgmt->state.recycle_thread);
+	kthread_stop(mgmt->state.slot_handler_thread);
+
+	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
+	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
+		kthread_stop(arm_state->ka_thread);
+}
+
 void vchiq_dump_platform_state(struct seq_file *f)
 {
 	seq_puts(f, "  Platform: 2835 (VC master)\n");
@@ -1396,6 +1410,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	ret =3D vchiq_register_chrdev(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
+		vchiq_platform_uninit(mgmt);
 		return ret;
 	}

@@ -1410,20 +1425,12 @@ static int vchiq_probe(struct platform_device *pde=
v)
 static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(&pdev->dev);
-	struct vchiq_arm_state *arm_state;

 	vchiq_device_unregister(bcm2835_audio);
 	vchiq_device_unregister(bcm2835_camera);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
-
-	kthread_stop(mgmt->state.sync_thread);
-	kthread_stop(mgmt->state.recycle_thread);
-	kthread_stop(mgmt->state.slot_handler_thread);
-
-	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
-	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
-		kthread_stop(arm_state->ka_thread);
+	vchiq_platform_uninit(mgmt);
 }

 static struct platform_driver vchiq_driver =3D {
=2D-
2.34.1

