Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5CA3483
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 12:04:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BB7F61050;
	Fri, 30 Jul 2021 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627646668;
	bh=I+xXFURVvAptYJKMr5PgQPz3hcAQV3Y/2tYQl3FYyKQ=;
	h=Date:From:To:Cc:Subject:From;
	b=JHfwB6FwLpGQ9drtWZThGhtUg4RQ51WAwy+ZhCt3CGNpnKVgbnxpU9ZqQZX/olY4w
	 hCDIqH1lQW+FgN+mlwEczWMIFMI/0M9Wg/TWwTnEdsXowaUsid+pVlv5eUOGE87E+m
	 QeQC41QVj9NfXLgVaqQ9dy5YgiQs2lFTiRaqoJA2hLnElWan+6k4MUI8cg/jekpXXa
	 Lkr4Tqljzmv17u1RHoKEqoM2MJ431kUG+il+kQ/Bmm4FPFdZ9W/8yfniV80oGqlqiZ
	 bhw/5outBA439yrBPj8WwDa3GhByz5miL8PKgoGd/RJJDbZim5SfNufUnh8iatfZSS
	 mYyUH2HBLLz8g==
Date: Fri, 30 Jul 2021 07:07:00 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 0/2] Fix size comparison bug and use flexible array
Message-ID: <cover.1627646101.git.gustavoars@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

This small series aims to fix a size comparison bug and replace a
one-element array with a flexible-array member.

Thanks

Changes in v2:
 - Use flexible array and adjust relational operator in patch 1.

Gustavo A. R. Silva (2):
  media: staging/intel-ipu3: css: Fix wrong size comparison
  media: staging/intel-ipu3: css: Use the struct_size() helper

 drivers/staging/media/ipu3/ipu3-css-fw.c | 7 +++----
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.27.0

