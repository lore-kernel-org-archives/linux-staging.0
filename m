Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733813A6B6D
	for <linux-staging@lists.linux.dev>; Fri,  5 Jun 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648170; cv=none; b=PkTTgHK1UwJcOJwKO6nGW3ctfMQLTi5VCMnjExRlKfVlPz/CJimtVLcfawL8rw9sw5z4XX0WGGzvVfntzqB4/XqJaLq7dJF4WPUEreFXW56NZL8qQxW/XLGPEfI3Ay5RZ9PmbEV6LoRomrVhWQpUXxVnXsRsG6jb9CECLhEwN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648170; c=relaxed/simple;
	bh=MV+PjOx58Vq7EmMRcMcCm3SFzpnWKrn66vShyqWj3rs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=cnCsyyodtkQ0NSE39JVhpee6vPTAbrhdCooM73V5DHVBfUYYn76PwIKasRfaGsscM2MaMV65RWNATcdgjU1icsBoc+FvoEgBE8s7Lmhs8wTOeCQ/9suStfl+D6F/DPwcYRZR1d4i9QkfHpXMsWILwyavpye6JDKyWqW18MPhn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PXb+GPt8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PXb+GPt8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53FDDC58471;
	Fri,  5 Jun 2026 08:29:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B48A35FED1;
	Fri,  5 Jun 2026 08:29:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6254106A16CE;
	Fri,  5 Jun 2026 10:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780648164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MV+PjOx58Vq7EmMRcMcCm3SFzpnWKrn66vShyqWj3rs=;
	b=PXb+GPt8T2483LQBm5RhlGucJ2Rnf/U6vVgxKqL2jVRRGsR20ad9A8LOfIwZBmxmA1RKIp
	/f/hDj8BaZk2rhUkU0ImBnA0ucsZ1suq2FLYvgWL7CjEW1wRsu2bMDuJKBa1KL2qr3VgGF
	jk1cKlir0cO/43KgLFO704EWXx0WvvJ12y+mxrSXWlKkgqxi0j39CTBxR/Yy0gq2dOYYSE
	seEwWdm+7nRpjnPqQlWiv4+sIWzJSbFTWxQfpETHZo2+tuuGgEkTMtJ8/78uIOG9lXTmWw
	QGEXfcdlpsROCM1eecFAXKM5T2w7/4/C0907xoQpuce1zEak+GSMe2Ib4BGk5Q==
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 10:29:21 +0200
Message-Id: <DJ0Z3CCLRGGD.1OA7X9AZX5P03@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/1] staging: media: tegra-video: vi: Improve media
 graph building logic
Cc: <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260523064750.35553-1-clamor95@gmail.com>
 <20260523064750.35553-2-clamor95@gmail.com>
In-Reply-To: <20260523064750.35553-2-clamor95@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sat May 23, 2026 at 8:47 AM CEST, Svyatoslav Ryhel wrote:
> The existing tegra_vi_graph_build function relies heavily on a one-to-one
> match between Device Tree nodes and media pad links. While this works for
> simpler configurations, it causes issues when Device Tree nodes do not
> match media pad link logic (e.g., mt9m114). Switch to the
> media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
> linked to an endpoint, rather than assuming the endpoint ID matches the
> pad ID.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

I still haven't looked at the code, but:

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel ca=
mera

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
