Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CFE3E63AD
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857988; cv=none; b=Cp+9Y1Q3+S/UMtndsvxtV5SLz0PXqZuxdLLn1qzFdhy9Z/uLwy1ZkUCSEcIRkyrI39po07n8/8pL5BR34+mHpri6xw2VYc/jVmXk0YpI18SevafEMIxNvoJp76tWkd6jkFk+Qumzg7ww29VvPpC0RBlWGUGiMXtr5AmrfMN/vkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857988; c=relaxed/simple;
	bh=ZCN+ReKaNXl0jj5cfTlbwhVUr3tP5x5BfaXgZpqY6V8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmDLfoPxnmxfobqH4BTurEl8Y8X3DmtOiOj9P+bsMiifhawyt1be0QqCWsy80laskJnnt6kZQcaFFcqxjwDPhjLIKpoSeVws67mU7F94yMAZc+5UYjXiC0aanACGksBRAZguwGocmbWK1DrM6rH59TO3rtsyHXyrR3+KwmBcyZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rknRnBOu; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rknRnBOu"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gH9gD1XX8z9vCw;
	Fri, 15 May 2026 17:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778857976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0y5AAsbAJJKcrpCwwIW+01b9ivfxSq7yXrAIEFrmoU4=;
	b=rknRnBOu20phhfZYzSX4iYSgIkizTnW98zstrGcucHnzgb6KhTKzc145lUmsAf3pMRE+AX
	ZlzfFaMn0MBUaWB1h1aaspfk5SZ5Xde995fCQIftZ5GzaNVvKAYiMjfAmd6Nwr7mJ45FK0
	MduVNnnNJMm8+nftgr+hzcEQ+EhgNK3LzWd0p1SlFHN/rJ6iPH3vrkxxkMtlYrObNTAJ0G
	LDIEj9JoP8LpEtN3JykD6pUVJMmZnMCGb5XtYtzpDFVDOMLJnx6HvL3L+UeQuyh/JcIBNG
	APfhAHOUoWcpJpMrJkrDGft+qckJd7NM7J6hvVcji4kzRQxNoJFLMSg+E7Ugag==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 0/2] staging: rtl8723bs: remove unused code
Date: Fri, 15 May 2026 18:12:51 +0300
Message-ID: <20260515151253.8106-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6y7xbph11ikyctnw6uw8h68o6abd5zgh
X-MBO-RS-ID: 687907935c41fb9bdbe

This series of patches removes dead code hidden behind unused
ifdefs to improve readability.

Andrei Khomenkov (2):
  staging: rtl8723bs: remove unused DBG_XMIT_BUF and DBG_XMIT_BUF_EXT
    code
  staging: rtl8723bs: remove unused TXDESC_64_BYTES code

 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  7 -------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  5 -----
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 21 +------------------
 3 files changed, 1 insertion(+), 32 deletions(-)

-- 
2.47.3

