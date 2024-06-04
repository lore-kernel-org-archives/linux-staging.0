Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB314388D
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522176; cv=none; b=l6edxewYb+YVH6mxblso8sG3zzFTXJX29mPfUfpmeuK49dSlqO9tKII/C8Pahxy4dkoqW40IeGoIgHYVcRS1Ku9C4Wbxpvilb8yZqnH5j016QEDEyAsXY9BoC9JNvuneQtSbS7yobg/rCzfEHo0UAEEMVARUK2osVPKItkXk4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522176; c=relaxed/simple;
	bh=mEjCmYV+0yJ3ZzZiGO0slGyIxHBqPgSA+3sYjBWQkKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g9Nd3V/ooWSTVBZFlh5Sgf2roHlwGNag8lShZ+LUqtfTqoKDVlLQC87Z/jHENa4gQ+MM5DUnTli1IUIOMOHqFiQ6u7cc3Kvsxq1xajH4q12UJ/GsJBxcceWRngztje8JNoRYbQw3Iyvj2009QKyOK6S9pGwTAX5SmOIkH11UMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=VQSrxt5U; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="VQSrxt5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522166; x=1718126966; i=wahrenst@gmx.net;
	bh=oLnUhAfIjQvsBXkFU8uP5t4BlhGnaI3fAL0JXEynWLI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VQSrxt5UZeDVUCvvcy3VYT9EdFGXlw/+DuVjx7DJggG6soiMlbPa4Uyc7d2pzmGZ
	 rBmydeCtV5ILIN7V8fjAW2s4rb9yrLRdKmi66Q29DMRrnbbKzNuyJ5bkmGNr5/Juh
	 fevpJ7oQ1Gp+65lByd+UL/T1Vkbqc2jQm2Un3q4zvyLIg25bEzvENuMt73kUW+r9Q
	 wabw0R49CTZIHBjjJswvQ68Rj9tsXwjR4QiY8Vos71wGmIH5QH91tVP0Hg46+9i2g
	 HFTtMs52ja3fpJMVLi+3k3nGEj3oD4oP4CIg6DMAm11jsNsz4otrUJuKcMgpFOa22
	 ma0ECJbaFsghFbLHHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1siwlz43yU-00hvPr; Tue, 04
 Jun 2024 19:29:26 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 10/11] staging: vchiq_core: Add hex prefix to debugfs output
Date: Tue,  4 Jun 2024 19:29:03 +0200
Message-Id: <20240604172904.61613-11-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:SJfo5yqiDek4L5LZBudYlirCSzraVY5mTAlzRWetPA3So0NPwIw
 YIuZDmyUFMfPrBjSIDfGbfdfBfS6LqLuJ5Txp7WsDzIEGe/fkQqeOUVqUzVlMlpnDlBsXQd
 VkhzVIxPfGknyMJyFWf5Oc0aRboqU6i3+EjB+KBtrEltS71IQTguZewhDP4OsyttnxS0JWB
 W0/ox3fp6RBQqwfsXuw+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/rTqJoJHZAA=;CtAQsnvJsb0yML4lLJP+vzKbNZ9
 LSQ6SFLJA2TZOJ/B0EqH0OWFT1MhNDVE7YCeNQTn4916b+wap6KQvQLiJaVkIkFsyQSVwF2Fd
 30rpDmwmF1ys2As4ZVpKheT1A6y/yk8/x8XBEx6GvD9YQTobU6HStCVl1P5uIyWAslzQ7+8DT
 IqSSH10sJxHsgAngBcp0UksdiGbTj83Y52LpH5H9Mr0guhlmYDytu3YfPu0Z2xitpQ4UfiN3Z
 4+/q/IG+97539YDbRgpUzSrz1AcsvpHmdmBVZyyHf5kbxNSsMS0BFhCQrwv8RGdI4OqWBkHk7
 yHy8pydy14DTwP/DeirTbPfUh1+x864l1IJDGW44iszkbN2eEYBW3SjcVH4NOXUGeeFpLWqJp
 We+v3VkwaC6kur5v1j+8zClIYLHu/kplYN3bZQISD3N6xElET+c8RRk+bIa90yUQfmB6jY+ar
 tub+j8rCku2t6IEzoimiw9DQd5gSwIMpDA1Wn7i53RlcFIAQJtHkZ6GNoUdScDjP8MXKkngVE
 0lrJ4yoGi5pbdgkAlpmdMNnSzGlesegZUGSqGsSVfR112nPcqlOBlaHNYvH3F3V1OfyUIVqfQ
 aGs/Z3jM1avx9CQmVtq/pimBFHXj1uO8rRmPCJp2l8SFnitAbbDWPUtBSPio6ti3fvC1J1jtw
 YRchb6i8eFGpU3PzeTHQIBWoaJWtsE3pcMAnvR9Ov+0P6f3NEKtNMgphOly2AQdIyrZIh0ovs
 1bYGt7cy0kaO/j1OYRi5fUclr2dscLipanh9z4ImorznbVVOmGYieOCra9HQgsnYxC4a6T/lq
 gFN5S0vKpKkX70RnoF5tb5c3l8BfcgAFEnY1uXgLBIFBE=

The number format of VCHIQ debugfs isn't always clear. So let's
add a prefix for all hex values, in order to make things clear.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 51cfc366519b..4f65e4021c4d 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3370,7 +3370,7 @@ vchiq_dump_shared_state(struct seq_file *f, struct v=
chiq_state *state,
 	};
 	int i;

-	seq_printf(f, "  %s: slots %d-%d tx_pos=3D%x recycle=3D%x\n",
+	seq_printf(f, "  %s: slots %d-%d tx_pos=3D0x%x recycle=3D0x%x\n",
 		   label, shared->slot_first, shared->slot_last,
 		   shared->tx_pos, shared->slot_queue_recycle);

@@ -3386,7 +3386,7 @@ vchiq_dump_shared_state(struct seq_file *f, struct v=
chiq_state *state,
 	}

 	for (i =3D 1; i < shared->debug[DEBUG_ENTRIES]; i++) {
-		seq_printf(f, "    DEBUG: %s =3D %d(%x)\n",
+		seq_printf(f, "    DEBUG: %s =3D %d(0x%x)\n",
 			   debug_names[i], shared->debug[i], shared->debug[i]);
 	}
 }
@@ -3414,7 +3414,7 @@ vchiq_dump_service_state(struct seq_file *f, struct =
vchiq_service *service)

 			if (service->public_fourcc !=3D VCHIQ_FOURCC_INVALID)
 				scnprintf(remoteport + len2, sizeof(remoteport) - len2,
-					  " (client %x)", service->client_id);
+					  " (client 0x%x)", service->client_id);
 		} else {
 			strscpy(remoteport, "n/a", sizeof(remoteport));
 		}
@@ -3475,7 +3475,7 @@ void vchiq_dump_state(struct seq_file *f, struct vch=
iq_state *state)
 	seq_printf(f, "State %d: %s\n", state->id,
 		   conn_state_names[state->conn_state]);

-	seq_printf(f, "  tx_pos=3D%x(@%pK), rx_pos=3D%x(@%pK)\n",
+	seq_printf(f, "  tx_pos=3D0x%x(@%pK), rx_pos=3D0x%x(@%pK)\n",
 		   state->local->tx_pos,
 		   state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
 		   state->rx_pos,
=2D-
2.34.1

