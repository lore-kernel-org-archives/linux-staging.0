Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9727A3D0DD
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330106; cv=none; b=uHVmmWh+om/+pS9CCIGmpBxm6lursIzeW2Z36TRSxKSbq/lSA+4xvGqFz4LuNQeRX3+eg5zVZKl4YgPaRSK6/tmdGqVEhArGKfqY3YnL7C7oOe8fm9ZsLTfCaX7Y8hg5LuWYDTj9GEA3UGDRxWhAPD5Q8ulnnF56Y8QHIkyXTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330106; c=relaxed/simple;
	bh=EP+UBSw06WyqmjbcslJ6kU71eJXTJxmwhp+wzAOZGc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9a1Vp8rPZCVmetWf0fJ8bxdGVhkF5S7FlxAc+dfrgiUXn6XObdsOG5if1I8FgzBABaBWHuogTltn4R9sm5DO90ZC2Pxx/q7xh3bTXrqe/32FQ3N+3gQwv03ekjRdGne3ITn21a0+eG8GCnMloiNMPS9yY3zB3sec2S+iDMhKpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ew4TqE5D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ew4TqE5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710330103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=phzUMfeINh6dbuyeZg9sPFnUlzhipZ5AmTkMI6GYbLo=;
	b=Ew4TqE5DrcF3P1eJ59YqscFhNCT8EqSkdfcNL0grkK0NdIJp5WIhlOVY9AB0H/wBRjoJYI
	KSIwOHwjiNB4i08KILASi3r56Y/xWiiidBfeDuY/TxBf+1je+gbfkVJ1o5ofOwP1GElGDv
	5cpOdIz7dEXVEiACRWHsDkesLqKi7t8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-yCpaULeNMjO4ZqHSiwzyAA-1; Wed, 13 Mar 2024 07:41:40 -0400
X-MC-Unique: yCpaULeNMjO4ZqHSiwzyAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8039A89C56B;
	Wed, 13 Mar 2024 11:41:39 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.67.24.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7339C44421;
	Wed, 13 Mar 2024 11:41:33 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: dan.carpenter@linaro.org
Cc: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	gregkh@linuxfoundation.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH v3] staging: bcm2835-audio: add terminating new line to Kconfig
Date: Wed, 13 Mar 2024 17:11:26 +0530
Message-ID: <20240313114126.1418453-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

From: Prasad Pandit <pjp@fedoraproject.org>

Add terminating new line to the Kconfig file. It helps
Kconfig parsers to read file without error.

Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 drivers/staging/vc04_services/bcm2835-audio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v3: fix typo and note about parsing errors.
  -> https://lore.kernel.org/lkml/CAE8KmOzcD+__7xdC7tegbHO9HEP48s7=reA4j-tvqVDwzHr+8Q@mail.gmail.com/T/#t

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

