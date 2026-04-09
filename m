Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12201331215
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743848; cv=none; b=VvCS/XNBORH8ao9Avbbl7wLpXsHi5Xhy+z/E1tULG7cF0ms96v2cX9nKs8VdDolGyPURxMM3IMavD66cP0Dr3A7zL8W3I2TfbVt09kqUF3KVtS1ZIpRaXb2cD+ma+KUK6uxbBhSZ4jomJVQ/4vJmrPiZId+k9Hb0f9yUJjCw9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743848; c=relaxed/simple;
	bh=+S5V77JjvcFyHnQUaBrmreqFxuSoVNFTzdSuzZbQfyc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oJtXyRfUtHDAraNndlzYKZ7wBoiyqdNB5XJW1XCYsLt36CAONMIRChf+uidCefeMQBvofJ/d4uP8eJG5SfTj7kVKHeqJQLtEOn+4IeToEnQqYZEEduHMrtNcuqeS/xZSgxIC4K9wyz0RHll0qqjHPkLU1W8XLkuPyZc0ELkvWG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D6Ia4stE; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D6Ia4stE"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+S5V77JjvcFyHnQUaBrmreqFxuSoVNFTzdSuzZbQfyc=;
	b=D6Ia4stEMIdnHqSuyaEXjMrO7TORj12ZNG7CrIfBD0rAH1wLgh2vU1xRnnlw9zhCCpvEcc
	8WAvwNGXW8RyouYKoAKlgtC4dcbMvzeBqCK1A2MxbOQ9+4rW5E4ppU9Y4zdpJUzBJKVbw3
	2DKZAlC4ElTbR+FmjENLC4jXpr+2PKk=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:10:02 +0200
Message-Id: <DHOON505D3ZM.1AA36SQK4WOXO@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 1/5] staging: rtl8723bs: move constant to right side
 of test in comparison
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
 <20260409135026.137904-2-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-2-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> Move constant from the left side to the right side of the test in a
> comparison, where =3D=3D, !=3D, <=3D, >=3D, <, > operators are used, fixi=
ng the
> checkpatch warning: Comparisons should place the constant on the right
> side of the test.
>
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---

...

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
