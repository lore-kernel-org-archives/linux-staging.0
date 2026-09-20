Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AF039B49A
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905595; cv=none; b=OfQybNmjCCSR3z3RpG8DcC3hrv2fRQQV5jxBqgWIwmOJL4WHCc/HVT3HAtc/0RI52WNZ56SwvCUx6wX7tkaAW+B9NNKYOnmiOBOTL9HgrN7oRvY9mcZXWrRIBugFfLE2srX9r10VXXKSStMC1VkTMbwkt/iUTPKw24JJ43mE5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905595; c=relaxed/simple;
	bh=pxYPO61SLBpwlXPpx2HWl96/2rvjavXEyUVOu801jVI=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=CBvn4hTjyTegc9HHvtgokKGU1cVVLRIv7l4KSamhLJ6LCqVZVII7T3vuW6gG5BFMGs45MEnCpErZ+1XBPHWtBBAWroFBZ/FI7yEceILyIPUIj57zljtGkFC/EI6MlAe3V2abbGROJzRZrPG0T4umvhRNf9ARFRhQ3+ISxRxhwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=V1vetCDo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Vpy7alpO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="V1vetCDo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Vpy7alpO"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789905574; bh=pxYPO61SLBpwlXPpx2HWl96
	/2rvjavXEyUVOu801jVI=; b=V1vetCDo4Eqa+UyUsgWHZECxQS9D+GN6krgMwMwdq6MTZD748W
	/8uhOZtqFsTkxjM9rhE/tJaAoEDPu70Bj1LWbfIG/VP8tJPa2oQPtikiTgdsbETOvFZucnnuox0
	Gx/U+a3cTpvAg4lSpBP3YIlDBCaqFxx8Zxq7O7x2YLcK4hs27DB9m95myTiEEg58x+OeNqwG8bv
	mes/djmlGAU8Y360tVK7AEPvVj0OnuZjLfzca9BtftxA7wA8cGNKzM7YkYZUSEnZ4hnlfY0Jx4w
	dB28FR4kK1mTZPDvLXQPouqvI+yr+GX/RlO1ExaTsj6KJejoOXBnLQx4VxKFNOteG5Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789905574; bh=pxYPO61SLBpwlXPpx2HWl96
	/2rvjavXEyUVOu801jVI=; b=Vpy7alpOdkfCN8SWrguhWIWcnlNIkq56sJD+auCLZ+5EpwjRXv
	r2ImfpTEgmj00dELylEDgkGSUP0GhgTVZpDA==;
Date: Sun, 20 Sep 2026 12:59:34 +0100
From: Bradley Morgan <brads@mainlining.org>
To: palaomer100@gmail.com
CC: dtwlin@gmail.com, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 mgreer@animalcreek.com, pure.logic@nexus-software.ie, rmfrfs@gmail.com,
 vaibhav.sr@gmail.com, vireshk@kernel.org
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
In-Reply-To: <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com>
Message-ID: <33F62319-50BA-45F8-BEDA-75BC4AFBAC93@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 September 2026 11:37:00 BST, Omer PALA <palaomer100@gmail.com> wrote:
>Hi Greg,
>
>I thought someone (not you) can allow this.
>
>I want to contribute kernel but i dont know what should i do.
>
>I wrote 3 devicetree schemas, 2 performance fixes, 2 mutex/spinlock
>fixes and 1 syntax fix.
>
>All of my work got NAK.
>
>Can you explain me what should i do?
>
>Best Regards,
>Omer PALA

Hi, I don't tend to jump into staging threads, because well I don't do
staging and all that, but I'm sure I can help you here.

From me looking in archives, you tend to use AI tools, which isn't allowed
in staging as of right now.

Staging is a learners playground, not a AI bot bug report thing.

If you need any help you can contact me off list any time you need it, I
do need to start mentoring people....

>
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
