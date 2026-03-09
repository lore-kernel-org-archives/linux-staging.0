Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E60D3BE17B
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063255; cv=none; b=GVZMn8169aXzI7t6OT/RjrGTCrW6LN2HvGe+eUWX0LdWShAItkBeHXB+2vhM+3yJ33v5pAoyOtok2JoPpwF/p0Gu8Sn32XsTBa/I7fIQd/0HbjCiizapT/Br2deJn1B3h0G6MtozlZ9EB0sSXJfBXaVViJJBl2X651yIMSpntXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063255; c=relaxed/simple;
	bh=aureN5+z4kbjIW4GbM6kZhvT6I8y+shXhNijw2bFd48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNrbxdFi5xMjgQw8ENSVLNck1/ts1WE1WwIL6dSc0IA2zG7YZQJ6TfFUMRTs4XAz4Ml8+rlHBwWuYHmk0hRQF6YwKqcE4ou36OyQVpnuJ4cFayG+goq90MIqNOHG6Zp95Vc7XCfNvDeqwbt/Rn7aDwTK2Ngsn6GXM35zGkik2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=bi30+5W+; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="bi30+5W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773063240; x=1773322440;
	bh=aureN5+z4kbjIW4GbM6kZhvT6I8y+shXhNijw2bFd48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bi30+5W+wIx2luPRZ35P9pcMSfOJ40gXKMFPKl0qFgXFOeRtwbdr+XrMB+7u+1Nel
	 wUtvWDo+qiJrvudGFfBkKG5aJxaFV/yy0WAFSwa1LJyJThjytznPeAIrjCPS/APJI/
	 BtZ2tdaSTlLoNwKkiA78zwOb0A+BYGEOBpSeakV9e10cQtbYlpfiOPyxHFhuGxkupd
	 1BUCGaIl5RtH08F0UC2+174SXYVb6G8bCrt6f8qzhl3k6xJLaioaGOzEKmYNTbJTPq
	 TM7THGUxajmvYh+Co8O+iXvkEBI6lICdFltqC/8gTEhN5NsJGYGqHhzojwMRKiB/y6
	 NU+tfNkoAOsnw==
Date: Mon, 09 Mar 2026 13:33:58 +0000
To: sluisr <luistermc789@gmail.com>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: gregkh@linuxfoundation.org, david.laight.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, sluisr <contact@sluisr.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <aa7MQZzncWIBtlFN@ubuntu-desk>
In-Reply-To: <20260309004050.19339-1-contact@sluisr.com>
References: <20260309004050.19339-1-contact@sluisr.com>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: eb143fc7e6ecaa1c98ef88e05e4e83ddf264f518
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2026 at 06:40:50PM -0600, sluisr wrote:

> WARNING: msleep < 20ms can sleep for up to 20ms; see function description=
 of msleep().

This had been addressed in a thread recently and Gred said to drop the patc=
h [1].

Best,

Bryant Boatright

[1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100=
@gmail.com/


