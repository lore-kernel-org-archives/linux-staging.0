Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC940148E
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041014; cv=none; b=FNKDBk3MrfPSzX61eM+6PwLloG4HKk9UbS0KSuWu4ZYnLG75KQxhadzL20aYqrCjsHZ5t2S18Qe+axg3oQl3z/gjB+nzjdLqj+nGNqxYeWKPlo/5MvOKQbmyPl8388cVjAGx7Rk9YlS+AIFtBLJ3AT26L3JhnQfQpRC/7nswCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041014; c=relaxed/simple;
	bh=NV9zyaJe1Z2M+ia8+dkHXRYlbAxe8xkpGhpeMJ6CYME=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XM+AThx2Yi4qdaChRgK+cb0X1qsUoR41pmlp6uKoFGLknSQH2uNI4Bmwr53dy5Wth0RldWMrWLOVGZnl+OneK93R+10lbqi0CeWZqdECgLwWSnHO4WAUtNfpV3t1M6/fEHOnkwyoxshDW8bPFyoDBCmXSV4uqClP0JSadd0CCuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lq9XNeIs; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lq9XNeIs"
Date: Wed, 01 Apr 2026 12:56:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775041001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ncR4fPTtiUUazWfu1FczE54u6TUnKr+0d430kMTElw=;
	b=Lq9XNeIsznIBWGwYilljXHjWq/OpCbe404f2NFgWP0+kalvv2NXCRhEAAlrxLdZNHVd53H
	CgEngTvsNwJP38ODQZlo3u9v+VQPyMGwMNPGulBJabL+MPfR3u1zHTpsXeSC3N8J75+U9w
	mTqD88Vq83HF4Ydr00CwQbw5b40FbDw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: omer.e.idrissi@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
In-Reply-To: <2026040159-bamboo-ended-620b@gregkh>
References: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev> <2026040159-bamboo-ended-620b@gregkh>
Message-ID: <7B336E66-4300-4D63-918E-1B658B4D5926@linux.dev>
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

On April 1, 2026 12:29:52 PM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Wed, Apr 01, 2026 at 12:17:41PM +0200, Luka Gejak wrote:
>> Hi Omer,
>> Thank you for submitting this patch series=2E I like the idea, however
>> during my review I have found that there are several issues=2E
>
><snip>
>
>Please review things "inline" like a human does=2E  With the code in
>place, and the comments right below the code=2E
>
>As you are using AI for this, PLEASE use an AI tool that actually works=
=2E
>Use the ones that we have public, which DOES get this right and puts the
>review comments in the correct places, and in the correct format=2E
>
>If I were confronted with a review like this on patch 0/X, it would be
>very hard for me to actually digest and handle it, given that the
>context is not there at all=2E
>
>I suggest you take some time off, work on your review workflow, and
>then, if you still want to help out with reviews, do it in the proper
>way that we all have been doing for decades=2E
>
>thanks,
>
>greg k-h

Hi Greg,
Thank you for the guidance=2E I understand now why the summary-style=20
review is difficult to process=2E I will take your advice, step back,=20
and fix my workflow=2E
Best regards,
Luka Gejak
