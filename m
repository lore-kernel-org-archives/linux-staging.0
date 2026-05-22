Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9843ED5C8
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450807; cv=none; b=VWTPlNIZLR/zxWnaB8dJiFT5AQTs9Zl+KLGfc+p/5hxC6ajzUb8XXlvVXNekfJTP93QCTtJWUrmDbCi7BTMnEzXQ6/+8LakWlDAwutScedBxbqqCdGTznUVpqZe3j1n45gmJBwYcQXtCiuVJCsJ90QccPAJiqZxhSVrCxmmpzFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450807; c=relaxed/simple;
	bh=jmZIy1A3BNoIDEfiFFj7yhCBcRQAHqemrZXK1zBJKo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iaQTGoporiHPOnhGyQThvNnAztT5lVbYknDYKAjB0E0bzDIqdsVElSV2XZwSxWqK63FHGFcVMmwCE8FXpKuZOQQ4hZSOfRSRisIO7z28TyZICl4KS/f4PMHlvEmDVX5g5evBhnUVPgFP5QVHo7urnt34zgt4BpkqEuJKchYM0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cfduzoO/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a+J5AkLN; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cfduzoO/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="a+J5AkLN"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gMNj14KJVz9vCq;
	Fri, 22 May 2026 13:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779450245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jmZIy1A3BNoIDEfiFFj7yhCBcRQAHqemrZXK1zBJKo8=;
	b=cfduzoO/J3g27G7HvYmg1O7ssJMsrWCme47B1+P0t4tXkDpMgQfeksDEaZNcicnRcyeQWP
	IWYWDq5kI3MUDqO0kkR8oq1KfovX+nb/2RcvZdd6Aw8HZxWo99pm6Di1+Ov8Eag88E7KkV
	BLUsAzk7fDBSv7RuykHg/1vFBzqxWdo9040ZwW95rAc8SPPaa9BJ1E3ygncNaVPS1rJnRK
	RWfQ3CEDVjpdcLKyO5iDuE3X0j1J9rrHgrSQ8Bx0uwwogJ+SQhG2cOKHvnw9puyrJov1hT
	SyB7l4hLVu3/l34+3E6ocbrbu4OHoTTSy1+eDoVSmTCX/2rcX5oEeyOwxmdWDg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=a+J5AkLN;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779450244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jmZIy1A3BNoIDEfiFFj7yhCBcRQAHqemrZXK1zBJKo8=;
	b=a+J5AkLNA8aCWNltCD3NU0rqjkvVmc5yfLsf33vbl/ImE/54wukJiRhsA3ZnM+2XdqNXMx
	RMCUdC9+7oWNXzk1E8wjFF4TtCy7Q2snVaWMmKDJqfBsg5mxK0tPnEq8hxrtcdEvo8drqO
	c2uT54Ml66lBCKylPksqJc4V9knn3QBye4jvWyQt1JYPunH7R6MrjjtmM0ACEn9x7GLPUF
	7trIwesjqzFEUgHptxwsbakyjb4kNIIff1oRQoO/dscu9ZknQlvVdxVabq/udPmPRmzt95
	vN1/B8U6RqDlqgnrn6aE6c6EZukC0Ee/XbuMhtfGvCYYrvekzk1D67agPSSWIw==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 0/3] staging: cleanup of sdio_intf.c
Date: Fri, 22 May 2026 13:43:20 +0200
Message-ID: <20260522114317.189368-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x71mr9nuycoinh4d4s8sioof68rsbtpu
X-MBO-RS-ID: d12600b1064e3c4f694
X-Rspamd-Queue-Id: 4gMNj14KJVz9vCq

did i overdo the split up?

[v2]
 split patch into series

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
