Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C241494D0
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522175; cv=none; b=L9k9wAY1xoLzKuUXqJ8kBf3e+HqHcSDBT1XpUOxCgwidaSKD3cPktJ/6HPZ4cwUc5EwRszmLY0EGw7Pm3cdAXkdahSlf03zkyZhdt/5VzW0tpk52K/acQAhnBrqj7920V8MbFmDGE8UYus7Fp+krus2rN3pnHNnj/QWrwcSKPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522175; c=relaxed/simple;
	bh=vhl0OuF+UFnFrCMyBcRcdOlzdev5NREkOqDvz+XEINY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4loVvLpHIJjMNGme6+KE2IzWwwDhc+vuhYzWoPRK0UALSmp11TbfG7DiLyG6qL2Bfp4OKPADWxDpX1oCJpHoDw+20cDNgDxpCV0/kKKXk1tFHIiVVSBjxb66RAEbJEYNbJDKnQ273uZ5yMkdkT2ZlwboBXYn2tynSM0k77B9tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=lv2589fK; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lv2589fK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522163; x=1718126963; i=wahrenst@gmx.net;
	bh=JtixJ+5R5VvbdeFN7ZhkNpcbzroFRKRp1CgRilsFn2M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lv2589fKjyH0+gDE0YdsdH9jygWKya1jkDQIzDMGAHPR1hf7oEGXrGClsyAV0Yla
	 BBrvwRNOkpIBNuwbacocJ/6VQ8+nHIgqhQD26CdwwbiSaYGsEVydJsHniP9h3nPJH
	 33bWP7X447r1hqqjq6vjlJ3Za2FuyMq0L/HwIyRwWzNfSAudJQnIrubfit72iVfEN
	 AurR/Pi8CiIDUilUhJGyQuArVWqUN8m8xeslmBGRgeYI1Mldv3nMZ1Ot6pav+D4Un
	 09tpQpMerW0BLb19yI/wRp/manhOQmAVO8zgxN9OjsHTWoNhwkNy2GbS4KrrWkMYN
	 kuXb8Y22PA2h1FAPpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79u8-1sXLtn0rsK-014Usb; Tue, 04
 Jun 2024 19:29:23 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 02/11] staging: vchiq_arm: Drop obsolete comment
Date: Tue,  4 Jun 2024 19:28:55 +0200
Message-Id: <20240604172904.61613-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:UiTW8i4Vxx4YciNN+DR/pxONHQX84OJ0/p2PYv0tvzZ+nJDq+Jz
 3llboV9XV4JYd8F2b1S+NIHbV1uT5U+jgzDT5RAkGOQ85YE9dXUyNuiTSEZwpBlKn1vc6Fc
 NhFvoqjzUPMKNKr6A6xH2pWgzJu/YwsMkJf+QbiJQK3sU7KjKTKrsrRgN+ivkgi60F7kcCH
 RFCklZijdwlZSlnta9BzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k99gOYlTekU=;fQVuznd4pmdhdpmP/ILtZCkQ1DR
 yJyMQp+7gbputmJmVbV8xTMGC6vSKfcjWUObDFo2lZoxeqTWyPfPjGB1azVT6UtR0gzMoTKVP
 bdZB+3XE8hpivLU4c776M3qzITGUKYUNqqfHY3K6+qX/uI7FVE6vQBoDVUiSNVs9RTUl0IhuO
 DIsL2dOV+ApMNAI6WOTeq55mHNgBDmYmraRiiWfLvVOWx2nh/d3DRdblU42fQdF3IbycmmV5/
 RKXgnDQsFUf0CEb8YadoURsvdvVuqf3oxLS2yfQdEy1xfoiGQSqBxx8wVN6V2Y1Bo8OxVmmhr
 TaXTggnKL1toI2KZQQi5GZBt1915iYJaEAS1rejop/QFaNNW0HbosYOF5EYwl3fG/qV0Ko4qt
 CNSXjEjiICMg0yqVsmsLAddw810CAtODF93Qm77pyhep4r6uwjQZI3FQuDfv5KvrdPNupvdtc
 deefjXVdDFDMzui9Ov0yve5M6XFx+qUf8G3HS8C+S47OIY6abEPHmItzajRucQjxcybPHV3jg
 ccO1A/wQET5XZdNaLnmL+lrFdvwzaZfMQyFuQRPkKnqeqXXgk58wMdE9TMi9AlFZPrmp5su4G
 OkTj47q0PXwLaJOMK+L3yQt/nx7V14G0j18GpSruW+F32M0jSHpO0M1sbrqU1hzgKROvfkosS
 cMH8xjtXC8ilR2Ydbt0XUw+2hKikhLDyj7n6bfxyCwPLxwiXofbsWY6XNaCdeZDkU+G4FOlZY
 Z9rQfE05yDqLbMjVyX3qbPVl4JZ9eWLS05PHdOC4biMGNrVa4UYUl1ncQ8QXDjOK8H7diqJBP
 x5x9FC2jOthr0qWOhIYZUMMDRtgBdRRiJfvbu98XYGZzU=

The BUG_ON has been replaced with WARN_ON. So we can drop the
comment.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e2f4aa00cb70..515cdcba043d 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1451,7 +1451,6 @@ vchiq_release_internal(struct vchiq_state *state, st=
ruct vchiq_service *service)

 	write_lock_bh(&arm_state->susp_res_lock);
 	if (!arm_state->videocore_use_count || !(*entity_uc)) {
-		/* Don't use BUG_ON - don't allow user thread to crash kernel */
 		WARN_ON(!arm_state->videocore_use_count);
 		WARN_ON(!(*entity_uc));
 		ret =3D -EINVAL;
=2D-
2.34.1

