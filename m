Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E3D3D8117
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942377; cv=none; b=FHpMUzCrTXV54fWSfNyyxDOVNO+OSR1X/Xo/FuWKBvGd3kDx19UcbmsoOzZ438Yggs66NtXUYcqChSbgrkViHcjZTxJmMIJ4FLqYk3cwPL65Uxp/WTxzzcPYWkg6p0aht/LcjAVKxGTBUNqjH9J7fuLLjBASmu1o4rb5p4j1h14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942377; c=relaxed/simple;
	bh=jfNYeN99gAO59FwG3P3VAa3kf8hrzQVeZ3qtqu3ruDY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FLNzrlFx9SEjCaBQ/1KuqMcp9VgG8+XvzOf/QnON2L00RKd3tBJJY3TeROydAB5EtzWzAqpzTEM7PooL9sORJma/niVE5tEQWQtpa8G/SKWYTbySA0dt5ieVH3HT8vjov8e1s1a8zZJ0mn/4bZmLoJB9D1bxI3UtIN38f+4TosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j25jTwoC; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j25jTwoC"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773942367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfNYeN99gAO59FwG3P3VAa3kf8hrzQVeZ3qtqu3ruDY=;
	b=j25jTwoCxS4jJrhT7KutMhYXWhrziN4+OH5KkQzzUbKwpyytDLjwVChf1mQNg6yUD5vw53
	Gmi/vd0Q6eJLCpn+VkN4BZRxMjz+/0exX/vl4X9HSD4dvnsbh3KQTUpa1ziyd0ZiW6x12l
	y0AdupUISGzIoHl+JGgZvZor5tVzh34=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 17:46:02 +0000
Message-Id: <DH6Y335L3139.IMXTCAPS9LOJ@linux.dev>
Cc: <luka.gejak@linux.dev>, <ethantidmore06@gmail.com>,
 <dan.carpenter@linaro.org>, <linux-kernel@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <straube.linux@gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: removed dead code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Aadarsh Mandal" <aadarshmandal9354@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
 <20260319141818.7735-1-aadarshmandal9354@gmail.com>
In-Reply-To: <20260319141818.7735-1-aadarshmandal9354@gmail.com>
X-Migadu-Flow: FLOW_OUT

Please send only one version per 24 hours.
Otherwise, looking good to me.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
