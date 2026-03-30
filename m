Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C92FB99D
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881371; cv=none; b=EmDZStiQUBWXEfS5xvEdq9RGVdn0uwE7kIPwL9971s06i09w1kLUDI1fO0ghaX6g79drdxC6KJpkmGCVoJxshzEvDVmCOLydHpJEgYOtqyOI20BkQPz7fUp2F73A8LcLgk8EuItcCklRaJ04+B1/oi61w9ABsgYIfrQakGaJSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881371; c=relaxed/simple;
	bh=hNktthbVUhxU1iSSkofUPZFScohFvOot44Ez8mpoGEQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:References:In-Reply-To:
	 Subject:From:Cc:To; b=Lna67K+pgD2r4RtdZtiVFj27/N0m8tA5BctixXTUyiUYe6rVCWkL6Z/TxA8+9vj4sxVElgzNv/k7QVT+sqNEbgnpuwhB8yKeu0JLspSUTWfWasiubdVGrapDJLBC171FMup8F0/4Pj2zkWBEPjXvAx4dlJdUqdOH0WICxwi0DUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Hlb0yrJP; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Hlb0yrJP"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774881367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNktthbVUhxU1iSSkofUPZFScohFvOot44Ez8mpoGEQ=;
	b=Hlb0yrJPUczS6h+Am1TG+xzBVyzd42iaOHyRCrnK2P+qo8G3QJfQiDUmzdBGb0jsmv5fT4
	yzbiD/ErcHa8zthO46aHXYHk1ikm7st9FXNNrEWM8YaXbn2Ap7bONTlyIDfh310aUa54Sx
	vEFnEvOtOiFljWpf4dtzIJKek9PVCfY=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 14:36:03 +0000
Message-Id: <DHG6XM1H014T.B4RW4LAW5XXU@linux.dev>
References: <20260330114232.91431-1-mashiro.chen@mailbox.org>
In-Reply-To: <20260330114232.91431-1-mashiro.chen@mailbox.org>
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: macro fixes in basic_types.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dan Carpenter"
 <error27@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Mashiro Chen" <mashiro.chen@mailbox.org>
X-Migadu-Flow: FLOW_OUT

Hi Mashiro,
Thanks for the v2. This series is a solid improvement. Cleaning up the
basic_types.h header is a necessary step toward eventually getting=20
qqthis driver out of staging and into the mainline networking tree.
Here is my formal review of the series.

Patch 1/3: Excellent catch by Dan Carpenter here. Removing the=20
WRITEEF/READEF macros is far superior to fixing them. Specifically,=20
the latent bug in WRITEEF4BYTE (which incorrectly used EF2BYTE) is now
gone without adding any binary bloat.

Patch 2/3: This correctly silences the COMPLEX_MACRO warnings from=20
checkpatch.pl. While these macros are candidates for a full refactor=20
into <linux/bitfield.h> eventually, your fix ensures operator=20
precedence is respected in the meantime.

Patch 3/3: Clean and trivial.

So for the series:
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
