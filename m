Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEAC3D3CE7
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339952; cv=none; b=TEhlb6SSL3tJFnO5gXAVyoycehaPPwHI0saCV9YtWk6wek5bnymGdBJLgJFOn/qC+J+ypSVs36WUaB3kTpvBSxa45iJpos/2pG5qaJivoIjQYvcYNtqWQWEvN6jizM9R5r6gov0k2jFSKn6Z52tbNPT5blIDoreeWLvq2QgX6Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339952; c=relaxed/simple;
	bh=YLUaZ2pUeIpDOdh3BNxucRRtphnihrfsXZ9f9SX2kc8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=T784emxn1k0eP19ws4F1+SwEWF7RUAIndww3BWtpOa30ur25nTmUeRN08+aScclOLmZXWd1/D0fW7nBnnCW4u7G9wD18B9g8WoGUumcFr5XhvhQ+ZZb+cKPjo2RSssyIx/JJidKMbUpWcdTnjQpdGQpoTLRS/I6W9HH5Zz5Kvn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n2qJXTmS; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n2qJXTmS"
Date: Tue, 24 Mar 2026 09:12:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774339943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxPzvqLQTBow90YLnZ6OSHwnkfKWoTduKNFo3wPzW7M=;
	b=n2qJXTmS3b1Jy6uHXJJT+xD2c7cQPLg3Zr+cmUtV71iF91DQncLovTt++j6D/ONuMgiiRk
	GtIf7yzix0NzVlfvGuL9yMjFgKp9yGnh7T79FQ5bx7nGtTukii2wEZOnDo0OFggCgYoWtW
	24QxZ5Kkor/vTvoEvyDjuVW2BsDZOGQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Aadarsh Mandal <aadarshmandal9354@gmail.com>
CC: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 straube.linux@gmail.com
Subject: Re: [PATCH v7] staging: rtl8723bs: remove commented-out code
In-Reply-To: <acI1M_djkY5NRe0p@stanley.mountain>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com> <20260324040718.7777-1-aadarshmandal9354@gmail.com> <acI1M_djkY5NRe0p@stanley.mountain>
Message-ID: <7B1A6199-F3D5-40C8-B63A-421888A173D7@linux.dev>
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

On March 24, 2026 7:54:43 AM GMT+01:00, Dan Carpenter <dan=2Ecarpenter@lina=
ro=2Eorg> wrote:
>On Tue, Mar 24, 2026 at 09:37:18AM +0530, Aadarsh Mandal wrote:
>> Remove code that is not used anywhere in driver=2E
>>=20
>> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>> ---
>> v6:
>>  - No change=2E
>> v5:
>>  - No change=2E
>
>Why are you resending with no change?
>
>Also you're not working against staging-next=2E
>
>regards,
>dan carpenter
>

He probably means no code changes as the last=20
two versions were related to commit messages=20
and Signed-off-by field=2E
Sincerely,
Luka Gejak
