Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E213E030
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522176; cv=none; b=uL7rcMwWQ1iNfiXwdd+1BN+OtlG8Hq0Pu65gB3AIIn8mWxY7Hfj5PTG0Z0UWBmES2u5vL3h0HLQrCqIANICiMea5/2jlwp8RDtlWDL5JyWXDUgsGq3LsthN7vxdyft4gcoi0C478cxYpEkefaRDXv8takmNIvTOmuQBvryMfwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522176; c=relaxed/simple;
	bh=1yaaAonmHYsrNmTOdysB/NhX4wSvO3EgV0FZO/K/sTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYnGRsQhIaSw0MQX8CmTNGQTrHXJzwZYguKa8jznOSEIbL9myqzd7YicuK4jkdSVq15BcG4CLsicZOhYZVcFqWjD1WZxvIOu14M4n7d7GuMD4+hyzRcfAwAjr8JvWQzy5iS8Z79JLyookhws/6rPcAynUK0eICL0YiU0rQLX3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cvVlNEDK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cvVlNEDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522165; x=1718126965; i=wahrenst@gmx.net;
	bh=Rfry0NXDm1gI1wrMbe/CMHPe2LIMDEs/iZcoJxyMFUI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cvVlNEDKvi2Q5RqimCm0SkcC+jXYTPm4JPh+RrQqxhspd1YQ0Aq2Xbo3lyy8YEkY
	 Mg9lcdsQIvL+L4R4Aug/ysrLknrvUz0dOmMnEbQOfZ8CBA14qGmZMGgLXZrYmrhV7
	 4gxZzLyy7KBWvD1HchqmulZt2hB1LRwPuHuRgw5dlv1vZlJetbTF1JBUYxxMmQjHi
	 T3JCAT47TXA09YL8M8M4LU0VwS1ep28k0F0+oLrQOVfUnrMW3QNL+icrRk/eUrPSn
	 ZtURP/ZEb+l/4wSV/WH7ygZvDGeAn4Gk7Dipe/6ScmDNyocASyMr0QNYVPSMB7Scx
	 UbzmvYpag8AQe3NZpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1sZq4M1M6l-01857O; Tue, 04
 Jun 2024 19:29:25 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 08/11] staging: vchiq_core: Add comments to mutex/spinlocks
Date: Tue,  4 Jun 2024 19:29:01 +0200
Message-Id: <20240604172904.61613-9-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:1GYyFfrK1UIOo9UDgccMzFEDbhAkCS6WELbwpYOASjPgzxulI9j
 AS8NOL7esJnmUBLN4RuNU1kiwH8KUxO5WLW2IXfcR9t+zv/08ws5hF37MBGYZXT+fRX7NVC
 OmveHThI5j7S/fR6u5mlv4qFR/CcOxgxG+we4Mv8oXrBC+Guu/rc8ZZcGUa8kM/53wH++J6
 o81GDmjopDfYn9Vh8whNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xfwWQuTnG7U=;Bjx5uWH5WBW6qPqLclv0AJ8aWGh
 b5Q4JVia+tkKrM2fyZV7HKpRgYFy1xsUk/huh9FNDffiOft5ocFJINle1M5uN07SuDYOX938d
 gnG7ZKqptm/LK8oQ1tA88ZjJZmMGKrMW4sQ3TQG72ISfr7/+SvyFlacBq0Bnv9Pz9Jl5eS6yc
 zOZqmcDYQiLZPhRWh1lQUDdGECboRrsVIY0r62kP7Hjlkdo4ikJwTPHH951/LG5RSzKLqIl00
 9Pm9h6dX4A7238SjSGs/gMTeQdJAhbFAMh8z7+tH0PeXbaTiLNEjjtTut6ZUqUwKOnw0oPmcM
 RDrkzTOToiDW59uctY0s9NfylCqjwv4OQHH/kTYwQG4GPFompcg4j8dd+QTsOSeR0HAn86vGz
 1WLxzuNmTM/6GnfKAJEShcNLvveGwJPie7IpCUQdIv6bsrnw3UmMoB9/G0it56tZFDFmS1qzv
 DLJPKsyKIGsNYAPN+xNAD1QgaDWk/eNYrNx57IH6UXLWqx600PPOA7G7nbcx1bwFxHXHj9NXm
 C1vZ9hMr10M3NQ2MKdXP21M27DC44lRmObVPvkUBy+CEl7kpO3iyeoM00irBOkMbx/B6LSyjB
 NxWrVmDzeUOnb1awlgDSNkLVlL2E9vAkdxqsToIuHs+MjH0SB+lAW8/N8f6UGZGLMF4HSo7tU
 JP2sH2xRv86S5jR9W3gW+oou2538Rf7mUQ63J4E6ilzdfAJJct0vH8uWrdxabzQUWFPJCwjy2
 826IU+DvZGEmkfOZSARbbvVCY2bSoK5N6nNTDjII+775rbgNwrgu8pR5nsyL4gaNVspQNwTDx
 th89u4/mfIv4tRRyB9pZuTS3y5GPgmIm3E/6lv4B2qcx4=

From: Phil Elwell <phil@raspberrypi.com>

checkpatch.pl complains about missing comments at
mutex/spinlock definitions. So add them accordingly.

Link: https://github.com/raspberrypi/linux/pull/6139/
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../vc04_services/interface/vchiq_arm/vchiq_core.h     | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3c7a6838ddba..3abcd6910f25 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -196,6 +196,8 @@ struct vchiq_service {

 	struct completion remove_event;
 	struct completion bulk_remove_event;
+
+	/* Serialise access to the bulk transfer queues */
 	struct mutex bulk_mutex;

 	struct service_stats_struct {
@@ -312,7 +314,7 @@ struct vchiq_state {
 	/* Event indicating connect message received */
 	struct completion connect;

-	/* Mutex protecting services */
+	/* Mutex protecting service creation */
 	struct mutex mutex;
 	struct vchiq_instance **instance;

@@ -341,16 +343,22 @@ struct vchiq_state {
 	char *rx_data;
 	struct vchiq_slot_info *rx_info;

+	/* Serialise access to the main message slots */
 	struct mutex slot_mutex;

+	/* Serialise slot refcount updates */
 	struct mutex recycle_mutex;

+	/* Serialise access to the single synchronous message slot */
 	struct mutex sync_mutex;

+	/* Serialise access to the message queues to userspace */
 	spinlock_t msg_queue_spinlock;

+	/* Serialise completion of blocking transfers */
 	spinlock_t bulk_waiter_spinlock;

+	/* Serialise updates to slot quota data */
 	spinlock_t quota_spinlock;

 	/*
=2D-
2.34.1

