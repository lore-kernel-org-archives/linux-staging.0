Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4FA30B53E
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845391; cv=none; b=mveBz81Y5Zb2B7/keNPSt0kUIoz6CO1bxNCwkT79tL92zRfyuh63q3CNH91P1NKR1Zp+WiwhGV6z9+LhBYUhhXDV81/oRubDuJWlvVJZej7qbREs7RiQ1Y1jp8leqztAtNC4S//64kSCKDXpYlzTQS6hThniiaxcEshDesNBopo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845391; c=relaxed/simple;
	bh=qnBxEWRw5LTGNo1NwRDKQUOcaRa6MCV3QUG9JdfZz2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwlVJkeHcCpyAsGCX87VmDIXfYEUrOrJxVCa10Jk3YjHE1MiKeRw1W93LJNpxElRonLEhM9paVP8SrNy+mukVA/wpQE1Scwmm7fkF0O1us+cjSA4s639QTmPFS+dOwAqALxHzRrfagrb5d0I1uzIvUfqpQCEPyDZp1rKSjA56Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mavick.dev; spf=pass smtp.mailfrom=mavick.dev; dkim=pass (2048-bit key) header.d=mavick.dev header.i=@mavick.dev header.b=OgkYVW+x; dkim=pass (2048-bit key) header.d=mavick.dev header.i=@mavick.dev header.b=qzbiSM9n; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mavick.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mavick.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mavick.dev header.i=@mavick.dev header.b="OgkYVW+x";
	dkim=pass (2048-bit key) header.d=mavick.dev header.i=@mavick.dev header.b="qzbiSM9n"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gyf6r0dKszMlGH;
	Sun, 12 Jul 2026 10:36:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mavick.dev; s=MBO0001;
	t=1783845380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnBxEWRw5LTGNo1NwRDKQUOcaRa6MCV3QUG9JdfZz2k=;
	b=OgkYVW+xVV16PGzqmSM26EMfQvTmXKZ/+6mQlGY/6k+QAAoGW+Thw6Xwh8TgNxVYKwo1Gu
	0higHqAUKk2p9+xvjD3gmazft0LF0tGp4oY6Wu2cuprKIS0Y+zFYT/XmxTu8TKVoCgC121
	heFWszwtJPJKTwdTWRWy5NMw8t9blRub2s6/wLZDyK0vpJKIXtOV8sYMvLl2y9WNn0Zigj
	ZrWn8HUJPC2rVPf3AFOdW9jBfQxlbV+qLv/KcoEPSRxVyOI2y9TSmPu0e9ofk6idotj5cl
	D+rwJZoBhuqwblFheO41W+u0GphUcU+SMoBrIxBCko1qTMw4YVZS86naJhZurw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mavick.dev header.s=MBO0001 header.b=qzbiSM9n;
	spf=pass (outgoing_mbo_mout: domain of m@mavick.dev designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=m@mavick.dev
From: Eugene Mavick <m@mavick.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mavick.dev; s=MBO0001;
	t=1783845378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnBxEWRw5LTGNo1NwRDKQUOcaRa6MCV3QUG9JdfZz2k=;
	b=qzbiSM9nB1jBZ25QBT8fqLyRWLKDe48YkwiMFjti6a1jUwM02M9XmXmUSSgEfX/1mFBw0c
	OJYNhPgTH8PLblPsG4KQjYVWvm3sl7sbSVLQtFEok6Dy/XZig6y+MAyCkWBgnL+fvqXNCv
	jmgU+Ev/2NK2jEXHNp2vy0V4JexplqwOm3QtXr/IASlMx+TH+a7NWLt1vnPgSO1PWW4sO/
	NJLZEKe5U2TFZlwoVPtHaUc/RY9vWIVWKtOnVoGi4X7GqHVFgUxsLgAB33EGTuQO1tTtUB
	4ESVdxZCOx1ft2L3d02H8gzkVc8NtuENrlE3naQhz8OI6fAH0vzkdBzZDgpG7g==
To: m@mavick.dev
Cc: arthur.stupa@gmail.com,
	dikshakdevgan@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	khomenkov@mailbox.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maxwell2119@163.com,
	nikolayof23@gmail.com,
	straube.linux@gmail.com,
	william.hansen.baird@gmail.com
Subject: Re: [PATCH 0/2] staging: rtl8723bs: rtw_sta_mgt cleanup series
Date: Sun, 12 Jul 2026 16:35:46 +0800
Message-ID: <20260712083546.1525203-1-m@mavick.dev>
In-Reply-To: <20260601093757.612130-1-mavick4022@gmail.com>
References: <20260601093757.612130-1-mavick4022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gyf6r0dKszMlGH

I would like to abandon this patch series.

Best regards,
Eugene Mavick
