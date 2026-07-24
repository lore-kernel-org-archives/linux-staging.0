Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D29377AB6
	for <linux-staging@lists.linux.dev>; Fri, 24 Jul 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885674; cv=none; b=Wu2jfO7mFcQLeXL3hLKTYOqY6Utj7GTFoto+3+Z+buzUyFgkwWW92sgy4ODRe/ENYt6fqKHpenBlCjmaCx+tJR1XsmuR6nLJHjeZgRcublYz9P4g9uNMFJObuB6bmRhIAZZ0ivm6SgfTlbPcxnj8nn2t97cVURw2Xgz3HnQWOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885674; c=relaxed/simple;
	bh=8gcy2zLBaCdLpQ/eKMcYAZX/j0Ykh5B8FsBo2OmTc1c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JkfYZrEBwfhCJOriGDYgrZSI74fPJ0Xay9VfTFBBjxkO89pXw8eqJrdfhG/NQdG+fkOloUPgmGOt43jqxKwtgByzImSEI4Rr+ux4liJGvf+vYSiXMbOQOFdoFkDSMrUKVehBsWxYHHwWfXnJimcsDR85PEc7AfXTeVXH1ERH8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=KDYi/P3z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C3amm4nf; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="KDYi/P3z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C3amm4nf"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 485B31D004FD;
	Fri, 24 Jul 2026 05:34:30 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Fri, 24 Jul 2026 05:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784885670;
	 x=1784972070; bh=8gcy2zLBaCdLpQ/eKMcYAZX/j0Ykh5B8FsBo2OmTc1c=; b=
	KDYi/P3z4UiRIYwaG4oEm7JsBKKoERWs9Af/9cM5WkJBZvWF2yYiZSmW8r4okFvb
	7D5Ua5U/8Pi1/8sbf5EA9EsgfXY/hhEqYRR3mcGxMQ7qxK+9gtGCxbGjH4MpHDPX
	mW7r8V8vi8X6PffQ3j4IiUSw0zNtNfalM92TyEpsk0xf0o0uhHpGIsk5VGHAM+BS
	heA5MTtdkBq/FB66IsObB/Ir1MBBT+chHoFmK8FG5iwCpXL1wAmB9iYQqjxIHUYb
	zN9Uqu4raY3V0lpToiSRtnQAizooflnyAIXosNTGEk9Y7aKrN1yJnH4UYSs8lP3+
	pEeC+XVc7XGz6AMCO+wf2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784885670; x=
	1784972070; bh=8gcy2zLBaCdLpQ/eKMcYAZX/j0Ykh5B8FsBo2OmTc1c=; b=C
	3amm4nfiTgdN1eXnQwp7cvKDw5jkXNpdMAA9FymYPjeKjGbjBUth6MAhV/ypv0NT
	KmrukSG3ILOe1yH1CLmF45O5onRqEC8sc/rOFjRxLl7G/pvzoYcO7qGJIi3yWteX
	EbKRiUoPbBErlscc4keObx9kWvjjK1rhKyZMHdxpLqllLHHQ1NqmofgJF9jx8pSo
	bZyX99jO7lfqwAxRLc8qXeDI+drAYuk+kGR7a1x+pAXQPrAwnNBkOGCXlCtwEb/N
	Rpw8rSt3xwVEseMWR5q6FNqPX+rKKcqIIBqVXLWq7d8jUCZe5F7npeAmfceTNcZI
	hqZDeCqXgTEoJXtvkP0Rw==
X-ME-Sender: <xms:pTFjagQC7dvewu-AISx5_rjJlaR_LmBWkYhaxtR9fb3SZNlGkhXZzA>
    <xme:pTFjaolH-MIw6vjeXFE-gEZekEn3QjNr96kK_goFmjAl0uzxejrfU8HXyVW6wgHtV
    Ruivqw8693YJ0uXxqThD2fM906-CnTxQuNcf1jcIP3uijUOw9Dh1w>
X-ME-Proxy-Cause: dmFkZTGarKqEYyZgRkCOSRz5emK2BAGzaNcoYhciZVYK/1l3GK0CqjCjuU0YdXkNHEufiS
    7AQGu0lzyGC6OgZVZpISN3kw+0OR5JmPUELAqodb1D/bYBiMiT/YGPa3IghyFajPYrXw8T
    sDIt8NrgkcCAMVomrlLcC2V2aY+sIRod+uLG0gBoXdN4IwyGkuaDdD7NreweeYlYrjq84d
    YvJTfjeEcGgvhR9DyjUM3vBzeZzxg/mT6j/kutFd/7Ieq/6PDPHsR4ax+H81CkGgqMeRSS
    WjGRX7Dwo2/0OWyEE/Eb2f4oqhb9fT6nPTlxhHKgpZBiVmQc6hBwPZoTJRP/aGpzeL7Ndh
    kA+/971IhhgsxFn8UvEwmUfsKWzqpxydHRmuRpkf5WycoaG2k9pf86NwRB4qe3b3gZtBWb
    7KD0iG3HjfHXzTVqhLiIF9H5SCHReQkuvqb6TdgFOrlaVHY3nbwm571pQoDqIMR/NakrXF
    z1ccn0iNCN2RS8tlGa6fPiI4BqvluayPdlYXStEjv4fhYmexrLOlyHmV9g7ONRmErDtcol
    my9tKLtVnqxmfJBOxqFvE+6Ly5rPKKqLaUXKEI1kRj7F31J+0qicxoG3EHU23Qjuesvf8B
    MymbsE3Dd+VwVbiXOMEYuNwvx0dTZLCZVKu18/v4esl4un5fNKARQod7EzUw
X-ME-Proxy: <xmx:pTFjajek6OcrNTBiHJxVtkIHQGW47RWwQtZRN8EZo1GEjuOCuio_4Q>
    <xmx:pTFjanfbwziM3LbvlNLrYoOKlXma0V_GRWycKPG8rGmwQtErc4Un5Q>
    <xmx:pTFjal2fk50jgOWqoyEu_jyAAeugp3v2rqHG8EBes7bgvshrtDtouA>
    <xmx:pTFjan87qT-SlBsResX6f6-y-ybV7Jawus6ZcqbbtMXHvrgp0VrQ0w>
    <xmx:pjFjaupW8alM1otK-4KCtBXtIIUdoaxYzEnPZ3txjwjv8xyi8n77u-dM>
Feedback-ID: i372e487a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2E170C40071; Fri, 24 Jul 2026 05:34:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A74LFP6wUQ7F
Date: Fri, 24 Jul 2026 18:34:07 +0900
From: "Jeongin Yeo" <jeongin.yeo@luaberry.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org,
 "Greg KH" <gregkh@linuxfoundation.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, andy@kernel.org,
 matt@mattwardle.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <c5ddbe32-fc3e-416b-958a-bab154248d15@app.fastmail.com>
In-Reply-To: 
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
References: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026, at 5:05 PM, Andy Shevchenko wrote:
> On Wed, May 27, 2026 at 9:37=E2=80=AFAM Jeongin Yeo <jeongin.yeo@luabe=
rry.com> wrote:
> >
> > Remove the hardcoded function name and line number prefix from
> > dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
> > can already emit the function name and line number via dynamic_debug=
's
> > 'f' and 'l' flags, so embedding it in the format string is redundant.
> >
> > This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> > introducing __func__ to format strings.
> >
> > No functional changes.
>=20
> LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20

Hi,

Gentle third ping on this patch.

It already has Andy's Reviewed-by tag. Please let me know if there is
anything else I should address before it can be picked up.

Best regards,
Jeongin Yeo
