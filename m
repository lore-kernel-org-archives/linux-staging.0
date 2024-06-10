Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA047A40
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053376; cv=none; b=J+THSSvkQG8327pVs7ZLqs0phq7o6MKkJjKxBUH5JZvpc7WQzybq9yZSk057z5TCPxOYnynnZUatMp1EoY0ynTmo3nLv1mVxmUYkOFWYU1+pzsJqe6+GLVJewGxb7ZFuT10Z8xYeueLHmJOOg0wnnv75Y13e5QWkCUkbePZlAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053376; c=relaxed/simple;
	bh=aGDYVRxQRR0UAFKpQJI8+OH9qCJ+tFm2ovDHE+6UMaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tC8fUohlFKgimf/z9CPY9rPIPueX4M7KIZig250O7vQ7sMLwyI+pdPyS1L15z90LaibKAwtXkt3MpXyrDyLNKak+5o7SpFiBUxjKUpfh1S4WBYYchW5s09OolrbRkboj2ioXndyc2I2Aq196R0S0E2RM+Jieg9gN4h54ZpSM0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Q5ELSIze; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Q5ELSIze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053363; x=1718658163; i=wahrenst@gmx.net;
	bh=RIZLK4Mq6tf/0k1hA0SAyjoUPxlZbtYJq1exf8ZpY+M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Q5ELSIzesj9XN/my8QD2PGUJOUpDBp3cLEBQmtAgy6oYpZi3S/mxWKBAGhuyVB6R
	 dZq7Pw5nUrdZGt453Naen3EGU3aozxQyqT/s9KRmp5mbNOzgQrnd3xtbt9pNrcm/Z
	 3KQVU7wwcAJd3e7fMl1b++h3RlawLKtJ85PkG7LNXPeRbwzc8jStFHLDXRCTfW9qI
	 rFFBtN4BbZ+XCxoS40OmXY/aVxwt0dJ3xNFxvCw4LV35VRL77FGJkeobt+288Jg0M
	 lbQ+T1OrZAQ8S/FQumnyOjhz6hpjtysBDelVip1odBTkO/XMViLl4nYOq548fk/TX
	 i7oJxeVUVXmRp1bUTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUmD-1s8DJF3Jb5-005mjx; Mon, 10
 Jun 2024 23:02:42 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 04/10] staging: vchiq_arm: Drop unnecessary declarations
Date: Mon, 10 Jun 2024 23:02:14 +0200
Message-Id: <20240610210220.95524-5-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:c9mHqwgPaF2/adxzfeyM4WwC9J3jHXOEVGEILGXs42V20UP3NHP
 IMiVI3QahObV4kZxr3Z2FETtpn19k0OLPMJacGe08YBbnJvd9/+1Yh3nu6/DKfu2bzAlg06
 FtvJbs6XTD1OBd6swcQCeKM8ZYuuh5rMFwW1IncTJiVXH9kziYZimuX2drklEMENnDQpjjF
 ccU2/gWJpLBky8SCDi5VQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iYr/5F7vlU0=;F1/+lN0DDzFimFx46/nTmIiY7El
 qNsyY9TEW1744MhDoF+PAneawD/SfOXZLIcL/7Zh9AdIZxlPwm+WLTNjFBrjsbxf870VxhoUm
 VyAmPrLHpf7lXC4bykgI2D4hITgloStNlSSRcyBDTbeZAYKdg+3rrzaUwIePQlBNwURBF+lL4
 Xp+J1JZzXBiZ0HLsyizLOQGZQLkHsSCcyD8VrtVi2S0bHSfRBkzVJf0ZM+wOwWs/wp/zIXweL
 bRUMDOA7m1iXMGkxBeW5RoWMKEz3tOQGX7rHJEwfHTKBER6hKUVT1rdaCy1+/MkUWk4UIuQIe
 FaX2LCz7D2DdAUiLQI9BfYa1Hl3l4e//3SNuhUMWzjhKwt8GXmt8MysRUOKQtBAG0DjYVPnRA
 NThtSh2GVOqu/bSeOwEDuP+CvgHT6zD3O0O3wQQcRgJOZmhFTiRgdA+62/U/YQH512IKjV99f
 nEpvShs6bVMZTR/ZkbjjeRQGA/USr1XzatCbhzFAKfSNS97r2qDGcLnUALMdjtktrK1C7j3sn
 zL6UTW8v4nJJJ6yHokymAGWC6TDACe5JMTDasOZyeabw5eDjJl43FDxtArfpZCcZ4y7sL2hj9
 1lkhQ/1qSyQJBGIhDmpEwlPuxKzNvjN5n6bvTar/39CrxTuf+AKR77gi2rKWJWYze18dcaACy
 H0puXPN0NP4vJMr+HWIuXCBPFu71SbPESL61HppaMMQ8F/z6uMwZLnjV4igt9+Hn9OkW0OSQv
 J5R23jdOMrGT3KClj9IjLPZStdBdMFDgn+Ws0xl+/hCC4xWqjLz1QESgKwuTe27e++h2FGWxH
 l2qiU+0Qou9bfnKhQEL20SBoziKoKxRAJ2/OTHRFfAjfU=

These declarations are left from cleanups and not necessary
anymore. So we can drop them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h  | 3 ---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index fd1b9d3555ce..b402aac333d9 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -109,9 +109,6 @@ vchiq_release_service(struct vchiq_instance *instance,=
 unsigned int handle);
 extern int
 vchiq_check_service(struct vchiq_service *service);

-extern void
-vchiq_dump_platform_use_state(struct vchiq_state *state);
-
 extern void
 vchiq_dump_service_use_state(struct vchiq_state *state);

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index be20abcfad75..3c7a6838ddba 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -539,8 +539,6 @@ int vchiq_platform_init_state(struct vchiq_state *stat=
e);

 int vchiq_check_service(struct vchiq_service *service);

-void vchiq_on_remote_use_active(struct vchiq_state *state);
-
 int vchiq_send_remote_use(struct vchiq_state *state);

 int vchiq_send_remote_use_active(struct vchiq_state *state);
=2D-
2.34.1

