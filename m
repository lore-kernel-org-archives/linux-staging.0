Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1439E181
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939696; cv=none; b=pw5Hd+L6elvelWzWyacOdxoKYzrfpirMVTQ+BHXWuvM3D5hGodEj7Fr50r9eZ8lQrLRuQ/24MI17VgykzIVGo921pAgs7pB9s/jXajHt1WSdeXvWjelOMlH7J/KVwDQiS+igK4yOHjWWQPX86wah9rPCBVRoVRtmed2QjqdZRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939696; c=relaxed/simple;
	bh=hsVyNBNp2mvXvCGlnIBMYBWPfEKLcTwW4qOq8JVV/Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJoLCQ4mdYIx9pr3qE25oET3JvSF1hKa3f4XaIyr0Ifrytgl391+Zfp/b/Kf8Bzaz4W5RXHBHYTdxhxw4gYdLWadmujbTx/gFdUyx3fKokov7nJ5WDTlsXPN+ZuQO9qcEH1hhzJNIpMvFFu/xaHRPg70izXZjWKQhzA8hLBLGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t422M83R; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t422M83R"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAQfwgf0jcdmilY/xPuYTl1wRBpyOp72+1AAY9exhQM=;
	b=t422M83R5QmpJLb79WTcXHejqJ3wCRUuhds1SIYeeN/dvdJScVH9W6JAMA2B2le4nEr043
	1Dz79ZpOHLyIREklRn+MbsxbFi+XJQ9s6c68cMN6zH+PUpRRTmPOEbN9VQCRsPvk5sdLfC
	X4C8jQEdaYsbPqHpxSvmXjK68gB1hos=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 03/21] staging: rtl8723bs: remove unused MAX_PATH_NUM defines
Date: Tue, 24 Feb 2026 14:27:30 +0100
Message-ID: <20260224132748.12336-4-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Remove unused MAX_PATH_NUM_* definitions for other chips (92CS, 8188E,
8192E, 8812A, 8821A, 8814A, 8822B) from odm.h. Only MAX_PATH_NUM_8723B
is actually used by the driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/odm.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 1c929d88e596..38830552d5bc 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -202,14 +202,7 @@ struct odm_rate_adaptive {
 /*  */
 /*  Declare for common info */
 /*  */
-#define MAX_PATH_NUM_92CS		2
-#define MAX_PATH_NUM_8188E		1
-#define MAX_PATH_NUM_8192E		2
 #define MAX_PATH_NUM_8723B		1
-#define MAX_PATH_NUM_8812A		2
-#define MAX_PATH_NUM_8821A		1
-#define MAX_PATH_NUM_8814A		4
-#define MAX_PATH_NUM_8822B		2
 
 #define IQK_THRESHOLD			8
 #define DPK_THRESHOLD			4
-- 
2.53.0

