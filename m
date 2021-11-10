Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75E2C81
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 12:09:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: dafna)
	with ESMTPSA id 32D711F4555C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
	t=1636546173; bh=drd7pjo9KNm9SXbJqSjRnoiOHd+JUDMpVHIVQiFuY6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OeNIpSg8PJEnbZjgzuqJEgRp4jXR+JmcSZQ3n392dgINfZfdwsyX9b1e1V00pP7bk
	 AcTRnCTfnJ+kNcwWkaIHW6NOXngwxQBDIfPyB36tHKVLiR4fBcwsrTeanJZ/BlkDOg
	 horCmUfrNTN7nDdcUXehZR5CPS65hpgX4e4Ph4EIUINJkMoaWYvbsjvZ4Ir8nYrdtM
	 C4li4J7L0mbi+xjGo33ZPxnxaotw98a04/tvRsIjc9qNKiQ5NTkTLd5E0XVDUqbTCL
	 nHcCRfBxFyWJEpBzRAczZbDQr8oZa8x3jXqb03D3f5QKgJ4PA0Wd6PGi/85aReeB3u
	 sWnwX+scWAzng==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Robert Beckett <bob.beckett@collabora.com>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl,
	kernel@collabora.com,
	dafna3@gmail.com,
	kiril.bicevski@collabora.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	lafley.kim@chipsnmedia.com,
	scott.woo@chipsnmedia.com,
	olivier.crete@collabora.com,
	dan.carpenter@oracle.com,
	rdunlap@infradead.org
Subject: [PATCH v3 6/6] media: wave5: Add wave5 driver to maintainers file
Date: Wed, 10 Nov 2021 14:09:10 +0200
Message-Id: <20211110120910.12411-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

From: Robert Beckett <bob.beckett@collabora.com>

Add the Chips&Media wave5 encoder/decoder driver
to the maintainers file

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e6594a4ad8f..5704b8c17f72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19962,6 +19962,15 @@ F:	drivers/watchdog/
 F:	include/linux/watchdog.h
 F:	include/uapi/linux/watchdog.h
 
+WAVE5 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Robert Beckett <bob.beckett@collabora.com>
+M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
+F:	drivers/staging/media/wave5/
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.17.1

