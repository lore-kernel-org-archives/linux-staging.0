Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5B2472B6
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152156; cv=none; b=Yu+EZx2MZhQAg4WXEAQasRmqNBxB3CtjQdc5Uo+X+fCHl07UxcfQaUx0Pe4XqPVGCucpgKtWgDSjfvbNix04oMoSQRhsVjQHoqHHto2385vIDdk1S2FdMG9spqbBkyDVch6wlyRO0AbVuyacG3ZXzt8navUwxYJjfVQXovgrWMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152156; c=relaxed/simple;
	bh=yLuCOVEHl0t/c2u5YdLWpqYURq7xJuqZy5RH4IGOeyo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uNqa0c/ThQQVx2i9jURG6+nM06/wTViUN5zvF7rQiDG3TrWNRxOp/sCElWdhiU9iVdKOj33MokGJT9aQrzFN6eGGFxdRHrFYXAEKScoP1G45PDpVYaptKinOd94nASXI68GcpyQjPe4qt5rue6GspvJiQP4iNozH+ghIFUPysuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g5+2PIgB; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g5+2PIgB"
Date: Tue, 14 Apr 2026 09:35:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776152152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/XwHekTXc5a/IBfzn9ON1SvPujjYFcTdQWgJXmA3a0=;
	b=g5+2PIgB94VgoqQXlD8wn1AzhdUGu/lIpZ/uIWTiWUaqNqsYB46AkrPLa881/VHRsqhVwR
	WoPf/8383JziyyJXzKVEwYxzgwZVEDctKZsmtQKtOIxKITBGY01JWQP9U0k1LmzesKA9JA
	I7wjlW221hV4ICwo6iXJFB9h0Nf018w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Dan Carpenter <error27@gmail.com>,
 Aadarsh Mandal <aadarshmandal9354@gmail.com>
CC: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
 ethantidmore06@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, straube.linux@gmail.com, luka.gejak@linux.dev
Subject: Re: [PATCH v10] staging: rtl8723bs: remove commented-out code
In-Reply-To: <ad3oSfJnRAjSWrjN@stanley.mountain>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com> <20260414063534.16697-1-aadarshmandal9354@gmail.com> <ad3oSfJnRAjSWrjN@stanley.mountain>
Message-ID: <A04DE1BF-A5C5-4E7C-A096-E70C6A531C92@linux.dev>
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

On April 14, 2026 9:10:01 AM GMT+02:00, Dan Carpenter <error27@gmail=2Ecom>=
 wrote:
>On Tue, Apr 14, 2026 at 12:05:34PM +0530, Aadarsh Mandal wrote:
>> Remove code that is not used anywhere in driver=2E
>>=20
>> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>> ---
>> v10:
>>  - Change in commit style=2E
>
>Heh=2E
>
>We really do want to know what changed between versions but this is
>too vague to be useful=2E  The problem is that we are very lazy and
>forgetful and we can't remember or be bothered to look it up=2E  If
>we have a note, we easily check if you added a Signed-off-by line
>we asked for or whatever=2E
>
>So this should have been "The notes under the --- cut off line were
>misnumbered=2E  Fix that=2E"  It's not really fixed=2E  :P  But whatever
>at this point I'm ready to just merge this=2E
>
>Reviewed-by: Dan Carpenter <error27@gmail=2Ecom>

Dan is completely right that this series stretched for too long for a=20
simple dead code removal therefore I agree with Dan to merge it as is=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

>
>> v9:
>>  - Change in commit style=2E
>
>This should have been "Don't do unrelated white space changes"=2E
>
>> v8:
>>  - Restore the formatting of non-commented code=2E
>
>This one was probably intended to be the note for v9=2E  In v7 what
>we complained about was that you said "no change" and we wondered
>why you were resending patches with no change=2E  This message should
>have been "Add better notes under the --- cut off line"=2E
>
>> v7:
>>  - Change in commit style=2E
>
>This one was "Add a Signed-off-by line=2E"
>
>regards,
>dan carpenter
>

