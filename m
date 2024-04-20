Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AA29CEE
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713614063; cv=none; b=hUJTE9UQTcVLLoHc8g9uEVlXclX5bj4+Fyie6mkVHBt2Xoz9gy8/M817mXDXyaukazgYbwBlu+TIbD9i2SM+w1HeOd5C+HwxUZDpGQ8woLpAJ9NFG0L7O+/GYzTCs10DyGgI4+hwzEdMm9O3Ocsr780iq7KHSsSOUk0JF7PfgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713614063; c=relaxed/simple;
	bh=uAaeLA3g3WY9oU9qN2Aw2y8icEXnUwBh+UiLT6c5WHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GH0uBlbhxBvB2VAU+g/KX+bOLEoHUBgWx/3nwmPU8bKbj4dwJwbYqHY2tzdXiOzDI37z5oIL339mYIK+YyqC/W0R/mlmaEm0dwh74oH93XZdpG0GRIt7erD6S4fj39eJ7M3+diDgFKSNq0/kmxlANepds6BmdsI112UsQpoDU4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=FTj1ugb1; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="FTj1ugb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713614048; x=1714218848; i=wahrenst@gmx.net;
	bh=IdPvZZcmTz/4Jhv3avJuKOovLJWs7cPlfVl3VPx2mj4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FTj1ugb1U9y4U3dVfJb4o6MJM0vjc/2mLan38rWrQPytq94fVEyru2yjY3BAh3T0
	 WL495muh4tXjBEF1GU/m+SxW2t9U2bLqcgESF4OdYHtb+fha7k/w6sTX5NbWwpb1I
	 nAfndgbqcRQEqr7f0fNGQcVWxt0YNygxyWlY1oGImyXUc2rqd/sokG1J95/ZNLOUy
	 vek/AeZvZXvF+7XGR7Q5uRIzAto82uFbHeafQbz5ykrookKp3D7UcU7CXMGvT83dW
	 Rj/YFQmJSGJF2c/dbRHGtjB81KrEDO+Xj4zBP82F/8mi+AEZXtRNaSFe8YmYzlyIX
	 quD+NdZr1fRleLFbTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1sNpKM2fCc-00igeX; Sat, 20
 Apr 2024 13:54:08 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/4] staging: vchiq_core: Use printk messages for devices
Date: Sat, 20 Apr 2024 13:53:48 +0200
Message-Id: <20240420115351.27713-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:S4WO36eka4RpRX8zyZMI+Fh++NjZMYAbPn2LYBG5ZAagsBg9bZv
 +6dTxW4u/SJ+KIbjIV/e3GMnw9g3buzUiWYIUuf9qJ1r9WAiPPOMTcgLiaEXkeQckOmGOKf
 QZBAVAhYz91qqEcBlW2IpCErlth2cYHFz0mQDdYl+ihk5+7vpLY5+SjogEvGvo4zD+T6ihL
 PbfsSLkzTPv3QBxXldJ9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:djpi2O3a8Wo=;qsU22WJ6PCigW2NRqdwRNbuPShI
 IFS9yWoFI2j55iLe4wVAXme4QNlnZf30doClR1NLOXHgBZHBdzTSTz8N3a74qfLv0fF6r5LaV
 7dINF0c7AGzfaHgPjK2kMFfAySCkeKjuHo31EZuSUV+mgxY128Z5FijQN3xIXv2UKO8SbNjDU
 81voc4j02rM+531fq5Ia/4pVPgfM/KuzQZItxL8yBlVMav/Vgh4JYVSQeDJcooYsVAol4ZtCM
 Wl+YeXihZj4GBcyIEA6+pM4N5viq0XjRQnFCu1UUo0f+PD+xZKH+NQmgDuxccfQYfruG27HRL
 hbKoPWGXVU+nPZD1efcQ8Pvz/gK9g/4JtaKZ4nTvcgBV40ce4Q16jlLDMmBWQIWA5cZh/c/JQ
 iuNsvBS75rPDBkdmGNcbaA87J7rBkMkgLSbb4IBuyP6V5z+wLxeNHyLrbQpfkIEfgEwmsPngY
 qpbFafbWAPqToDHVbsmqDlhgSrBaNssyIZ7Kgu6X/TsL7JvOfgVCcD8LwuthvxIE1bJBlYV+u
 E4c4Bx1VWlzURC/VohaJdbHJ6eu8O2BDuVT94VtTGpPDfxg0r/9+V9SRewnupzxNq3QM9eSs+
 OFqxXF4cNiTOx8Vdj983y5tWRfR6EQkpOubH/6wN+V60vXjjDqH/Wc/Mu7ck692Nuvkmh43kz
 wp8b3KNx0ca/1qkk+pK9drZ4cUa6wmSxOU1BNm7EGFcvPx0YcVJJc9udiuboyXiCdbFnWEEtP
 lPIOLPrUoIGUI6CzhdlSRTPpPd1i18J//55FF/PsR9wz4rxTLqlQzEDTvdjsfZZLNSjDQbnP7
 /DO6ZF19u2ELafKv9SBX0uZ7F4cDVc6rBY6zdg6uqKIwQ=

Now that struct vchiq_state has a device reference, we can convert
the remaining printk message helpers.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3397365e551e..129d73fec2bf 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -697,7 +697,8 @@ reserve_space(struct vchiq_state *state, size_t space,=
 int is_blocking)

 		if (tx_pos =3D=3D (state->slot_queue_available * VCHIQ_SLOT_SIZE)) {
 			complete(&state->slot_available_event);
-			pr_warn("%s: invalid tx_pos: %d\n", __func__, tx_pos);
+			dev_warn(state->dev, "%s: invalid tx_pos: %d\n",
+				 __func__, tx_pos);
 			return NULL;
 		}

@@ -1732,10 +1733,9 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
 				break;
 			}
 			if (queue->process !=3D queue->remote_insert) {
-				pr_err("%s: p %x !=3D ri %x\n",
-				       __func__,
-				       queue->process,
-				       queue->remote_insert);
+				dev_err(state->dev, "%s: p %x !=3D ri %x\n",
+					__func__, queue->process,
+					queue->remote_insert);
 				mutex_unlock(&service->bulk_mutex);
 				goto bail_not_ready;
 			}
=2D-
2.34.1

