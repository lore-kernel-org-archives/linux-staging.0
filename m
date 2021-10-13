Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8192C88
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 10:56:23 +0000 (UTC)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2d05:985b:ed8c:969a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: dafna)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EEA8A1F4416B;
	Wed, 13 Oct 2021 11:56:21 +0100 (BST)
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
	olivier.crete@collabora.com
Subject: [PATCH v2 6/6] media: wave5: Add wave5 driver to maintainers file
Date: Wed, 13 Oct 2021 12:56:09 +0200
Message-Id: <20211013105609.21457-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
References: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
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
index ee91c5472bc1..3538e1a9b492 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20190,6 +20190,15 @@ F:	drivers/watchdog/
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

