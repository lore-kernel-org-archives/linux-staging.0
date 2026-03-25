Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05869279DC2
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 05:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417089; cv=none; b=Ou6MA7kM6nu1Rxz/So1GYCgXyba2Wn3XnViT3GfGLzlhrOvRHqwgrdaz0KpdXw0iJrM0QeknRCUx4jGpUqcRIuv0kT7OULUl3j5F6PJ34CzIkxp7Xr4qJrzJiK2FeQQhiRCTXOBPMFW2l9IQlHVwQm+Ecv7JmJnIMIswpl6ej/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417089; c=relaxed/simple;
	bh=CdtAm7jhbxmUI5O3yjvTUSbAMySqjHgJUyyl+v+znTA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=SQWmnbVFyZlUYQQPQeqlrUJUW03qQMNGZ6kiJr9FJqvObaQyIYxN310s/cWIAZCPUxwoInedY1hYMILmarpnEp0EBNizG96PFDSaY/HX2qR0yeDDCrghdyejoZRdrYV+LQSplW2/tyQ9mNWtxsPfX/hSncr26/i8ICcPfyuLqOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nDYiFQWW; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nDYiFQWW"
Date: Wed, 25 Mar 2026 06:37:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774417084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Bfh81PSwGljuJfbHX2f9q3a/n8DkMCT0mbmI7oT5Xk=;
	b=nDYiFQWWuFcTBbr4cYz10HUv+m4Jn9XDmNXJPPQgHAViA0x6pfx+z4DUPe+NtQRUX31lK7
	LxQWAOvOkjRzPfM2BEC/rM5VFXQecr5uEIwknaR80F30T+rt1//GdtumkwmTeOyEsCI3Ga
	mzxV8kph8mRnCidXXlUNedLR2egof/g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Aadarsh 7001 <aadarshmandal9354@gmail.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>, gregkh@linuxfoundation.org,
 Ethan Tidmore <ethantidmore06@gmail.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v7] staging: rtl8723bs: remove commented-out code
In-Reply-To: <CANQQrNMNRuFw29zhckRYJ37Xf0YDXqZg9jnHgXznvNL=VfS7kA@mail.gmail.com>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com> <20260324040718.7777-1-aadarshmandal9354@gmail.com> <acI1M_djkY5NRe0p@stanley.mountain> <7B1A6199-F3D5-40C8-B63A-421888A173D7@linux.dev> <CANQQrNMNRuFw29zhckRYJ37Xf0YDXqZg9jnHgXznvNL=VfS7kA@mail.gmail.com>
Message-ID: <FB65B2BB-8D3C-4845-9545-7E49959CAAFA@linux.dev>
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

On March 25, 2026 4:41:20 AM GMT+01:00, Aadarsh 7001 <aadarshmandal9354@gma=
il=2Ecom> wrote:
>On Tue, Mar 24, 2026 at 1:42=E2=80=AFPM Luka Gejak <luka=2Egejak@linux=2E=
dev> wrote:
>
>> On March 24, 2026 7:54:43 AM GMT+01:00, Dan Carpenter <
>> dan=2Ecarpenter@linaro=2Eorg> wrote:
>> >On Tue, Mar 24, 2026 at 09:37:18AM +0530, Aadarsh Mandal wrote:
>> >> Remove code that is not used anywhere in driver=2E
>> >>
>> >> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>> >> ---
>> >> v6:
>> >>  - No change=2E
>> >> v5:
>> >>  - No change=2E
>> >
>> >Why are you resending with no change?
>> >
>> >Also you're not working against staging-next=2E
>> >
>> >regards,
>> >dan carpenter
>> >
>>
>> He probably means no code changes as the last
>> two versions were related to commit messages
>> and Signed-off-by field=2E
>
>Is it wrong to mention like that? Thanks
>
>Sincerely,
>
>Luka Gejak
>>

You should mention any changes made to the patch, even if they=20
are only in commit message=2E
Best regards,
Luka Gejak
