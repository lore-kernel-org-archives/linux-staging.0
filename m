Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA51ADC97
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524627; cv=none; b=Is5xt5qitItRzDkUHFRQnwTpk19tM+IBtFNeNNQwhPMqw/64WiMbfi/3imTAQcSM55nNt1TEa8HUPwUzRikgY+9MrG6VxXQqO6HyzdI3NjPJCf6hJI60PLKFnHzfDvZWQ3ER+LBM8Zpkd/gui18sJX8seeKHYcZa+4AXDxJ7/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524627; c=relaxed/simple;
	bh=8PhEzUe+8K5VzhNrKeH8MrhIerWJKLS0ypKZ0tqIyz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VNaBXKjxxNqeRN5zhwyDfkDTl7x1zRb4T8NJ5zeCVJf1MDCBVheXJqduQNQTCTK8ma2DBADouf/a7Pj8msC2J1zHjw7O2E0KYVRUyM+5/iBNh40C72qbO/cEJzUOt7Pl2PHooJgUEw87cmd1/gnNGoqfxmXH/KYKambgdf2ysg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ZGNdHz/A; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZGNdHz/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524622; x=1742129422; i=wahrenst@gmx.net;
	bh=WvaaM+FLfRS5VdXZOdeYPQhThs+XUaNWcJ7xxiUyZ/I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZGNdHz/AdHGyY/T6hT3mwiEI3F/x/JKITS7Fwun8wxisa+nbb46F7dXa54qyVqS9
	 2n131KuQXCEaomBcn1j2b5xQ54Ns8s6A1wvNnNfK9m5OG0jwdou9P/l4AUM1QM4Sl
	 qo9fUCLgKaoQBkaQoSksEysfhoqK6TOc6kf9tHd/niBtyYDFtl2SIjSxbujer/VGO
	 +Pfz0jHR8nbKh3Caf3hf70t5ptpWPHIvIk4L4CYD8IyviKODDLozS/9aAg4nQsFm9
	 1HejfJ7iL9eZXzJDDLKNMcYZeBm4FnSNEiTjlWaeNlbT5QYaO/Vic+C7yqW7YxWWs
	 /FA2GodNj6Yh/2+40A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1tuZUv3Lee-003sTW; Sun, 09
 Mar 2025 13:50:21 +0100
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
Subject: [PATCH 5/5] staging: vchiq_arm: Improve initial VCHIQ connect
Date: Sun,  9 Mar 2025 13:50:14 +0100
Message-Id: <20250309125014.37166-6-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:FgPEJhdrmJRi1lxTwbDo6Nx83ecah4hheEEdvqCuiVj1Iv8qP3o
 zsNShoAbsn8tKrgggRNb//GVkxulhUdPibR3mAG7u8J+oHtengY24aUebJq69xP81DGxByn
 sydioE/U+XFKSSyfUu0tlNaFkqCuzEQki7TB543iI9z5RFghEcPazWQvLKFxZB43jtzhBIx
 a1lTT4XLbbmsjap2SD9EQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WdGkj7iZjhE=;3ow2XZSaaC3rj/W0dHKeCFfqb8s
 OzQoi1XS0hWvL/BoqfB1EKzRsOdB397NcCsFdxPgsaC0SUhDlQnNGzPXhf6sIj4ssfeW/i8u2
 VrHYFo2X2zuJwpsmU4d1/BN9yBCW2RQB5eIRn8SWmhmeBo0yiT6sU5mNt6M4WjSZ8q1WQnzRK
 DlHw6uLkJ+gLPaqdgdt7UDLbZmKH/cZX7XYLojGZoC7jYAxCkAjDfrsIEN/wiHeWt9hraniGS
 CGBaRYheNYXUx4QOp28PDvDY2kmZCWhomVdGCdJySU9q7rGZF4MV+eTbJvEEig0EV3tp5vRjT
 TS1BEwmSmVfx3bs4euA0jNvgTt4av51OLnrpyuFzuhFEbbEn2IN33ELzvW9CRMcilnuHlWMBJ
 DZIqzg3SWwbxxyDDGVEvwsxFFD7EWd/XirywlMUYWInwzjsEYGF8viT4LoEDYCrDXjbESeZ3u
 MIFnAKgXJQrIUAfIiv4qXDwhCa6RoUMsbLqdFbolsDFX+AuqqimzfIa/Wc+6QAR5j82ue9NGa
 KDvq6YvsRbuyeanjmeua0lujLvEZK7Xv9QcoXGozfTDbvSZwcQ+pO49uP5IqFi7HTuZw/vMnD
 097sWbWUHwWj2qcVxKoIM/6Dac0D9IxxmwQKxh9WyRsXgA5ALSVMJb9Xh0aN7x31HPVFvqfHv
 TIJ6lubE4/FIEI61cyTMRg7MCnGtPLkev3nqGz1V+W9hELhV+CHIcLW7zayOkljxugecckFjF
 5AKoAu6pfnYz8tWfr9swL0RMyFj50OwXVZ9iribCdh5lFWpAK8DJjiLi7cGxshrADkQHiApZR
 nXb9uZMUzJG/Y3MHExPsSafXbVIMKJ7p1chsyEYSX4olJcFZuZRztKrlbZz5y+O0OJDQrrXlJ
 dGyKpneled7fj77R5OpR1B62Fpjl1Z1EdschWUnD89f3xdaEK3ltPQ7HuFleitspFcwMXutEn
 MEjQLHz+Av402b0fqSVkQYEenphvOeiLm6xC/SiABJ9UxfaMskHWvdINHD/tBGlofpxwjX1+2
 JZslZ7VhFbi4TY/0YR29EfyUUFpjlVT3lz9jL/jOmnwbLUHFpuNgTzOYNmk9YVQN0NUpHHMr5
 x5lYQHm9NGOpvWVrr7vBmyDBQS+OhwkYYCvoo7wWSqv9InrSXC/+mbRS4015wT2kKuzPJjdHF
 CquV4H+VRd5mDaizC1FV5OavEU3/7Rt9xllXXdynmoGyMDYgBJt9M1tAjWM04I+fy+SELN+uG
 1jircSoRpA5v5TzcpzfDiEyReM8hod6nMQab+sJBa7A4ePHJeXWxblovrQNTXbcoses1s5IkY
 1lP2yhQEPIUy8uUHfXowk6fZ2t2jDW5zs5ZzqT1pCi+cxSxKbMWJbQaQY0hUxAIsEKw+WQXt+
 XcuUdnJ34yBtW/TlrvB2y6oK/LG2EpziBnUBZWFS2E8DIdRCl/k+rUuERp

The code to start the keep-alive thread on initial VCHIQ connect
within vchiq_platform_conn_state_changed is unnecessary complex.
Move the keep-alive thread wake-up into a separate function and call it
during VCHIQ connect.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 28 +++++--------------
 .../interface/vchiq_arm/vchiq_core.c          |  1 +
 .../interface/vchiq_arm/vchiq_core.h          |  2 ++
 3 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 64f9536f1232..be0c2bf9561a 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -97,13 +97,6 @@ struct vchiq_arm_state {
 	 * tracked separately with the state.
 	 */
 	int peer_use_count;
-
-	/*
-	 * Flag to indicate that the first vchiq connect has made it through.
-	 * This means that both sides should be fully ready, and we should
-	 * be able to suspend after this point.
-	 */
-	int first_connect;
 };

 static int
@@ -1336,26 +1329,19 @@ vchiq_check_service(struct vchiq_service *service)
 	return ret;
 }

+void vchiq_platform_connected(struct vchiq_state *state)
+{
+	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
+
+	wake_up_process(arm_state->ka_thread);
+}
+
 void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 				       enum vchiq_connstate oldstate,
 				       enum vchiq_connstate newstate)
 {
-	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
-
 	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
 		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate)=
);
-	if (state->conn_state !=3D VCHIQ_CONNSTATE_CONNECTED)
-		return;
-
-	write_lock_bh(&arm_state->susp_res_lock);
-	if (arm_state->first_connect) {
-		write_unlock_bh(&arm_state->susp_res_lock);
-		return;
-	}
-
-	arm_state->first_connect =3D 1;
-	write_unlock_bh(&arm_state->susp_res_lock);
-	wake_up_process(arm_state->ka_thread);
 }

 static const struct of_device_id vchiq_of_match[] =3D {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8d5795db4f39..5e38609aad06 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3343,6 +3343,7 @@ vchiq_connect_internal(struct vchiq_state *state, st=
ruct vchiq_instance *instanc
 			return -EAGAIN;

 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
+		vchiq_platform_connected(state);
 		complete(&state->connect);
 	}

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 9b4e766990a4..3b5c0618e567 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -575,6 +575,8 @@ int vchiq_send_remote_use(struct vchiq_state *state);

 int vchiq_send_remote_use_active(struct vchiq_state *state);

+void vchiq_platform_connected(struct vchiq_state *state);
+
 void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 				       enum vchiq_connstate oldstate,
 				  enum vchiq_connstate newstate);
=2D-
2.34.1

