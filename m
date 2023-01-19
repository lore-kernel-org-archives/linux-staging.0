Received: from MTA-10-4.privateemail.com (mta-10-4.privateemail.com [198.54.122.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA77485
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 14:42:35 +0000 (UTC)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
	by mta-10.privateemail.com (Postfix) with ESMTP id 5914618000A8;
	Thu, 19 Jan 2023 09:42:29 -0500 (EST)
Received: from bpappas-XPS-13-9310.ucf.edu (050-088-208-136.res.spectrum.com [50.88.208.136])
	by mta-10.privateemail.com (Postfix) with ESMTPA id 42B2218000A6;
	Thu, 19 Jan 2023 09:42:17 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1674139349;
	bh=OvjuU8Er9NffYgNl0xuyyr+JSQYsrtMIdTAEnQq5WTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOXLzkyosRaBdcMN0ZtH9/fbx+5YhAyqwHHv5q6hJa62Uz3nqSUeMi5h/tCyIRMyK
	 4vHtnIVbhL5ijYpmiIk1adATGuASKjFzwenkc1dejLQdaFvQ3LtLvkHUTejSknAHDY
	 RIoQmrHhhEwWG1c47UaYT4r2q7KW4TxnoL85j+Yv2ROaWHz1yzCHJkj69k0UKiiAgQ
	 gvlXQINieg7EN7utJaTLzAllIGXjeUqz6vDFKnoa9FEUz4/UOQw7aQ/Q2js2zUCuPs
	 61Brz1d7i3QnXi4ctGq66B7xRRa3KmDTurjw2QZrcHDx+yXaLKvxWbXBIAl4Ep7++T
	 4QGtk6eRF9IdQ==
From: Brent Pappas <bpappas@pappasbrent.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	bpappas@pappasbrent.com,
	colin.i.king@gmail.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] media: atomisp: pci: sh_css: Inline single invocation of macro STATS_ENABLED()
Date: Thu, 19 Jan 2023 09:42:03 -0500
Message-Id: <20230119144203.17084-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAHp75Vc4QS=Gr-DSvf7pzCKktqGPfno4TBDmicj5CKgyHGjSsw@mail.gmail.com>
References: <CAHp75Vc4QS=Gr-DSvf7pzCKktqGPfno4TBDmicj5CKgyHGjSsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Inline the single invocation of the macro STATS_ENABLED().
The macro abstraction is not necessary because the logic behind it is only
used once.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 726cb7aa4ecd..93789500416f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -97,9 +97,6 @@
  */
 #define JPEG_BYTES (16 * 1024 * 1024)
 
-#define STATS_ENABLED(stage) (stage && stage->binary && stage->binary->info && \
-	(stage->binary->info->sp.enable.s3a || stage->binary->info->sp.enable.dis))
-
 struct sh_css my_css;
 
 int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
@@ -3743,7 +3740,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 			 * The SP will read the params after it got
 			 * empty 3a and dis
 			 */
-			if (STATS_ENABLED(stage)) {
+			if (stage && stage->binary && stage->binary->info &&
+			    (stage->binary->info->sp.enable.s3a ||
+			     stage->binary->info->sp.enable.dis)) {
 				/* there is a stage that needs it */
 				return_err = ia_css_bufq_enqueue_buffer(thread_id,
 									queue_id,
-- 
2.34.1

