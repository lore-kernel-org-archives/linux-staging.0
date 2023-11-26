Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF081870
	for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="DbUt/23/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iPE65/ot"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B525F5C018C;
	Sun, 26 Nov 2023 05:47:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 26 Nov 2023 05:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700995659; x=1701082059; bh=GU
	K8NYIWhxmHRlJ/Q3UCfOU0o3WG5vH+hS2N4nDfHaY=; b=DbUt/23/1LJl67GLXB
	thZz+h6irPTqz55hA5K5aJm9XJqeI15E9Fl8+N2l2dab2PzNQ7/R6Rb7WHpSP98d
	mnNy3C0STEpFWFu3CH5uZnvhyhDidFUop2khHHAO6WcKuPDokQJIOAGcPD3XSp7B
	pppMDY67hT27VBMHs1gnmJySGkCAflNK0cJf8kULqtUpNpLafFUHaLOAD6clnvuA
	ZzG//gmY6VG6JiNUKawM/9PHLZaoRiSiiPrfnzYccAabTfDxDdAuMabGDAYCJEpq
	VbfZ0lAlLkrXY39tuPTv80bVWUWDz26fyCqw/9yn67HgKzGXB6NBRVJrJE86KPYe
	KY/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700995659; x=1701082059; bh=GUK8NYIWhxmHR
	lJ/Q3UCfOU0o3WG5vH+hS2N4nDfHaY=; b=iPE65/otHk37Y+NK3ntWNUFmDWisq
	0Q9cHxZlDORBQN5EyBuNWZr69CzcEBL5mT3Tr5nRgw9u7dd5gaMQw5KIm+NqeIVQ
	dld6ML+dh9+aMX43mTHVR3gxLbEZx74QwqgDaMAiVwS7i3WQd+nuOOoNmY6vp8jO
	ZJ64OiRO7s8qinOMtHjke49kzEBnZ7BkazYP2R3UtC5PHRZbF3A1TAiGQyFUY0FG
	pU0P/lqdNf8SKPe1Hu8rMi8NNihqPLL4TDLTvPziWFiudnYVNzKHbP8OSGGj8UsW
	H2H3fk7CChptLIj/zB36XG6B9z5oiaZgruaHwP0Ymm1LTfwkI2T8UlwOA==
X-ME-Sender: <xms:SyJjZYcZ3vvGlpdEwz_N4Bi57bXtYZ-RbZ4fB6Ecu_sYY79hKP7Jww>
    <xme:SyJjZaNE6qrX4hasYvMgLu9BNKoxIVRIugkdp2AsSCWBCgYQSdk3H_zvt5ztRDNX0
    j4CRguATNBoMycoJVs>
X-ME-Received: <xmr:SyJjZZgDDtdga9loZum0LXDXDE9tGFLgGLXbbgpK4yd2WFIa8ROcwWUjD_ojKTqpVEWEgVahU1kOA9uGl9770gsarkIyy7qM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehledgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffgjkfggtgesthdtredttdertdenucfhrhhomhepifgrrhih
    ucftohhokhgrrhguuceoghgrrhihrhhoohhkrghrugesfhgrshhtmhgrihhlrdhorhhgqe
    enucggtffrrghtthgvrhhnpeefleffhfegtefffefgfedugeehhfdvueefffegkeejvdeg
    leeiueelkeeiuddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:SyJjZd-DNY0NMvnSjEqL61vjrQ_bPkCTqrcv7eqLpQ09PGtpndML_g>
    <xmx:SyJjZUtEG2RYziePMLUnkJGxTDWtwtKdsD585Uzsmxi55Wmn597rxg>
    <xmx:SyJjZUESAp-yjZGmDRb72NwGCOOZ4r2VMlC8VqV6pVq2vel62MfDxA>
    <xmx:SyJjZd5vkAejY8QWOJ_HWv0VC3ovkF1ZEfDF71otBXpQxh1dK7Kb7g>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Nov 2023 05:47:39 -0500 (EST)
References: <20231125223432.13780-1-garyrookard@fastmail.org>
 <20231125223432.13780-4-garyrookard@fastmail.org>
 <2023112618-subdued-genetics-8062@gregkh>
User-agent: mu4e 1.10.6; emacs 29.1
From: Gary Rookard <garyrookard@fastmail.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: rtl8192e: renamed variable bCurBW40MHz
Date: Sun, 26 Nov 2023 05:46:44 -0500
In-reply-to: <2023112618-subdued-genetics-8062@gregkh>
Message-ID: <87r0kcx02z.fsf@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Greg KH <gregkh@linuxfoundation.org> writes:

> On Sat, Nov 25, 2023 at 05:34:30PM -0500, Gary Rookard wrote:
>> Renamed from CamelCase to Snake case the variable bCurBW40MHz.
>> bCurBW40MHz -> b_cur_bw_40mhz
>
> Same here, why keep the "b"?  "b" usually means "byte" which of course
> means nothing here, so it can be dropped.
>
> thanks,
>
> greg k-h

Okay, will redo.

Regards,
Gary
