Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62B47ECFC
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709061; cv=none; b=rnnXg7d+2B0jDSoZIQ8Ag+s3qL8FPEdCxuQrhVGFMzScYreGVfw8XIWwA8JBJQ2QWLoi4AKB4p9hAlEJ2Me/kFKt8FGLplk9s5QH1ZEGmKe2+RPd0YkiuAPn1tqkyVzow/Sz1ldq8fPht/kC5AGhGggZPXsZv9CXLWNkBYDjzko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709061; c=relaxed/simple;
	bh=0ym5WVu2Iqlxu3QdP4M4bQKr7KkoEQAubAI5Fiai8jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXB7LJIZD280Pw7rsAj8RCLMmzrH6mzOQelkwH7yIJNUJdnNPE4aU4Zn51CD8sXBPt4TtDu4nGX1m3Tx3c5QPUT8HHjHYch/IeRrptuSyDsTpJtvDP/ghVql0ukL573fLRZErlefLatm7TrARk3mHfsU/Dy3ODKkRIHssEUG2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tRnDaWbY; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tRnDaWbY"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ggS3Z2BXpz9tQr;
	Wed, 17 Jun 2026 17:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781709050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aw/KJI91ochDL09H/pBtNaModorFbBeZwQKbbRSfc0=;
	b=tRnDaWbYvDBA2wyeoBhfqIV7ke7NyWqO0qWO8HZspagkBUc8JHzglq+htVEBSK3mvfUzru
	WouA3rUPVR6X9owx3VfVDT88GlLLcu5frSlIX6GpdTDNUnlr3a5bb8j1thyVaGPIgFQXgo
	0wu3g99s7trsxzzrGZyeeW3x2LoS8RHNIH+CV/uelhYUC1hw1I/59d6Zw89gAF6CSyTJyy
	sVLD2211w4/V0/+iVkA3S8+61S8aZxSCBYX5gA2wmCjJTcOA34CoDH8S/IMIlFkM7iRt4o
	alquZiLai2dLLAjTtOuzNiWj7lJfX7Qm3sTt/D9JKinSkr/PfnZu1kxd/g1urw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] media: atomisp: replace kmalloc() with kmalloc_objs() in sh_css.c
Date: Wed, 17 Jun 2026 18:10:39 +0300
Message-ID: <20260617151039.12533-1-khomenkov@mailbox.org>
In-Reply-To: <ajEtHT5PXYZYXUX8@ashevche-desk.local>
References: <ajEtHT5PXYZYXUX8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dqdzce6wbwzs3jpgsyy41zwe1yqft47o
X-MBO-RS-ID: 8de91b8a17b57fe6fb9

Thanks Andy, thanks Dan

I saw that a similar patch (commit 11f94f5b1d30) was already submitted by
Pedro Pontes, so my patch is no longer relevant.

I ran the command

   scripts/get_maintainer.pl --scm -f drivers/staging/media/atomisp/pci/sh_css.c

and saw that when working with this driver, patches should be submitted
to the git.linuxtv.org/media.git repository, not to Greg's staging tree.
It's also clear now that working against the linux-next tree is a better
option.

Andrei
