Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604137702E
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411487; cv=none; b=qCmIb4mpV2/K14EmGZNeQorZY3Aok5QwnKsT75sEW3xvvFt+LtE73p2mRmchZVvvAoIxCYtNEEtqXC2j27eNICqz8ZbeS945JwxS5fhPzFPQo/EgQdNrnDa0+SqBmylq36UQotJgIysO+34XHURnVtCtW4CUyRrDcgXkrJyJ8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411487; c=relaxed/simple;
	bh=BQIvWNr+jEkxiwWW2AcraSiOVR/QyJxmMr8TBvRAjRs=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Mxn6koKeYZWpsoGnpmWZ1mf4w+99GfOVQ8ahCc7/zultxmSoDT+PRZ1UFQwlBHXMelhIJnrxjMv/LFmia38HQpe8ZdlXMjpHg2P/eV+zf6Vh/xaK14eOoQSRlMO0VKQEfG4+0g5goJYVahaUuUolsocHy18TS1j7CQjnE1q/9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VR9dhtlT; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VR9dhtlT"
Date: Fri, 17 Apr 2026 09:38:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776411483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=BQIvWNr+jEkxiwWW2AcraSiOVR/QyJxmMr8TBvRAjRs=;
	b=VR9dhtlTazmbvn6yt5k9sQ5pWweUbkb0496AM0jVo3NsyKGSncL1mKCu9a4Do6M9fqSa6p
	7srn8aKtlaeCRQtW4x52EjBXoItx4LDvXgjGULfKtOO5Xa4OmeqvLbDzQU8dV+0ml5nfi3
	C2zc8QWpib7GGgz2oLQjbbpZqONExrk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: suryasaimadhu369@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, trohan2000@gmail.com, luka.gejak@linux.dev,
 error27@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: simplify boolean comparisons
In-Reply-To: <20260417071725.110471-1-suryasaimadhu369@gmail.com>
Message-ID: <7946F605-8CC5-480E-80F0-399F2B7F3E0B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Hi suryasaimadhu,
I am sorry to inform you, but upon checking, I have discovered that=20
your change was introduced in one patch in the past=2E You have probably
been working on master branch(one from Linus) and not staging-next=2E=20
Therefore, since patch wasn't merged to mainline yet, you didn't see=20
that your change is already present=2E Also one more thing to note for=20
future contributions: in Signed-off-by tag you must use your real name
(Firstname Lastname <email>)=2E
Best regards,
Luka Gejak
