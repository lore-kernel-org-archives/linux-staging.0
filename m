Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D3014D439
	for <linux-staging@lists.linux.dev>; Thu, 25 Apr 2024 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064369; cv=none; b=t6besgFMe+gYvt6+ixgXdWCaP5s+tdw/NT6ivF6ewfCkcQDtodfmzf8rMz+8vZbWFQeZ+iiiOiG8H3FMZfgxuPLrFA89RzmVo1kXnBmWsMOlgPGb7UHg/zbu5PFXuPXYevWvbmILAo0TVH/6HupHf8XK+IzDf6xyEQm2Ug8pFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064369; c=relaxed/simple;
	bh=0f+6GTUkzZ+F8Sq58FKm96+Gd+AOuzQHCa0B9cveagA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FZKxzHR+90zlB7HJ7L7i+hMr4v19SZz2y30TxX7XSBxGoHrUZ2/tEMxd1htSDkOUkCnTw3LUdQUyZGRKV+jSBfvit114+JLSoxQtJWaMvHRwv1QnaLmw4xei5K4KIihHwTuwCwuNO58gqLbeoEqx4cewPju32wbsYMqo4srdIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=coA+a2cr; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="coA+a2cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714064356; x=1714669156; i=wahrenst@gmx.net;
	bh=CNQeXx88+PWs4m7o5y0Jq0wLFvN1UeH9xseza45YiAE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=coA+a2cr1eeN/EKaUndygwblIprNpeT7DtXjuWdHbGJyVKiEwQnFNkQKJtkbg538
	 CuM39PRB67+9hL7cBPaZf2I+F4LApF8JH9bjKbnIheBD1wCkvyN8AszcPlsVXCfsd
	 gp4jE0yvArpFdLyu4jqaGXOb8Qla54bFA1/XOCh9qJZ8h3IQW1+KeXFLXTCN/PI7l
	 EFQ0D7MafY7yopLTfA+nNc01yF3i2XWxJ2H0MSmzY5Dv78h1Ck8emJXu2HlYQj9W2
	 v5rU0e1IaD3NLRxxTvLUz3gGxxDqVJWISXTFCLFVkfwoEQv742eg6m2tfFO94CC9Q
	 +RTi98l5bZjwupqAoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMobO-1sIoHH3A0q-00IZ7C; Thu, 25
 Apr 2024 18:59:15 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 5/5] staging: vchiq_core: Add missing blank lines
Date: Thu, 25 Apr 2024 18:58:52 +0200
Message-Id: <20240425165852.6681-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425165852.6681-1-wahrenst@gmx.net>
References: <20240425165852.6681-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5ZmdyL0d0n11brCiTDARa/Sl7DKBkm+kiTclKZk6DhVNQzTPHsP
 9WDM42//cGxaQreIHeUX2Ek0Y2tAkHwqU3uOeQgz2fKfRbAgeFDXvqkOL5/6aLzr1kSTbQa
 U8klil03sFNREkm1QqLOljrp/b3c9iY/cXb5PPafHb7tAgKuE5c/1i/i0D7mby9nCxhRHNB
 Ke/g89AMLNrApdWCkBqbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BdrE43XugC8=;gsKDqjA48TcgVEhomlzSkZfp/Xk
 Oq3uf7UZ3G17GWDA4cO9+B32F/cT5s/v1NSXkPngp9dBZfhNFAd4yaDbuYuSilfp4b1/zcGzZ
 O8Gy/GAbTNkhzzV9OPP6tsAcxv/h8RdRg5Y+a05KJbBfxd9wnNN6vd/HgELWRuH84SyzCFEn+
 0izpy4ECxGLzRWjU0dWMsG5B7MnkaukzfqHjRcHGb+zqzTN1c9Rs/esRMHfbLSZ3RSkIv/TgU
 i00xWn7Ch9rzPJRHznz6lOy4SzOXClYsxGYXWJqqcbuC0KczajZDgyoQAFFrq7TCNt4Qzhsig
 SOfh0segilTio4u3VPSKYifu6ieBj1DeNZkILGtweHxhxwKdbHruD9Gm+t8Jo4eO2mHz9R5yk
 q5SN3+i0B4QBc0nsQzygDlLtufqzMIyrWLfeJk4EV2DVjUevRMRru24+pT+t3MRgkgNiszHY9
 5fsZnZROTiPt9moAGOaooNOgDkT6Vn+0FMpLtAoOJB6GO2CEQVD5QRjwpXy/gmUCtba5/bKpn
 5ImiXuC4Rr6ky4tun0nBKGOxvFAnEiCI/+7MQeXNc3SBfjB7KS28adA/Zo2cvBdOBe5wAJb59
 O+QyLU66CvdVGOQBIW8RswKz4olx1erQGkQ1B+gQrmkq400iGfp2oRyINUeewIdwgKUxgU6O1
 vCKFw+Elh8H/T2HQ9qehIdrvc7b2uUTyicKQ2pqbLRlmFOrvaiilydsig3f0puMhRo6MAjTz3
 uHfCL09wS8oZs4vQgMbdr6/Eu5dqKVOqjy67ln6dG+MdMd/c0A0gbIwy5cWCui/euXolGUtTN
 aUCqJYue8vlzmXxNMGL2vZgx8hdC6+SUt0TVzupCxI7po=

checkpatch.pl noticed about missing blank line after 2 declarations.
So add them for better readability.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index ca32902afe06..df3af821f218 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -227,6 +227,7 @@ struct vchiq_service *handle_to_service(struct vchiq_i=
nstance *instance, unsigne

 	return rcu_dereference(instance->state->services[idx]);
 }
+
 struct vchiq_service *
 find_service_by_handle(struct vchiq_instance *instance, unsigned int hand=
le)
 {
@@ -2176,6 +2177,7 @@ vchiq_init_state(struct vchiq_state *state, struct v=
chiq_slot_zero *slot_zero, s

 	for (i =3D 0; i < VCHIQ_MAX_SERVICES; i++) {
 		struct vchiq_service_quota *quota =3D &state->service_quotas[i];
+
 		init_completion(&quota->quota_event);
 	}

=2D-
2.34.1

