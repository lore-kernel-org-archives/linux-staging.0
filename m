Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704513D27B
	for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 20:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484901; cv=none; b=TR6J99q+HEXxio+N4mL4fXdax1cN6LHlryvhLtEmKl+GHKZxTodfl9c/qxgnCh8+INMlOXvLYFYW6CSxEuU8bP+u6QKfhDNF1DU7s86RtKVbuUy904AisAHJ/5BwGh6qZtx3VhQnlJ5qcnO0tiqCrW1xZf82DJ7bUaiTBgn2Fpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484901; c=relaxed/simple;
	bh=fEezHZYrjEOkzCb8cPzaGdM5y4H+/KQdLqpJeQTIjVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmZ3efvfLPGFrUGdoSr9YxUxcI+Q33M3N+/tulaQx177Ja66TybrFhDpV1WNRs3ZC2SrhipLoCKiK6/n9M8AdrQALZQ66Jku+fYG5d1micet17LSxX6MRSxzssOm2NNUgwvCsLTgzPeNJOxCrK4hfEzX1Y5BvXAZBuY/3UpKdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIjp0lGr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIjp0lGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711484899; x=1743020899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fEezHZYrjEOkzCb8cPzaGdM5y4H+/KQdLqpJeQTIjVY=;
  b=EIjp0lGrvgFS+eS9hWpvGN+0l6NZgvgGnooVojgPT3ttdPLTh7VwYplQ
   x67mNI6B9WCDs91444c5LCZ5YT5l/lPobYdmC2r45XcF2rqMJWxvfzVeN
   SIRLEcBYDrav6ZmUG/hTVjhvD36A5jhONiO/pXTLd/o/zCrczSdtAvnmF
   C9uda3h8lPh5ZkHeN+tnOiawU//m053I8arO5nAdvNe+VMZa7Oq5BHs4P
   a5Ciw/OMh3/e3gKd3bttRViEJ7CNMeKMEha7hj5TbHmzU9YzHF5Qz2TqA
   mSyeH574UBrUb2UHo2a4t2EtS8afwbgaWCoxvlMcm+RWtHYG/sie1kIhB
   w==;
X-CSE-ConnectionGUID: 1fru7ImtQOq08czhPiJ98Q==
X-CSE-MsgGUID: IxjHaAFYTS2mJyXUcpJ2fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6500448"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6500448"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 13:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="937073003"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="937073003"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Mar 2024 13:28:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 21CB4228; Tue, 26 Mar 2024 22:28:14 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] media: atomisp: Replace open-coded i2c_find_device_by_fwnode()
Date: Tue, 26 Mar 2024 22:27:03 +0200
Message-ID: <20240326202813.1425431-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
References: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gmin_i2c_dev_exists() is using open-coded variant of
i2c_find_device_by_fwnode(). Replace it with a corresponding call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 80aa2211cdc3..b7c477280986 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -394,12 +394,10 @@ static struct i2c_client *gmin_i2c_dev_exists(struct device *dev, char *name,
 	if (!adev)
 		return NULL;
 
-	d = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
+	d = get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
-	if (!d)
-		return NULL;
 
-	*client = i2c_verify_client(d);
+	*client = i2c_find_device_by_fwnode(dev_fwnode(d));
 	put_device(d);
 
 	dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
-- 
2.43.0.rc1.1.gbec44491f096

