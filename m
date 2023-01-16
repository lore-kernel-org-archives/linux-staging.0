Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B146B5
	for <linux-staging@lists.linux.dev>; Mon, 16 Jan 2023 18:55:34 +0000 (UTC)
Received: from MTA-11-3.privateemail.com (mta-11.privateemail.com [198.54.118.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id EDEDD60757
	for <linux-staging@lists.linux.dev>; Mon, 16 Jan 2023 13:48:09 -0500 (EST)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id AA24918000A5;
	Mon, 16 Jan 2023 13:48:01 -0500 (EST)
Received: from bpappas-XPS-13-9310.ucf.edu (050-088-208-136.res.spectrum.com [50.88.208.136])
	by mta-11.privateemail.com (Postfix) with ESMTPA id 4905418000AA;
	Mon, 16 Jan 2023 13:47:52 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1673894881;
	bh=7eZ35sq7vCUVk3hra9JJfEa8RywzMOV09hPbJgGfvUU=;
	h=From:To:Cc:Subject:Date:From;
	b=Bl1SddMe0MQndGSlzT/1qEvDmy8b2bDbFoRZIITe/g8u3rsWRJKgiuSqnUpIHmCmM
	 LYhvh+0Hn+IBx2jy1ZdBxNl3tC5Fz3Me63rP9J5OkmHytR7E3BhJWEdQ6E/JMfgf92
	 B9H5xbSs5XEK3GRzRZdUHJoqGMG9Lza9pRsI/fXb0sEXzA5t408mK5gSiCMjhwixAZ
	 1oKup3SFLrua+sSGvJ1bgehrwYJqjaM96+MfOsUSWq7Znf1P+fXmiT1AnBq9SjlGeW
	 NzI7F7JtxzznJ7aFeoVKsp8QbCWzQJbRQVbHpTWCuKBoLfX28T6lAvSBQIzgtmvqxt
	 IUBrcJ2cVMWXg==
From: Brent Pappas <bpappas@pappasbrent.com>
To: rmfrfs@gmail.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brent Pappas <bpappas@pappasbrent.com>
Subject: [PATCH] staging: greybus: gpio: Replace macro irq_data_to_gpio_chip with function
Date: Mon, 16 Jan 2023 13:47:06 -0500
Message-Id: <20230116184707.22302-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Replace the macro irq_data_to_gpio_chip with a static inline function to comply
with Linux coding style standards.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
---
 drivers/staging/greybus/gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 8a7cf1d0e968..833162ceb385 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -43,7 +43,11 @@ struct gb_gpio_controller {
 };
 #define gpio_chip_to_gb_gpio_controller(chip) \
 	container_of(chip, struct gb_gpio_controller, chip)
-#define irq_data_to_gpio_chip(d) (d->domain->host_data)
+
+static inline void *irq_data_to_gpio_chip(struct irq_data *d)
+{
+	return d->domain->host_data;
+}
 
 static int gb_gpio_line_count_operation(struct gb_gpio_controller *ggc)
 {
-- 
2.34.1

