Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC171F80B1
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729019794; cv=none; b=j5lBq85C/a5P9y4yW2DZEG14wHfducTtVkiM9xWd2YDFSIWh5tfIvYTE2sCa8XPd4QZCLzWD72djS3EMdlMm9aAXPT7p8VwJE8n+nFo3m7/8BN7FaGf7I1zpS90yuw3vwD7UnMLSySy4KCy8HACCFgygs9/R89WrL/vVQhdta6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729019794; c=relaxed/simple;
	bh=6P1lIeVHvgYk8kglhv6+91KzxfIvaZhTA9OGkFzQjB4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VVW3zJV5GZ2wR/S07TL9vaZ3+y3OS1QBAj+kHLEV56tZdM7G/XZ/Jr9yLpS74gLMfJZ1PMTzm/Io9fKlLRaDovfGh94FsiccMug+/EeoFdFQ3+T2vwOp2HBAhhjj1QA4v2TYr4bMkGM2whX0avYbzRcidvtnlt5ndpLuS6qYfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=iOMP+YC5; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iOMP+YC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729019785; x=1729278985;
	bh=6P1lIeVHvgYk8kglhv6+91KzxfIvaZhTA9OGkFzQjB4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iOMP+YC5PVGLXZz+cvXfQuYZfC9JPFvDM8k0iSxVmgBp3Q+NVBGYYLuSCf6LNI9oe
	 GR/lui8+0WXH2dz/RhltySNAjE1cM1O7xKs8U7r8PxwBTaEBAMqx+/hUpk55Vkvnpa
	 zdYxI14zZBojqETl2YDBFXiDg76caBmD+vZ0O7eo9OmIFXZPg0Jza2/XmiZMvJnY+f
	 IRT4S4xPYUD0ZnF2utjzJ6+AI75gfeV83qtJJzAcgShqTFO5+1wsLIhedMi+rfcf+Z
	 IVZ3NS0hrcJjcUSoqZXnE55QFPcM6z3gm+PW/7gKcMYNXF5OuxUZVmM7W+LItCNRDS
	 TFwgjCFj9fXwQ==
Date: Tue, 15 Oct 2024 19:16:20 +0000
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH] staging: gpib: Add TODO file
Message-ID: <20241015191522.14713-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 1bcc425850591257bd19a8b7cd581287ac04306c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a TODO file stub for the gpib driver.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
 drivers/staging/gpib/TODO | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 drivers/staging/gpib/TODO

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
new file mode 100644
index 000000000000..734eab691924
--- /dev/null
+++ b/drivers/staging/gpib/TODO
@@ -0,0 +1,5 @@
+TODO:
+- checkpatch.pl fixes
+
+Please send any patches to Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+and Dave Penkler <dpenkler@gmail.com>.
--=20
2.34.1


