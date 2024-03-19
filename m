Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD345946;
	Tue, 19 Mar 2024 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710828288; cv=none; b=bpOzPRUvbnFAzuQyf08GhwiCEwnJv4/5dJn3mMN1KfJeWIv8W3bolaY6DLy7H/25UFU7WC+pUsFf0C1+d3sya62nP+OFxuwYUaBGCfw2MEH/J2SvMaGy/Uuw/1DOaFDCI1ebzafGWEfCf5mBgloSErXjCeIvoR1pKPO65B9ZRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710828288; c=relaxed/simple;
	bh=tQvXsniKwtZ0PeKE/Wxl4zOW+IREK9GLuyMiAOZl5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OX5QGLWzyJAaImfba8trU4fePSJF5k2nTbBGbxjgEcpzzXp6WW/pvx18ngbqB14x1eJwjPXXv9xMec8W2tHikOdMoeehLITqJWC/JpacLS7lLgd7W/CNhusLF1n0G9JTGm9LNscaQUvihi0eiPekaZB3Yr2S4+sgqLiaFWIM+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdqMUi/o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdqMUi/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710828287; x=1742364287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tQvXsniKwtZ0PeKE/Wxl4zOW+IREK9GLuyMiAOZl5I0=;
  b=TdqMUi/o3IGqS5JnHmqZmoocOq58kMpYm25l5RcaXSF3FBEYMSCucDiC
   ctxsoE/YWoioiGMx7Z6tEHhMziDlN7NwwYucXy9kDfJ9WY1Ap6l3K2V8Y
   D321zoriDA7SJnG/y65uB2b15y75HNSsRBWQ8oHZpABdjX4GT9wvcT3QZ
   9jWA+u1Vl3CIimTvonwlAk/w0ETbkSBxvXjx1K+Y3D84Osm8CJpMrTDP2
   sTNrJsDu9ZiU4cRqMuQtmeJVP63vpspSCBySAsXSY79j4nSdI+evHDZLm
   PROpxNq7OJElalbgz+zpqiUVMfnxd6RYozPBOBXo+x3cVJ5kNMgHw6mHb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9478290"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="9478290"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 23:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="18280558"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.213.26.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 23:04:36 -0700
From: "Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2 0/3] Trivial code cleanup patches
Date: Tue, 19 Mar 2024 07:04:34 +0100
Message-ID: <6485785.DvuYhMxLoT@fdefranc-mobl3>
Organization: intel
In-Reply-To: <cover.1710703217.git.ayushtiw0110@gmail.com>
References: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 18 March 2024 20:54:09 CET Ayush Tiwari wrote:
> Address different kinds of checkpatch complains for the rtl8712 module
> to ensure adherence to coding style guidelines.
> 
> Changes in v2: Checked any possible reuse of backup_PMKID_list
> manually and rebuilt, rebooted the kernel and loaded the driver
> with modprobe.

You have not made any changes to any of the three patches in this series. 
No changes in commit messages and no changes in code. Am I missing 
something?

So why did you submit a v2 of this series?

Fabio
 
> Ayush Tiwari (3):
>   staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
>   staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
>   staging: rtl8712: rename backupTKIPCountermeasure to
>     backup_TKIP_countermeasure
> 
>  drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)




