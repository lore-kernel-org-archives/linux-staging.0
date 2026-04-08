Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251D53537DF
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667611; cv=none; b=GD7MNZTRH2FFF4A/q4ZOtwDYYDtJKpiYxr394XyWeeCis4RKfG4v+beQnLomFzmt8J2cE9mE6Uo/7cJlu1rw8oZSwnhy3uolimssr8Q/BSnaA9J8ny1YApubvwkzX7VqAllMNEU58T5SmcQ8zbAl1OUp+f6tCAGos+qc7kV3a9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667611; c=relaxed/simple;
	bh=t9BN9T861jzWiPgZl9Wtuhw63kOrYH2s+ABhxoK+1OM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q6TlQz52Ow4gmxlFPcEEbtOzpbTrKJ+im97CKpdsvOQnc2mcmnhhuxBAmY9rPFUGQ34z+xV76CmDVAfaNhJqlsfgTLL+VJjzZABTG3Gru058toDl3GTaDkYM0cutw20uOmugTjZGbRdAs8dSrGyGWBr859IEfOpDW0zEXQNsZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AUWjAdv3; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AUWjAdv3"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775667607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9BN9T861jzWiPgZl9Wtuhw63kOrYH2s+ABhxoK+1OM=;
	b=AUWjAdv3YFIIJWNf+7/eUBJiL8BenkVjRBKiKwXPJ3leJO77tLQG+1Lgwu6dHCVQNYLFIW
	VWDM5L0gINHLxt0OS6jYPaQ7ZvL1wwAdijkHGz/7RrmgNt/JFcAAuuezmHUVTwscq+tGYL
	JNFHL1Z1bBGuidsGYgCEo6+zG12L1BQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 19:00:03 +0200
Message-Id: <DHNXMRNAO70Q.E1ZI3XLH3Z46@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] staging: rtl8723bs: coding style cleanups for
 rtl8723b_phycfg.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: <osjin83@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20260408103208.7682-1-osjin83@gmail.com>
In-Reply-To: <20260408103208.7682-1-osjin83@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 12:32 PM CEST, osjin83 wrote:
> From: tas0dev <osjin83@gmail.com>
>
> This patch series fixes various coding style issues in rtl8723b_phycfg.c
> as reported by checkpatch.pl
>

...

Also one more thing, when submiting patches make sure that all messages=20
are wraped at 70-72 characters.
Best regards,
Luka Gejak
