Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F46D18
	for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 03:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o6zS1SnTsY8NxtD8X4Qurgu+HNtIJy+wL0A4Qwnfq6M=; b=jCjeo0/KS6VBY8f/cIpGZFXSB1
	Lp+S9sLL6LtLQUDT3ZdTtRCgQg4t+JFmpNv+kjNibBdYIfClN4WldO/256iyqkAeLQjccqnm1LD98
	F54rj5IdFYA2UsVGXLCPBgnRyzSzGJjsJly8l6jJ+57ouRCQ0kcsnqFKV6ER/NCIuqIw=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1mF5vs-0003RC-Oo; Sat, 14 Aug 2021 19:31:28 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: daniel watson <ozzloy@challenge-bot.com>
Subject: [PATCH] staging:iio:ade7854 surround complex defines in parentheses
Date: Sat, 14 Aug 2021 19:31:15 -0700
Message-Id: <20210815023115.13016-1-ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error found by checkpatch.pl

Signed-off-by: daniel watson <ozzloy@challenge-bot.com>
---
 drivers/staging/iio/meter/ade7854.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/meter/ade7854.h b/drivers/staging/iio/meter/ade7854.h
index a51e6e3183d38..afb13e21002e1 100644
--- a/drivers/staging/iio/meter/ade7854.h
+++ b/drivers/staging/iio/meter/ade7854.h
@@ -139,9 +139,9 @@
 #define ADE7854_MAX_RX    7
 #define ADE7854_STARTUP_DELAY 1000
 
-#define ADE7854_SPI_SLOW	(u32)(300 * 1000)
-#define ADE7854_SPI_BURST	(u32)(1000 * 1000)
-#define ADE7854_SPI_FAST	(u32)(2000 * 1000)
+#define ADE7854_SPI_SLOW	((u32)(300 * 1000))
+#define ADE7854_SPI_BURST	((u32)(1000 * 1000))
+#define ADE7854_SPI_FAST	((u32)(2000 * 1000))
 
 /**
  * struct ade7854_state - device instance specific data
-- 
2.30.2

