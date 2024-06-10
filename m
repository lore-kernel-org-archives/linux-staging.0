Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9414277
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053377; cv=none; b=CDhjxTVIzPXukaWKAGRy8/fA77qg/qRJrUeZ8rouCIOlxaVwf/9hp5CiBwEfvWkaKBx/boh3uVnW7t50/STPur1FrFZLBYLaqQBsEB8havkCv4+xMjsSWsEKxsaQyL6eBhmLbGIxYSD/mzrllDQXkVzpxgokaR1qaUrMPz0xBfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053377; c=relaxed/simple;
	bh=coHmPvIWbe15vOJe/1A60TJ3PkRTqnWG8P/TYhJDQ9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gwKRCyuzOnRCvPtuB3WAFbq9Rom6ECRw4JwzBrBU7tXI6jlqzsEDro0oTZQT6bVQOdsbDmSOszzF+k7DMVVYnFMIhNZqynDShFkrvhFPP3C+wTb95jthEs6G6Bh4xaNtVdaRKIziSB2M8DMFJ0GJDEnrWvLodlqZpnNC06tp9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=okinB0J6; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="okinB0J6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053362; x=1718658162; i=wahrenst@gmx.net;
	bh=7VFCSssTtDO9xPluI9MgXHm4u5tAO4VmwCyLKgp0fVg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=okinB0J6qTxtzLlAWf6hBGZg6WBLQ8V2aWnnObjLSLoSfafaI4+V7t4679rdpiSr
	 GMrc20M028YLgQqicy4NGG3dPaU53043saTGhm31Qp8Nlkg3zhT/NkGeHboGx6CRI
	 UBKqnDA23eUwCmiVfqOBuLEQGMjTc0YWUmElQJXeOZqyO7Ooz5gfR0XD9eaTpbfft
	 h5UAlcWtf19O7/IG5z7LHgg1y4yD6LgbclyjNAIgzTJJoLn5B2jk78Tv8UUOH0WWb
	 tw9r9nI1TZwUS12OlO1inN7C0mfOLQEJ+SqujSngKGuv1Kc30KzXtylfq4RzsBd2f
	 To+Iu0TzS+ewUxRbzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3He-1sEYA628PQ-000a4c; Mon, 10
 Jun 2024 23:02:42 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 03/10] staging: vchiq_core: Drop non-functional struct members
Date: Mon, 10 Jun 2024 23:02:13 +0200
Message-Id: <20240610210220.95524-4-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:gw7OvOhS4diir/o5m0oPbmDYNpBA4Iajuo+XcZ6xPzqpcZ9EZT5
 p6LyaqMoYHR+oY7VbxzyiXCVL861HOgHHSVqvBTwQ/MoEJZ9+PNdOypJ2UAGsRWaWTx0tRO
 9yA81mhI9gMAbQAijKBvrP+/u7qzYz+WVnzcUcjxHl/9gi6pFIsBKIW78+nUDp1uixphQzB
 uJKV0qfeaxwb/c5imFPow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Spd8uZmX7HQ=;WomSKYpAWGv1dxvXf3x7L4roMBu
 Z4Ynk+Eiw7Pwc5AcIMnvq2hcCdAjjs9VXrsKnxXgwZwHS8CDEOqQ5SGHvH+n0Zjy1yTUhHxmo
 C9JmdfrywZCpB0e0DZEv6TWMznmgK/3z2+ScWW6038euYEDDBgqCdUfO68vQ56qw42SuOD5Md
 oyc6sr0kvZbcWBLGXcb9JptAEQwwuW+wSf8PnP91Q61orTY5YqFZ1/WQwrqX9F2KV+8ocoPp/
 ceYvGBY8xNXFUuzI3pEkIORSUYDwSHFk7TRmRZshOEFnQKbg3ZEa3g7cwNNBvlkS3kfUFNlXK
 F05w9bYNMhYJtekxtcnl7fLmRRephyoM7Uh1b6MrYZrBX/rgZknMl7ohkl9OeJ1EldxPEeKuR
 7O5aLI/lpSDXZvfRBG6GcNymA4g9xqOGqE2Nr0G+A0Vm0kIzYupgjpBTVtB5hQl7w6sa0F8IN
 xp8dqzb72tc00gNqQ8yDnXHklX45wTta0GSXRXMoevGrajWLpujI/UVXVV2zE0JlxBBh1WaQI
 B8ia/1r2vzqa4X0BLAJgFTgO2q/Y6OhfOmMWVxpQ7MCEVzWn2Yj+QEMyJMlewWlWluif70tzM
 RauN9cifSRB3Tj6wqZEXM467H8efXgF0QFr350dfgkpbIZaNITaV66/hVJdRQG2tmo0dOs0sz
 vc/ibTVJDCLzhINN0+kD7bugQ/fm0bsDY1R7csflMHZBCUJEihA9AgOodTt/oY6iFFQfw7obF
 HvXikGeKsy+6sn8zMZE5vZx58aPTil7nSOF3vV6ZY7fLHGsqNtaSSj6MkbZGHT/6UzFeGnRJ4
 7CUzggz98HHFlBqjVVZVzgtbI14VyVN+ElyYQ1O+DEEOg=

There are some struct members, which don't have a real
function. So it's safe to drop them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 2 --
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h    | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index df3af821f218..51cfc366519b 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2163,14 +2163,12 @@ vchiq_init_state(struct vchiq_state *state, struct=
 vchiq_slot_zero *slot_zero, s
 	mutex_init(&state->slot_mutex);
 	mutex_init(&state->recycle_mutex);
 	mutex_init(&state->sync_mutex);
-	mutex_init(&state->bulk_transfer_mutex);

 	spin_lock_init(&state->msg_queue_spinlock);
 	spin_lock_init(&state->bulk_waiter_spinlock);
 	spin_lock_init(&state->quota_spinlock);

 	init_completion(&state->slot_available_event);
-	init_completion(&state->slot_remove_event);
 	init_completion(&state->data_quota_event);

 	state->slot_queue_available =3D 0;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 8af209e34fb2..be20abcfad75 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -347,8 +347,6 @@ struct vchiq_state {

 	struct mutex sync_mutex;

-	struct mutex bulk_transfer_mutex;
-
 	spinlock_t msg_queue_spinlock;

 	spinlock_t bulk_waiter_spinlock;
@@ -393,8 +391,6 @@ struct vchiq_state {
 	/* Signalled when a free slot becomes available. */
 	struct completion slot_available_event;

-	struct completion slot_remove_event;
-
 	/* Signalled when a free data slot becomes available. */
 	struct completion data_quota_event;

=2D-
2.34.1

