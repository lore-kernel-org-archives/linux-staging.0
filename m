Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EBC2ED149
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248468; cv=none; b=jQ9SPqVz7b+/A+MIz/uEIfibJoL6B8NAVTVcXbJaNE1Gg1ZQvFhhNM8zw13lMSPmTfI4KHjhpP8lwP67qIGPm2PeQ/ppeiCuUa/WhKgvK1csd4yLba5G2jF6jglpORIgmaBsmxhdnbK5A0eHH7tn6lx98HhdkYEEBmtGJxqpBbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248468; c=relaxed/simple;
	bh=bRD4WoHrOQDyC0icRY9Ap4u+SWJQx64xVvLm+r6WjwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMEtjt7jbEIVim/d1EiTH/vCg9wYU1p8kLht4Pybtbgc6eiUc+wCWgcaiXFzXd8AGwjGsk2TqjUANCSNdtCSoeHa/Vd31AdhY/SN70+BwvIQ2ySvdHNrhz7SSo/Ql1SHD+v3yP9blTQj9IEj1C9QbviVCemQCUl+nxWUSA5S5V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LQ1duoaZ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LQ1duoaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752248447; x=1752853247; i=wahrenst@gmx.net;
	bh=Pvmdzzon70L1hOLqeuWPtYOsuZehChUPPCRRTupcrA8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LQ1duoaZCaombf/ZBDb9r2QOjMuF5Jj5+c5ViHcmoP5YCeHl+sXrRSrgoxosxE6c
	 iUy5IOjSzw0gg8m3GMWIneW9VWDtwtoD6y7i6WNZWPgV9TUZqvYpLL9kzIOgTTEJw
	 i8vB7JsL+aQjwGatk4yqke2EUTr23k03kOBrRJenrBkaNV3olfgK6DT9LArcLxUYe
	 KjVXfcEC697TSOpqplG6WSmM2/MyJd/poya76N3FYJ20G8UMLBa8F5sNVtICtyqGR
	 jcdnllArQOCCBplRH47epoVGeuqcUntu0l/tDCHEbs8p0Tj+HMvt7GGl1v6UTAvGX
	 cb6OG8Yzn2fLkKztLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1v9agP3TsG-00cTeF; Fri, 11
 Jul 2025 17:40:45 +0200
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
Subject: [PATCH 1/3] Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
Date: Fri, 11 Jul 2025 17:40:29 +0200
Message-Id: <20250711154031.24178-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154031.24178-1-wahrenst@gmx.net>
References: <20250711154031.24178-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XPMa324HfxC3iLXRnKYUBTBW8QnkPAyU2y/MVE/V2Ab+K2O2mcD
 CDZJzWjlxixJSJQPRLSn7TQoCbmx2X+p6L8EWDToSV7Mej2sLQWDIkbIwXZcAJ1mvirgM9m
 R4HsgDyGScBZ/YSMlUNG/QAP9ugGN9CLGIWlSskC/01R8pRMKSPlzYvGEVnnhdvKo+09PX7
 Gab2phRr8Juc5rk0D0kSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3LE+fveJhmw=;Lsuuij3WnGn5g6ST7aaO4kx4zPs
 +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
 gBhIN6AQcGad64B11vK9pZ8=

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

