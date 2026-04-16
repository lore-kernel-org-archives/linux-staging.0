Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721FE20DD51
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776373142; cv=none; b=Cw8AfsDw+YMI/xQ5ZjOWAkPRV+C3psjzcvaPyaAXJilQFrjypsaqYC71fxdbCD8UE39rXv+EiB3Goyuyq9JnsKmwlchpI1KqZ5SrYXHj6CgEzBQNpTjeZwUSVwbycEtFVIWgIBxSaYOjIncN3CUH92RS99+JxXzwLBFPW66SHPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776373142; c=relaxed/simple;
	bh=saEDRqSRUvowSIClKIEupqwehwLvmOKO/dX02ADMFaA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cIwu/ze0wwS9DTITcUyBLTyCtewnNM/hurYfDkUN7k7Nyq8O+nnseEfgBKwYzgKoD/U1oUeXLYPvVd3emj1nRCz6QXO59fJBeVj7gNTMpWKBq89UCa9fuVmMEE2f6vVIPF+I8tRFzEFb6G0EJ35dhkEmHS6qWLpeDR1axDkIu0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cxGYG1cd; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cxGYG1cd"
Date: Thu, 16 Apr 2026 22:58:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776373134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saEDRqSRUvowSIClKIEupqwehwLvmOKO/dX02ADMFaA=;
	b=cxGYG1cd2uh/gnhlKkAdWvTKXc+ailNF6UtRbBAkb4zbx5yNpgqbKhYYDei14Q6P/3ufIC
	PoPfgQZEFkvl3aTW6wnhdYYDs7yLREaw56A7nnRdtxWKfSorNd52di1O4Uy7X89J3BDgJi
	nUzMsr3Qcdw/fllr0H+brSgxy9PCIK0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Maksym Pikhotskyi <mpikhotskyi@gmail.com>, gregkh@linuxfoundation.org,
 ethantidmore06@gmail.com, starpt.official@gmail.com, straube.linux@gmail.com,
 sameekshasankpal@gmail.com, arthur.stupa@gmail.com
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: reduce nesting
In-Reply-To: <20260416195338.324428-2-mpikhotskyi@gmail.com>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com> <20260416195338.324428-1-mpikhotskyi@gmail.com> <20260416195338.324428-2-mpikhotskyi@gmail.com>
Message-ID: <E7D7D838-852B-46EE-9E74-E7ED7D91030F@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 16, 2026 9:53:38 PM GMT+02:00, Maksym Pikhotskyi <mpikhotskyi@gmai=
l=2Ecom> wrote:
>Reduce nesting by early returns=2E
>
>Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail=2Ecom>
>---

=2E=2E=2E

Hi Maksym,
Your logic is spot on=2E However, your subject line and commit message=20
should be more detailed=2E Please try answering questions like why you=20
made these changes and where they apply (mentioning the specific=20
functions or file(if it changes whole file) in the commit body)=2E Also,
it would be preferable if you sent your v3 as a completely separate=20
thread=2E
Best regards,
Luka Gejak
