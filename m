Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7F14388D
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522174; cv=none; b=VSUkVeTXMLPyhPFBK0AX6yQYKkrbX8tAiwTQtPvUQ0w0B94JQcmYGw+NE9oppxLsJxDVQfbMcVvS411y2WuMbOIX0KhawEOvy2bVMWCur7GjMCWLhsuA2+ePYndEj0iBNCox+Ql+LcNZxSMhOT1ok0g5iGafPNMtDhE4HQ/1GgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522174; c=relaxed/simple;
	bh=7MazP8t4rqjiFGpwOsPtztB8DNdLqxS31CEKVwHb9as=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CwQF8HuMBFv0oNwmvLyVytMWvnSJjFlSbOzUQUozzk37jlmkrhYlrF+87Eg1iXtE58MTtCQsEIXTSaomSAXslSLV7XVPNbA4ODaigRiwj3L8BG5VpHDv7HIH32PTAWFMd7Kf4XZV0BGar58ZHDTLwhml5K8B+8qi783FtLXywWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=e304O/JE; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="e304O/JE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522164; x=1718126964; i=wahrenst@gmx.net;
	bh=tyanfsDOlygVC8ytJoEWfA17D5viEBrkrpVolUIqD/I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e304O/JE5fkMJCB1X9twnioubyZRwY3Vv3XfLexluOM5JaLOrP4oKvX0KLgYhW58
	 zncofC2y45kp26V3gu9VCqszJ5TyLhYbc/zK4CFGQZK0b6VQzfBgdbUSGMXd0p6b/
	 tEoRrBpUHSYVdgg95Q35wZeNfUyJ23Dqx4OA7xzY61/HpOFZV4WbchhgsCE8p8oUx
	 7o4FtdWdW35EBTUaZCydDNAAjJ8VyTO7SzjW+LCp6S/bwDPxUCz6KUlhj+IQLiM0h
	 /N3/0gcusbaYI1KnI5WnBIzwkbmfznbLRer8ohTLQpS+C9uKdthvc0Ios0WBBRhCz
	 Rlmq8bh8mnMbW8Qdhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRMi-1s2Oro26UW-00QkDZ; Tue, 04
 Jun 2024 19:29:24 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 06/11] staging: vchiq_arm: Drop vchiq_arm_init_state
Date: Tue,  4 Jun 2024 19:28:59 +0200
Message-Id: <20240604172904.61613-7-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:OmtYHr0D8SmeXLdSboNtmBRM8p36xwQ1R/nIEraYr99BGkiQuyu
 vnFhjiqw5XN4/b0q1xOYlt9ef8000kXKqdhY8u14HNqffFClSfij0E/nnfyT9MhhfJSLsxA
 M9n5DPf8kumeVpgBhGWA0lPzlLmwlJQllgXrRwHcrVgwQeeOxZ3eITmu7qNJhTK5+Kj1pVN
 hEJIGWwgLJ1rRBYJXk6wA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fr3SCDPs9KA=;AotGbbAvX321wlgbXRo8/+EWMql
 oqD8fRViNzRI+VbLNPsB9VO/GFr/bNosf/8qr4VrPwstFeCjAh772ta5Ww4bcsnkTa02dK4rh
 boukJg3KCtJr9yPpxxocN519pFkGpWtPHb48OAuJC0v5Gtf7uLaE2xEGBv1ybHr2DRGDRhHmM
 hvrpjuULn3OfbzrFJsoy9N3BG4UFp8Me21mwyNgpHQWbYaNVZA0UfkkmaY2z8fiRme9dFhSeh
 fm9vTl6kNlAd9tcOYoDQAFS/kU0ersHVRsWCSY6SV6kqLSQtys7+P+rcKBY0E6ihZroR8Q3es
 yyRdMcU/m/fQqk5puWorWFe7HE3Jz//d0G45/S93uIMSyKz9QcJsJCGzJhLEnc8GC1IBTY0ip
 rYLOPX+48mQqglYdMw58evD8LTiYsSAAtwbnqJ3t3fi58BQt7LRYL3UD82Nun6v6snJ+rSQRR
 /8GVhT4J7+XPAiwkW8FXWhNDP+mBRXHxLa4AATr3jwAVrb63+dJpaSkrW2lUsCVWGKIIe7HTH
 E7j2WM01ZDVgZGRJuboWKYJ6HrG/M1hCbIP4oF+h48QzIJiRsDZcZpIfItYRkkwiG6Qkhpkbt
 A23cZkajrx1J/L4mk6W7sA/iccbz/W3ufMkQtdWLS7vnDhsVYfagzrb+v5PBmy14dkZ33KGk0
 VPqJO19T75h4gK7xnEanRVl9XrPkGqw/mBsU6q/kuPhBcTUusIOy5gPBm5Xas5Wq9d3ly4H0O
 nIVEj3h/oSkeVizG/AenNgFRVynTr3XHlK3wAPGYjYtE7ZGMay3McQRnVIqUPCl0NXzTiP5pV
 r+WLNbROpbFmpxxh2BnHOW1KenBiTKMcX48Wxh2paKtwo=

After removal of struct vchiq_2835_state, the init of vchiq_arm_state
can be simplified by doing it directly within vchiq_platform_init_state.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 27 +++++++------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 98a0b2d52af5..45acca670bbd 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -588,23 +588,6 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
 	return 0;
 }

-static void
-vchiq_arm_init_state(struct vchiq_state *state,
-		     struct vchiq_arm_state *arm_state)
-{
-	if (arm_state) {
-		rwlock_init(&arm_state->susp_res_lock);
-
-		init_completion(&arm_state->ka_evt);
-		atomic_set(&arm_state->ka_use_count, 0);
-		atomic_set(&arm_state->ka_use_ack_count, 0);
-		atomic_set(&arm_state->ka_release_count, 0);
-
-		arm_state->state =3D state;
-		arm_state->first_connect =3D 0;
-	}
-}
-
 int
 vchiq_platform_init_state(struct vchiq_state *state)
 {
@@ -614,7 +597,15 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	if (!platform_state)
 		return -ENOMEM;

-	vchiq_arm_init_state(state, platform_state);
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state =3D state;
+
 	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;

 	return 0;
=2D-
2.34.1

