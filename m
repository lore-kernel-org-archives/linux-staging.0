Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D20254AEC
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595882; cv=none; b=ZhepTwJ4ullx33dyQVhhhN0JQbPhxWWHwUAXKryk0I6cNv9flu5p/23gXooDlGug44mEMCEcGbXejd3OFU7dZRc+fkGWMz7y1QrZFh0B9da0T6w3SUbjl9Yo5NPeJolTXAcXVsGK/p3gaCkCnC7QRE1idXOgJKGqMQOxPmelx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595882; c=relaxed/simple;
	bh=Cm7GdxTeOxuhXyk1PBGpLlHFdrZRDKiazxI5cqe8vdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbzol/F7WH8jjxTbIXEMNBxnPJon3SPEpoeIUnEIH8iEuxC0xQMAJM+y98r8XhyhmFiFa8QtbHVkVB0UXvckeEj9/RR2KuY+Nj8xzzFoi7f5qArX617Ygp7xokgZ6ZIizXNb2dPkdopf4rsc9OzIsMEwTtHm8D23E8aoP/dMFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ofC8QWtX; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ofC8QWtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752595875; x=1753200675; i=wahrenst@gmx.net;
	bh=lmr+db+yNJmGlXRrWF6J4Fq31vYFOrSCaAl+JQBAHz0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ofC8QWtXGRN54y9ogXnsMii3mvu+ch30VLCl7Jdc1C1HBgMOQPe2urXAXRNtAkTT
	 chGySwmyYNXwu6124gTeX3pyn9APtFEUuNWY21Mvt5ejUa3xS0gaYS+2Sx3xQWlcO
	 KVO4HX1rAP3HJFWN388ndpXdSf8cyQbWdwHYZOa6v+5zoRz+mRK0f148hsuFV8S1L
	 s0XeQrFMduPIHy0gIH1aQK/X4nkpZ7fi4s7ksF1vylNwmMfn77Z6lWNlCp0upqssw
	 8icm/zWBcR8aL6ypS9PfR0/4nof3cBCe8+3Qoaga4ukLPfp9FDST3jtmz0wPSi97x
	 AqWNqO5KacbpP6v+Rw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1v9OZb22ty-00fZtm; Tue, 15
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
Subject: [PATCH V2 2/3] Revert "staging: vchiq_arm: Create keep-alive thread during probe"
Date: Tue, 15 Jul 2025 18:11:07 +0200
Message-Id: <20250715161108.3411-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:wyhi7gqhKVUCGX1TKF7ZLudzmUSg5rrfIA//Zyy5LMWB6MzmrbW
 N9jk1AM466s4Nd21X917Rrv1TRXlegcaguQl5KtpDZCoRYHS4cttSmoS+0kflgDXsYXyykq
 36xXl4iJPi6LC5qRS1V8wrThoOoxY9WyLHLPWh2JS1zz2engJaGl1BbhSMK1SbuaMN/cXvi
 ddpgBMLYdb5TExz7T8vSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9mo/S2K5+AU=;G16x3kAt/7lW5bVHm19SMtpSopS
 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
 ctJC49klEWOG1lIlkhW0HkFPM2

The commit 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread
during probe") introduced a regression for certain configurations,
which doesn't have a VCHIQ user. This results in a unused and hanging
keep-alive thread:

  INFO: task vchiq-keep/0:85 blocked for more than 120 seconds.
        Not tainted 6.12.34-v8-+ #13
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message=
.
  task:vchiq-keep/0    state:D stack:0 pid:85    tgid:85    ppid:2
  Call trace:
   __switch_to+0x188/0x230
   __schedule+0xa54/0xb28
   schedule+0x80/0x120
   schedule_preempt_disabled+0x30/0x50
   kthread+0xd4/0x1a0
   ret_from_fork+0x10/0x20

Fixes: 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread during =
probe")
Reported-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Closes: https://lore.kernel.org/linux-staging/ba35b960-a981-4671-9f7f-060d=
a10feaa1@usp.br/
Cc: <stable@kernel.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 69 ++++++++++---------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index cdf5687ad4f0..6434cbdc1a6e 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -280,6 +280,29 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
 	return 0;
 }
=20
+int
+vchiq_platform_init_state(struct vchiq_state *state)
+{
+	struct vchiq_arm_state *platform_state;
+
+	platform_state =3D devm_kzalloc(state->dev, sizeof(*platform_state), GFP=
_KERNEL);
+	if (!platform_state)
+		return -ENOMEM;
+
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state =3D state;
+
+	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;
+
+	return 0;
+}
+
 static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_=
state *state)
 {
 	return (struct vchiq_arm_state *)state->platform_state;
@@ -988,39 +1011,6 @@ vchiq_keepalive_thread_func(void *v)
 	return 0;
 }
=20
-int
-vchiq_platform_init_state(struct vchiq_state *state)
-{
-	struct vchiq_arm_state *platform_state;
-	char threadname[16];
-
-	platform_state =3D devm_kzalloc(state->dev, sizeof(*platform_state), GFP=
_KERNEL);
-	if (!platform_state)
-		return -ENOMEM;
-
-	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
-		 state->id);
-	platform_state->ka_thread =3D kthread_create(&vchiq_keepalive_thread_fun=
c,
-						   (void *)state, threadname);
-	if (IS_ERR(platform_state->ka_thread)) {
-		dev_err(state->dev, "couldn't create thread %s\n", threadname);
-		return PTR_ERR(platform_state->ka_thread);
-	}
-
-	rwlock_init(&platform_state->susp_res_lock);
-
-	init_completion(&platform_state->ka_evt);
-	atomic_set(&platform_state->ka_use_count, 0);
-	atomic_set(&platform_state->ka_use_ack_count, 0);
-	atomic_set(&platform_state->ka_release_count, 0);
-
-	platform_state->state =3D state;
-
-	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;
-
-	return 0;
-}
-
 int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *servi=
ce,
 		   enum USE_TYPE_E use_type)
@@ -1341,6 +1331,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_=
state *state,
 				       enum vchiq_connstate newstate)
 {
 	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
+	char threadname[16];
=20
 	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
 		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate)=
);
@@ -1355,7 +1346,17 @@ void vchiq_platform_conn_state_changed(struct vchiq=
_state *state,
=20
 	arm_state->first_connect =3D 1;
 	write_unlock_bh(&arm_state->susp_res_lock);
-	wake_up_process(arm_state->ka_thread);
+	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
+		 state->id);
+	arm_state->ka_thread =3D kthread_create(&vchiq_keepalive_thread_func,
+					      (void *)state,
+					      threadname);
+	if (IS_ERR(arm_state->ka_thread)) {
+		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
+			threadname);
+	} else {
+		wake_up_process(arm_state->ka_thread);
+	}
 }
=20
 static const struct of_device_id vchiq_of_match[] =3D {
=2D-=20
2.34.1

