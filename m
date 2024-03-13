Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8538A1BDD9
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321195; cv=none; b=g1Om4X7/HvLJbSKrT0AsUC2ss/M6msfUAM3l3bSSn0d3vIdIX2YJHvgvDbwvAMJPhDCtMnL6XnR2ksz05ftunJ0Fwm0sq82sglXIC4K0w6QAWtF8wy96T7tOpoqY4jYk79IrimLGcFvthUlH6Wr48H41DxZHap2XxJ3NTr9xPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321195; c=relaxed/simple;
	bh=r+X8328ipwFNBoJDjN8mGCRUW53I09V6HqgarOZveCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFnXYOK/drgypehBm1E8WbzFfGD8rNswnttOFHwDEbw5WPvqrVUFKpoISKOen7HjLkpcMFkamd04ez0eFeKrBI27t6AbaT9nEABJwHH4dkv7RxrqD4Ni+j1RUYX9hSq33AKFuponMZGekqIVcTJeX77kH5foD+InH24yndEwMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/B8YfYH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/B8YfYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710321192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=75HuuVuSW3xTNtHoVuj3UQkwioukSu4YrMFtPrMEBII=;
	b=K/B8YfYHQzh5XBkl6b9AdC9qzFhP4oJiJf+sQdvcD6sZWUhC5fBB/ZsI6cec7iePVO2fOM
	PX1hombxhR2BvfOQ5fdUA0IIydkAJ5WEzCD/BFlXNuDsoLcNjZ/ecijZku8s0WXvVsSXSW
	FSDb+SDGBJnwoHX+94uDaRv3kkJ7qS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-k_PasUtlMR-xiIBjthuRCg-1; Wed, 13 Mar 2024 05:13:08 -0400
X-MC-Unique: k_PasUtlMR-xiIBjthuRCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 747BF85A58B;
	Wed, 13 Mar 2024 09:13:07 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.67.24.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0D7C40C6CB1;
	Wed, 13 Mar 2024 09:13:03 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	gregkh@linuxfoundation.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH v2] staging: bcm2835-audio: add terminating new line to Kconifg
Date: Wed, 13 Mar 2024 14:42:59 +0530
Message-ID: <20240313091259.1413854-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

From: Prasad Pandit <pjp@fedoraproject.org>

Add terminating new line to the Kconfig file.

Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 drivers/staging/vc04_services/bcm2835-audio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: remove Fixes tag.

diff --git a/drivers/staging/vc04_services/bcm2835-audio/Kconfig b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
index 7f22f6c85067..7fbb29d3c34d 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/Kconfig
+++ b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
@@ -8,4 +8,4 @@ config SND_BCM2835
 	  Say Y or M if you want to support BCM2835 built in audio.
 	  This driver handles both 3.5mm and HDMI audio, by leveraging
 	  the VCHIQ messaging interface between the kernel and the firmware
-	  running on VideoCore.
\ No newline at end of file
+	  running on VideoCore.
-- 
2.44.0

