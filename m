Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB970
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 02:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BWOAH
	MeQs30p5Lf0u4BCTTaRk9brnPdDjMlfsEuvWs0=; b=TC99jUw8754ppa5497M5u
	2ZYbY2drQlqdresS75vy+Aq3eCXhwCcENg84OkFgeuVMb58pzzU0iehH50fq8Kda
	uhxdBE20CwxKoB7kz6H/KFAHwXyFlNVLLcWNvpOOfrGKp8FEIQJ7cCETuwalfDji
	wJ14v5h/aUB8e5nr5jZ/Qc=
Received: from Wanjb.localdomain (unknown [36.152.145.182])
	by smtp1 (Coremail) with SMTP id ClUQrABnb8+VG6NgxVbOOg--.58114S2;
	Tue, 18 May 2021 09:42:46 +0800 (CST)
From: Jiabing Wan <kael_w@yeah.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jiabing Wan <kael_w@yeah.net>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: wanjiabing@vivo.com
Subject: [PATCH] staging: media: atomisp: fix space and code indent
Date: Tue, 18 May 2021 09:40:07 +0800
Message-Id: <20210518014107.81213-1-kael_w@yeah.net>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrABnb8+VG6NgxVbOOg--.58114S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF48ur4UGF1UCrW7uw47XFb_yoW8Gw47pF
	W8CF1ktrs5KFyYv3Wvqr4UZF15Gw10qa1UK3yxGwn5CF9FvF17Xr4293WrJw1jkrs7u34U
	ZanxZrW7uF9xZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jov38UUUUU=
X-Originating-IP: [36.152.145.182]
X-CM-SenderInfo: xndhzs3z61vtnkoqv3/1tbiBRaW2FsU+yqH5wAAsj

Fixing the following checkpatch errors:
ERROR: space required after that ',' (ctx:VxV)
ERROR: code indent should use tabs where possible

Signed-off-by: Jiabing Wan<kael_w@yeah.net>
---
 .../media/atomisp/include/linux/atomisp_platform.h        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 8c65733e0255..56df5678efc5 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -241,10 +241,10 @@ const struct atomisp_camera_caps *atomisp_get_default_camera_caps(void);
 #define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
 		     boot_cpu_data.x86 == 6 &&                       \
 		     boot_cpu_data.x86_model == (x))
-#define __IS_SOCS(x,y) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
-		        boot_cpu_data.x86 == 6 &&                       \
-		        (boot_cpu_data.x86_model == (x) || \
-		         boot_cpu_data.x86_model == (y)))
+#define __IS_SOCS(x, y) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
+			boot_cpu_data.x86 == 6 &&                       \
+			(boot_cpu_data.x86_model == (x) || \
+			boot_cpu_data.x86_model == (y)))
 
 #define IS_MFLD	__IS_SOC(INTEL_FAM6_ATOM_SALTWELL_MID)
 #define IS_BYT	__IS_SOC(INTEL_FAM6_ATOM_SILVERMONT)
-- 
2.20.1

