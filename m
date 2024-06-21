Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3A12EBE1
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976028; cv=none; b=gFU4IUlA/auIpXLLCJf896hU5qWTr/5aj+rtKOnpWHuwIMjjGn0BrXY+5gJP9pXNgLn6K2vBMXH82EcvutkLTHAj/seypWgmbRA1IW7p/TI4wtO/Wd03EmO2y6SbA0RqNPLjGP03YkgLFqF+khi/8MlZYtiNQoPXXFobJjpC5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976028; c=relaxed/simple;
	bh=kUWyMmxZtq16GZ98JIccGbbK81BdrmX+wbi8UVQGiEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pwBWPEunDp8aaJZ5qYYhERfcKFB5mz6eRV1whuIx7TkzcQ+cXbnYrJdaKyeT+6Gfv6pqoOvykXdXJGgT6UuhIDNXiMDrWnBwiw0G6WJmCyNmlJ1klTrEYMf5qpF7xfQOISRz06qYArfx797l7w6N2sKkWmdS5Yse+7M8yEYPgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=rxeUwKOZ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="rxeUwKOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976018; x=1719580818; i=wahrenst@gmx.net;
	bh=uX+rS5G3W7Xd5WyDA9MnftLeq1vdmexAme+rSO6wfwE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rxeUwKOZh4pzLRTZP/qZtogoYtZBSc8Qo+FlUSTh7C2wPoV09Osl/bfAWJU6S+9D
	 DO6yEAde+mQLm8k+TRtSK750t1FSDkc+Bu2mMC+hsd/V1QAOMx176C/WUYIwlK6g/
	 gWstfMeOd24f05a45KIF27/Ftbbx9NLqOEaRXHCzukc88uGdMvA9BU5YDV5AvY9w3
	 SVVjrovHuTaRMVAYQe8MAoJZPUYL7wjHTdSarb5mrH0mCVtVj4pFp+0j+q0Lg0Nme
	 6VoIzdoNOm80TKPGgfM18u8x5rCVjrLwvyCrXR2SpwXxiqOmF2vyrldcWwtLRJRY3
	 KdzEqUraDQbEre73Sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw7V-1slQIc3Aln-00jUrn; Fri, 21
 Jun 2024 15:20:17 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 08/10] staging: vchiq_core: Add hex prefix to debugfs output
Date: Fri, 21 Jun 2024 15:19:56 +0200
Message-Id: <20240621131958.98208-9-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:p0q/8XrLSg6nLiqJSnB84xq6GIQIkrtFigmv+1MD52yFxufc7QO
 cudgPhE3IpLZEUsk6T0dGqu6QSU99TmpgLoEkm5QhbaH8RRUrca8gh1qSCj8xM0qg6zkliW
 /KljRDsIgtePA4GdatY7fpVUxHU+SM6XHnzByxu+zdsX6BoGrdEU/iRkJU/9KlhJreu/OG5
 e1pCmfhlzN4VVLaCqplgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bE3w4uPKbg8=;aUeH1NDefhTjPWEh+1pC/szlaI3
 3CTFTX/KzHvxLxORm7tQrIvP1hE19hiNHTD3JoStQsYTXqEUJT9Mcim2eIrzg/j8I+cZqntW4
 h4+l7BD5l2SxG8qPDm8TuoVu19hScResJ2ea4/AV7ZMVeBkfll+5rbXLy4hSkSwyRddPtHFtQ
 YRNx0TKRXdOdJzbLTF9R7lQqYxZAAFAKOpGB1/1ZrM8aVeLul2W6qZytvaKAukqrxqZ3DkGk6
 lHocTwOnQrb7FKBGwC4c4mzEaJ71FcJ1Cq0V6of329OtprDDRoO9hf6VJ07/6/bH3Q1AEFWeq
 ccG8gbHCpwSJBnHkvxIlBR1JRFvoh+SAESPJKU470GsRueIyVqZIIUgmhd1ubNi/vBOWmC9/v
 CsJCHGVlvVq9/Ljc7TQLFvHKR8p02y/K9/drpW+BCD0OtLGneAuPW74E2QBVOZomI76TRmQh9
 PK9m9hrcJp3xQvdiI3kTaWA+Ln4h0Ubhjke4h21mER/Se3W19koaBIc3slnI6VLa0+jUKKWZ2
 JDqOEbvKCcTiUDCDsk1tqi/1x9l5oDVPgCuPabZIbZZCkhye0nfAtekjsveHoh+szq7qcECP9
 aFZPCrf/PSRhsFFq6m8TwJqunsvREuhcnH15aBOvpSKbBM/2VqQMGC9noZB1QT+h/G+Nziq5k
 cLBRIJfBZ26g2CxuyVfsYo6eyj3dGCs24CZ4GTtRhv1lJxgKzKfbBwAAREBZ9QtFDYiZzsy5f
 RpDMtCn8UHc0oD2E+xaM2fhJ3qS3yDo0aQ7W/5uyouR08X6UBTsNoUNHzKnizJSXwcFnmHCH3
 itBOuABdTZnYqftpwoN6549Kw6ReEOKapWZ3q8VEGzgJk=

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

