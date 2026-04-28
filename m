Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097C33B2FFD
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376816; cv=none; b=pEu75oQxJrXaZkA4HxKft9vD7RoxJDIn6+x0yCuRLKrJcwej5Si9PJv/b22RDQRrsNIPkVnLGLSAK/q0NLty8byoifb27ud6qMwBN+zb8+UtgqSr3M3YFWz2d+/yFuiGPEi4JIvDjqukVg/GziDOCtZ1n0k0SwZvrkGTeFlIO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376816; c=relaxed/simple;
	bh=DoZItnNhihX3rpkapjq5Z1COmljE1ebuaVaFQ5xsp50=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=h/3ltMOPpD2bwh/k3beDs8su07ghZtD3sXyXr/KQI/i1uNMHe0tTk2ol4wpIdW3URnApEhw4uKPbMg8XY4RMo5TNXlzE22R7dJDA1hGNnRdjhyTlCLJtm+EbAY6WyDd68gl3Ry2LBOSdqR8vPsz/cPknIcPbBYM/8hWLc0bU9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=zc54OAsg; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="zc54OAsg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 3810884F8E;
	Tue, 28 Apr 2026 14:46:51 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777376812;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UJpMlC7zGtiDvlKG3wyhvRJ3zonmeo5nh79Mh17WUnw=;
	b=zc54OAsgjc06+lFNR9F1/yBLQ1Yp11O9gV28HXPUJngFDJpZh1v3TeNUgZE4cf1vU3rh7D
	yeOgCM95Ep6yqW2RS0E590ZWZKfU3ykoFREpyLRGPNhRhKr+SSOeWYziFKIXn6ArelLPmz
	H6tyxptBeScB6DXOwSZAzvqBm3si0fyexmPg8l54NpcrbFuy8ZlFAq89hZav31Q1vYXzkc
	ozPvGhxllz32vX3T2qX/hBfSPW8LEciARuV7IvnYIqDMU7BUCZcPhth3bfNw3EOuMnAcM7
	zco8cQxXakLtXrZIwBY5MZ9fYyerBShMmQoO1vGGyXfC+IpQgPYC861yaYTPy1AllAytS3
	9d2+9CQAudERJNsTsT9S6ZY9KQrnbtp9ZlSRdpillvKwjaAdbhPHxiyby+e/d8orKRexDH
	CczHDB3DpzYp5BXEn1gBjW/hLhBNmR1yUOq690fOcnMVcdlzidu/Iz9OZy0hojQQurIvIn
	I5JbakNqoOmYD0pT0PZUkHb3jnOVjCMih5tgoAqmueoCDZ9Z8Rn4+iF+Vy0xOzQ+4/QIOT
	5ANVdqKq9B9s4oETW2w2RYh3ALcfpWO3CnwGWSQXJJjXm05FscSM0CqNm6mHbjQc7cfLL1
	1x10CL0fi7Z9nHKUPF+jnh+b5SuIkYYRvE3hSJQo1K8Od1hB1sfQE=
From: "Salman Alghamdi" <me@cipherat.com>
In-Reply-To: <afB5jnwGX6H5j0PG@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
References: <20260427190548.156499-1-me@cipherat.com>
 <20260427190548.156499-5-me@cipherat.com> <afB5jnwGX6H5j0PG@stanley.mountain>
Date: Tue, 28 Apr 2026 14:46:51 +0300
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
To: "Dan Carpenter" <error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <097542ec-adba-ff0f-7d7e-8b496a9e78ef@cipherat.com>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 4/7] =?utf-8?q?staging=3A?=
 =?utf-8?q?_rtl8723bs=3A?==?utf-8?q?_rtw=5Fmlme=3A?= extract local variables 
 for long expressions
User-Agent: SOGoMail 5.12.5
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

> Just write this as:
> 					if (!rtw=5Fdec=5Fto=5Froam(adapter) ||
> 					    rtw=5Fsitesurvey=5Fcmd(adapter, &pmlmepriv->assoc=5Fssid,
> 							       1, NULL, 0) !=3D =5FSUCCESS) {
>=20
> The "roam=5Ffailed" variable isn't beautiful and the if else makes th=
e line
> five characters longer than it would be otherwise.  Eventually we'll =
get
> rid of the =5FSUCCESS but I like it to look ugly so we know which cod=
e to
> change.

Should this change be in the same commit it was originally made on?
I'm not sure if removing a variable from an "introducing variables" com=
mit
makes sense so I wanted to make sure before v5.

Regards,
Salman Alghamdi

