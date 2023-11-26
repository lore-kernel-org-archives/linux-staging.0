Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAAE1870
	for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="TXqxbh4W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e51fYF0t"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1346B5C0164;
	Sun, 26 Nov 2023 05:49:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 26 Nov 2023 05:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700995750; x=1701082150; bh=EO
	MOkS2/UVozc3tALLYGluUBGVVrqVPD4CI9ogonssc=; b=TXqxbh4W5kN02u7RE4
	UXupyiBMPkXWdtRWLtdaLcaFnh5wJr+nzZGSM5TtGtqFbGXLhqTwD6R6Sqq6txiI
	qwzDhywVPLwVi7lpuDYe4izVAhTlL4Rfluk1EmWcHENP1PuNTmBViBiLtg9C2jGv
	YNSmKhtjiOh8KZO4DdUbbee9CDrYTdhbdZp9qvC6QMfMwzLEan4lqQlen48bdaNI
	9HZrAbF+RlthQSnsG1u2471ijoL6lZRgLJH2TalN99qZzmA3jPy5Uz2RXS0aCxQZ
	s873XZsmE3/rW8y+71YsS2FfLl68ivcvS1ry4BPBI9BUOFto2CnC0BY4SkgfOrv8
	nb/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700995750; x=1701082150; bh=EOMOkS2/UVozc
	3tALLYGluUBGVVrqVPD4CI9ogonssc=; b=e51fYF0tzQyTc6HkhXSV86wg1f6XL
	mcfG5thwKnwmZpODNM5iGCpjfNfPr6tNBBL0io7TRNma83nisyWOohPgTE/PFRbR
	265Vr9vci4+/aIuU+laad+IQ5alB55qMIt6K+U+S1gl1xVXJAX07Iv/WqoxJiH6E
	0oRWhDgvgRBfQ5+MCXeW0JOM4VEpDvgXPrWRs3JG70bCUvkkR/hg7WR1FQutNV3U
	w0pgpMpPVE05+YJA7mmN0hMYW+DGmXKlKKObqMn1qzHAY0jopSwNpTXjfq2yjFNf
	SgR8PLEuYAJe8PPuOwJTF+99svu7qJwJ1sOJL/crs84UxiWu342KP9mKw==
X-ME-Sender: <xms:pSJjZbqKRhZDiHI0oMTL1aCjI08V3kF2fy5nq6gRKCfknL4sqqPIsA>
    <xme:pSJjZVpJGlRS2hGwUzIXgbtO_GBknIp4j872t_LPjcanOfXgynuVPYnvc04pYoCCo
    OlXK4j_nsA3mXz8hrM>
X-ME-Received: <xmr:pSJjZYNvcA-pSCyyGAbY40l7tNb3A29HMGf1eqyCixYV9rzPEuM64Cm5cl1yh47Mwiq3P0rbA5er3Rn-wpWD1m7GuIzac7gd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehledgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffgjkfggtgesthdtredttdertdenucfhrhhomhepifgrrhih
    ucftohhokhgrrhguuceoghgrrhihrhhoohhkrghrugesfhgrshhtmhgrihhlrdhorhhgqe
    enucggtffrrghtthgvrhhnpeefleffhfegtefffefgfedugeehhfdvueefffegkeejvdeg
    leeiueelkeeiuddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:pSJjZe6YtkJwbsNKmxPHYGh9TyRjiTzQzyq0dAfC4E1l2EvoToScEg>
    <xmx:pSJjZa610BAPNk4jab9tlBHYVP6nkwTA2dVNSZEu7Mb2imvBGh9PcQ>
    <xmx:pSJjZWhLZo2S5T9VEIcVlOe1jJjrXVqXWGCSQrbKjvIOkFe1Y1E21Q>
    <xmx:piJjZaGKr9z3OjkMsFONkbqbwaY0R545_Z6CYQeGJPPNpEgmmoKzgQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Nov 2023 05:49:09 -0500 (EST)
References: <20231125223432.13780-1-garyrookard@fastmail.org>
 <20231125223432.13780-5-garyrookard@fastmail.org>
 <2023112622-jigsaw-scrambler-d385@gregkh>
User-agent: mu4e 1.10.6; emacs 29.1
From: Gary Rookard <garyrookard@fastmail.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8192e: renamed variable nDataRate
Date: Sun, 26 Nov 2023 05:48:08 -0500
In-reply-to: <2023112622-jigsaw-scrambler-d385@gregkh>
Message-ID: <87msv0x00h.fsf@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Greg KH <gregkh@linuxfoundation.org> writes:

> On Sat, Nov 25, 2023 at 05:34:31PM -0500, Gary Rookard wrote:
>> -u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
>> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 n_data_rate)
>
> Why are you keeping the "n"?  It's not needed, right?  Remember, these
> were written in "Hungarian notation" which uses the variable name to
> denote the type of the variable, so "n" means "number" perhaps?  So it
> can be dropped.
>
> thanks,
>
> greg k-h

Okay, will redo.

Regards,
Gary
