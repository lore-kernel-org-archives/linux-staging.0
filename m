Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69172617
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776496969; cv=none; b=MkeV91q6MlXw5YrplFkcP3ACaA6uitKuqUtOWxFu+1h4K5t4Oi93JlFL/CmJ9U0OF+MIiAWwN8AWMhNlwscJTM2d1ajEudVekN1gwW2vwgNQIcYF7AM11yRyEIFzPp7whtPfNkaS/ZG5IyutcMafFQdyq3ZI0ycQr2+Ei2IMsFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776496969; c=relaxed/simple;
	bh=VVBw4QM4Bqf8fdCxE2nqIQ8eYpXfKi2VuVOzPz2kfYs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jDAB2BgQfJu0vKAkTrwbGXMza//i9qZ7j5zWBKV9MWUY/uqlpedFO/22SWHAt2hNO0/FyKBRrcM9svuhIFPLsc1T/ewTrEuhkZ/9fJUOBu0usWEWSeukvqroL1ugW+lgDQWD6AQjn5yWCvGPt0TRXzCFwiNY0Hf7c9rC92wZvDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aRQ0wl10; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aRQ0wl10"
Date: Sat, 18 Apr 2026 09:22:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776496965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsKXJH2pVhKaYfrXZrD0myHzf9pJxNDNfRd4CoLCQBM=;
	b=aRQ0wl106EUhK6ghDO2hl8xGuNfaCu+5aSWX2MW9OD+5VAJEPbj9ieHTz02z7SpSmrkcDV
	oEVgy4wClfS6VoQHRbyYR9wuWJm3fEvysShqtiXuT+42s/xTqt8Q0jfQHWwM9I9GqCLl6h
	Fa27Wt7rmCDW0fk+ozEsIO67vwp0EHQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: osdevhari@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_remo?=
 =?US-ASCII?Q?ve_trailing_whitespace_in_rtw=5Fxmit=2Ec?=
In-Reply-To: <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev>
References: <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev>
Message-ID: <F8BC4492-C5D1-40FB-AA90-0CDCB18D23A6@linux.dev>
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

On April 18, 2026 9:10:47 AM GMT+02:00, Luka Gejak <luka=2Egejak@linux=2Ede=
v> wrote:
>Hi Osdevhari,
>Let's start from the top of the email=2E Firstly attachments are not=20
>allowed, only plaintext=2E Secondly Signed-off-by tag must use your real
>name(Firstname Lastname <email>=2E Thirdly, you should setup git=20
>send-email and use it to send patches=2E Now let's take a look at actual
>code:
>
>>ret =3D xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
>
>>- if (true =3D=3D ret) {
>>+ if (ret) {
>Here you did completely unrelated change to what your commit says=2E
>>  ptxservq =3D rtw_get_sta_pending(padapter, psta, pattrib->priority, (u=
8
>>*)(&ac_index));
>Also why break this line=2E
>>
>>  ptxservq->qcnt--;
>>  phwxmits[ac_index]=2Eaccnt--;
>>- } else {
>>- }
>>+ }
>>  }
> Here you removed an else without readding it
>> }
>
>You didn't even do anything related to trailing whitespace, they=20
>weren't even there=2E Also please don't do unrelated changes and stick=20
>to atomic patch rule=2E Check Documentation/process for more=20
>information on how to create and send patches=2E
>Best regards,
>Luka Gejak

Hi Osdevhari,
Let me add two more things: Your patch actually introduced trailing=20
whitespace:

git am patch=2Embx
Applying: staging: rtl8723bs: remove trailing whitespace in rtw_xmit=2Ec
=2Egit/rebase-apply/patch:21: trailing whitespace=2E
                }
warning: 1 line adds whitespace errors=2E

>Fix checkpatch error for trailing whitespace=2E
And trailing whitespace is a warning not an error=2E
Best regards,
Luka Gejak
