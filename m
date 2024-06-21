Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071B3155325
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976029; cv=none; b=U2QPwlbKyuVB6RMW+u4k5RmCzv7HP8nQedgyyDU6xj8Af6sUF0TJy60KuN86T60lEKsMi0WMI68ybArJEZPgZT8j+XTKpCwXG3iiqHB0WZp2fdv/F6z0kFGqTbk8BQt2uHXRoHp6CdUg4FQvVW5zhk41HTJTtnTq6IXaVTko7bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976029; c=relaxed/simple;
	bh=GnY6dZ1v4OIwTQVShNkBAcjiHKzU0yaoSTj47lDbjkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pjnz/VB34Dmqr9zCB1Et0Gysr+0V/GBUEs/L6Nm4qmiriJwWUvmbLKBIenYH01c8Po9+dkLdw+jNs8alSSjSrNR6vA7WmJLwNMW16pdCp0XMXIYIvuFeBx2nw36qX8wgGIi5oSKNgTnSWEV9W/mLljx3OImKdLCXJipA+DrEEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=FRAf8qoL; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="FRAf8qoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976016; x=1719580816; i=wahrenst@gmx.net;
	bh=EiwqwtLbWeIKNfGQut/XomuN7KJlz0oUvJUtt14KeEw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FRAf8qoLg2h8RdiRPxOChB7rTrv7visk7HwXdf63J6QVGHYSisWy/pkYiLQMXb6i
	 vLJTzPa6wE8kePvW68xcgWyyW7NaKYri2hwbeFeTRZFNSsXP7O/lAQ+X6XRrl7eFw
	 uyCVze6K61/pIIJy3amt++fPhT1KlxOFCBcBeeY+AXQ5vhKHMtqMqjPf8661kbG2W
	 jQnoMgYdhsvA2ZWSoKNniCG+NoPN56j19nvJK3NCb4MXYLs71LuO1dIAdFJzkZogz
	 QrjpUnBkdJqzgIZzEgacwaQkVulOE3LwOAtOYW4D7AzjCgl/CTM9b0NpKwqbVTSw0
	 zuHV3SMufwmIbG9VSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1s0CK62KPG-00OLQA; Fri, 21
 Jun 2024 15:20:16 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 04/10] staging: vchiq_arm: Drop unnecessary declarations
Date: Fri, 21 Jun 2024 15:19:52 +0200
Message-Id: <20240621131958.98208-5-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:W3CkbwSKaWKtryod3DAduooTZCX4pnHKkiuvlDVQmP1OUBLQsdR
 yc/Cs/1erl/D3zfca1QZXXmlQ29VncdmHpTCxk8exJ1wykuZ+8Ef0ugpdCe/gTJO10BiWDq
 +4kwPYb2Xwvi5hRCptWQ1in+rxxYcXSoz5icXRXR3+So/J2Wen5rhCw2+ziClxASaB26+9A
 K1fGuTQnJiVewZ/5ABaNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N41LMo44T9s=;rlafzwyQdKyTyziWL72RZ4Y1xUJ
 YVZmRUTHZcsz+HLOy0JIjFSI5oGtFmRxhRIYSiFeRfvR2avGp0KD0q4hzVfZIeTWKaG6nQidG
 OxsQ7ZiZ4P1XT5aJ/lnVYaHuSae87C5jMzTH2Gjlezx7TbeCirq1BFgvY7nQ7gSHbzOJBvTE7
 skDHP2JL7ZOdACPMPBM1xSqvm37UkwjVvOR6l0oYU/rpDJ8o/S18Ny6FknrPYagSZ3qXSAGrZ
 vc5D2CuG/Q9d+LgQWYAOJQS77rlQ7CU0lf3ya57amV4/YDCA7AkES//KO9dXuqXDkYwY/iRI3
 glp3dlO4i42xiS2V7hfHNc6K45FGSNDBRTb85AE/fVsWqmVm3EMZoE3h6b+kpdsJ7Y4Xs18Wi
 wv6uUfh5NisNK2G+ZoqiI29cAi6UZ9JtrkpMXUjKz7594sexeKg/FLlsL3cEQfJJC7ft2jl3j
 CBgayaAvekc44yJ2EFtMiGG271yWWjvslecCs+falw24A6A616fXEnETU1N6SlQzpRWv7ElcU
 9MKTyVCZ59TAIcIDvoTi/9jdqgbtcAb2RZ3qjtrGY6r8sZnCVT6zPn6M1HMU1GJAJVmN9J+uu
 mnWsBD8NYt0WW3vOJt3YDUD8Nf0D+Zm2R+ygkTJyEFmN3FfBqvZHLWmw6OxWcb3ijHe9ELQRV
 BZBtqw8VKaoVAEgw3zBvdCU0kthsD6DrToLd1167CdFxgLfny3eBBEY5Sc++cLlhmQSsVamdc
 uUjtn/bYjcS9m9ZwVwsOpcwDepphCzZtFP+R5BkzPbY3dJFjDWPKHoSbcA5y52R1ZB+b8iVdS
 pg8MUiaIdgl/64xkW6CjlkXLELGQGBKUzG8TfVrsYYcuI=

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
index aac46e2a3b75..77cc4d7ac077 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -544,8 +544,6 @@ int vchiq_platform_init_state(struct vchiq_state *stat=
e);

 int vchiq_check_service(struct vchiq_service *service);

-void vchiq_on_remote_use_active(struct vchiq_state *state);
-
 int vchiq_send_remote_use(struct vchiq_state *state);

 int vchiq_send_remote_use_active(struct vchiq_state *state);
=2D-
2.34.1

