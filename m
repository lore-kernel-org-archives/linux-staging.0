Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF53446BE
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153829; cv=none; b=udXTUD0/UDvxRYhrB+aLuYrksa9Qu2ta/kHp2StiZuBZ0Bs4BJmKwISflL2iusIkRfIo62fNui7rRQSJq0yA07rbmonKPgmDrHampD3t6uPwe/2sfzFbJaDrF6t46rsoJKz4mdusYqjC8SWApppxHKYh2AQgyPIfWpehk3PsTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153829; c=relaxed/simple;
	bh=gYFgZQivm6+5UYWuVEb53q7llWgE0aK6PpIadIw7FEg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SkW3cB8vdprHKZLty/olmnVSe+JPJ4irGRIcbOG2ijfP5pesppieHDW+OGyAj+H/0J9ALJ1qXpCd2MVnmUx8Ax2Pbtrup865cpdP3bK32uGeb7XheSCnZfMhUte7FkiNp/kuNNbc20vejoldLDKAA5/+wjE6aSFtxPvVjuLU6tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRNl9XWS; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRNl9XWS"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79ab3e26cceso11515297b3.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775153827; x=1775758627; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYFgZQivm6+5UYWuVEb53q7llWgE0aK6PpIadIw7FEg=;
        b=rRNl9XWS2tjPib/fMHcmPOzu/eB1euD4R3nvhza71iTTU6inh1GvtLz1H0Ko/0bwqL
         JQwSktK5QSxwdHQUNMUpE1yQHJpEj5KfH1afcRdk9mn2xfXXDvRWghUqHNOBDlHUQqL3
         SRXxN6hYQdpMn/YCQN8n+TtVyspLvS3VEOKf8EStrgOvzG/FseYBM3/KibS4jMmpqvDl
         941K5CeXQw+8r8hoTKOpYoUXQ1gTd2AYbwuSUaApm4KsVcPS3AZ1IT+Ml276mDSSjyRp
         usod3Bzj7AaaB+FO1sGmO+lMp4zD5mcfb443viS6QnYzTfJ4Pg4CbA7IUYE26Ui7qEnp
         pVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153827; x=1775758627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYFgZQivm6+5UYWuVEb53q7llWgE0aK6PpIadIw7FEg=;
        b=d4V14tzkeHnrBfUDKHE6ECzeX4qkvjAzTQPXYF07MhtlvA7Aw2xFcs6rAtH13wdVSI
         B9Qny6N8kj9JakBf0Ync1ca3l4PXYf9aKCunRHrmrGXz8MgUbQpejXTruwhC1B/Xd45d
         IDQZkM4AfrD1nkbl8qghvqJpa+gV4N1pTI84dVdmg0SPAKR6h2JU3fSB7C74Dje8fBhz
         kCf+/Fqb66j4dGtTtFCBVlKMSvWfvBiw4lNOnitoYphFf1FBB4jDfPFSK05BCE2nMMvs
         UncvG5KqWwnZaT2Wm0G3ET6IKgnNnnlu6dJAoVskI7ot7GBkltGBQNhOC65laAQXDVY+
         t5eA==
X-Gm-Message-State: AOJu0YyMWiLQZezL0Z11UjkuImK0qZoSnWtjQj2Jxbk5bKp6lGb4TrqS
	Si94VupQ1JKNAtNskVGF38BN6jTuRwxQ7geCpUe/yugQvY2ncA0LRe8GeV9a1YqC
X-Gm-Gg: AeBDieu+f/plaayn1tsrSifFdRG5lRo19B7CIxItw0BOQ2/uGTPZmEUbq2uxfwG84cr
	LdujFXB8/WDr78M/BYx8UCLew847QL9mipqsG10a7n3iF6LBOeI64EaRt24Plhg6ZzyGYqULiSQ
	nFz6mFgeD+uL3Y3KxjespyOou8PQK+ROxDWNnApUyQ3B8G2R4rUKU6aHd+cb2pQ4109Xs/tIgsd
	rDz9HQen64sNLa9npVMzFZzXTub+GFMn76OynW2vGprDzQkUnSJJKvZYAyMVKrzp3YtGmVvFjH/
	psAdQR/4NTYFkPkDTV+r8XNgSJ2GuaYyQ3k1nRsPE0mIXtVY6+qyI+CtGUc3f/nYxcvcb2M7Y5n
	pNvsTItWcEIVXzchu+ztE5Jp3wHK5VAmvPCxpYddbrPSizhYKYSlQgO/I5gHgqp4WnU8/Tx/Qg4
	QnJgXDvPvgZc6qKxCyLTdCC+XIk9zxQwvFoYTG6SuGF+tEnj77lEyQWpPp6CQ4OLWk5rSCrUflg
	j4O0093+HTfRnxFP97eifBj5l7ageDU
X-Received: by 2002:a05:690c:d91:b0:7a1:6dd9:14dc with SMTP id 00721157ae682-7a4d3bd4170mr4173387b3.17.1775153827095;
        Thu, 02 Apr 2026 11:17:07 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a3709ff99bsm12988757b3.26.2026.04.02.11.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 13:17:05 -0500
Message-Id: <DHIVIH86QXOC.30SPHTRXKK4X3@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] staging: rtl8723bs: cleanup rtw_io.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>
In-Reply-To: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>

On Thu Apr 2, 2026 at 11:23 AM CDT, Nikolay Kulikov wrote:
> This series removes the dead code and fixes separators in core/rtw_io.c
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
