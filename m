Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482F149C77
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522176; cv=none; b=P3bmLfQIFZY4way9MeqTY50krrh0Gi7KrAmw2kM9RxzDqu8iCGAj07E85zj6BRuCEwWZmbtx17D8SxcLMFxlZYtLq8V6sAgXliovAXMFvmnNOqTV7JitJr4zi3BmmzNq3bJgs62fFvsTc8tLd1BJ+1AYVN6AOmod/Y1T5HXs+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522176; c=relaxed/simple;
	bh=aHMIaYo31gK5AiGxLDZxj03sCBFWGsMxpvd4Sw7Ouew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQDAEc7NoGIkCKXCE6XNQz3z4riBFQ5kyTaBQU767ixvOYpsmtg5hzGHJPIxKg1lp5v2Km+5oTDBtccapJg2gqoAeUd0ov50rj9oHb8kZSKBUXQ8xxdtyZ4bDQpkE0n8RPgVowY4WWqtF9DhGvNpgeOLJW98jEd1yw7ESSWl5t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=TwgjAnc8; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="TwgjAnc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522166; x=1718126966; i=wahrenst@gmx.net;
	bh=Orjc4i7tUyVoi6f4QE0Sy2YxU1o6Nh1ldyLhIzy/dgA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TwgjAnc8pkUecVJ9tRD5OnI/1PwyqCQ39Y0vlMcOLhfDApcfI1DApHU0jjeoH46n
	 SWPDQbXSricJoerZL3uHZwC5Zg2+KjmuAaR7qimdMlKRdocQRzF4haTOYPff//zvu
	 Cdhy7djidtmLcteIWU0ZVR4fbc0ETVHP+6zfaqOGqZU03nyVl09EqaAafrC5qJp4k
	 XSlt9qXBABWA3eZMhNUTgoIdQtM9EuVViuvmVVmzBHqOZPu1uZqZiYFIRJa7XQg7g
	 BJqUL8/5jr1lWbJ39mXmZPQPj4n4hkI1kJDlLYW7j2op596qyVWlq/L2fw/ZJAT3U
	 Xpae86IoyJvRFfFQBw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V4J-1sauPB1FNf-010Lsw; Tue, 04
 Jun 2024 19:29:26 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 11/11] staging: vc04_services: Update testing instructions
Date: Tue,  4 Jun 2024 19:29:04 +0200
Message-Id: <20240604172904.61613-12-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:pUnMKi9W2INB338VLSco5r6Wqsgef9MJOtdssMqJtXuvPTxV+Al
 pNRzI8zwanmUd+hcg3JxX4Bu5fz6fvp+hoqUOv1Xt/C7nRRCc5k/r7JkLQuDp1faEERT++c
 azb95ihYqX9bnNs0RupkHkQhvdDbpsPyhJ6dCDViAvQYuiGWxk1GkW8nsCVfyc/5qwALiFF
 XYle2LSvBALcTaYxaXXcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2BOfyW5LTAE=;0b5RAqeV4D3ufbyzMtCfCtyGw0v
 sC2ufG7eMT+6dl0sWkvO8B7D88yuhji+IRwHPlNoqcy1vr58vKp103VyI7W+3aBflYjxp7lvr
 +jg2gQYT1vm4Nef2aSWD1owpp6mXftU7tmYSOokFNZgR5i2OVofytC9Oh6+fqEh0xTyiRBcVx
 5Mn+P0KxUedM9hKhpuliD7JpJSwMIWjOcgXt5PsHZ88Ky/kQk2KUuFrq5QfIQ/kb7RptrTviT
 0OnsPCauIM7qCBNWRC9PVbUcikLyPCzq1xPdYi8hy09ipdWCHYqoTglewis/pSW+qX+tT3UVx
 LziSNPgs+xNHwB/DwKL1PCg65YnnQmhRYObHCKe+mRt5zwZJfEy69nHE5GRroU+7EtzQZO2BU
 gZ68i5G6QE6wbmEtxb8FnSm+PPjh+zs9AhU6lMGcOt28XNrQSdWbeFLV3nCX0KR5RL+WecxXK
 dXU2rdG5hn6stQ1prf1CON0Vv3BkRpSgfOhGDTl6LJWvRr8vAWnTnUxdktjbxeK9e/fn6nYeo
 h030Hy9UE8d9wfqJ9Qu5WDmILjhFz/R7RNyIHYghIyLFra37afQLo4I/kePA7TCwag3/6tTcI
 00bJ3ENcnmORRSuKIS1cCnRQ6pSjPWKKin7FcXcqbchMKoP/ZE9WYgh5gv8b34XN1wmsYLtyX
 8FxTHlaahpyh0UwNpVFdqpzzaao4MHZB0VcpE4n9ST1l7QZXX6k3XF3rEbe0HW6hd1UWFfmsl
 nxjluxxpFjfUj7G/2mAFvEddex6ED46nlgoASlYkztlHH6gmHtGlTMyLYN4t7oYAf1kIrDnLc
 djdG0/vRScLGDze2OxuZZZRWVxmEHOxPtJQiOmXxR8VEc=

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

