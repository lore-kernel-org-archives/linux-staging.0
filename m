Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485B62F83A0
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462520; cv=none; b=DV3aMfkP0Fp/HpjUhjK/wMy2Negp0SExeBh0uFEa9FwKcnbQk2KfbgtqLiXFK2QhpFELARSQoxaE4aTGP66+GuBJC+n6BnL3bU78DVFD4qCciEr6ihe8zQsNTpVpIjyRA6hIfvfvtFX9EnmEYjD12qd1r1kaDdYZ5ecJgIdQgws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462520; c=relaxed/simple;
	bh=kYGAGeHCPt/7/exyEXC+ixGmsyjkga5qj+sDZ3ryGnA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ucPie3h361jQOvZ6+ICctpqoEtiHyRqTqTA14cGK1Q+38cbRxjiJ6l7+Lof+CB2kPiFTwnrLG4xdC5I2V+BR0qKRr59JEuByWS+XQfH/yaXlwGXYNt+qJSmSeG47e22aip//NMnPL11khPoVO9VmBHgqL1S9HEvgjJuoqw0I5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aHQIxoj4; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aHQIxoj4"
Date: Wed, 29 Apr 2026 13:34:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777462516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYGAGeHCPt/7/exyEXC+ixGmsyjkga5qj+sDZ3ryGnA=;
	b=aHQIxoj4Ieu7ngiySX44nWAFbZ7NzMQb0zdbQumfWSPU53Z9s7+l/Ttq0XX4HgTftu2l3m
	5I08N/N/+AZioidh22EzfkKi8sD1vxUMYZJG0Ma+gZcq3Jbr5SGr85rTsh/NC1XWcNZtFf
	MSeVxsHo1kkdwPjDL6d2HWtkCF36JGc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Linus Probert <linus.probert@gmail.com>
CC: linus.probert@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 luka.gejak@linux.dev
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
In-Reply-To: <177745958799.1254637.4289009650997698120.b4-reply@b4>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev> <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev> <177745958799.1254637.4289009650997698120.b4-reply@b4>
Message-ID: <FD718F1D-8156-4E27-BEE7-23E66D045A2E@linux.dev>
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

On April 29, 2026 12:46:27 PM GMT+02:00, Linus Probert <linus=2Eprobert@gma=
il=2Ecom> wrote:
>On 2026-04-29 12:24:53+02:00, Luka Gejak wrote:
>> On April 29, 2026 12:18:12 PM GMT+02:00, Luka Gejak <luka=2Egejak@linux=
=2Edev> wrote:
>>=20
>> >> This series eliminates all remaining checkpatch warnings in
>> >
>> >LGTM, so for the patch series:
>> >
>> >Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> >
>> >Best regards,
>> >Luka Gejak
>>=20
>> One note:
>> For the future cleanup series, feel free to squash identical logical=20
>> changes into a single patch to keep the commit history concise=2E It's=
=20
>> up to Greg if he wants v2 but logic is sound as is=2E
>> Best regards,
>> Luka Gejak
>
>I will make a note of that=2E In this case what do you consider an
>identical logical change? What would you suggest that I squash?
>
>Br,
>Linus
>

A logical change refers to the type of cleanup being done=2E In your=20
series, patches 3-8 all do the exact same thing: fix CamelCase names=20
for functions defined in rtw_btcoex=2Eh=2E Instead of 6 separate commits,=
=20
those could be squashed into a single patch=2E But as I already said it=20
is up to Greg if he wants v2 or if he wants to keep v1 as is=2E Either=20
way code itself is good=2E
Best regards,
Luka Gejak
