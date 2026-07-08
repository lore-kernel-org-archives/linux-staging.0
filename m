Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C811402B96
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500704; cv=none; b=aqTkw3REgNRpWwd7zqAUDDtqebCV/AS4kVdJcXpTPa4v8GBcBWlNckTskPWbc0NgHiRGZ+M61qkyEp/88KoEqpVnGpHibWjWwYwm+0euDFTlUA9r/aBIsD01kMOzU7lQsIrset6Em+GCtY5BFap5b+fHnB0N7CzSrK1EomY5J30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500704; c=relaxed/simple;
	bh=BTbxQ/wCD+0OCX9houArivFgTubTbTdRByGqq+yA+TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlTgR99ZPRqZMGlU9nrE9DlHPE3BK/iG3mKEkTTrTJ3OX+RGoHSh68pQ0It6n8ot11dI4Xa985zqTnIdcTvMDETYMMsHZ0oFfXp54+x0Dfh4gDIXkbKfA4UCiYEmV2/33Bo1xs8W3KSmt25w4b6gO9cCmttB8z4HcHfA4xMhOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rLwaPY+c; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wGNmUMVi; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rLwaPY+c";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wGNmUMVi"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwBfM6zFBzKvtj;
	Wed, 08 Jul 2026 10:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783500699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a5q/B5HhEMhtwt5px02FBJ1J2CPdT2Pt6eiNkChSkXE=;
	b=rLwaPY+cWvA0vkRxtziJULmoCQCqAXoJi7VyAlpmfz+TE9VQZ5q4bqt0IigRjpRPr6LVYN
	X+vx+URF/E1MLTFKPUlAWAEOaXZOcz2eSJT2VDizyisX9zcVaPMX/BGgEQJclTtaY5Vgh+
	/+aS8quQolIXfVNcuQ8fjwvhjOV+tY8Fg5vNRsvmQHngbzRxgpXljacD+bUd2IRlmj7qAt
	kcbYahQIcSMLA5zcbiJQQvtp+vzDumo9Aw+JStRUNksBMMEcoW2tnskLZi8pxaOxBlIf1W
	SFhzIVLvmwg6dPFXY+N3pg/7MaJwPVRgVXJTZD+YnCpB7fuDzQCXaoxZO2SsqA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783500698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a5q/B5HhEMhtwt5px02FBJ1J2CPdT2Pt6eiNkChSkXE=;
	b=wGNmUMVi5JP9GcgI/erpDGLHTRyOw7E+dzcTf/WxkZD/34pMyf+G2eTeq706YTxS6RB6NE
	hFUjX517TAUh9OV10rYMKGQ6C0xEWufugGKZEC1i3q/HzW7zxxg2RXXuAcpASBv1RxThyG
	FUFLKpexzhTa0bLJajpf3NvAREN6FDt/weiIRRgVVTdKnmPW74H59uBigc7Hr67kRug+b5
	H2lq28VyoBTIjTtNCrofYzxzLLGcz88K/muu8/UsTxE5D0LA4EJR7qPtWiSDK6mirxmxbj
	jS4BI0tMVEYVSj9aNxHv1ajdTDR9nfJ6Rqpp3a0cBJZURQj0vkGWVTGs9hyrJg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] staging: rtl8723bs: sdio_intf.c: cleanup
Date: Wed,  8 Jul 2026 10:48:10 +0200
Message-ID: <20260708084808.305951-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4c582c8f7cbb865a020
X-MBO-RS-META: jhbujwckh67woay8mnetwgp931p6z1i4

This series aims at cleaning up sdio_intf.c

[v4]
 Remove patch [v3 4/4]
  This already got patched

[v3]
 split [v2 2/3] into [v3 2/4] and [v3 3/4]

[v2]
 split patch into series of 3
