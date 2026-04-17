Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CD39184B
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421348; cv=none; b=HPDDWPiEFo4kZ+wHLBcIS4Fm89iJDNAARCPQNGgd07GjJfNibBu17R6x7GMtgaz+QMNc2mr9Ft8jnvyQaSrm1zaoZi97lAyuVC46E/P0v4u4ZeXSaxkA6RCEsZp/3cJMs9TpN7CGZr5Hm2EAjXIh6OjBHL1oEI0yZJnTARSwsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421348; c=relaxed/simple;
	bh=Rb7ON0Xah4TWltVSO0yWo1BTJg7GeLxLhOJ2Xk7NV+k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=C2gmXyHZlD1c/q5bLtzjeMYsNQEY6al6F4B3Lx1C9Tc41Y2NcZ5ANJ91gJA0pms3cCzIC+F+ZGAwvtuwPIXZ+xdXSLQwSPOX02SbhVs8Nb6Pghs84QWqnbR8RcxVEP5BbiEZryJDyJMcUe/k91kw4MQtuu9oauGe5aD8pslolAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xR3Udeeu; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xR3Udeeu"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776421345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb7ON0Xah4TWltVSO0yWo1BTJg7GeLxLhOJ2Xk7NV+k=;
	b=xR3UdeeuS5+njSNyoXVncPcHFdappKHk51eGabMGJZx7dbzRf6tE3HnhXiunbmpNpS1B/e
	vDslomijdYgsYv15L7Yaunyjep//At8T3UflvyLLoRhzkPbT1H3q/b/M1e2PY7juWE6B+8
	lP1hDJIu8ScN6ddNfKhsHjOlxiGltC0=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 12:22:18 +0200
Message-Id: <DHVCT4WZPEBI.2NJ9U6WUXMS8Y@linux.dev>
To: "Maksym Pikhotskyi" <mpikhotskyi@gmail.com>,
 <gregkh@linuxfoundation.org>, <error27@gmail.com>,
 <ethantidmore06@gmail.com>, <starpt.official@gmail.com>,
 <straube.linux@gmail.com>, <sameekshasankpal@gmail.com>,
 <arthur.stupa@gmail.com>, <luka.gejak@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: reduce nesting in
 rtw_security.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260417095452.23440-1-mpikhotskyi@gmail.com>
 <20260417095452.23440-2-mpikhotskyi@gmail.com>
In-Reply-To: <20260417095452.23440-2-mpikhotskyi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri Apr 17, 2026 at 11:54 AM CEST, Maksym Pikhotskyi wrote:
> Improve readability of functions:
> rtw_tkip_encrypt, rtw_tkip_decrypt, rtw_aes_encrypt
> in rtw_security.c by adding early returns for the
> encryption type check and the stainfo null check.
>
> Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
> ---
> v2: rebase on staging-next. split into a series of patches.
> v3: make subject line and commit message more descriptive.
> ---

...

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
