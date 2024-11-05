Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878961D88D4
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816104; cv=none; b=A/UXk+t03QUUhXFCYY67OuLnothpd/KwOXV0wIqD7u4wm+aUhpkOa1RW/Ug5AO7GlzG5bQBdg4f3mZgQSHOqapZtx5CDeBLrRW99gecYg1nCAccu20DY+s2oaF3+o2DJyjjJmOKzIrf/FVj3QvIpYxGKfO7QDXP8+C9GFWj/G74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816104; c=relaxed/simple;
	bh=u37A83b7u71UReUwZ8qF3KJR2fr9d/q7tVyBROUwb5A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MlRd3pUmcBNK3sVjuxHofNiIBrp6FPptudzsA9OReG6DElvm39Hs3xWbr+U7NiByztwXv/P/SLJQriwk8wJzh1gaQ8uqst3c2i57iz/4DTY4vPP8RlPD/uYiyY0IbB5nM6rbbiIrIoFU/C+MpRdEnTyO2aLvAvmQ4uz4JqI4oo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XjVgk1rbhz20rYL;
	Tue,  5 Nov 2024 22:13:54 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 425B518001B;
	Tue,  5 Nov 2024 22:15:00 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 5 Nov
 2024 22:14:59 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <lars@metafoo.de>, <Michael.Hennerich@analog.com>, <jic23@kernel.org>,
	<gregkh@linuxfoundation.org>, <cristina.opriceana@gmail.com>,
	<daniel.baluta@intel.com>, <linux-iio@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
	<judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH 0/2] Correct Phase Range Check for AD9832 and AD9834 Drivers
Date: Tue, 5 Nov 2024 14:03:57 +0000
Message-ID: <20241105140359.2465656-1-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200012.china.huawei.com (7.221.188.145)

Hi all,

I am submitting two patches to address an issue in the AD9832 and AD9834
IIO drivers. The current implementation allows an invalid phase value of
4096 to pass due to incorrect range checking. The phase registers for
both devices are 12 bits, meaning valid values should range from 0 to
4095.

These patches modify the condition to use a greater-than-or-equal-to
check, ensuring only valid phase values are accepted.

Zicheng Qu (2):
  staging: iio: ad9834: Correct phase range check
  staging: iio: ad9832: Correct phase range check

 drivers/staging/iio/frequency/ad9832.c | 2 +-
 drivers/staging/iio/frequency/ad9834.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

