Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC51B4138
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566684; cv=none; b=bxOg0+/yumPgiX6vBcTQ83azAnPUKyR3b208Bdr9BTjZh3Bx6nef/O3tHCzaGojU4J+V+ODC8n7HRLCFXeDwd9A0uFZt4Yt/Lnz/3thwHXJ13WLbuBw4NOTB/WbDy1xIHqrstBaP2ymiLxz19qar/egevpS5W6X9VB3YAH6tBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566684; c=relaxed/simple;
	bh=5dExm2+WYjTINWkfgq1bvbH/7Br0Pz/JdInghN5BJUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkfyOWyT/hG+hfLenGdA8AAvxWOTfk8+6ku6fpZsgl7QQL/P0iwQW6LxWz51g0FY/jfVvgCLgWcU6gLaIv2db+6hW6Csi77wriffGndhf4aIlrUwU8Y1486plTQflGg6BImykMXxzfb+WOjLESddUpdu4tt7qoHJr766n9NwvEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BPAyi/2o; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BPAyi/2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566675; x=1771825875;
	bh=5dExm2+WYjTINWkfgq1bvbH/7Br0Pz/JdInghN5BJUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BPAyi/2oI0sIQvMGhJHwOrwLUEkcPCEdtJr/s+QdUOjJH952qgMerQgDN4bi9zxsx
	 NH1VypHesANYdBPFo4g8sFWlDQFMnLl5wA0gM5tP1n0jgFbWrQLeWFxEkD6TveRtJp
	 RD1atKqAeDWt3oaccRGje3h5ldoXoM23ItS8Huu+aUIYOVIEgepLVFDXZfkTxsZXPt
	 bnqLxPXMAFQIsvstvdtr2q3kfCPeFtcEKG96Fap/GoisQ/3ios2Nwk409hZ1V35q8z
	 Hmyfkxik23tze317rimE6se65j0+rkEcoM/TDZ+xUSn+KmN+ojh70E461PqG8HiF5I
	 nkHoBMI+1FgKA==
Date: Fri, 20 Feb 2026 05:51:09 +0000
To: Hardik Phalet <hardik.phalet@pm.me>, linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] staging: greybus: audio: small fixes
Message-ID: <DGJJYXAOU3LQ.2LQAL0PPE0SYF@pm.me>
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: f326bb201c39f706ee7099166a5ce48c37cc7abb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Apologies, resending via git email for proper formatting.

