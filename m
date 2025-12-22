Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36219755B
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393174; cv=none; b=pvSGtMRCs3BGW3FTchXOYzTssVwAhFeppPi8nJDM30bz4UCrpcgfTqaHHADxwuedPjJybvFQjyFvvCfN7VxgIIkpkTn3bGV7kFiPTypvPKM/SOrC1tTHLxxj9x2JJF0wp6yePTJ8TQ0fWtJSySMGliBEifjLkAPictU0wPdsV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393174; c=relaxed/simple;
	bh=ypExW22hsLym5gdGGYcW+TwJ27C7gl55s8Vjslv7QLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGVsYoVUSYe8cwgoELlwcWsm3KP1Ho2ctCxhzIR8v816UypmpqBJPwKZZ3XVRWy5BIsnTX69T4A2mJ3SHJklwbI9JNjImiFLUqXrNcdYPVHhyxn9aZmIqF53foyDJqZE4s44v3XncHnENhrrOll9Pw2cLAK7y4OI3Oc3VON6GIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=DP95qBkk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=shIBD4g8; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="DP95qBkk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="shIBD4g8"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 11D24EC0088;
	Mon, 22 Dec 2025 03:46:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 22 Dec 2025 03:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1766393167; x=1766479567; bh=ypExW22hsL
	ym5gdGGYcW+TwJ27C7gl55s8Vjslv7QLQ=; b=DP95qBkkzF9V3f1vXYPuUSMbh+
	2Ska9JbIbq5guSSpi7G5fvF2aGJPuwNlhZxYTYYK1oXpu92lKzw/pVIzvp9b2XQc
	kMg5COG0hvWs4723vjdc4S7tPqWb/56Eg/BrXP0T2vIPFsGBZjRTSRyDwNhHdC84
	wO3WvG0EhbyEpGO4zySJjJNbPoqM2uuuzn6gZxeMkOgrfCYVOrb0Q+rc7QUZFgaM
	BbUQqdfBJ0kXT4r/bYZ0Kjp3ftOlUA6TJv2kAqTvY96vrJhoFe8uBMxmsO4Mn/r6
	69hJaVGPnvDx7H4I5pZPc1TrO97uKHlo08a+7bSQ5hObmV0K6s1HjC31ld4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766393167; x=1766479567; bh=ypExW22hsLym5gdGGYcW+TwJ27C7gl55s8V
	jslv7QLQ=; b=shIBD4g8sbyziXf4rIhKAtVVMh8uUpIHgkUUPpJ26bQLVU7nZ9T
	esOBPKVACmg2BoOF1Eidz3VNP0rbJdH7bZ0oeBZVU4GU8zl7RUeQ8Mw+enUm3j2n
	/ffOUcke5T8FrB6ulwZsfVwZFBvkVsSkfd94Wt9MTbUzwabxRIvXw3ovIjFCmPRm
	MonEi4aIu+EpIf5VwUNHDXZ9igBstKViJxKhVKy7a3pWIx9MGLnjZIJ/83aUA5yO
	e8qDfTDDon6Eq/QvvMJin9KwmnL3c2tvAKsNV8v3Ids/AOgYZPFSAtnN0OnMn0D9
	bGsHhu05kUUggbqThHa2YVOY6H/F9dBeOLg==
X-ME-Sender: <xms:TgVJaTUfTxElbzdDx-KFrhW7_2hSaNIHSx50WitnFTDZELf_qQefOw>
    <xme:TgVJaU5XgxO4g9YjgpVpTPLfxsSFBW_B9yqantVVbSWJ-vyl_1sF4x8uRYi8BGo_8
    CufD0sOnDpDRoXfnIUGO-SA8WueYXJjDLsa8WUoRczEMhQfBU0>
X-ME-Received: <xmr:TgVJaWoPutUULRh2IpgUO6734RPrKJqrneiUPgBwufnLcvyC5UEq4840LaBh7od0bvRstpX11RbXTzLsV_J9LyBSJErDPWHrRWuH-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehieehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    iihhrghngihushhhvghnghdutddvgeesghhmrghilhdrtghomhdprhgtphhtthhopehlih
    hnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohep
    iihhrghngihushhhvghnghesgihirghomhhirdgtohhm
X-ME-Proxy: <xmx:TgVJafnq-dqauxOKpX-bgd-ysmsfxy0vL1rVQSqK2CIIF0DMK_oOrg>
    <xmx:TgVJaaM4GV-IwSPubioq_JuHYB5BsyWE6dEitwxDBuYRfhReOhH4RA>
    <xmx:TgVJabOTsbWcPRWxZw6EjhKSA0_b50KMZo5Qycym2yAaGgWxrKF-ow>
    <xmx:TgVJaTiRljWEXoIIqkF-IJfWeftcdBX30XfWDEP1tQuhzIR8tfBf2g>
    <xmx:TwVJaVKP3S1kA8oRrZ-HGye8bDCFXjdB3sQkWeezyi6esuy5xi185haf>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 03:46:06 -0500 (EST)
Date: Mon, 22 Dec 2025 09:46:04 +0100
From: Greg KH <greg@kroah.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linux-staging@lists.linux.dev, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 2/4] staging: greybus: audio: avoid macro with side
 effects
Message-ID: <2025122213-charger-stark-8289@gregkh>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
 <20251219063415.46818-3-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219063415.46818-3-zhanxusheng@xiaomi.com>

On Fri, Dec 19, 2025 at 02:34:13PM +0800, Zhan Xusheng wrote:
> The gbaudio_dapm_for_each_direction() macro modifies its argument and
> evaluates it multiple times, which can lead to subtle bugs if used with
> expressions that have side effects.

But the one user does no such thing, so it's fine.

I'd just leave this as-is for now, thanks.

greg k-h
