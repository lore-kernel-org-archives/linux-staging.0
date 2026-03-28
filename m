Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ED033A708
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774708068; cv=none; b=KNC4cvb5HKrc4u2jvYtmrCV4ltTaPBeqdzJpOxVJp5tPF8mt6c3CMAxDtc2NmkwT1Qm8LxX60yHqmoQyjjNXWUanuFhzakReMpMD99G3aGjQS/ngTdxlRvYyVhFJW6L0a5Puc24TnR5nJZjJU/FNPSGzbKGRk7ekgabW+Da6uM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774708068; c=relaxed/simple;
	bh=C/y3WpQHkLNjSBiE9nuI5zQHG+PNP95fSQ5EYjqk8t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hzuc3IrhRd+rD6uA/D3FcYYyx4PRG1TVZzAsisEsmxuXfoMfcuT1PKMw4R2lAvOsRD+2BS9ofNct5UkCQ+6Xw1sNrMzGKBbToe7FrDMrrZxPOUsjMAAC6eOIZefbcOjdhoIWHdnT0NHup4ag3TngJE4tKsiRow+mOD4KH+om72M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eoNaEt0q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ajx2SSI3; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eoNaEt0q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ajx2SSI3"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fjfxD48vbzB12J;
	Sat, 28 Mar 2026 15:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIJ8gAOv3X3ydgg3wB+o5FfaZ0bdUfazrzhRlXsP7Po=;
	b=eoNaEt0qHVYBheDsiJwt/dxtTcsNMtbx4DvtbQmPPhlAHWd5h18Z3SmzRyC13nTmCWlsER
	3ZUHh6ZpRSTEUIZR0gG492Thh5e7LpS7CM6q5a62N3I0crwT8xPRlZZavm7PzU8GmwNo0S
	p2p63Oo3Mfoxq1EjB1PwzvfeStZ3iB84vRSsBm/3uq5rujASjfZe0RZo5VwSXXXI52tyXh
	AVVDDMcQCoHKl3mnRxWc3EWK27MeyprVzRl+dtCMg3p3l3Js6T4Una8DWPs8c1tgsuA8hc
	7SK93HeP59ds1uRkW+3mWtLqBB/dmyAz/xu71UJPrvk9IH38fyTdFg14FnvkSA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Ajx2SSI3;
	spf=pass (outgoing_mbo_mout: domain of mashiro.chen@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mashiro.chen@mailbox.org
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIJ8gAOv3X3ydgg3wB+o5FfaZ0bdUfazrzhRlXsP7Po=;
	b=Ajx2SSI3ClgtZhcgWlWz2P+5HOB6dGPuaHoD8OWeKEsZYFKclo7Tk9+rwiy3R9BBoa2eO/
	Z9vZjPhweYDkMZ1znmQGADuazsLUytN6QxNm8zyMpXzn3QESltamt7TEDO0nTM1sL8IAKn
	SvdVQi35xaFuRSfFOPdYnKOM0IjhhFD5tuhUfSW3pwswi5I06yvWZliPbABBkw876bPGjo
	7v4Acf6KjocCcXOqiACu7xFmUnMZawThI5WaKLlz0VFio5oqd3kKBOyrMh+GpKFZ0jqVND
	iZDcWxqznaOKlpMpVpp/X8ICrBgjUhAuFiT63rxcP8X3SjXCECIgJD76CbxEJA==
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH 4/4] staging: rtl8723bs: remove redundant blank lines in basic_types.h
Date: Sat, 28 Mar 2026 22:27:09 +0800
Message-ID: <20260328142709.330401-5-mashiro.chen@mailbox.org>
In-Reply-To: <20260328142709.330401-1-mashiro.chen@mailbox.org>
References: <20260328142709.330401-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9ksnpofi1gjq884m64e5wkdgecj4ywyj
X-MBO-RS-ID: 035b7b932c4e304e86c
X-Rspamd-Queue-Id: 4fjfxD48vbzB12J

Remove redundant blank lines at the top of the file to improve
code cleanliness.

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 02965403e..304a17daa 100644
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

