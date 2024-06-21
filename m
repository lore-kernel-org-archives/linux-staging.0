Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6515575B
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976030; cv=none; b=tSA7sZOyYw71mM+80P30XD3Hl17BVYadoFgLYskqzjCf2wdSvLC7f9d+zACvkKklFmZeYbV2F2F+Fi2dnDCGkYkVLk0tpsQRuBMLOeJewEI2rQmImRFFj5d+/U+x2QeZIZ756y8efz6WCkTarVHMkd9zY10Mq5IND0ii1yWgfOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976030; c=relaxed/simple;
	bh=aHMIaYo31gK5AiGxLDZxj03sCBFWGsMxpvd4Sw7Ouew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fFDBQZL1E4BcocN48dxDLVCdlN5DAcCmOSYfLMBhCNk1H5/uKP2vlongOyyu64Rex8/AjwHC6pMG20D6K6ko2WoxZ0a0FzaFrqAitW/LI5+a9YQAreJH+RdrggKSbas36QDjhAiDS7pLzkVDI4jDe+j7NdQI9q68oH9+9otWhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=U/GxEzIB; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="U/GxEzIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976018; x=1719580818; i=wahrenst@gmx.net;
	bh=Orjc4i7tUyVoi6f4QE0Sy2YxU1o6Nh1ldyLhIzy/dgA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=U/GxEzIB6obsTfL6d3AaH+RAAbwRSyToj/1D1iO4VDG80Cmabjr2ItDq2pIJFnTf
	 twwMLdTVk/sa65I7k8f7c9EQF5hxW3Hb81yYJdjp0FWvfvcouSZ3oSWskOU29PRH8
	 8oTrZaHro7JREi9coxowXU0EC8Totv8ExYWzeXFWyLwfb3nEH7Ygg5iB7xDwEo3C0
	 Dh4EDyoZQGwnNpebl81ONLC+4AnxkL6vO9BHSjaGquzsERmml7J+LpH+9fYuorK9d
	 YboWVl4gwUpPTr5HBaWjZJBjWhNP3CIK0RaArnu/4hNdRFXBVYej+UAHZNqo6hdi2
	 rKWyPvHNsdvGTKQ4YQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnpns-1sjTI01fwI-00poOE; Fri, 21
 Jun 2024 15:20:18 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 10/10] staging: vc04_services: Update testing instructions
Date: Fri, 21 Jun 2024 15:19:58 +0200
Message-Id: <20240621131958.98208-11-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:rjYjr7NVw5bQtEQUG/5CcZ4VqDjorYBCz6M2qSOQ9BGi8bO/fs2
 UBU2/KlaUckGFqM4ssoxAXpdzMJyzeptMgp3wREOWj76WFgJl3hiJd+o7CRvNQOsU4SJl5g
 9o7IgW1Ko9e/sm5XKWpIAwiZccw3agffwBvkKOYjdBD1JQrbFVyHQo5r65S112SJOms3ofk
 n7gyc2Qomq6Pci8Ji8tYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DckBwmdH+G0=;zo1Uy7tXJEVnPY02NV128tYTXaA
 dbQWQ9akiJluDUPBs2mEuKxKY1E01ifoJeDnJYNVrxpbuk2gKBUp3dgSdv9+lbKJBAxlmV8jC
 2zBhw3rej9JPtQROqZQWqIoLXHmMi/2gdH5zVYoxJqaAA5NBsulcOG7go6OsWd7WKfBKuivZk
 +z2z/DyRR6MTV6X9GgaqXyifsDLuKdsvxOf/e3ili8ZKg9tpoTJZ3nJupkSUPV7OM0KR5EoCv
 exUO27xwjSNh60WYKoAqwpt/PLSVsR/A0bs9BKvrcwXSAcMKn6VUx2Mv07BGacx1STh6i4s6g
 09uNB4NA12PYNcEhD0XK0BZBUYrrJ6+K+e0GiQ40uAXot2nZLMzDvVxRHLx7kCSx/WRotWNHG
 HCJWeWkaOjXc2E0eHQ7S2a8O5zlCqnOXzfSUT4jDaJR/SZjeKlFRm+5wd+OfMqj8ECwbJxBa7
 F97iU3CN3vuVKSwVSKMXhHvIYomYBJKGS+GE04FviCgqMB1kGwFIghdS3pizR5vuTvgBz9G+7
 D+jPTQcqHbme1dzibRzzpuidKD/nojJEP/XdpsaRjqeMbSdEeMN45WRFVtALVnbQoEcUhXJeU
 z0puNTUGPMZ9ACgYaIqT3+0pf48x66+4TZkuaTQNZfytabgR6Vjs8X78JrhuxodV4QwqKmWqE
 w8axobpGOQzsQV2wG3RAScYQQMJ3Hysu0wSNDo/YEjfkYzo0yX0X+JpCfcNTv6JbJt3w9VO+R
 g9/E3oYsdF3ZOOJX450ECiNXWYHZft0pcND9dbgTw1UI8p1KPjekoVJtGc/jpuBVnoTs9ZX+L
 aw/EIhqcPIAboplTrQB+7gi42jKMLuUjo+1m2q/ANn6OE=

Since the initial version of the testing instructions a few
things has changed. So consider the latest arm64/defconfig changes
and the new debugfs entry.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../staging/vc04_services/interface/TESTING   | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/TESTING b/drivers/sta=
ging/vc04_services/interface/TESTING
index a6d63efcbcb9..273952dc9d85 100644
=2D-- a/drivers/staging/vc04_services/interface/TESTING
+++ b/drivers/staging/vc04_services/interface/TESTING
@@ -31,7 +31,7 @@ Here are the most common kernel configurations:

  3. BCM2837 target SoC (ARM 64 bit)

-    Use the defconfig as a base and then enable all VCHIQ options.
+    Use the defconfig which has most of the VCHIQ options enabled.

 * Scenarios

@@ -80,3 +80,46 @@ Here are the most common kernel configurations:
    vchi ping (size 0, 100 async, 100 oneway) -> infus
    vchi ping (size 0, 200 async, 0 oneway) -> infus
    ...
+
+ * Debugfs test
+
+   Command: cat /sys/kernel/debug/vchiq/state
+
+   Example output:
+   State 0: CONNECTED
+     tx_pos=3D0x1e8(@43b0acda), rx_pos=3D0x170(@05493af8)
+     Version: 8 (min 3)
+     Stats: ctrl_tx_count=3D7, ctrl_rx_count=3D7, error_count=3D0
+     Slots: 30 available (29 data), 0 recyclable, 0 stalls (0 data)
+     Platform: 2835 (VC master)
+     Local: slots 34-64 tx_pos=3D0x1e8 recycle=3D0x1f
+       Slots claimed:
+       DEBUG: SLOT_HANDLER_COUNT =3D 20(0x14)
+       DEBUG: SLOT_HANDLER_LINE =3D 1937(0x791)
+       DEBUG: PARSE_LINE =3D 1864(0x748)
+       DEBUG: PARSE_HEADER =3D -249155224(0xf1263168)
+       DEBUG: PARSE_MSGID =3D 67362817(0x403e001)
+       DEBUG: AWAIT_COMPLETION_LINE =3D 0(0x0)
+       DEBUG: DEQUEUE_MESSAGE_LINE =3D 0(0x0)
+       DEBUG: SERVICE_CALLBACK_LINE =3D 0(0x0)
+       DEBUG: MSG_QUEUE_FULL_COUNT =3D 0(0x0)
+       DEBUG: COMPLETION_QUEUE_FULL_COUNT =3D 0(0x0)
+     Remote: slots 2-32 tx_pos=3D0x170 recycle=3D0x1f
+       Slots claimed:
+         2: 10/9
+       DEBUG: SLOT_HANDLER_COUNT =3D 20(0x14)
+       DEBUG: SLOT_HANDLER_LINE =3D 1851(0x73b)
+       DEBUG: PARSE_LINE =3D 1827(0x723)
+       DEBUG: PARSE_HEADER =3D -150330912(0xf70a21e0)
+       DEBUG: PARSE_MSGID =3D 67113022(0x400103e)
+       DEBUG: AWAIT_COMPLETION_LINE =3D 0(0x0)
+       DEBUG: DEQUEUE_MESSAGE_LINE =3D 0(0x0)
+       DEBUG: SERVICE_CALLBACK_LINE =3D 0(0x0)
+       DEBUG: MSG_QUEUE_FULL_COUNT =3D 0(0x0)
+       DEBUG: COMPLETION_QUEUE_FULL_COUNT =3D 0(0x0)
+   Service 0: LISTENING (ref 1) 'PEEK little-endian (0x4b454550)' remote =
n/a (msg use 0/3840, slot use 0/15)
+     Bulk: tx_pending=3D0 (size 0), rx_pending=3D0 (size 0)
+     Ctrl: tx_count=3D0, tx_bytes=3D0, rx_count=3D0, rx_bytes=3D0
+     Bulk: tx_count=3D0, tx_bytes=3D0, rx_count=3D0, rx_bytes=3D0
+     0 quota stalls, 0 slot stalls, 0 bulk stalls, 0 aborted, 0 errors
+     instance b511f60b
=2D-
2.34.1

