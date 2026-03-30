Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA803C9428
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870986; cv=none; b=qPMsBNBdn+N9wkek3jKx9r7PvuKOebQp1Ll07mRH/f6ZT07zZY6ay1nkcQ0AifyWKrfLuNUEKfEbAq/BHEw0Hc2Fdgk5m3p+TugW6GIEd3FOlTID8CH+fymMJzZtHVVcYM3vSjaRySkV/cBveHAcpRqZc2iiFQARY6ZrPxHyEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870986; c=relaxed/simple;
	bh=jEz+A8RXM3RxYQ3BnsrMoOD9X6b/x9O4kEVKZlLO2/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=np0J1lapiJVjmn0Eo2N9T20URbdatfQnJrJY/T6+5bvcjmRFlRb9xPPsXPjdezFaxY62csDhTlPCM+zeuGB9EQ8AdEJLwtq9AlDYYE7VskS2U5/fnrYghxolgVlwmWJnnnSR6frbnOPL4Ah/PvNtfLgnEm/Cl5jJufALx2O0jX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Vj0yVI9y; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BeCsPxGu; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Vj0yVI9y";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BeCsPxGu"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fkqBH5FltzB0rW;
	Mon, 30 Mar 2026 13:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AB7FQ0GQenDHAR2JhKg6f5Sw1JgSSKHMvxOZ8zJJ2Dg=;
	b=Vj0yVI9y/vLvn+7VSkytlQqsjqDquoEB52uMcOxRsWaRCIGlpVsGmNsEqeRJtBYJctxC5r
	Q4H/TgEyBgfwxEMMxaLqF9scC7WTHbTSzETPzK7SmH26Wf3ImFVcWlEGCV+4fwaVZa5V/C
	1+xMY/HnAwQNPgJ1gMwwl40/JDIwUJFmGASnR1vfWfw51OpQfsndyC5wopg0d1c4E6hYMg
	2zSEjRa09azRNjbXKF9EbplJO8AJF2aWxabd9Bpw6y5lA1GAazy7skpFq0eVHHPe5ZgaU5
	0gGl85ve08Bl0TbXspV/YHB56QlK5c/r+PGl7e0/CcL3icfh67q6XNjR8ObmbA==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AB7FQ0GQenDHAR2JhKg6f5Sw1JgSSKHMvxOZ8zJJ2Dg=;
	b=BeCsPxGu7VeHhCu/lIMkxXFoXCcgBzqtKEXDNf7ciIRMWIPnQkBkksohjvsRdo8RusOV7F
	jVuuGzvT8JdXd0DzqjEPniXKRAjwNhNBJcgeeuU3UWDdWArJRw+jCzgKwBGiwswaphuJV/
	N0Y/Ngv84d4xgrfZ7CJu1XjdgORstc580UNew402f0G375zoQFwBNvDOA2OlPtVYazw3sc
	5KTgKT4KoudnoRep9shMaQrRrnD1rZEV0zFGDnk4RYLNp87lw0gyc1iea59kBGMOfDX5FN
	YqAwBWjI59sAfRPJxndmYlFeI2tnw/fvuOrhcdSTIKtX4E6d/OMchD8wEMqYnA==
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH v2 3/3] staging: rtl8723bs: remove redundant blank lines in basic_types.h
Date: Mon, 30 Mar 2026 19:42:32 +0800
Message-ID: <20260330114232.91431-4-mashiro.chen@mailbox.org>
In-Reply-To: <20260330114232.91431-1-mashiro.chen@mailbox.org>
References: <20260330114232.91431-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6bec80a14fed76e20e1
X-MBO-RS-META: 55xkowh3daq1bzoj9ew7x8u8otbmrkg5

Remove redundant blank lines at the top of the file to improve
code cleanliness.

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 2cb6d24fdb1b..b6b1afaa9ab8 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -7,7 +7,6 @@
 #ifndef __BASIC_TYPES_H__
 #define __BASIC_TYPES_H__
 
-
 #define SUCCESS	0
 #define FAIL	(-1)
 
-- 
2.53.0

