Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4644D13DDAA
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522173; cv=none; b=Na0n7ToBqVi3rTQHB1AWKkMXK/r74lG/4r1EUSDbOB6wW9xemWnc0qz7Y/lAX7BSldZRbQB1ISv+hr+8u/43IoFSseVAyNgvgX5dtsIaBDoNFyDjxgNbGnr2MNvFfnB2BVNAt51YIM6CH38gS0bxFj3UNZLQY5qBu+lFAb0CMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522173; c=relaxed/simple;
	bh=4Up7z9wFpW/ECL1J/Pa520AKqUNVkkMlclkEyZaEI58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MsL7IyGYB8cxdCHcNGMEKP70V6wwMpqdp78azZvsGTx98/t2nVnylZ+lxxb//wgRBR66ovD3tR3GN+lTY5+P5TD/uN/LRMa+k8Mg2MPFTwdEwskKhcifI+ofGDITFbdfAXNdBdeDk7s8vPiatou6brQ/pPMJM+Dzw6q+JSWb1WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Tyc6zGZ7; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Tyc6zGZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522163; x=1718126963; i=wahrenst@gmx.net;
	bh=Po6U++Q23uoCniRWMppgIdXReURdSThx57a7W7ynEwg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Tyc6zGZ7gGZJwmjMuyuxT07BF5p8ValofyWbSE4QyqjXR3TPO990UGNwM4l4MDoN
	 zihXRDRrFHcud+l0k7nUik4Kze4FO523gXvyrCcypfJbST0U4fpzVFECZZz3IA3dG
	 b76Gn5BY+qgt2e91IoriHTZw+BEgKTOT54Xt5td1rI6aG/QLbdaB2r4IydFKXnkEc
	 zf3GPu+rMxnD4Sz9rSt31kdCCL4Q4qNwyb8v6xVwuCqKVPdsDLjJQ88XnRagQ87Cb
	 5XLYMir5TGh2ZqNG2KAGQL3NH9fWRxXs3xgMOkCubia2UAiLteG2xCQrD8ge5wl51
	 ycuwnzX2N9krTCqiTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1sKLWa2ACh-00AS9e; Tue, 04
 Jun 2024 19:29:23 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 03/11] staging: vchiq_core: Drop non-functional struct members
Date: Tue,  4 Jun 2024 19:28:56 +0200
Message-Id: <20240604172904.61613-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604172904.61613-1-wahrenst@gmx.net>
References: <20240604172904.61613-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RBRK5KPOp3jCpQkYNR79OEei+jfTnwMW9sSLq4MzqYLfzSgybjB
 Ux+7/l3fHz8usH95/5KoPbnEaEVJXCdKocrbmr5g/zzDP9Fj5tVFa4ND/TtMAfiOX1qwZQw
 AU3NKD2/bFl7YzG1i3WHfu6lAqszJZMW9wkZPnOhnim8yhsWmTFX10Tb/0nkTsrImtBIywx
 X8Z0ZP0O95H82EzH57W1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qS8uns1rHAw=;ztcLJ0O2n/ySw1XxGiOD+2BstlO
 WDsW6Gq8E9T/6xTeYm2TPHQT3zzKTfP0NV9f9XMGf1TLmJIRh6VgHRoyaWyhYqItYxW+P5LTX
 LLkvnASOnVlLWmvmey+5rh/mODEy8Yk8kPeEIkGon2O4sdSXO2hfzpb6K9PPpPVvkZHcZ2nlA
 wKdaJclxJOZZTb7k6MR4o6cYWnZ8IFD7cEaFPDioHeNnZRTC8U30r5a8iYmRgUocZOrqylzBb
 kz4hVhOSwGEJnZ75CQWPFoGpdpNB96y1M+Ig93dXSqeP15YUj7PqoZM+fRE76lIVOP7cVgE9J
 65X58VtQDgyWcPgllSBYVF8IvjCuljK4lIJdHUtN8/vxtJSbTZ9wSP//FOScizpHTBvTotCWM
 nV1EaEhizfwEaa751Gf5eRhPDgmlxpVoYJXNGHXSySPa5+qr6aVi5xEbEdtbIS7rDPBWPISaT
 QeU5XfsnvGzTTsHvgxLwCQ2ugHs3BoDzie1R5gb0OsnfVZdJkE7ddLNlBnrkSVM2iCb+Ta7kK
 cxKoo3OcWCdXHRG7yEL3lQeQ8QfvKgr8hwPa8gpMbF5qCrZty9szFZ/4LkHNUDlo7hfBrcWA5
 KxIiLNzliDadhFONov0c+90ObkHj5M8y/MgMHlcDIp5Px9pQJ4F54lw8Nz0H7nSftIengMIkQ
 5uU2sBjGKkxyity7a6rqaMegaf8ORDtbcJIBO71FQEzPwKP32Ne/fejADGrX9nT1Xf9pyEXp7
 pxHYc+CpkydM28SItM80FgU42cg4PkK8vRrjh5f/d+dhAKjQOe9ZnjAvuFdei2mDqOQzGB1ta
 uN88pzlmHD8wyCnP4aiiQlJgZ9MRsd9NpZU9xygJtC9IY=

There are some struct members, which don't have a real
function. So it's safe to drop them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
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

