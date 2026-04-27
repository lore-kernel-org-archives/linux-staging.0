Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E736DA07
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270937; cv=none; b=du14Q+0LJgahS5qrIbGQZu9lIiwdJa85lih9yYQeLH4Lm+kdbinF6TsW/F0m6VqlHp/ed/eLyK2UV2gniXe0Bpd3LvEWJp8x6Ue9kfzrUOZ2JZ64DowN5G2WvOe+IrYZiwH6rkUcpHs4u4h/rE6IpD8s8rBR2lqKAWLjV4cs5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270937; c=relaxed/simple;
	bh=j7e/du9+j2jk9AVNnfbZtHDbOyDozY0XpogdSRtO4ZQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZJ5s1Yv9iL5Sk4VyDUSmOHErstT38gsQyMcyQXhsZsGlepEFUA/TJ9Oc9fqkpxLKpfq9Mi+DnkruuFls12pSiHPpHKsJEii33hUyF06us/WJTWIE1vHnVBIgLyorfD+WGda/TbZFoCqnDh+9Gkg7G3EmUeH4iIOAxPWC9cNZcZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UFkX7keM; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UFkX7keM"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777270933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bE8rFBtiQN18oD9KtRCn2qzsGYI1oD+qH+aBAA9CSY=;
	b=UFkX7keMFUFJkiY9FF3Bp8XkSi/yZCcSxV0rhvBUI6/EIdkYZL/PYdFsl3N3fstseUGsSz
	0dE6FmkDcZL0utlRHB19qRMRgBz2Cq1z0H6L4Dcwt9pwyln2pbKXbUhHUIWUMwvzg8vmUZ
	IbXsERwebYYybh5OsZAYDjXv5yS1U3o=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 08:22:06 +0200
Message-Id: <DI3PYO2WBVJC.3J79HVNKTFNOO@linux.dev>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] staging: rtl8723bs: rtw_mlme: fix lines
 exceeding 100 columns
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Luka Gejak" <luka.gejak@linux.dev>, "Salman Alghamdi"
 <me@cipherat.com>, <gregkh@linuxfoundation.org>
References: <20260426225552.87114-1-me@cipherat.com>
 <20260426225552.87114-3-me@cipherat.com>
 <DI3PAOMCIRAL.3FHL3M7JUSBXT@linux.dev>
In-Reply-To: <DI3PAOMCIRAL.3FHL3M7JUSBXT@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 27, 2026 at 7:50 AM CEST, Luka Gejak wrote:
> On Mon Apr 27, 2026 at 12:54 AM CEST, Salman Alghamdi wrote:
>> Wrap long lines and extract local variables to bring all lines
>> within the 100 column limit.
>>
>> Signed-off-by: Salman Alghamdi <me@cipherat.com>
>> ---

...

 		/*  Added by Albert 2009/02/18 */
>> -		/*  Restore the PMK information to securitypriv structure for the fol=
lowing connection. */
>> -		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], size=
of(struct rt_pmkid_list) * NUM_PMKID_CACHE);
>> +		/*  Restore the PMK information to securitypriv structure
>> +		 * for the following connection.
>> +		 */
>
> This is not aligned correctly either. f from from should go under R from
> Restore:
> /*  Restore the PMK information to securitypriv structure
>  *  for the following connection.
>  */

...

Hi Salman,
this is the only viable change you need to make from this email. I have=20
verified that the other ones are visual glitches. Other emails are still
valid and you still have to send v4 to address other isues.
Best regards,
Luka Gejak
