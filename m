Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD03A2586C2
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063393; cv=none; b=T84yHbd8UmSvwDfz7a4TG9FF//lTT6zF93BZrdjPCUwx8fVK4FhkzrmEP2ECm/G5tNPB2kU+MBshkXnXGe7bUbkrgGPh2XHh4vs/hZQZ8M8UQR+FLa0wCTJjVq45dnVIFoHSwL3MDyXziyApv1Nbc3sVdjZO9GAECE9znNRD6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063393; c=relaxed/simple;
	bh=opQaROat0lb/3WxfS1UzGlkwocN1iBUrHngZBQ6wrCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRwUkNOVI8D2p5SLb0QPlOAYQjV+Embr4MRBuAxW1BX4vcAV9ZHa+O/WW37kl9piTSkCQcmxqgehfnr/mFGNhwFTGjolGL5hS08S31bhRqXMABG3jrHDKj/eHRLR1HtG84QogQpK72lcChxYjjNMlG4HjoyKY0rYjQN1aNtXHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=T3WRFjW7; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="T3WRFjW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=zcjhstelh5g2bj224ovu2qnnk4.protonmail; t=1773063390; x=1773322590;
	bh=opQaROat0lb/3WxfS1UzGlkwocN1iBUrHngZBQ6wrCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T3WRFjW7W26oLafOpg2dzsZRLD5Ut7yfuj3PJASm1HicuMn4Jlf7mvpDXr0B1Qf/y
	 5YaZsN1yZQ+QnQ+kP/wYbgiP4+nO4fshazy1yS6eBth3LxlJmRiFLxH00+LMd2dQ/b
	 /yCX7jHyzE5A3u3IRtXk7y0i5bJ58KgR7P8GLp/FLvUmbTAQiLHWuDYCa4WUJhI/uf
	 kkFYcJbc82MPdk8GCIeWTUybIXV2QAbL2Lkt/ZegHT1Ak3EWr/WPjOrk3S4/6piYcm
	 M+Z5v3LvKFLNUAcpmjexGaULpAsmh44DB46A0xyop1v1nP2Zq0UtASmapz566d0kjC
	 rmZlXKchdV0ow==
Date: Mon, 09 Mar 2026 13:36:26 +0000
To: Gustavo Arantes <dev.gustavoa@gmail.com>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_suspend_common
Message-ID: <aa7M1WzJd5JWa1Wh@ubuntu-desk>
In-Reply-To: <20260308221950.6721-1-dev.gustavoa@gmail.com>
References: <20260308221950.6721-1-dev.gustavoa@gmail.com>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 63d3db76f907526d4c4f446c57beafe1bef749ff
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2026 at 07:19:50PM -0300, Gustavo Arantes wrote:

> Replace msleep(1) with usleep_range(1000, 2000) in rtw_suspend_common(),
> since msleep() for values less than 20ms may not sleep for the intended
> duration as documented in Documentation/timers/timers-howto.rst.

This has been addressed in a thread recently and Gred said to drop the patc=
h [1].

Best,

Bryant Boatright

[1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100=
@gmail.com/


