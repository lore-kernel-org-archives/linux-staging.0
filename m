Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61438946B
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420609; cv=none; b=VfnRP0uyT/NKclV/HnJAHMqMGuehIXpgpxv+0Zt/Lgq6vbitsYzDoIHRVORDsUV9G8rEfgz76JdOo/8XfRC2iTIbMNpAnK7dTKE2s02vKw0I8vE94D7QGnLKeR5nwSkDsnk2kkPyfv7sFI//6E/RFL1M+/s/dEwjyo/ZozJC9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420609; c=relaxed/simple;
	bh=R9JPcdSkxjUjPiczCM6PEkkptw5NpSGYTzAh2h9ZXao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zu9g+osCq2ir/bH1MMjUR8FbKOXj8Q4qbxAvVhhjejxUrxebXV++DnS0r92+BfHKPvmPuXMI565B6dY5fy0oABF6jeribU162T4jk27QEal21iMIN4NcbVHiaO5Lfh79uXUKFKRUOARyUjFiAVkuZ2NxvC4MnS3IwNv9Z5ugkhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fg85HO4m; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fg85HO4m"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gD3wD52Wrz9v0J;
	Sun, 10 May 2026 15:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNRKEzICD3s3nBK0vsul06EE6jMwtOUTS9cykgItROI=;
	b=fg85HO4mbg+xmeiR8r1fh7qsfReMZ+IusgjfYCLFrV6S1SDcuKFSe9UZlrKzma0udcdndB
	j2Cl4tTEA3boYZaQRuYDsidK7rBIfOffSNqy6htwonkUyMM6uKSHyY50q3pFt89AAn7ACN
	M+1F/bsaxxAiRVYNpblGINkkMYRnD4szsG02Z5X3CdmNwZem1u+6rTWuAaT1GwsqvEHvzB
	5Yjv8eEK6x8ggoE0bTlt5iE38MgRUc23OMCyfM/y7hGKsYg8nyyVgifrdL8f+IM/JVYNf+
	WjkWW7kDG94W+yarnyYIRYQeXeVd4CDYwKYkb2Jklh90HzOeAg+1cSf0+2aggQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 7/9] staging: rtl8723bs: remove unused RTW_MLME_EXT_C_ code
Date: Sun, 10 May 2026 16:43:13 +0300
Message-ID: <20260510134315.64295-8-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d37b4be50b231b81ee5
X-MBO-RS-META: q613ebzdqudxy41fwij1dmrg6877khrc

Remove the RTW_MLME_EXT_C_ code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index b37d08bd5a59..d64e533a63c0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -705,9 +705,4 @@ enum {
 	MAX_C2HEVT
 };
 
-
-#ifdef _RTW_MLME_EXT_C_
-
-#endif/* _RTL8192C_CMD_C_ */
-
 #endif
-- 
2.47.3

