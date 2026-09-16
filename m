Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB556480951
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594024; cv=none; b=o0xHMxOWBYUJ0vu5aIuQfdcoTPx/sgXlUFekbDqoKxwB/GL7Gab+Q2XsN7UPkJEjAFPKfBK7Hsi3vtvcnhJO140va0ZD0KA0+TRIf41+oEq+gG9zx2HzH9wAdUuUstWFHAw0UjTBoHwqEoRfFDarwKhULYQ05tEZu9g/cJFctRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594024; c=relaxed/simple;
	bh=PlFfEzaVTasB2l/UchoQeYFuUZR4yW+7bUjU2nGdbCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m+33N74VM/WXMShHoHKIh34x08bQE/VMflWwi+of8SdkagWJRL1fs2qD5poDo4XgJXgh4PKx6v3tH2ygYNZVhF1KYg4J+p1OQY0hx36RpRue89msNej/lRMMTltP4W/XAF9ujephiSLQaY8HtD8HhRTVO12yQw7gv0VNhoj+gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WyRhxXOc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O9Dw04yY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WyRhxXOc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O9Dw04yY"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789594010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PlFfEzaVTasB2l/UchoQeYFuUZR4yW+7bUjU2nGdbCU=;
	b=WyRhxXOcUFCd0h4fU5lFQe7O8CBeWWckaLrqqGeCacBRb6oWjyFiwJlSKUcsBfUyNSK++D
	5G1X+2aO6U7lsOzeF5F6qqDJq82efqCyhBmDu343FYG2BhOaZdxcAdyv1rKj+d8zFGIy6Z
	tNEXpErCMwISGZ68pjPkyltsuep7Ke9bjFlZOVUX4ifIo296mDlcrMY+IwzLm6eDRgyHbe
	JvMHofTd86sZxUaxbd49DzQq/mi2V/zECtXCYdZ6LgU8PqGC3yF6RsIDlCuwCbXhDAWkHY
	bxxkVDzPjHpGxuM3w3ULU1JOP6Wj11wt6DMBUp5Ydfwdc6yUHbfDfirzecaHgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789594010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PlFfEzaVTasB2l/UchoQeYFuUZR4yW+7bUjU2nGdbCU=;
	b=O9Dw04yYvPNf/0+PKUo4eQ3oB9NZaXQmZGmBES9dq3uQnfEtYSuwtNRg/mPAUa6jjTmQMm
	H8nvAeup34PSs+Bw==
To: Omer PALA <palaomer100@gmail.com>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add newline to sysfs_emit return
In-Reply-To: <20260916155855.9022-1-palaomer100@gmail.com>
References: <20260916155855.9022-1-palaomer100@gmail.com>
Date: Wed, 16 Sep 2026 23:26:49 +0200
Message-ID: <87zexgyjja.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Omer PALA <palaomer100@gmail.com> writes:
> Add a terminating newline character to sysfs_emit() format strings in
> audio_manager_module.c.
>
> Without a trailing newline, reading sysfs attributes directly from user
> space (e.g., using `cat`) appends the command prompt to the output string,
> leading to broken formatting. Including '\n' ensures compliance with
> sysfs single-value formatting standards and prevents parsing issues in
> user space tools and scripts.
>
> Signed-off-by: Omer PALA <palaomer100@gmail.com>

Also no, sorry. See:
https://lore.kernel.org/linux-staging/anw3nOfSGKoq-1E_@stanley.mountain/

It is a good idea to look up the mailing list archive for other patches
attempting to do the same thing.

Nam
