Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AF4A33
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730942484; cv=none; b=mBBO+1EWKgxN/s5AYEFiFy8v0+ZelfqR2YRFYxeyG0GBP/VKMB1+f5nX18V1oMvctELcz8b/jmhFmfeYCUY3MlIf7s5J4ZJ8o2aLlqjItMKPK//tus88BjyFV23RrarNo+owMT5tjOWYCMMfbRELFRstBvNvh2mdHUEw/v72h2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730942484; c=relaxed/simple;
	bh=QvZky2T40wp6AqKdgMoAhK1oEDqU/ujLzvX+/avy5KM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JEg7OBTCw58obqw5ERTbLWrsv64XmaVkaRtDj8Azpx2M3tZxNRQhn7h77rS28Q/ZRXxqbWerZ7PpAw4j283FOCOm5DLZnkQG2Bp+M8NavJI8/ZCoVR7Tz5hQf5ANIBjdan1LfOF2/FP4REG4YRHGbl0IcMqZMn9Y6Qq0/QT2JI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XkPNf0mspz1T9rq;
	Thu,  7 Nov 2024 09:18:58 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id D67941800CF;
	Thu,  7 Nov 2024 09:21:18 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 7 Nov
 2024 09:21:18 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <lars@metafoo.de>, <Michael.Hennerich@analog.com>, <jic23@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.baluta@intel.com>,
	<shubhrajyoti@ti.com>, <linux-iio@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
	<judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH v2 0/2] Fix phase range check in AD9832 and AD9834 drivers
Date: Thu, 7 Nov 2024 01:10:13 +0000
Message-ID: <20241107011015.2472600-1-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105140359.2465656-1-quzicheng@huawei.com>
References: <20241105140359.2465656-1-quzicheng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200012.china.huawei.com (7.221.188.145)

Hi,

The previous link is: https://lore.kernel.org/linux-iio/20241105140359.2465656-1-quzicheng@huawei.com/T/#u

This patch (v2) addresses an issue in both the AD9832 and AD9834 drivers
where the phase range check allows an invalid value of 4096. The
condition has been corrected to ensure only valid 12-bit values (0-4095)
are accepted.

These changes ensure compliance with datasheet specifications and
prevent potential issues with incorrect phase settings.

Zicheng Qu (2):
  staging: iio: ad9834: Correct phase range check
  staging: iio: ad9832: Correct phase range check

 drivers/staging/iio/frequency/ad9832.c | 2 +-
 drivers/staging/iio/frequency/ad9834.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Thank you for reviewing this patch.

Best regards,

Zicheng
-- 
2.34.1

