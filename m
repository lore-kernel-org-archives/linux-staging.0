Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17DF3A641D
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907456; cv=none; b=nLtgEdDV+zDt9TfzLVxl0UtUYnzOwXxudLmmHvLbXUcOBvcKULmdIacW8ahuAmW3FswCFnCmX7hShfuDx10oLjIC0xH1zSL3x26H0GxlXGZer6dTLb9881l2txO4ETkstZtic/3Q2fLOUBHMzjEsFYIKtDCJIbc4yS2qKj6kww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907456; c=relaxed/simple;
	bh=EYBMQS6lc/JGLdjN0BciuBZq3dWnkkvM1TJupfJN2jo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lU80emxAq0zqfGq+ne1iIvVH2jBn6eQchMhwodZJP1z1+Hl2jKMTMLGT5yyqYVwU2/DF23CYVPHQtO1fI21YOGgLjtGjd+4LFz4iZ31S90xXOfmwtsolbZjOyJfWjQJ3jM9u/PyorgHG5EC1WfRUt5BNhSZSC+q2dEtpLewDDUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nUnaK48+; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nUnaK48+"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773907452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYJjkYoiWJ8VLN4qqUumSb83tS8piiRs3ypLcYv+ssU=;
	b=nUnaK48+mcxv2Nrj3IUbeyhmpQhya2VPFEP7ic3LjjYqz0ynelvzNMLF3USY77UhTuOVx2
	UWf01kiztNjTJ85X1sQkJ27YRGKgdNXYNzCOGxuIFJkYLaDcat3lsCvlDpdcy8qjZ2mVB9
	00nk0/i3OxzwDkydOvbplMUf+bNUmfA=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 09:04:05 +0100
Message-Id: <DH6LPIGRIL2D.37YZEKWFQSMTD@linux.dev>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Michael Straube"
 <straube.linux@gmail.com>, "Hans de Goede" <hansg@kernel.org>, "Khushal
 Chitturi" <khushalchitturi@gmail.com>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Vivek BalachandharTN"
 <vivek.balachandhar@gmail.com>, "Luka Gejak" <luka.gejak@linux.dev>, "Ethan
 Tidmore" <ethantidmore06@gmail.com>, "Artur Stupa"
 <arthur.stupa@gmail.com>, "Zhuoheng Li" <lizhuoheng@kylinos.cn>, "Nino
 Zhang" <ninozhang001@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Reduce indentation in
 rtw_joinbss_event_prehandle
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260318225550.535368-1-azpijr@gmail.com>
In-Reply-To: <20260318225550.535368-1-azpijr@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Jose,

Thanks for this patch! Refactoring these deeply nested if-statements=20
makes the mlme flow much easier to read and maintain.

Functionally, the logic and lock handling look correct. Great catch on=20
removing the redundant spin_lock_bh(&pmlmepriv->lock) before the=20
function returns. That is a nice optimization of the original flow.

I have two minor notes for a v2:

1. Subject Line: The standard practice for staging is to use a=20
lowercase letter after the prefix. It should be: "staging: rtl8723bs:=20
reduce indentation..." instead of "Reduce".

2. Comment Typo: In the refactored step s3:
> +	/* s3. find ptarget_wlan & update ptarget_sta after update
> +	 * cur_network only for station mode
> +	 */
The code here is calling rtw_joinbss_update_stainfo(), so the original=20
comment "find ptarget_sta" was actually correct. Since ptarget_wlan was=20
already found in s1, you might want to revert that word to avoid
confusion.

Best regards,
Luka Gejak
