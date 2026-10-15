Received: from mta1.migadu.com (out-238.mta1.migadu.com [95.215.58.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052548C8DC
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095068; cv=none; b=I9QRwKHBazYvzRChgsI6Qyg9VE0MG9E+PTzpba6mIIEH9+FZUPIQPPQK84h23Dv6cB55aPzQk0L4737sQNAdnU2Wr9vwWnZM71cZZbHjnbfgKS9aML+FBHvdqYVgKppUvyoc3Ko6Id6LKH7Ev0OZDVdy10S1PJIvZS3OHIoeJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095068; c=relaxed/simple;
	bh=kk+kPcVFHiLVyUQl1wdbVWBtluwdSYxSjGl00eh/bHQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=EfNLfOTkSdYljOn7vAs9jVVCUE7Q8MHfSVvD2gJfkG2z8OuMtB63F2heazDyA5d1OpRSOJGO9mCen4pfyr8LJV6gSjIyTkyMJGPo83AQifWgO9jUSGZoIdAPQXkM+/qVEESTtyeF3+bWHQv1UZMshfKcgxik+qDY7I+kH3ALTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rJcwA5TP; arc=none smtp.client-ip=95.215.58.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rJcwA5TP"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=kk+kPcVFHiLVyUQl1wdbVWBtluwdSYxSjGl00eh/bHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792095062; v=1; x=1792699862;
 b=rJcwA5TP3TDcdoDM08LQU0K0h68hLadHPZv5FtVH+5l6Myg/EETxFTRuhmuSpsRpwRfY8uMp
 LvTLeRKVbs8tEb3KE2N3nJZvYurX+Fs16qd7gdIDJz1VEY4pioIMuBs11UqyjwPxvBCOF6W5HA/
 Zc3Nckdo1vygOPllt9bfJMQg=
X-Envelope-To: linux-staging@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a6cfccf0b1064ed8;
	Thu, 15 Oct 2026 20:11:02 +0000
X-Mizu-Trace-ID: a6cfccf0b1064ed8
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 20:11:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
To: "Dan Carpenter" <error27@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: pavankumaryalagada@gmail.com, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev, dennylin0707@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <atEtUV5q9MHRSTJb@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <atEtUV5q9MHRSTJb@stanley.mountain>

October 15, 2026 at 9:45 PM, "Dan Carpenter" <error27@gmail.com> wrote:


>=20
>=20On Thu, Oct 15, 2026 at 10:41:53AM -0500, Ethan Tidmore wrote:
>=20
>=20>=20
>=20> On Thu Oct 15, 2026 at 9:11 AM CDT, Luka Gejak wrote:
> >  October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> >=20
>=20>=20=20
>=20>  From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >=20=20
>=20>  Remove redundant parentheses around the address-of operator to
> >  follow kernel coding style.
> >=20=20
>=20>  Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >  ---
> >=20
>=20>  Hi Yalagada,
> >=20
>=20>  I'm just letting you know that this change is no longer needed as =
the
> >  entire staging/rtl8723bs driver is being deprecated and removed.
> >  Support for RTL8723BS has been ported to rtw88 subsystem.
> >=20=20
>=20>  So rtl8723bs patches aren't being accepted anymore? I saw Dan revi=
ewing
> >  one earlier, just wondering.
> >=20
>=20I didn't know it was being removed. My expectation is that we'll
> probably keep merging patches until it's actually removed. It's sometim=
es
> easier to just merge easy uncontroversial things without trying to trac=
k
> everything happening in the kernel. We should obviously delete the driv=
er
> as soon as the other patch is merged.
>=20
>=20regards,
> dan carpenter
>

But won't that cause a conflict? PR has been sent today, carrying my
patch that removes whole staging/rtl8723bs into net-next and if
another patch is merged into staging-next, whose time of commit is
later than the time I made my commit localy it will try to exit a
non-existent file.

And since both net-next tree and staging-next tree are merged at the
same merge window this will cause merge conflict. Correct me if I am
wrong, but this is what I think would happen.

Best regards,
Luka Gejak
