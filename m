Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6CA339A8
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053374; cv=none; b=rVIFMIRwmGs7T2j6tah0ZFpiXKyBbObBkIG3/ZkkvAcJt/Qy6EKiFdOoHA/nw42HktTsXQIcXet4qy4amDjcvmZt1Zg4YoBO6A2MRScg2RQjzCifBtwNvfspLHRrEzkoPio5kBESp9/HDsl0z/EtK7skUGtdKdZZIZ9qGDzKlhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053374; c=relaxed/simple;
	bh=ZvVTcI8Nyn3gWemcp7JQREwVcfOYyj4Im6fa4/CbXkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkyE5TRNK5Tn97bCEVWmhPJr8KKsqbHzEHdfTBthKHxE+6P7T1+DalCs7rIutWOolkvV+eVrcbdMTm1s/mpfV1mncZaaMm97PGGcf/gTG1xC4sWFb5hZJQbA2HlssE0vTZRLDU0mXXPoFQbIeL4duX0D7uwnSPod04W4vCcSqC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ll2J9zVl; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ll2J9zVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053363; x=1718658163; i=wahrenst@gmx.net;
	bh=ar1NLPxF4FZyTBWrDAr+cKjNP/7T4hUOU0PPMGPmEf8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ll2J9zVlZCgGmXbpbtoe9F6RblFGi+/+3G6KfjXkkGz9sRPUydNY63bYjCGLbF6Q
	 fl1dtgF6R9tK0mXOT0JyHZYFk/tL42scsP15Ylg6bgdIv4NXl4kEnsy5AAfCeGhGx
	 cHamhVg6Qy0BlwenHentdjm2Xa8MDkXk9BZbKNGsTqX+vkponVfPeCRrNbVBYV7RL
	 30jnJCDh3mxxexFFc44f6x8iq8XuKrm624MrsioV5PTOWP6VQH0yxgXT4FbclYfzJ
	 3oUMjbPNSs+wrVbRq2+8qNqq/YnHX4fnGczCHGF6aSMeBGSqK+t2iwsxYUfXM95NA
	 Qp7FRW59HIx/79sumQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpNo-1spYwr1eew-00om7o; Mon, 10
 Jun 2024 23:02:43 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 06/10] staging: vchiq_arm: Drop vchiq_arm_init_state
Date: Mon, 10 Jun 2024 23:02:16 +0200
Message-Id: <20240610210220.95524-7-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610210220.95524-1-wahrenst@gmx.net>
References: <20240610210220.95524-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8VtTvGmjyY52zusCmOdbftJqeWV9KvMZBiXUHU9nm5Hp3KM1Kul
 TDjhkJKsftWxyUrsfPv7EZVTcSeldfW6Vmru3uBPCl9xgU75ftccxN9PEWAOhftV+F7rXxg
 T4JeMRRrR6KHY0ianRd1iO9n+7SXBEtGA68Cb2wGgCpLuFEQOzOXlJEWk4BnUgsiH7JoGqy
 e1Gs+FTmZKCpC1KzDDmhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CCDkiY1a3is=;5ad24nRpgTfEV8OFCfuQwi4W5WJ
 JmKk6y+hxhFgL0ihZBGbNmW4640EIdj1PXjE5eQFwHgDN0nWsnQ8RubPntr6s75hwwUbarVU5
 Y0YueQTzETco85MhrtijyRnl6MRbgOA8263phLWVaoi/4ko3FtiIDUiOCEWE85DwB1NDxe8nJ
 qOIxnFGOfgkwyTPDQo17dndJBpuXhKRLhygcwA/JwNTzMl7nyhFcbbKVMnnZEKZYnF9VGhNTK
 eVZI5i04o8E2VwCDhuDyTBdD4tvhE0hXn7d6fO02DCC2M8MSc1AVFVcIKgYE4YR7Gl1GXGxlN
 aeRmcRD4UIe6kqIsmhn+lRmDZM3wUDlbpJA28GWHuNPpcO5oa02q0tywzF1DxNLl03CbGZarq
 IvFQchhVsFWLWXGMsZdae5mpqjl35QK8151/yaSJWUXoISBxz5dNxIoz2IstIyTyoaU19O0mz
 CTGAZhCVKLvgzRT1bjfPbk9mDrDs7+yfMmciQzxC/xlVcEmRR7YusVWuf9TSr8QXoM23Ne7/f
 Bu3cnjbSbgG4W/dk8nVuIquxwO6uarZhw6Sh8yP8srMRvYmFJNEfAtyQuFgc7cQLr8/XaOXcP
 Bl8Azn+YTnChXZLKllEr9m+Gux+tL1tGsT9zrrTC6Z1qps0/S2VE6ZMe1m1QkvSkVijF5aSSG
 jx3ZwHJB1BrO1bk1Saq5NexsU2zeQ41q1CK11BAsfmp9TYLc4YosnnS1qYucuEmWRvfGil0cT
 4kPQKJFJAptqeqeJWKu1nRLsGCxECEwLp0tq4QTd0TVrpggfKytabE/TMKeKQoUdkkuHQd/vO
 VJ5Ox+mrXIt/tMsvqeqK6nBy48CB7lJXOikUF4zuZyEIk=

After removal of struct vchiq_2835_state, the init of vchiq_arm_state
can be simplified by doing it directly within vchiq_platform_init_state.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 27 +++++++------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6ef4cf702c78..0ba52c9d8bc3 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -588,23 +588,6 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
 	return 0;
 }

-static void
-vchiq_arm_init_state(struct vchiq_state *state,
-		     struct vchiq_arm_state *arm_state)
-{
-	if (arm_state) {
-		rwlock_init(&arm_state->susp_res_lock);
-
-		init_completion(&arm_state->ka_evt);
-		atomic_set(&arm_state->ka_use_count, 0);
-		atomic_set(&arm_state->ka_use_ack_count, 0);
-		atomic_set(&arm_state->ka_release_count, 0);
-
-		arm_state->state =3D state;
-		arm_state->first_connect =3D 0;
-	}
-}
-
 int
 vchiq_platform_init_state(struct vchiq_state *state)
 {
@@ -614,7 +597,15 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	if (!platform_state)
 		return -ENOMEM;

-	vchiq_arm_init_state(state, platform_state);
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state =3D state;
+
 	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;

 	return 0;
=2D-
2.34.1

