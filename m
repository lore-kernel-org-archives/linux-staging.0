Received: from new-mail.astralinux.ru (new-mail.astralinux.ru [51.250.53.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7150249EF
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.53.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708938821; cv=none; b=G4C1yF0T+uSzD+WT97TWFNmWUzEMlcYHuDVGpjd+sYF+M0IsizCM8GIrGMcaZ78o4EBjUzyvw1gVy/BKCv5a9DB8PCdkr56CViJw0RXtEaNk14OaWy43d9g27j695h3JNMsBuqtBufTrK7q2g4Q+U30GomvhmFRo/FJlRb9xEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708938821; c=relaxed/simple;
	bh=6Rh0/f6Q0JKY6bLRR8SKhYzN82pnSyVW5t4yFwbYTJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rFbWqudABnDkDDWV90Pw1QzaCdr55GsoTR4wMqmy0XlCo5PtKwjoLjiJCUAqiTLaY2ND6E4OY4B1y2qbapoh30kGw87UOQAE2+jdaxTLNOFngGqM/4HOEN2A7b6KhoCmgyP7hF2IYBz16v4TJHV34RangWE+7P7tY934rJVfibU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=51.250.53.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.232.106])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4TjvnF43hVzqSN2;
	Mon, 26 Feb 2024 12:04:17 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
	stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.15] media: atomisp: sh_css: check ia_css_pipeline_create_and_add_stage() return code
Date: Mon, 26 Feb 2024 12:03:23 +0300
Message-Id: <20240226090323.21799-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeduleetfeehffekueeuffektefgudfgffeutdefudfghedvieffheehleeuieehteenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefvddruddtieenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfedvrddutdeimeegkedukeekpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegrughiuhhpihhnrgesrghsthhrrghlihhnuhigrdhruhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrg
 hkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehvrhiihhesvhhriihhrdhnvghtpdhrtghpthhtohephhhvvghrkhhuihhlqdgtihhstghoseigshegrghllhdrnhhlpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhvtgdqphhrohhjvggttheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB; Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128, SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12425787, Updated: 2024-Feb-26 07:45:37 UTC]

commit 912680064f94 ("media: atomisp: make sh_css similar to Intel Aero driver")
removes the affected code, but in versions
tags/v5.8-rc1~10^2~220 - tags/v5.17-rc1~114^2~261
there is no check for the return value of the
ia_css_pipeline_create_and_add_stage() function.

ia_css_pipeline_create_and_add_stage() may return an
error code, so check and return it on error.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7796e455170e ("media: staging: media: atomisp: Fix alignment and line length issues")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ba25d0da8b81..8502adb75a5a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7912,6 +7912,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 						   out_frames, in_frame, NULL);
 		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
 							   NULL);
+		if (err) {
+			IA_CSS_LEAVE_ERR_PRIVATE(err);
+			return err;
+		}
 	} else if (need_pp && current_stage) {
 		in_frame = current_stage->args.out_frame[0];
 		err = add_capture_pp_stage(pipe, me, in_frame,
-- 
2.30.2

