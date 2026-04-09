Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619433B6C01
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744329; cv=none; b=mpRGoA+emmLOd8a7q61URPq07CeVBmnZ9TgSxQ+mDg4BWAtXzK0YQDqCG2YtfEsUEcdJemoWvgVcBb4LQu2yM8yx5GszZ7Zx2yi3YPNy02zJYDbst78x0JxhPWJrFxwdkE8ZnYbpQisyWCjpdvvoi1zpCAf5t7XqFD0J2A7r3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744329; c=relaxed/simple;
	bh=fT2Q8VqpJ9Hhrl0HOgx+xkWRbPNvqZpaqr/KdqQB28A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g0TkMITuKYzVkobR6TRe9vvpJvjF+SrTPM8n1TgvWXEdTiYEMqEU4Vj0BpCJzyGLsdu86v+LDf9kWVBCtqLq1WMIp1A3Gn2EivyC5He4lC5gD/7V3EHuTIPRgSTdkq1935uXa0rba0KAXdcN01gioeeXaeG4L9NEhFR49XifQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lwdW8IRZ; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lwdW8IRZ"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775744315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fT2Q8VqpJ9Hhrl0HOgx+xkWRbPNvqZpaqr/KdqQB28A=;
	b=lwdW8IRZeKupCA3CjFv7Xwh2OvQxcItC8EU39viOGRC31koUtKgJ+7IUJV+ZQGJXTlfi/D
	UzQeKrsKFN4GpX3sijJSfMBZaDMrgc9OOATfg9MFY303ZHEzUospVdullQ+tS1uvJh7EGZ
	LQFcKTZP1qvfOjHaEJPCPUMWaSD4KJc=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:18:28 +0200
Message-Id: <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Prithvi Tambewagh" <activprithvi@gmail.com>,
 <gregkh@linuxfoundation.org>, <abrahamadekunle50@gmail.com>,
 <b9788213@gmail.com>, <straube.linux@gmail.com>, <tmimiharoen@gmail.com>,
 <filippo.muschera@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <rayfraytech@gmail.com>,
 <david@cardinalsystem.net>, <weibu@redadmin.org>,
 <dharanitharan725@gmail.com>, <ignacio.pena87@gmail.com>,
 <dan.carpenter@linaro.org>, <karanja99erick@gmail.com>,
 <luka.gejak@linux.dev>, <khushalchitturi@gmail.com>, <suunj1331@gmail.com>,
 <s9430939@naver.com>, <nikolayof23@gmail.com>,
 <bryant.boatright@proton.me>, <ysinghcin@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> majorly focusing on fixing checkpatch warnings of constant being on right
> side of test in comparisons, deletion of empty if block ,use of
> read_poll_timeout_atomic(), and other code simplifications.
>
> Changes since v3:
> - Rebased the patches on top of staging-next
> - Remove compilation output from cover letter
> - Add changes in each patch version in cover letter
>
> v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB=
3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534

...

Hi Prithvi,
this seems better, but I have one question. Did patch series appear on=20
mailing list to you, because I cant find it and my emails sent today=20
don't appear either. Not to be misunderstood I don't believe this is=20
your fault but I would like to know if you are experiencing the same=20
problem.
Best regards,
Luka Gejak
