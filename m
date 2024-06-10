Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DC2339A8
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053376; cv=none; b=nDzpvnl10lQ9LzM1x2UeKNxfvbWoAjpyc0JJ0RYc79ubPUVSB9YVHuW/13IhxbB0HuS/Yngwu7+acGkjTUXm9rhhv62Vk/71jPOr2ccErxBMiT7GM8HT2vBnxQWEyKO9jP8SS4uoL5gK2yTccW65mV9xYnm4bmbePOmRo5+XJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053376; c=relaxed/simple;
	bh=kUWyMmxZtq16GZ98JIccGbbK81BdrmX+wbi8UVQGiEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JJBs88a9JBnI4hetevg32db+BTBtSJu5+qbJ0HBIiToT8s3HGvByJPdMS3RZcQJ+BCdhjO5TTX3S7aiDYFL0xW/iP1sT1hViYUjipDbtMKlR7Yb188tqdA3D/pz/ctIoi2q1Wj3Z34OfVhcjPCt6l/qEGlZdKmV5uf2lRdDtDYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CiMaZlgg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CiMaZlgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053364; x=1718658164; i=wahrenst@gmx.net;
	bh=uX+rS5G3W7Xd5WyDA9MnftLeq1vdmexAme+rSO6wfwE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CiMaZlggEI1ID+F1arwj5TyrGB7YeHeyhxkCW+/91fyAO3RjDsDl5b475vUTGhRQ
	 AMFikK1yFDEIdJA7nfkuvmhYIPs2gfnLruetghxLVCkJ4NNqpkvh2JTFbsB9ahoUg
	 zbvwv+hSb992LJ6N1r3uruFJ2/wA8aldd2tk1ixBMsSxCZwcx/L6N+cRVJte4Q20F
	 4CzhVbDFhzZFjciD/bZecbjTXt98OKCt7ybndP0oAOx47u/mJb/wDGzr51H+loZao
	 pzEDgS5NNPdgmCXPRfURI6tCO8XPzdTeUQpk61O/yQr8QwwEZvbx+iD5F5LjsU5Cu
	 AjmbOfoIVXbJzSIKxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1sthg703dL-00kfO1; Mon, 10
 Jun 2024 23:02:44 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 08/10] staging: vchiq_core: Add hex prefix to debugfs output
Date: Mon, 10 Jun 2024 23:02:18 +0200
Message-Id: <20240610210220.95524-9-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:7B7vRjXXi/8U92n6c0z2aO25TjW1C9858voYxu2gVzM30RHzC20
 Dzk8X3juqyZMCCyvVjdeea5kNbMQOiBfSWP+IAdoaL+Whd37siozPflMYO/W/JFE5rlI/nJ
 y1Qma2UKMRl03cFJqrtP1dOs7bOHgRNet8NECRwrTilnctdULjgukph39Glh6cw0uMLB9oF
 4htsNVA0mdQ9xPuyNHCHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IfE+h6N/QFo=;5gG5hzUNDBciy4YaMOff3u73qzC
 6W/TRDM4CIaqVCvlo3CgOS22lXenRAEstkqGzZr3rde7Y8sjS300XbNitSlblgadBjH3NnP2c
 aTluQzcQlXTjX1BpL3hDXzsxVPCZ4QF4DE7kDE5RgUxHZ4FEUc4QPpWDtpLFXbVkbqYGrSB/H
 REm91n6iqRx/+EPeYqDXnW7K2zWqIWVV71V3W7kYD7ZzQa3VnoSJMBDWFr94gv7+CzzbOp5Z5
 GmDDdxyoOJaZs2+FkMLZW4fiUxNCLsu8/V6GQ4UB/oTUEmnJrtWym8An0LsgJd+g5DvCmLuIg
 MJ1ooDR3/1kwdJYTXMA3dhZAZlKxpbPV3e4xyW6zGYbHp2sX8nF9nSBt+2q48imwm6k88Cwvc
 V5aRECtzrwTQlAFQHW/wXGRP5apmMz+NrG9+jErO9958HyEJCY8YPlB1Sh9TethqR7iPHl0LE
 53JqJKcjMSOqg5Llw3zv8LNUzRD6tS2vLTRdJXexYkcr2WtLMpOZHdosjVh06exMtORi2ezMb
 P057t+2N0tLARA8FbspjyvKlnA1RCHomoPpq1gP1iQQE5J39unH3YaFYhq+E7br4zga/mIe2r
 TtC7bxUtY4QVG8upNz3R7KxCKjKsNZbVc4zt72Pb6j/qj+JyEOCM8c9VxNQZ7Hj+EOuYlYTjV
 0SGjF+kqc2o7hSQi5OcPKq9hrXnd6WIx5cYkWt7HQT3Fn4FqawGfbSkitsjHMLTahPbqEYWJo
 YOwtNvvhrQKRjcMtFZHwlDEq+8u/iMa8qLdCO/FgPX43UrDlC6ApKdmom+hRWJ+XD5rJAZc/h
 vqLXHu85w0/sftVdXROqMHfqQTovWqjJBawdOBndwxr5s=

The number format of VCHIQ debugfs isn't always clear. So let's
add a prefix for all hex values, in order to make things clear.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

