Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F64C9A
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 15:29:21 +0000 (UTC)
Received: from MTA-12-4.privateemail.com (mta-12-1.privateemail.com [198.54.122.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id 54E97605BD
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 10:29:19 -0500 (EST)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
	by mta-12.privateemail.com (Postfix) with ESMTP id 78BE018007B8;
	Tue, 17 Jan 2023 10:29:11 -0500 (EST)
Received: from bpappas-XPS-13-9310.ucf.edu (050-088-208-136.res.spectrum.com [50.88.208.136])
	by mta-12.privateemail.com (Postfix) with ESMTPA id 914EE18007B2;
	Tue, 17 Jan 2023 10:29:01 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1673969350;
	bh=DcuerZeOumw84rDdMN0oRM675FUBgF4UGDCfY2qoPwI=;
	h=From:To:Cc:Subject:Date:From;
	b=bwEbeFA0cowSHaIAvq/EZXnha1OvxObmQ5G00PLitt4WTMiv36bBVhb4xjIvU1Eqq
	 igZ3/dAkBJnIMnCiXfZGIpi8ITrqMQoDdI5xKvuWUSiZfpoWYYoP+TWc2V3/uHu4gO
	 XkzS21LJ8QW0xAH5oIBeQfh4A7Xx+nXkqcluH4MJGsLH7b0gDDAM1hCVkDpE3uUfgb
	 7e1zgPkz10cFqLXJ3//D0crOTF8TvKo6VcvKBuOf/ECVUSFQViz5WSdi9ULy4u4aHC
	 ycEpBrNjkyUT/RgxjTc8YkcmrNFJySRiw2r08gg9UXlUQp6Yd318rzfmXdhh/g0Ekw
	 +vnKBnkJIQcdg==
From: Brent Pappas <bpappas@pappasbrent.com>
To: rmfrfs@gmail.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brent Pappas <bpappas@pappasbrent.com>
Subject: [PATCH v2] staging: greybus: gpio: Replace macro irq_data_to_gpio_chip with function
Date: Tue, 17 Jan 2023 10:28:57 -0500
Message-Id: <20230117152857.22141-1-bpappas@pappasbrent.com>
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
Changelog:
V1 -> V2: Change return type of function from void * to struct gpio_chip *.
          Remove the inline keyword from the function definition.

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
+static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
+{
+	return d->domain->host_data;
+}
 
 static int gb_gpio_line_count_operation(struct gb_gpio_controller *ggc)
 {
-- 
2.34.1

