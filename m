Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721431E531
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595886; cv=none; b=L/ECANd2zUSQpevcqn2IM9IHhZ9pLvIK9wxUgUnDle9n5NpUmUiqcOfita+fu6qtgwDfq4AgoUs3pU3P8VW3enByOjrRWBq2QcydWcGa4QRTWmf/bjcPiA2KIPwYC2VXecsviqWWyr+nfTlcKKDADWs8wiU2FchWTSD2iMe2R34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595886; c=relaxed/simple;
	bh=nOgRCOsy4epQMGx0jP2sNovxqEy5mQGvEO8RrDplq+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ej/W6sj+0wc8qg2L2DQZEfKYVu+RRpKiSXNY2qL7Mr1Poo0OQVJfDu0x5D9yUbfcCQqfi9lOKGURwNTkeOa1/0CdO7uW6LXAtpVLXBengApMQ0phZ0UN9OmdkSrjTeZ74IfsVv/aUBye71Hu9HYdaxuc9DCyEEL97qcGdYiYdBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=su8e0XB6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="su8e0XB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752595873; x=1753200673; i=wahrenst@gmx.net;
	bh=EIlQNIzecn5bdP1imBfDsZPiIdoL5qWTq7CmIfk0cbA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=su8e0XB61XuOshr3vQaLoG0yLMO+JD5uDkfpfOdfvWzTbnGOjuITJSLonMV9Y6Y5
	 jYjsp6ynXNCu3iw+/nnM1DMiT1mTt4q3YhrM7awOF872o8Jr/hOb5KkK7yNl3IIZc
	 nlYzYLaVsSSren1znRC48FxKDTmg+jQnar14ZmNXSo8J1CzYkvdE4yOr/GuL7Xi/2
	 Y5w14kPR/jMI+vsCgv3+FKqyEilfntndrRl2pqeHs05/af8hHvcj/SLDHsGDhpemI
	 3tBkHPNpXYOg5uu0gJavDsvmHkkO1xHBStfUKcQMc5mADHKpBYfTqRXy7X566IriD
	 Xp1IAPXrHpR/7DIbJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1unJLz0MlS-00spQk; Tue, 15
 Jul 2025 18:11:13 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	stable@kernel.org
Subject: [PATCH V2 1/3] Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
Date: Tue, 15 Jul 2025 18:11:06 +0200
Message-Id: <20250715161108.3411-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715161108.3411-1-wahrenst@gmx.net>
References: <20250715161108.3411-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vs62+5Ifksp5MGlxdtHSJRuYC8WGtpe2DqG5erqywUyqaUtllQs
 dP2VXiAHJY29dF8/eR6dfc4FNJ4I/rXfwa8hLp/mhX/0RCF4lwE2Xhz4GKlRz07szENpxvL
 zZlngvKaAPXt1meKz1pVvE0UjZFJwJmC2ICTLXaFC+XW1aYoN9jeXC1bDeptlvg0PNZmZ3o
 QfIhsroV0RXrD/y2T5rsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:waeZPf0tk4o=;MXhM6LgEN1dpkTsIUpIm0h191hm
 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
 xbcAQ=

The commit 3e5def4249b9 ("staging: vchiq_arm: Improve initial VCHIQ connec=
t")
based on the assumption that in good case the VCHIQ connect always happen =
and
therefore the keep-alive thread is guaranteed to be woken up. This is wron=
g,
because in certain configurations there are no VCHIQ users and so the VCHI=
Q
connect never happen. So revert it.

Fixes: 3e5def4249b9 ("staging: vchiq_arm: Improve initial VCHIQ connect")
Reported-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Closes: https://lore.kernel.org/linux-staging/ba35b960-a981-4671-9f7f-060d=
a10feaa1@usp.br/
Cc: <stable@kernel.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 28 ++++++++++++++-----
 .../interface/vchiq_arm/vchiq_core.c          |  1 -
 .../interface/vchiq_arm/vchiq_core.h          |  2 --
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 5dbf8d53db09..cdf5687ad4f0 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -97,6 +97,13 @@ struct vchiq_arm_state {
 	 * tracked separately with the state.
 	 */
 	int peer_use_count;
+
+	/*
+	 * Flag to indicate that the first vchiq connect has made it through.
+	 * This means that both sides should be fully ready, and we should
+	 * be able to suspend after this point.
+	 */
+	int first_connect;
 };
=20
 static int
@@ -1329,19 +1336,26 @@ vchiq_check_service(struct vchiq_service *service)
 	return ret;
 }
=20
-void vchiq_platform_connected(struct vchiq_state *state)
-{
-	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
-
-	wake_up_process(arm_state->ka_thread);
-}
-
 void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 				       enum vchiq_connstate oldstate,
 				       enum vchiq_connstate newstate)
 {
+	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
+
 	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
 		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate)=
);
+	if (state->conn_state !=3D VCHIQ_CONNSTATE_CONNECTED)
+		return;
+
+	write_lock_bh(&arm_state->susp_res_lock);
+	if (arm_state->first_connect) {
+		write_unlock_bh(&arm_state->susp_res_lock);
+		return;
+	}
+
+	arm_state->first_connect =3D 1;
+	write_unlock_bh(&arm_state->susp_res_lock);
+	wake_up_process(arm_state->ka_thread);
 }
=20
 static const struct of_device_id vchiq_of_match[] =3D {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e7b0c800a205..e2cac0898b8f 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3343,7 +3343,6 @@ vchiq_connect_internal(struct vchiq_state *state, st=
ruct vchiq_instance *instanc
 			return -EAGAIN;
=20
 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
-		vchiq_platform_connected(state);
 		complete(&state->connect);
 	}
=20
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3b5c0618e567..9b4e766990a4 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -575,8 +575,6 @@ int vchiq_send_remote_use(struct vchiq_state *state);
=20
 int vchiq_send_remote_use_active(struct vchiq_state *state);
=20
-void vchiq_platform_connected(struct vchiq_state *state);
-
 void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 				       enum vchiq_connstate oldstate,
 				  enum vchiq_connstate newstate);
=2D-=20
2.34.1

