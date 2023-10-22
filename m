Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC710EC
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="IP5iGF/V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hm9vJEyO"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id C87BD5C0338;
	Sun, 22 Oct 2023 04:43:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 22 Oct 2023 04:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1697964230; x=1698050630; bh=PmmQ1JPODoZySoOwm6kihtu+vk9WNtCKT+1
	H+A6EjQo=; b=IP5iGF/VzV1FK0oXgBC0fGmqX1c0QSnvIBSbsQ0DQtqNpq0WV2T
	QYZJCUnzxKyrXkPJXDYfqn5qfVOfkIssKdkJ8JCSjcI1SjiHBNZViGVETDRCLEW1
	VNx5Riu5p9lN0I1De7OX9/LfMLbGzv7u4Vr43PyUp98z1K5qyuYJSsKlkxRauqxt
	1H1WZm3V/ahvXNxRrHbgYyES2kXoVx8jbfuds95fqryrbDx91mgrLav28c92/g+q
	07FH2pf79es0KNSyqGnb6xj40n4Ze3G5s6aED/Lp+zORxMdTubsoz2ygDsAPh1K2
	KYhf1OoWqEd/D3wJx6EhLw0EYRBfbBSgBnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1697964230; x=1698050630; bh=PmmQ1JPODoZySoOwm6kihtu+vk9WNtCKT+1
	H+A6EjQo=; b=hm9vJEyO2N3bSAhwwIAsup3NYv3ZirEgHUVK69L/HU2gII/9FR8
	vHlw2kTGHwOR5NOo+sCbo0BYKp1MgMccbbXSEDuL/q3CNdBcAxIsVIYhtYHuVStA
	g1X1oaN1AWYSU0zB5FVYnYI+2esLGQEbZn1c3f6LEFTlO5/9ekpX6A3uq+MXYH2u
	gUFPdc2tJn4Z7+Wuv3cq9pjDPVserRil7LNPrsOyHBteGVqSsh+rnZmcKEnSrtWZ
	HF8sCpUVv3alINQ0ed+5fmq+s4Bq9wDeRfn7kfKSOMIa4naQcK9wMiuc/C5jZBf5
	suT641ZtQcE3jUlS7wKuPMnuTgDCqFSRV4A==
X-ME-Sender: <xms:xuA0ZbjPAvumz1X3nmhdYImj667898Vl6Q-a7TY9SnnP-NCdL8gfYA>
    <xme:xuA0ZYDdZ7xz-JXz46kdRIXeL1eNlAbw7zDHRHo5v1BF9AC_Ly_Ihs_wL8m8_kN7T
    BOdpHfmmM2hW_YRMqM>
X-ME-Received: <xmr:xuA0ZbGnmrJ4dG76Bufrtqv58_mkINzXQVlsHCJtHprY83kfFRRsWzaixY40Lz8_AYiCHJ3Y2c5dLiSOXFt34pvhxodMN28>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeefgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifgrrhih
    ucftohhokhgrrhguuceoghgrrhihrhhoohhkrghrugesfhgrshhtmhgrihhlrdhorhhgqe
    enucggtffrrghtthgvrhhnpeelhffftedvfeeiveetgffhvdetudfgheffffevjeejfefh
    ueejgeejjeduhedvveenucffohhmrghinhepkhgvrhhnvghlnhgvfigsihgvshdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghr
    hihrohhokhgrrhgusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:xuA0ZYTYkVjOOrmp66aB7Yvh3j1-8HoBRH3KVHmR5RSsqjwwfSCoYw>
    <xmx:xuA0ZYyMkwyhd5uBqBQMHeySg5OkhMaT_xpRUxYu28niiLfQngVMBw>
    <xmx:xuA0Ze47D2WHPisjgue_8SiYgiOMTTsCNSLy9x6Oy1I2S0acrZkFPg>
    <xmx:xuA0ZVrwsWLJ8onnNXJ469EQzpIwrI_s_ENklrp3R0TEIuodBzrbtQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Oct 2023 04:43:50 -0400 (EDT)
Date: Sun, 22 Oct 2023 04:42:54 -0400
From: Gary Rookard <garyrookard@fastmail.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
Message-ID: <20231022044254.460b6677@gnu-trisquel>
In-Reply-To: <070529f5-b0ff-4cbb-af3e-28984616a821@gmail.com>
References: <20231021224051.7443-1-garyrookard@fastmail.org>
	<1f47714b-4362-47cc-a83c-190b666f748f@gmail.com>
	<aa578599-cd87-4c3a-8040-03ab065d8482@app.fastmail.com>
	<070529f5-b0ff-4cbb-af3e-28984616a821@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Oct 2023 09:47:36 +0200
Philipp Hortmann <philipp.g.hortmann@gmail.com> wrote:

> On 10/22/23 09:32, Gary Rookard wrote:
> > Sorry, but I do both compile and checkpatch, but they seem to be 
> > failing, don't
> > know why yet. I've been using make M=drivers/staging/rtl8192e after
> > a complete
> > kernel build at make -j3, I'm changing it to Make drivers/staging
> > as a matter of recourse.
> > gcc version 13.2.1 20230826 (Gentoo 13.2.1_p20230826 p7)
> > 
> > I use checkpatch unflaged on the patch, never a problem before...
> > 
> > On Sun, Oct 22, 2023, at 2:48 AM, Philipp Hortmann wrote:  
> >> On 10/22/23 00:40, Gary Rookard wrote:  
> >> > Renamed from Pascal/CamelCase to Snake case the variable
> >> > IsHTHalfNmodeAPs, IsHTHalfNmodeAPs -> is_ht_half_nmode_aps.
> >> > Linux   
> >> kernel  
> >> > coding style (cleanup) checkpatch Avoid CamelCase. Driver
> >> > rtl8192e compiles. Signed-off-by: Gary Rookard
> >> > <garyrookard@fastmail.org   
> >> <mailto:garyrookard@fastmail.org>> ---  
> >> > drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
> >> > drivers/staging/rtl8192e/rtllib.h | 2 +-
> >> > drivers/staging/rtl8192e/rtllib_softmac.c | 2 +- 3 files
> >> > changed, 3 insertions(+), 3 deletions(-)  
> >>
> >> Hi,
> >>
> >> I assume that now I cannot apply this patch anymore because the
> >> previous one is missing.
> >>
> >> I propose to make a patch series out of the send in patches.
> >> Please do a compile test and and use checkpatch.
> >>
> >> Please include in the version change at which version what changed.
> >>
> >> Thanks for your support.
> >>
> >> Bye Philipp
> >>  
> >   
> 
> Hi Gary,
> 
> please use:
> make -C . M=drivers/staging/rtl8192e
> 
> I am using checkpatch as described here:
> https://kernelnewbies.org/FirstKernelPatch
> "Git post-commit hooks"
> 
> Please always reply with Bottom Posting. You used top posting which
> is not liked by the community and maintainer.
> 
> Bye Philipp

Again sorry, it's sorta a GNU habit...mailing lists :( All advice
taken, thanks.

Regards
