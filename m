Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1301A2DB7AE
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774708058; cv=none; b=tX68XNna2Xbtd4oP1M/kctrl+SKDPm90LTtiEnkRPtc4Qk6Vb3OgHOa1d/ThsSZufotYFw849Vz8S0HpAdc0ks1euDqtUTb8E/dM2IMwf4zTrDHv+QoQa2YOQi79+/bRTwy4ZIkVMI224Gs8nniPez5Bre5pkhfaxRvREBjyxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774708058; c=relaxed/simple;
	bh=OOMor0xggIdOXCzvvXCFGomspTv3174iR09Pscl17kY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnQQExro31pShgAEnRT8w1yU5znA9NpxIEHMoz8vMJHZ0KPXeMGHa1XiHFR2x2etOjeUFwTWONfuMECCH/XUaj7Jn0G+LI6BHLCncZXANlprnA+1joa3Rzm+fVb5YFLFRRn4ImjUvVR3Vl1gIIELZdtHkINSY8GtdyZDNDhSZ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xjDS4C+c; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lheyITqV; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xjDS4C+c";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lheyITqV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4fjfwx0WfVz9yhp;
	Sat, 28 Mar 2026 15:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=txm9DHUjDbSenJwkD99DXusS9TVKObq7ux7Z2l1BokI=;
	b=xjDS4C+cRCJzm831GRo2cLZnlHaWwOcO5G+zRkZQ45B4dIgfVXShWpq8P8SeWBv1i59g93
	1J2FSb/5W3pZeJKWNeYX7jJIXf7HdXP3XnD2UgFB3lEgxVJ3Hb41QM/yPT7E74hIUXG0pG
	2pB2I7tSeFkasy2ebxZ1xv+2KH5bUaVTXop9kH1ISSl2w7D0F/cPW0K7nOmk6DP1aDHFSp
	aaJVKwzg11+8/BH+MeV8za++yXUTPU6QXXqjWVIX3o4XMGtkdfzFJjOLuHKeeDdr5Anpy0
	GhoLv2fgYdrW+NwVJiI3gCmggnV2C1XJeU9D7WJmBjdzjZ7RHckdLPKCfsWZZQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lheyITqV;
	spf=pass (outgoing_mbo_mout: domain of mashiro.chen@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mashiro.chen@mailbox.org
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774708047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=txm9DHUjDbSenJwkD99DXusS9TVKObq7ux7Z2l1BokI=;
	b=lheyITqVxtbWuZngsSbOtI7UCQkGQtTWDF3rJimqkks6URG4Dh0yNdlZT5yoeFwiUZXYoY
	6wkjydG6/JQPoDDnka9zRXL+R83WL6aNy/lqsgiS8Ubd6UqKrw2Pfk4apMR2xo/nhlumJO
	XMgB64gaV+ldBeeSCR1JSCURZ4u0x/zrlcNVz5equ8jeappkc2ynh9k0Z5lpUbJ/5r93dZ
	PJYrwtUnTrRztn9mDaJNzvzBqkLZvQb96B8cEtrJId30NCmIX52jD3VyWZuBN1BE+NQeAS
	JNlZxhsGh2mmHwmBdENd5zT4x9i0Qm/vSOC3gFg5Cm6TU3m8+KyB7bzL1FJruw==
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH 0/4] staging: rtl8723bs: macro fixes in basic_types.h
Date: Sat, 28 Mar 2026 22:27:05 +0800
Message-ID: <20260328142709.330401-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: zoo9do1ophgusjyo89xnpn6c8gx33qeq
X-MBO-RS-ID: ab9654b918971574eb2
X-Rspamd-Queue-Id: 4fjfwx0WfVz9yhp

This series addresses several issues in the basic_types.h header
of the rtl8723bs driver.

The first patch fixes a latent logic bug in a 4-byte write macro.
The second patch improves macro safety by adding parentheses.
The remaining patches clean up coding style issues, including
unnecessary do-while loops and redundant blank lines.

Mashiro Chen (4):
  staging: rtl8723bs: fix logic bug in WRITEEF4BYTE macro
  staging: rtl8723bs: wrap complex macros with parentheses
  staging: rtl8723bs: remove unnecessary do-while for macros
  staging: rtl8723bs: remove redundant blank lines in basic_types.h

 .../staging/rtl8723bs/include/basic_types.h   | 26 +++++++------------
 1 file changed, 10 insertions(+), 16 deletions(-)

-- 
2.53.0

