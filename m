Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9335CBC4
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 08:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043777; cv=none; b=mHFFpEskjvnZW3m9Lkb5wCxJBPiUZcjgzS/6b16VNCCROgxzALKkXZP5udpsNBkd9VrqYwIJUKs5beRFhVJNhjOIL/iWHnCMR1x7sNfaSUsJxDi18vXi0lfJIxNJpRCWZhNcANBIgaciv2PGRBeRbvNjubrYeJrnJ+va+/rooAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043777; c=relaxed/simple;
	bh=WTBs7NOH3cvbVsDdAXXgD8yqzjMwmfcGEXYOhY1BLQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bvtBLVa/6NjRqSyBJ0M6EbS1I1gzHrdRUrbU0/rRwBzQJQ4I72ZBlBLeopDZ15Tw0YfhQ34UyI3ZoZpgYE+bjm72Cgr4ygij9+PKX/0EHm0uWJbzTOMLdjtsBqyE5cceJEmZ5yYZoxEt3h4R/Rzb7DG3KMjHTEOHsV1ipGv3+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVgE-0001rh-A0; Mon, 09 Mar 2026 09:09:34 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVgC-004Uqx-2H;
	Mon, 09 Mar 2026 09:09:34 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVgE-000000002Xj-08Zg;
	Mon, 09 Mar 2026 09:09:34 +0100
Message-ID: <40a03c2851678fc12fcb0e57f4048d6062e124aa.camel@pengutronix.de>
Subject: Re: [PATCH] staging: media: imx: fix parenthesis ending checks
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mark Adamenko <marusik.adamenko@gmail.com>, linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com, gregkh@linuxfoundation.org, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Mar 2026 09:09:33 +0100
In-Reply-To: <20260307062353.22069-1-marusik.adamenko@gmail.com>
References: <20260307062353.22069-1-marusik.adamenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Fr, 2026-03-06 at 22:23 -0800, Mark Adamenko wrote:
> Remove 4 checks for ending with a parenthesis by removing
> unnecessary line breaks, and forward declare a variable for a function
> call that would otherwise remain over 80 columns.
>=20
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
