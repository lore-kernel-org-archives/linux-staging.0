Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CBC3403E3
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391254; cv=none; b=WgvxqQ5r8vdCW5yhg1e1uMWcYLcvnUDcqSKalN0FFoR8dUgRQTAe09idwBkhDha/WfE5HQktZW6/o2+zQ2/EEmPv+VoiOdljCq9oFTdH96h3LXwpt8CQ7TQ7dTKDCFkHk51IRX7RLuGdPMEDrcg/cCkHT35YMO3k7nx9kFdfqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391254; c=relaxed/simple;
	bh=q0K6xPitBfP2o3qY55auZdD3wDZ8n/mfadI4HL0mz7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A4qmgv74cZMUuC9vVR7SxzQ9ifMY5W1qSOOY5lxUiFQm0M6fo0XuqUduehPDcI6r1wFvy64xm9kgMo5b76LFsHfhjGlO1wVz/i8uQyefYa/1lp5y2hFVMcQRoO/kYPF48XFbk+cRn9IXalNFGMIv84XkjzKvBlcyI9z0QI/OtiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VW/MluUR; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VW/MluUR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785391246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXy/0n/B70zi/oeUOj36XGnf9SFOTN7QKouBHoyJw/Q=;
	b=VW/MluURZ/HTzac3Rit+3Fb4JbEOzMInJMU2n3U37rHoRdpbv0rR+7dH1MxA5OzSrsbPQf
	JuJYdXhX1UjgYoN/gjXmmbNQD48c0sANMY2hx9il6RtU32Xo1F8O9hhV2VCFG0uj2MnK5l
	MSFsuio2n88tAnoJqx9d+ft7wM1cOTc=
From: Yi Cong <cong.yi@linux.dev>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yi Cong <yicong@kylinos.cn>
Subject: [PATCH v2 1/4] staging: rtl8723bs: free HalData with vfree, not kfree
Date: Thu, 30 Jul 2026 13:59:57 +0800
Message-Id: <20260730060000.1944670-2-cong.yi@linux.dev>
In-Reply-To: <20260730060000.1944670-1-cong.yi@linux.dev>
References: <20260730060000.1944670-1-cong.yi@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Yi Cong <yicong@kylinos.cn>

In the probe error path of rtw_sdio_if1_init(), HalData is released with
kfree(), but it is allocated with vzalloc() in rtw_hal_data_init(). Freeing
a vmalloc allocation with kfree() is undefined behaviour and can corrupt
the allocator.

Use rtw_hal_data_deinit() instead, which calls vfree() and is the matching
deallocator used on the normal tear-down path. It also NULLs the pointer
and clears hal_data_sz, making it safe to call here.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Yi Cong <yicong@kylinos.cn>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a5ca7..f7ec09310ce98 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -286,7 +286,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 free_hal_data:
 	if (status != _SUCCESS && padapter->HalData)
-		kfree(padapter->HalData);
+		rtw_hal_data_deinit(padapter);
 
 	if (status != _SUCCESS) {
 		rtw_wdev_unregister(padapter->rtw_wdev);
-- 
2.25.1

