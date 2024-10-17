Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B513219CA6
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192130; cv=none; b=ocnOIN74sOjzmTYsxdqu/oInR368qM4iQU6ehzEIJY0UNkofZXwkwh8RSarS/GoxYtT8V3fJDeHKnh/626Hjgx7NGrsqqDR4zL1eV2AwWtkJqhTP2Pq8VdqQl707BWkFks3fn5FTH9MgzwfqnRFTKHqUY6c8Axqh8prEHK1sUSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192130; c=relaxed/simple;
	bh=XNbrH+PzGJnR1/M+mgzMDxkoQIDaLcgkvgT5zLemzak=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f6fVkJRKcOkXMqjBrIJ1bArqe7Zg+46woi4zIQQxuK+Bo7+o90R6RbGXbsnepNAqXjJCKaite4qEkXky1TeVjWVtKy8ATMqCWo7FdxJxcRCweAhB2HXLI3CrmuWjHlwvEXKKLzBBDA4JrTHymTGoQ42dy4XSsUZDJCiOw80CEHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=M+zAVI2M; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="M+zAVI2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729192123; x=1729451323;
	bh=O++mAf3y6UG64ocUCmqLlzP2zNaHJlUb0xjtjNehFU4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=M+zAVI2MV4KODpU0wFeFKtpOCP0uvlvK5FlWSEqXhXZW7kYwsyKnp9brFQf+7KmMQ
	 c15dWoTly7xa5pD3/PD6ttABQKf1CIuJA8RjJSZZSbKKfJ1VhhkktPEz8ZlFhJ1quW
	 vaiPv0oTH4kjFun8/2d8GEB0wjuB2M4E2M19pWKgUW5Y98d6Nu7s/w6MrR1JcwBsc+
	 CYTJrPWmi50OvRPvRTLvNMNVOhs6bMnIihwHcLKLEwEUj1CfEn9LCa13KRUy6k6nDD
	 gDTZ9Dzgg/XE+p+BWx9ISMCsK7CLYJX/D63AmFLegkpj3Ep6eBlwVOZ1xVa0SwyBJX
	 IQBsqCIy/kwAg==
Date: Thu, 17 Oct 2024 19:08:39 +0000
To: gregkh@linuxfoundation.org, dpenkler@gmail.com
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v3] staging: gpib: Add TODO file
Message-ID: <20241017190732.82176-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 6bcbac51b5f7e11e3abe22314cf4f7c29781cef9
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a TODO file for the gpib driver.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
v2: Remove maintainers from TODO, as they can be found in MAINTAINERS file
v3: Add things other than checkpatch fixes spotted in the code

 drivers/staging/gpib/TODO | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 drivers/staging/gpib/TODO

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
new file mode 100644
index 000000000000..bf2c39742548
--- /dev/null
+++ b/drivers/staging/gpib/TODO
@@ -0,0 +1,21 @@
+TODO:
+- checkpatch.pl fixes
+- fix device drivers that are broken ("depends on BROKEN" in Kconfig)
+- tidy-up comments:
+  - there are some "//comments" and "// comments" scattered around
+  - sometimes they are misaligned
+  - sometimes "// comments" are interleaved with "/* comments */"
+  - multiline comments should start with initial almost-blank line:
+    /*
+     * Good
+     * multiline
+     * comment
+     */
+    /* Bad
+     * multiline
+     * comment
+     */
+- resolve XXX notes where possible
+- fix FIXME notes
+- clean-up commented-out code
+- fix typos
--=20
2.34.1


