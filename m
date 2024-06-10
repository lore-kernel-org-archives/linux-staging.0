Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C026B4437C
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053380; cv=none; b=Iusi02qHQa6rgub0ZHazvNnZo4fFYltkgHWX8x8bveiCIov0qxXfMItEun8k94qaqZwLUlusgdzmkAElg7z35IG7a1SkklNl7GfEk3FhDgV4Kad3evIUdwuu5VeiRjJb2gYURDBrUe9FzRrjM4EOWie8BI9l4WQdl3y89btz7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053380; c=relaxed/simple;
	bh=aHMIaYo31gK5AiGxLDZxj03sCBFWGsMxpvd4Sw7Ouew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cmWwfptEYMJh6vM/8+EUW+lS9jPJEeSicLjM6wyqV7gnW39YEntNerd0YQMV6XbBcDJmG+ySmWCm/1CjVzJQKLSMFL780vihKwKmFfmUp5GWKEcxOZfelVzyP9rQxM+D3/OpPHJZUvDresAVavDvxvTllF+WgL+WGL96UmfrnG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=h1HYhK1S; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="h1HYhK1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053364; x=1718658164; i=wahrenst@gmx.net;
	bh=Orjc4i7tUyVoi6f4QE0Sy2YxU1o6Nh1ldyLhIzy/dgA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h1HYhK1StnuyRrhfn2F5rJHBhKN1HNuxIepDhUVYC8M9L1fb/WruDZztqDUYhzp+
	 nnRThcE8q/iFtif7gCrTgCnyczIhhtKaXTRAf3sRe0IqAqoEXCSRxZHkspt5wJ82X
	 mLkJQCPFYsEAWd+srplXKQH9NU1yzDrg5z0NctPbqvL4KjEJ5VahkH4U4NAA/VXwl
	 MS//lf5l0briAE6fK8RTPyveBvlSpoydiCj9CQAjeiuWtrta1RIJqGqHKwWT7zbpB
	 fPSiFcE71t1KLlq6VOKl/Xhn8T3VLDu5JI4DhPiZwkidSkOv/FKLdA+9q6u3ZpK2h
	 wCphLVlzUQKfIZAK+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMofW-1ry0p62O84-00Ykfy; Mon, 10
 Jun 2024 23:02:44 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 10/10] staging: vc04_services: Update testing instructions
Date: Mon, 10 Jun 2024 23:02:20 +0200
Message-Id: <20240610210220.95524-11-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:rLh9H3EhgXg4+LJs9Pw7IOuMco8Uqivr4bgbVHXsEqbanKNWcGb
 AFvvUlWfpC7mx/R/M5Zl4ThuuzSwLYj4Efp3Lz5pw5NPuiNO1Db/iqJ/WDf2MxQr2dvCICr
 O9z7u6FmXyfqNmOeXxYFa37tTlNGU6nEMBup+ViSjCw1mf42ntBNJpafsf8xMKuMzTuzR75
 5dZ0TnFjMIdieo5mVdkdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LXMyQZCt5pY=;hkpM1m+t/1KaaHKHrN5L4ZDSk3u
 po20UBEQWzqnHnYTSenJfGCcca+XV/2g5LCLKD5CHAo+1HZJoww6vppmQphmbvo8hALCwKKbi
 adPjSSDXWFJ66REpuDiuF76/OGjWbw8dJ/vOYUxqEpb2qIEdZ6nVLbQ3vyfiPO7O4FiLil0MW
 3W5rUEKbnUF9SEtjUJQVrDJoOIL01KaWFfeomD5lOCANGj4rP6rkensW58Q+c9xyvY5Lbxbhr
 soj8bcVvxxDq7IskN5N99eqeCTEv4xr3ehWRMOxYYUim/9oAfzOe9VbDfE3vCEhOTGlU9023J
 3226V2r0jewaQpgMTWEGqYuL3VbZKTkjCqVSKhE4aPaI5r6ZbiA5hEzyLtKaPp1yZRk1yKZU/
 /1P/LUX4l0Dek0AdQvI2tk00Sa7NQ6K0OwD8E/mTlYDId7/CW2dWa2tvh4bEd0WFcHdWnstHD
 JUtqL1ANCnRZXlx6CZCXoEMLTh15hvHc9YQQOyUDOXRj8GqckTqY6v7pFr/X14SfNnnSPD0kk
 UAVATK0J48HI1Ld/9IHOXcdWWlSGRLgR17qYr4biysc7gWeaRW3+qrpOECyGQpfH10PIFRVCX
 xR92kI5EbepIJCitpnQN/5Xy2X4Dd7tTh9W/xTpWtg3hXdG9TvjayvV6NbXuDcgRKUyhaPF9V
 YfzmgC9FE1RlTk1udKrCNNoPxOWJgl3T4j/VNcjQWCO/QKL0JXPgc5bLl3uhbhmDuhKXL/AbI
 wHbCsvJz/lfWjgCHoB6X5dQnU4p9ucMTwn7QkUSUkM7M7PUVkWbuFtKg6pyJHvXXX6mvCQAFe
 JmquOXCHirrpxCF3GNiNNunGpXu3dKASCMooNNewmW5is=

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

