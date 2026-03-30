Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831873A7F74
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857047; cv=none; b=cbaNci++TjYvWZjufH/YlWKj9wa0vUjhgU64l3UMKDoNqro+91nPRzIpTH7Ysm9gNa0vKEaOlHAcnA7gN22GHfrr8R2ygxDRZD5Cqi6Ic4f/lqwDS7W8davbFukzu8vphX6bgtKeD9Br1myG2cXmfOUwaZJwNKZ4fltJKAs3Nvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857047; c=relaxed/simple;
	bh=TIgk8P6ljiScI73lfrYVm2Bv4JAr5As/NXP19feMupQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2izag4kgOKm6rZUJOu1YfAMdZcgmcwWS4LomeepMHbiWEEVR5F5cieRPzbb+9SwZtTT8Zd5B94L/VM7EJcUgftNg5xYZfity/onvG7lIwW7VT4exF9jIxb7Flp2fjPY5HJV5faWgCDuNV40nXqGDIPo0qaRxh2VqD73Bzg/ry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sqdFw9Vw; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sqdFw9Vw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774857043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymOLWhqzS3JrzZP6ChOY1euFn6k9x7Be5Q7VAkB8wxY=;
	b=sqdFw9VwkBCkEcGpmiqd58tKtpJkABB+pc70GAJXrAV/e5ELb9Ul31hetxH0vZZZIW3Epv
	NG5vj3p05/i98BfdyCZfTjAfxqXptLRlLo8agwX8bMz1lzAUU1cier0odvPWc4DWZA7P9F
	ehgzmy6Marw1JVIXipYCrQ8rwBeN/0M=
From: luka.gejak@linux.dev
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	luka.gejak@linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: clean up booleans and parentheses
Date: Mon, 30 Mar 2026 09:50:10 +0200
Message-ID: <20260330075010.62498-1-luka.gejak@linux.dev>
In-Reply-To: <20260325110143.35466-1-khomenkov@mailbox.org>
References: <20260325110143.35466-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Thanks for working on cleaning up this driver. The approach is correct,
but the patch is incomplete - several instances of the same patterns
were missed, creating inconsistent style within the same functions.
Please run the following to find all remaining instances in the files
you're touching:

  git grep -n -E '== (true|false)' drivers/staging/rtl8723bs/

Also consider splitting this into a patch series:
  - Patch 1: boolean comparison cleanups
  - Patch 2: unnecessary parentheses removal
This makes review easier and bisection more straightforward if issues
arise. The semantic changes themselves look correct - no issues are 
introducedby the transformations you did make.
Please send v2 with mentioned changes.
Best regards,
Luka Gejak
