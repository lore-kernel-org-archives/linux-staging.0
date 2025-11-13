Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C92EB5B8
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763046187; cv=none; b=AYj2or3Pq6Jy4n4Qlknz9cKMWCJ9ETvAgQ+jgm272k6NvtdM+12uqsOoqiOzATpSDi9miXBLeYwr9yUd4HE1i+vcOt3ssEgvcp/6RCi8Vcs3JcuSVHl9m7rm55AJ9Vnx7t/X4UigabOBh6RSUFsqAFEMJ72yibinMu47NTEIHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763046187; c=relaxed/simple;
	bh=VVg62TqQIJ7Evijsdq8qdbXdEeiYTcr6am16uCHXNkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJNs3P0UQ2loCbCRufLqVPdR19FVKGB2t6ZPeFXr8yE3DvfXGJMDBgtOtd5pBLVxpJBCnnLdx9nOi/hWjpaGDjDHa56UyRnMS0Q25BlPw1TfKYR67FxXKDJrFcs+VJ9fasX8AuLDX4FW7QSHZkBDavtpil23H4+KZCinmtyu6lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKIkRdJF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKIkRdJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046186; x=1794582186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VVg62TqQIJ7Evijsdq8qdbXdEeiYTcr6am16uCHXNkE=;
  b=GKIkRdJF/lnnUtrANaYqzAFoks28V6fm5fpRB0HywTXVUnew9ph+DiDU
   Gl0QIedgH4++QElkKWmHRleHVGaQ+LKdrsm1nm95M4Kfy4RjTI7JbvG0P
   6wIkCXyUAgmkemRzX8JgAbX3qCGpdsLyk3xxTpXsJL93OnPZsqsq10lEx
   Bt4hBIw3NggrLdsJCtZk7C8v8dxyotcIl50sh3ABzJXRLXQmxQwwqbdid
   FIKnEvotDVIJcWIzXBbPfENE7XHWQvnZB66ROFGKvnZOtLT7QqBSPiU5t
   6uT6YW9jW7p8hjDF/zwrfjiMbHVkk1YiYCEXE3eOUy9mcrePNq68os1kw
   Q==;
X-CSE-ConnectionGUID: 6xiDVq89SheaqWLtcxL0/g==
X-CSE-MsgGUID: E+1dZ1o/RxmPkEORtonzLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65054453"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65054453"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:02:56 -0800
X-CSE-ConnectionGUID: JYWYU7QLT9C4XjxLiDOJvg==
X-CSE-MsgGUID: nn8IkTNTRWuP0CZXVoFHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="220325080"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2025 07:02:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 53E72A3; Thu, 13 Nov 2025 16:02:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 13/21] mmc: mmc_test: Switch to use %ptSp
Date: Thu, 13 Nov 2025 15:32:27 +0100
Message-ID: <20251113150217.3030010-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use %ptSp instead of open coded variants to print content of
struct timespec64 in human readable format.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mmc/core/mmc_test.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index a74089df4547..01d1e62c2ce7 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -586,14 +586,11 @@ static void mmc_test_print_avg_rate(struct mmc_test_card *test, uint64_t bytes,
 	rate = mmc_test_rate(tot, &ts);
 	iops = mmc_test_rate(count * 100, &ts); /* I/O ops per sec x 100 */
 
-	pr_info("%s: Transfer of %u x %u sectors (%u x %u%s KiB) took "
-			 "%llu.%09u seconds (%u kB/s, %u KiB/s, "
-			 "%u.%02u IOPS, sg_len %d)\n",
-			 mmc_hostname(test->card->host), count, sectors, count,
-			 sectors >> 1, (sectors & 1 ? ".5" : ""),
-			 (u64)ts.tv_sec, (u32)ts.tv_nsec,
-			 rate / 1000, rate / 1024, iops / 100, iops % 100,
-			 test->area.sg_len);
+	pr_info("%s: Transfer of %u x %u sectors (%u x %u%s KiB) took %ptSp seconds (%u kB/s, %u KiB/s, %u.%02u IOPS, sg_len %d)\n",
+		mmc_hostname(test->card->host), count, sectors, count,
+		sectors >> 1, (sectors & 1 ? ".5" : ""), &ts,
+		rate / 1000, rate / 1024, iops / 100, iops % 100,
+		test->area.sg_len);
 
 	mmc_test_save_transfer_result(test, count, sectors, ts, rate, iops);
 }
@@ -3074,10 +3071,9 @@ static int mtf_test_show(struct seq_file *sf, void *data)
 		seq_printf(sf, "Test %d: %d\n", gr->testcase + 1, gr->result);
 
 		list_for_each_entry(tr, &gr->tr_lst, link) {
-			seq_printf(sf, "%u %d %llu.%09u %u %u.%02u\n",
-				tr->count, tr->sectors,
-				(u64)tr->ts.tv_sec, (u32)tr->ts.tv_nsec,
-				tr->rate, tr->iops / 100, tr->iops % 100);
+			seq_printf(sf, "%u %d %ptSp %u %u.%02u\n",
+				   tr->count, tr->sectors, &tr->ts, tr->rate,
+				   tr->iops / 100, tr->iops % 100);
 		}
 	}
 
-- 
2.50.1

