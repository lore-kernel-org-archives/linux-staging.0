Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C62BFC60
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476584; cv=none; b=d4YlUrVQwbsEgdh3XJXSqDtiPsk4Ltqt6GqNV23a7oagJwDNt7s+VO+8MwUdHbIoR5RazEhOA1jhN8p7FvLRbI3WK6XMvB4dqhFv2x5fX8/TGJg/MY0IQwCiMUd68gZgzb1GcfMhop/g2/2aQJrZDJEXnbyqpkDDP41BagooJQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476584; c=relaxed/simple;
	bh=G0XjQmdkZgNrBC3fH6sfdmRHsf2v7Ho3vMSlx2Y/h4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pmjdM16LtdtRQnwqggyolbJPEp/MUMZtc6eOXuGDgG4g6V7ZXxXFI4cjLxrd7E3Spc5KRDFDAzD7k9VCmAbHn7LscdrLV5uOb5SpBoCWonztY7hSytNQjH64mGDE0TAGivqNeYTfmdmTROwzJ6AqbAqEHyS9ax/QvDopQf5w8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=q4BccPme; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q4BccPme"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gMZRQ5Zfkz9v4m;
	Fri, 22 May 2026 21:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779476579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OBeaN7CZYxqjtWI5I/hTHlsQILXznNYTUCTBSg8R9nw=;
	b=q4BccPmesUuMQBgeMksmijlwLaPt83dOl9y7IbmVYUNcvYGsAK5ZiPoa/qDjaPJ9w2h1Cl
	OgD+2piOjpfh3VhHAKry9A+pmaXRTUirZnNXdevt/aogJwxY2JdbfMJWAiEGuoTHUaMcDb
	PBdMw/HB8y+v69T1lfEHqAFlZ8VfufjlIReQL9uLf0116Kd/294ZxlL27Nshdz03ztxDOH
	GeXHRvRE855SUkOxzkNE5NQySq1sbeHXqax7JYDwiKgXU4qehod4W+m/0WkOMeNaT4sdpD
	d0bXeV/wYmh+01/HGctdyg31pjyWB2VFK4VY7fjKRbD3uzGu9X7vySIxX+Q+sw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 0/2] staging: rtl8723bs: remove dead function and clean up table
Date: Fri, 22 May 2026 22:02:54 +0300
Message-ID: <20260522190256.49830-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4b0de6b8391908c2f29
X-MBO-RS-META: bbsarfdurtg117qfpuqnxden5qhzd8wp

Remove the dead rtw_atimdone_event_callback() function since it is
unused and clean up the wlanevents table.

Andrei Khomenkov (2):
  staging: rtl8723bs: remove dead rtw_atimdone_event_callback()
  staging: rtl8723bs: clean up wlanevents table in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  5 --
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 54 +++++++++----------
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  1 -
 3 files changed, 26 insertions(+), 34 deletions(-)

-- 
2.47.3

