Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E02017584
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713614061; cv=none; b=gUnzYGGMwl4zgoMWGrR/NP8+1CPJaUNEjJxoG5EYLQp7wWcaYh1dVDpnX/w21wDJFVHXc13dgpfAFUELXi95vHnO7hSAcJdsth9dfeMTd56Aejc2qvAlCEFd5I948QaY21c4SeAP3GpRiZ9jEQTn6ayA45ax01ItXDS/WD58GG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713614061; c=relaxed/simple;
	bh=mz01YWQxIIbxbEoynRgJK/0hKODPm37dH58LbJUfrT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+TkesQMv+vqsLGlVJ5VOHCBwdCuh/YqQmpLPUJimz31fDlgFtJIOA+3sM92xNx5KBorUX1uhIzB53432AKbIaGjXJTCXTrVGo+30sd+aCgUOPuPEwFkIOtFpvo90E9F9vBuvtd1kJNj3rvDm0GJVMA5a7Tz/QKLz8lesm2QoHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cgTyjjHP; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cgTyjjHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713614049; x=1714218849; i=wahrenst@gmx.net;
	bh=koFzLm44dz4nDuoKZ+qXrHUg624FQA2jhb5ki/HL6Wo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cgTyjjHPrUsJo6cECgixcObTD/Rjsg1Jf8b4VnzyR48BjjWYyH1VS3+qIQvqELpW
	 xtwlchUNGoKNJJQ1i1wCWndfYcBF3dxwiu6QBpGIPyURl2JkxwCSQwtHDeHHq86Zk
	 slFwLKCh7yEdCJED3NcfB548GY7DohKMi567YAOHANuIt/ubWsGY4324oxxlImVje
	 XmFGxzrv3WCt8JgxbDzV5+X8gNkt37G6d3WD2LK/39hFiWq2bNV48fhA7UTzx/nmq
	 ADF8i+Wn16K+E7VCP3SCIQPWmZa9VII33kgmEz7HdB/hQdy7DNgJ66vdWoVz4ayT6
	 dq0G5whphOOpVZjOfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK0R-1sobOC1QUT-00rJO6; Sat, 20
 Apr 2024 13:54:09 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/4] staging: vchiq_core: Drop unnecessary blank lines
Date: Sat, 20 Apr 2024 13:53:50 +0200
Message-Id: <20240420115351.27713-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420115351.27713-1-wahrenst@gmx.net>
References: <20240420115351.27713-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uTlXW34JNlZ4mLO6+ajkGBBjOwyvdCMN8b5ub2Sp5sIacnLGRfC
 V/9sclercDEc4kp/UQjsIUj63bHWDFHfYzng4O8BEJyT8SCe0dPfHuNv+cCeqAwKk96DuiD
 EhrGIewtf64kMMd8ABUUFCrY8WLEax5QxR6pC3bFSXkg9l43XOZkNGasPgnF76iZOEFaD8G
 BfrvEdUw687AXWLmoDGBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Woy9xTKfInc=;7NVdj+ErgKk9VttAJp+Ybf7MmUh
 uRVNLiNvEVtTFrEHgIwm8Mh089JSlG9qhoienC56TbllfdskflVPaVBhzmx+yXbAHiHCBNse5
 HQ8lkXoM5Vjq1aqWHzMB0EJQEBttca3M9mhQ0ziLRqCE81Rqxl3Po5uyX0j3NLq5uwyQfI/V2
 S187Agc1TivDTaqlVoLqIip9JsnS9kIhrOQ0rNOSBaVg7nNtCVNmDdmSdutSR43/BpxQUzphA
 nFn7HJ9p+1glYUsFAgjR1jobCEo2D2c5yfKsw/huCNCrVnuPH6gJX5Ql611BpoQrxhfm4lrJu
 lS3bl+tDsM+t/BmnJvG94o5ZTsm3SBDICeSOm5gsPyyxWErXMpc1BF6ZaEAmDmcxIrtzG2u6B
 T/H2PdVHyst9bOg8k7D/2PBRgiVORUnKxVSWhJYcnt641JD8DInXVfaMAuzEZMjKPBTZ2LlnO
 Owq/X85L8jlBnMLEsriNRBU55BovdaKx6NVzFEu2DcfEiC4cS1R/tAARxhV+ed1pdadNTxSiD
 o/o2UWP9Gq00fjKW/zsfkyrVtyMlQQ8rn+yvguFpiFo1VnO5v9m4gus67uA2N2KrGA3SFvxGn
 gTe4sFndAjfbrmdAMMfH9NSJT2WIlypzgYtGmrqhoFDa5eDrFLYrM3juduOFRk4xnmmNcNMgz
 eGH3AvThxNwx3Rya+LbyOMiIwt6W+grpnXQdqSbHkCe05FAp5O/p5QCEy0PFRK9mXoE8JrcT0
 Ws/dfAug1AEWMAzhaGJMOr359U2GFkO5oVJ3/acAlO2clIJL/dq0hlO6rQEsYno47cQ503vaB
 p15v2XUXuKnPU3PBB16vqDreK5eRphLX70uUMkQj7ghKE=

chechpatch.pl noticed

CHECK: Please don't use multiple blank lines

So drop them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 58451ee08abc..ca32902afe06 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1190,7 +1190,6 @@ queue_message_sync(struct vchiq_state *state, struct=
 vchiq_service *service,
 	header->size =3D size;
 	header->msgid =3D msgid;

-
 	svc_fourcc =3D service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');

@@ -1616,7 +1615,6 @@ parse_message(struct vchiq_state *state, struct vchi=
q_header *header)
 		break;
 	}

-
 	svc_fourcc =3D service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');

=2D-
2.34.1

