Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FAC1C760A
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524628; cv=none; b=UuOJ7MYUEYVrJHV/D0JowAPiRRyiqSfZ7TtSpPqrRPgRdn4dHvCqFh0irRQlu5HpNmWsR4+3HvfB5g2lwZ/i2qwi12yCtipQRl7DsQkDd3zd83b88LIf8pDd6Ic59C+El4v0NFywwyyR+Wgk9V+xPjjCV9MU4cWoq/ngFtZ/LgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524628; c=relaxed/simple;
	bh=7VPmfadHrCMEiEI+S5QOzlxkVfKFBIiAb0a9Od6PYpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gcEKWIlcNY+N4GEkreQPNKMCqraiu1C0mp2VlpBZbMbccF1ts4iw04EyJX7dBCJvmzZWGcu0YjsvZlDOSP6Yic8Zjrl4WjnNAAqOCw0teqHClOvvfaifS/qlYSAkfftt6U9XnYv7YmADL5MzAZTnmHtP4EECDrj2NcagS14C/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=biz3TKPn; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="biz3TKPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524620; x=1742129420; i=wahrenst@gmx.net;
	bh=h7/mEgicejaKA4VrMPZI0e0xkSVHXfl/zPMNtGlu1+o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=biz3TKPnrFbr4v0B8nI1bjcL2Ucg9DsIOi7SuySBUgI2WlHtDnDJoDQirUoaJgs+
	 AA7F8VQbwkHVY3q10XyupSbcmsFJpx8/9Kc+/d/Uhz3mh1ojpZG2qW6ra2NwKlUo7
	 kgJtU9lbRgpTkO7EHZ/4auGDOSUppTHYWr5v/0kmWSTJAunlzRILAHEFQ5HhublpE
	 Q3rZpgzIwk2YHCuTWeMgjZno+Wy4ivZiqHsOHBdcw0xGU+g5JMst0QeUGI0wjHdsJ
	 5T5Ap0jCoYvCQWn8bfj+Bk2rjNzP0tr498gEXNCPBiU6eAhQ58MYVb2CGrCMo8MSU
	 F0J0VLZ+QccNezfreg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1tzopZ1Hn7-00GH4N; Sun, 09
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
Subject: [PATCH 2/5] staging: vchiq_arm: Fix possible NPR of keep-alive thread
Date: Sun,  9 Mar 2025 13:50:11 +0100
Message-Id: <20250309125014.37166-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:WwznDqt6oKXT5S2jrIInUGthm4b8b3T3xCA8v2HsfRauQegO+dH
 UJR9xNK9TSDODWvlF7zEksnZqB/g5CJkXda4ij+b7tTexLA9IyPTARYNPCoJwQXrA1pocvq
 O4WQ4pbkJDl8SZO6N7wyZtlB9IKDl9wMIbZZLtZ8GPV56k3/yvUBq5P6roX3YLxKIb7bExK
 bLHfrZ6p+z2suRqmZZn9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HFKrSyDKaiM=;qaWKqODarzkqXYJgcRjPbZuykZq
 uHaxkI0emexZIU8JhP8qBhmtWj/3OvF8kXUh8T+ja/WsqODaEwLBPk/iJihLWQAYE/chJfgi0
 3bYvCh606au6m1UVmBmIuVTcAF+oEg8GcVIkZh/3bFa2T6IaaartgGlm+NOqRBAZtFro/zPkl
 UZy5UGikEVxLclX0F116aPR4Pqmh2ht//BPOdKXsXisi+1qhj1cn6OGvKST+CjSar9TCVv54i
 ipcMaDJWyVzkOOoylouIh8fxVywB5mbxk8n5D4HPHpkKQlMO+8xtryeTwyLCfiXc2ntwle+1T
 mAToBNKwEPUobSTQ+rKV6SosuOGyBgi2uUrTnar+POgOqQGVDZVyNkdWjwxs6OXzch5uH8qOf
 TPZs3zgjWZxr1jyNGjjsLs8/CgkWvB25RF0vmlBDVyxhbfqtYtx9uGGf6/xian1fwBPpyr7Sv
 9SqwokTvtNGUKdm5eeUqnQMbPTu+xMQvA8rzwRp0QONdLAx1iXDoacN1b7d300ZbpcNlIdCJr
 QL8CSNMXxtwH6fyr+IsbP2hoE6Sjz/yzVGPhh8o9fGiQswix4nk6lXVcbIEhb2WAXMDiC+grk
 OZlL6w1dDAytuf1s0Ap5lGJ+jaVezjoX5nWqe7X/4zBsWWwJT0QA+FP8dwUwaeNT0Pc5+SDO7
 AQmOfnjBvAju8UDnfZSXKt8ll7PwXIAL84H+yozVQpxNJzmfQ7AJQbGDo/bn0tlU7x5OuLj/T
 R4LMDB3OvtFRDrMz/2s0PyUUEtOa38/6Z9eKOvG9ziH5vTLaZny3Z5dgEXz/rChtZt3qGSoHq
 rz9EEkwVt3EJCjN0c5XcUV8RVtjRM9pQPXGpiSPb3tsspcx6Ew2bI4sXq7kQPKtKOAneMkORl
 MpXTVBIVyLZodntwcGkZnufSwrjnJEVqHftLeqfbL2KHgICMgrmm78P6whqqvxeb8KnlMyYab
 QfGz0rLDkUCZwWIyoNTZeSDDOkSSFDfps2Vyq83VKe7fWY/E8n+pIL8CLCm85B5PYvDe5F/Pb
 lI2dKbQszFttX3ftt1TtbrVZNz5OaWhztOfJzRg86pdWHk4LNqDuqBBUqhsciYcvHj/AZkcgO
 /0rNgi4fc0KAc/pDclT35sAhIf5/2nS+1l8ex85X27cBfLLSTGgIAcPwL92i4ZGL3V0eCKz0U
 gJ2ZZpsQ+X5NKbJ5PFuFB3gLbd7dcEnqHY4sewSqdJrjzFaCDKYQPURrM38pHlY9sPwUnNhuK
 fN3YpIdLTfai4MptOmCewlc+ta3sbwRyAXL3EDzuhm+T6jPicObRs5l9GHcEytlVGtRc9xUcX
 rmpVezJdKEaKT9giF3ucVFwoddqJWvKLuKfXGX8/7Bp5UhfCYMmGlwcmsLr0DEzNzY2rG/uHz
 7vIycBk/QgSmdkliaaG5Mgk1jyfGs9Y+604JZfCq/L+IacUokDfb6OczMc

In case vchiq_platform_conn_state_changed() is never called or fails befor=
e
driver removal, ka_thread won't be a valid pointer to a task_struct. So
do the necessary checks before calling kthread_stop to avoid a crash.

Fixes: 863a756aaf49 ("staging: vc04_services: vchiq_core: Stop kthreads on=
 vchiq module unload")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e2e80e90b555..d3b7d1227d7d 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1422,7 +1422,8 @@ static void vchiq_remove(struct platform_device *pde=
v)
 	kthread_stop(mgmt->state.slot_handler_thread);

 	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
-	kthread_stop(arm_state->ka_thread);
+	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
+		kthread_stop(arm_state->ka_thread);
 }

 static struct platform_driver vchiq_driver =3D {
=2D-
2.34.1

