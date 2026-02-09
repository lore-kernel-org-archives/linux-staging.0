Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AD18027
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770612959; cv=none; b=AkQ4zjQwckWZrn1lKFsrQMYjm1s1LQ27lWWzMULlde4zq7JL8ZZRrJmG19+U/2CgtTTAXFCaQGep9ZmMRPP3JevBsQQq/Im3AuIbnA0E+N2j9VIbCIwi7fjK28gyxAv0BkmHxMRP4iT2azLhNO8oKgGWridEGaMLDPEXaBlBX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770612959; c=relaxed/simple;
	bh=1nyS7lbXnHgai1A+sIgXovx2mevnkD41RjmQtUQ01uk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BDOlq5B6vni+9XDpRVuONaNDehNA1mlv2LNJF56mGjTZV9ttz5x1J2liquQTebTSzvh0peenRP4pgylDMqIRoy/Wl+2E6yNY+TPR/FDNgDYTyYYHYZqziHY6jA+IkOMnJEFb+PUlYhKq8ztmQTwRIDO8Kx6b7UnfmVZ4mDp/tEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com; spf=pass smtp.mailfrom=ohxorud.com; dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b=LjCa8K3l; arc=none smtp.client-ip=185.70.43.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ohxorud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b="LjCa8K3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ohxorud.com;
	s=protonmail3; t=1770612949; x=1770872149;
	bh=ajz/J67SYGZtvvatvCFt61byHAfVGF/M2f3Jg6Efk3I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LjCa8K3lrWC+ZYlV0jmoOY9SpTMVkVCBE6I4tlE1hM9EezxSusenuCmLbT8XaPRTo
	 r0MaS5rwUDwq9MIerWaPkVURsFHJ5RDUlYBd7x9VgIwI++7oegwdrDVD+SzvG5nbtr
	 6bkPx9yPdogTEipBYMlu5UE+h29qfcW0yRJyzPMsOJoGTx1/pWeIhSsPW0fsiGSeh+
	 AjqUcBZjaoWys0s4yTJdOCeYLUiyp2XzJEtDtCzsm8Z29ICFLilIW9NLNO0cVliapV
	 HP++2cII09HyrVpnGSNCQorCpE1WfNh5ivCCwYXXgs1ec30oep9J3DFYwkdayMke4s
	 EtFBZl+S/DyUQ==
Date: Mon, 09 Feb 2026 04:55:46 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
From: Taekyung Oh <ohxorud@ohxorud.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Taekyung Oh <ohxorud@ohxorud.com>
Subject: [PATCH 0/2] staging: media: atomisp: cleanup ov2722.h driver
Message-ID: <20260209045514.40352-1-ohxorud@ohxorud.com>
Feedback-ID: 133357498:user:proton
X-Pm-Message-ID: 76bf0fbbbec20355906d96a6064303f9a1a092c0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch cleans up the ov2722 driver in atomisp staging.
Both patches fix warnings reported by checkpatch.pl.

Patch 1 fixes block comments coding style warnings.
Patch 2 removes unused code blocks enclosed in #if 0.

Taekyung Oh (2):
  staging: media: atomisp: fix block comment style in ov2722.h
  staging: media: atomisp: remove dead code in ov2722.h

 drivers/staging/media/atomisp/i2c/ov2722.h | 649 +--------------------
 1 file changed, 6 insertions(+), 643 deletions(-)

--=20
2.50.1 (Apple Git-155)


