Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DF134AC
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980185; cv=none; b=nwNBbQ3DIfKiw+gmXpBJNMxnxZOWX5bMAYK5xG9WBjfbby/4+RjReB8kH30X0eyyBcKPTfSHVATQ/AOGdYz2x7Xd42IHYz6rpAWb7XuZpYy/NoqY3gDyitiMV01+Oe1SH8IkBK77MG0dpU1qdqili+FuDzPQHVcLPdR0Xr8zcy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980185; c=relaxed/simple;
	bh=U9ySVQGsF++hy5ffNcEiWRzACgeH/62OX2EKO+uZK+A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FVQXYwHuZuf0u+kTOm+twpwfkUHY2SZ3vP6eVTU9klDLmNUmxo76DZgZooRVLMU4nmI0IzRqNsoPIyqIZADamWMlvnd9K7f4PfN2b24U4HCyjF1bh4yGldOGBU5k/DuihdxwH5ndS6BjUiiITIFr4E8Zy926rm1qtFHZIHkWqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ww0RV2q6Rz1j7ml;
	Fri, 30 Aug 2024 09:09:26 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 924CE1402C6;
	Fri, 30 Aug 2024 09:09:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 30 Aug
 2024 09:09:39 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hdegoede@redhat.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<topofeverest8848@gmail.com>, <hverkuil-cisco@xs4all.nl>,
	<andriy.shevchenko@linux.intel.com>
CC: <lizetao1@huawei.com>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>
Subject: [PATCH -next 0/2] media: atomisp: use clamp() instead of min(max())
Date: Fri, 30 Aug 2024 09:17:50 +0800
Message-ID: <20240830011752.603433-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Hi,

When it needs to get the value of a certain interval [min, max],
it is easier to understand using clamp(x, min, max) instead of
min(max(x, min), max). What needs to be determined is that min
should be smaller than max.

Li Zetao (2):
  media: atomisp: use clamp() in ia_css_eed1_8_encode()
  media: atomisp: use clamp() in compute_coring()

 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c      |  2 +-
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c   | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1

