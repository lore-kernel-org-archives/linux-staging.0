Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF5302CBA;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142005; cv=none; b=kvBEol4MgZF9WBX/VJCZiZ/CkE5CutICSA/4cpv6gHALWY2N+8goXyFo0Ofdv9ZxGxlkZxBXY6f3BUZPmIqb/skGZ3y82MNsSzyzitE3i13e8cOBPqDwFaMUVWEOwXqhy+KVRVXNWOL2SlSD+W91qCYdxykkTAD8xWr3OnNE8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142005; c=relaxed/simple;
	bh=pF7UD0tW3OiVIYQQAtFEz1D+vMdZQtxYsbSG8ztDW8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7LKM4bE5d0+A1PvZyGgVLvBTL3XMDsJ6X8osxgAtsCEdyPtMzNH7ZwGh/1DeSffKchQVhppFhcAS2gW1+Uxv3UuSn4L4O4K1WFKlCVzzqpBY6aueQHntaZxdzgxnAG3bGgW8JB6an9Wb5vmYY8q8Sz7MH1YZfHJOB0JONOunvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evEh4JGb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evEh4JGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6184FC116B1;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=pF7UD0tW3OiVIYQQAtFEz1D+vMdZQtxYsbSG8ztDW8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=evEh4JGbpMnbn2aVs+HC8xNCut6OqLhzxd5EtARXde89ocnEPMf3OMmYvMroDcoNb
	 +Hv0lvgzUYPCTGOHTImk4148xwrhMwIUp2iPICxfZdDFV8xh1+oPaoK38cdUwAP4Vi
	 g36fgm0T640tlNHB4UMCVROHe45p3t5TN9eWbNJPl6F9tFl+Rd2h7N2HJ5wO4IAE70
	 NJE7fYI/ze4nysZknUkwrn5/Ami0I6ADiaTVusX3JAVV0WG+ZLe7WkhHAYOHVRtYWE
	 lJRjENGMXqeFc1+UNU3IBFkSNgqfAy+kChKTWSrf4xlApjQOBeHxh8f56YxP2E+MAn
	 v4eQFtN3zmLvw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDM-0000000065f-0WMF;
	Fri, 19 Dec 2025 12:00:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: greybus: arche-platform: fix memleak on probe failure
Date: Fri, 19 Dec 2025 11:59:27 +0100
Message-ID: <20251219105928.23329-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219105928.23329-1-johan@kernel.org>
References: <20251219105928.23329-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to depopulate the child devices in case of late probe
failures to avoid leaking the corresponding resources.

Fixes: fd60ac585607 ("greybus: arche-platform: Fix boot, poweroff and fw_flashing seq with APBs")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/arche-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index bd069d75391b..7dcb33a6f2e3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -523,10 +523,9 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 	arche_pdata->pm_notifier.notifier_call = arche_platform_pm_notifier;
 	ret = register_pm_notifier(&arche_pdata->pm_notifier);
-
 	if (ret) {
 		dev_err(dev, "failed to register pm notifier %d\n", ret);
-		goto err_device_remove;
+		goto err_depopulate;
 	}
 
 	/* Explicitly power off if requested */
@@ -547,6 +546,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 err_unregister_pm_notifier:
 	unregister_pm_notifier(&arche_pdata->pm_notifier);
+err_depopulate:
+	of_platform_depopulate(dev);
 err_device_remove:
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	return ret;
-- 
2.51.2

