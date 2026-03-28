Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3EC30171A
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774708063; cv=none; b=ArgUoycl87EDbkC/mWw6yS72MXmdyUvyBlKlqwvaoV3a2GMUu2ApRZsiQcBl6mjOHddoMKdg0QWIaEcbXSpASqXp3D9tuay7HHEzCg03/y88ZPqSi2r9lZYZNRR6Wdg4tNANuD7fT0PZezyTP5RJj74wWHtV92t0Nvf77QF9xKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774708063; c=relaxed/simple;
	bh=SSgpsYFQl9oI9vPodhpmynCH+V6TW3YfRwpV/pR5BRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izNWkBG4NJbJIPJRvkkGGoU4WIrNGAj90Wq88VxoDIY9s4PIU3LCWMFG6GzTfk5JfweH3m64UNE5BajalfoXkOtSQ/Rox7gKcgmQTvb3eVzVR/2t2fYX/5xkaWyw0nUwOiDFGlvCtutToSX5W7b7vi2ooaPTasFZXqf6zmrYeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OeN3ICTF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OFZKI4YI; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OeN3ICTF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OFZKI4YI"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4fjfx04FmCz9yy8;
	Sat, 28 Mar 2026 15:27:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sYR3pSC6GSdsiUBkLsGbYTZXeVcolVuqJJvU2QxaOY=;
	b=OeN3ICTFf5lQX4/PZHJqGoofVBrhKi0bvNH3HZaxoUofYuQTvhwmeStYtHQi8EHbcAVCA/
	gXLujoq+hjxNixOTw5PPxP+ZyCA9HFTLkiARdH0fiaUP962+yir4cgJOpZKcDC2k4SX9VN
	8OMuxd1KYyXJlPpDtUVwjSCXGzC2LeNCh9EZkg+/ppXvjYB66t5BzNJ6r660qpbcb7Ka9B
	gmu6RzlmdrqJDr6U3/9LIkALGwi5zRQXxdOtOWF0cex5hav5m/4cmyNBskF9hIXX5GEAoE
	BzdJrvqx2GlhVGqh8OZAv5Yvy7S1jNQMzaEeAtJwB2FDEm+ij+/jzgxj1HXC/A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OFZKI4YI;
	spf=pass (outgoing_mbo_mout: domain of mashiro.chen@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mashiro.chen@mailbox.org
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sYR3pSC6GSdsiUBkLsGbYTZXeVcolVuqJJvU2QxaOY=;
	b=OFZKI4YIjUSoSgXM+eDAxFVKMLLlpQr5RTOdIM5ROBgJ55XdbSMJqIX+vjVpMECnl2ZZTy
	8rO/MIDDDBeZ/x6AKUXsdlQdDyMjNWBVbN1aTPgd3YpOXnqnHUZ1QU3UScVrb5uheoIuF2
	XcWAP3yeHVbp8rPzn68hJhpjwf1kzxiRpM62oc51Crbh7W5PSjutVzio0kGVMmdrAQlWtH
	qaBVjrwWFeJeIRttK+yMbHhBiZyYyVNn5440zl0bUlG0TyvAx7IuqKqyQQ19RRFtQKCoI5
	Y16yTx6DMFjjZUAt8Tbpa0YYZKWNbwi36Gq3w51demSVANBFQ7GN7yM7nY6/5g==
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH 1/4] staging: rtl8723bs: fix logic bug in WRITEEF4BYTE macro
Date: Sat, 28 Mar 2026 22:27:06 +0800
Message-ID: <20260328142709.330401-2-mashiro.chen@mailbox.org>
In-Reply-To: <20260328142709.330401-1-mashiro.chen@mailbox.org>
References: <20260328142709.330401-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dck3a8upczkmnxom37htemft53pge4kz
X-MBO-RS-ID: 4a1943fa46f5b98b5c8
X-Rspamd-Queue-Id: 4fjfx04FmCz9yy8

The WRITEEF4BYTE macro incorrectly used EF2BYTE for
4-byte memory writes. Fix it to use EF4BYTE instead.

Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 8adb95f9f..99b12c724 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -64,7 +64,7 @@
 
 #define WRITEEF4BYTE(_ptr, _val)			\
 	do {						\
-		(*((u32 *)(_ptr))) = EF2BYTE(_val);	\
+		(*((u32 *)(_ptr))) = EF4BYTE(_val);	\
 	} while (0)
 
 /*
-- 
2.53.0

