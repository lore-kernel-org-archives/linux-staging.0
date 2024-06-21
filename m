Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6E22094
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976029; cv=none; b=pKyvhehBQYn2HWE3ovXVj/SMHRLC4KrE/QRePsUTsKZUYv04g9QoWLG/7Y0Mx1qwJn+fAw9ynVFFCmSl1B8lV/Qwx6fFhop8Jnok27NJJ0fue8qIp6C4Pi/F4/qSHyRQTkOFome0BswZHQWuFS4p9HP24Kv04UXemLK4rpGYc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976029; c=relaxed/simple;
	bh=wQlr7451K/jL1+fHv7Gtue7AMVFVmxXt3DzDAObQr7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFKHzrKJ5TbXQC/bgJMstUkTz3NamHjsm4/VhrmC0dkXgWrAAd2ZQ4e56nEDe5Meey2UH9dllNm9k8gvPmIzn71+Xzbng3ayzuuJurI2nX6LYo88WWNVxiHSw91JKrTtA55kyQcRSN1ICMXApBHV7T1IZB9vWd9yreGm8WPvCDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=kYH9KBMG; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kYH9KBMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976016; x=1719580816; i=wahrenst@gmx.net;
	bh=ZXwrWBf/rp62OYEuRIGYrUMITYO0P9PC4nNEExUdWpc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kYH9KBMGG1UxIjV4aFjsEVqfOKzYb+yC57LMqymgbDamJL69ovIPiyK9tkATK52p
	 s6wZQrOoQXHD9Ew61cK7krqD4UeUCz5cWWTHjIL5sqAWLEBfppSw0nBeWX6FyB7Zv
	 KvskyDFi8qFy1X+39Jdc79ZimOHna0MWu+ZpmgcSrxF+LjhABm8C86Fot9P9VpjPf
	 LwnjAviGTyNL3B58NtSZMSBHx9e1/HHPNRSHHpMVbBmu9VDaCAElo7jX9QwuzkdJE
	 6LiYDuz9o7GbeLcjDDZ8Y8XkI3gqPq1C80gZUVOUpb13N0hPlthfcuRIdCKEAsbf8
	 gANl7OLM57EyLa1RrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1sRnuk1AvC-017LH4; Fri, 21
 Jun 2024 15:20:16 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 03/10] staging: vchiq_core: Drop non-functional struct members
Date: Fri, 21 Jun 2024 15:19:51 +0200
Message-Id: <20240621131958.98208-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621131958.98208-1-wahrenst@gmx.net>
References: <20240621131958.98208-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A4erY3WkkQxBrH9sLfavlJbsf+n1s7dr9APBk2FJNUhZAJ2Rfyw
 6WxAjbU1+m+41ISlZsdIZV+jgwAU1oX409qdr4PtrTtkZXdad6Yb7VUAuT3925pNyVQenNs
 1Yv+/QgiRAMin+bCOkTzyVp7KDiPV1SFEfTid4m2rmxkGEvoKoFLjrVNsDwWbXwylp80ot/
 k+rM8U1Bgu5q9tNLFiDLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oyyimTcx9/U=;GywLyvU5Lc/o1y29x5NRqMZqlPp
 ghMI9raogF60qmERq+hLhg0+pViy2CKfRAnYck3MgqiOz1vbucsj++oBA9E8wPHusPNUGmI1r
 qRWBiVvJ/5xDnoZKAp1xUCYzQYovLJew4BE/REOOt7XdoNMrnWIhoavFNMPABXVdeJR8YGGpv
 oDcZWWLMKfoNYjmmLhKJJ6FnfEkkgiWJv2J95w2RfgxDM9Yt/IMzgKsfaz54RbZeFSLZxlG7R
 +sIWETGjplhhd2pCWi7k4nIH1vnTuogPvEJzZHPtFmwQPg38S/TMHsLmzWoRJRXc8wTDvdMlm
 iKydD9g4lEbV+ENvi9eUa9xWhHgvXHaVLPuEIts1DwbmQurV1Nh3ghIycnvG2iDzR2U8B/02F
 /Q+4Ng+cO7jcRintKVbPQgTZPgjVnOQPE/780xpLsi89IBS6cCD/z//haEvpE4SFIiNkAuj7U
 St8KCffojBqcX9taktDjrETO4ZLxZyAdDjmZSKWwpjP//1uR2rS44RqtHRIh3CpsbJMfhEBHn
 4eXJb7S3oKy3kWB9ZC+RnXTk/UaUQUCCJpA3OsI2RSkRXpN0q28GciAn7n8vu6jgInPYRoPxA
 tSWEVIGbP/WofIlv5eduKpIrDIffksTMjuKFjX5Lnqe+uRUXRFI84S+R5u1Gbt6+qcg5F3cJu
 mECZI1FNzBjnz4qFHzRkcnua6/l8ZgogFQZCEhzEbYNlOT2poPjwjrjYDJF9ym5Sj0VwPrqCX
 dpxX3tnyQ8SV86pLIl8Di6ZJk4FGPzywqSWJ2A5SGQ+J0fDF1qmXKODk5pC8699fZT2luoAzd
 u1c7bYiu06jRedDvptdser2T/kSuR2FyvzSoaJrawt7FU=

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
index 382ec08f6a14..aac46e2a3b75 100644
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

