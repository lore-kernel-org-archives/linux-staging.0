Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409DE18DF9D
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310845; cv=none; b=Dj9o8XeApRWvbMZLCAHBJEOHAJ1OxGCAZteK3foaWesKBlzMpHIWEmNfkYsSI8vXmg1ENazUfaAeGAiTT/O5nXXh6ZzaW273xiRsQPoCN7EVHkOVibHRpdqTy/+/l1WPsn0Jb8MkXHsq7uIxYF5c0sot2nuMMy4XhKw/3aajZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310845; c=relaxed/simple;
	bh=VWyFIebxJ9cfLRWRjji8BOa1Hdm+srNTGKJqHOrzV4g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=okwgKDiFn/MjawHN/DB3kS0JzsU1jc+sg86qkJ/mHiPKyE74M9vzudkXZenoivxM9DrzzFq2QlVW3/DC83uRPtu6udD1Qcn10BbVZ7uTWOzkNSek4orFDyN+fbf2MDv23ErfjOxCCbuQJbbhF/49O76sy1xMAu2IuZLyyofN/jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmwWNLqw; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmwWNLqw"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-794911acb04so12751737b3.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770310844; x=1770915644; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWyFIebxJ9cfLRWRjji8BOa1Hdm+srNTGKJqHOrzV4g=;
        b=TmwWNLqw2IRa2JU3tNjrBiWexat+R+YEdQ8uAJon8bMO3fFrNDcsA8d1X33ltDnM4+
         V3LagwKyG8bUtKyuX9l+J2a9wS+Ouo2eF2epDvtOe+qjQ5m6GPIbS4TmpVTKZGOjJyR+
         X47L601y19NLKL20sL90gM8IQx/IZFdUvj6J1jn12wzEOaInCnniG0eTFc3WzLaRRUZl
         AoKIljhomydxY5IzTnP8yov0/ecXoz0x7UdDOLyvIovExCven9EgGAkjA8rcsG+nbfUR
         16PQ5uds087uKTLOPfeXb2ohnNiLpUNyXZu9U2xeKJVuefu0zn68F2X9F7kfp51EelXA
         nNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310844; x=1770915644;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWyFIebxJ9cfLRWRjji8BOa1Hdm+srNTGKJqHOrzV4g=;
        b=U3AikDzdNFkarWNPjCTWXxT99KHC2Q0DACINU7xAk+sbmYxly+ixd/eBCnUVXTEGns
         j4h7eyhxbl5FuBMd3esDKRIWOYJfnsI+tTto1IgxHqFTNQ3gtpexNox0BUwHJynq16uC
         wYR1cFMfr+2WP6z/OFuKJWvCN3GhEq3hvrDR8yWGpbcXvPMzFNlSSPq5BlSzki6De/ld
         PuB3A+a9usTDlJRpsCVhEImb5n5c4LDbYSmiIGOGXkAk/uByw5GVAFPocE/7iHfewdlP
         V6Oj/BmUhi6oJ96A/WtfUHCG3XWveIAQgoCxxXSqDq341m25+gdeW44MaeS5mlQQtDh5
         osjg==
X-Gm-Message-State: AOJu0YwhtjAmpqn4GOITMc1ub1X2s6609avKAm1BJ3+z2A7WmEZQ4+cP
	t6GhQ1f1yKabSQJOqFJndSMvtqxRLMi0HdQltECB5vN4Dilj/d5vdELQ
X-Gm-Gg: AZuq6aIVx2XPpoOZnlWhOdis5E8ZHudK5gtl9IEUvNG5xjd4gvD6tfT3ENR2+i7gcPv
	kZPRVUpo7E+ERr1v2vgD+e7R6mMjs3RdRz1ndN47yeQpkldRXGOojlWAjkvC2jVyY5fSS+tr2kb
	C4cIQMTvo7t/NRojUTHNi35Q+1l+q1ibj3mOR+xMebdpKMC2UGU8FnQGHg1ebbfuP20rsFylXTB
	TbIKQ7aY6LZKE1xc0jOvnb/I9vzGi/KNKN2pQawFZ6hTnLgb4SGMgJeEz8AIoE9c/O9fiHJhkiF
	eQIerkbYb6pbAYFlu46KWkgytDVyHDk4fIrfSrqC5ac30TQY4NLiOaI6V+CLbWNP4Dyvi5henkr
	SMLcINnktC2Wtp78I9wu3CZdbOj44e/ROVSMaM5DbM17C4IKGg3KJq59nmMYQ19mQ+jp6AOgZK9
	9/fNE0TfLW4tmeLajcF92r40gwQ3ErF14=
X-Received: by 2002:a05:690c:dc9:b0:795:254a:b3ee with SMTP id 00721157ae682-795254ace48mr14160417b3.28.1770310843996;
        Thu, 05 Feb 2026 09:00:43 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a23b895sm271817b3.43.2026.02.05.09.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 09:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 11:00:29 -0600
Message-Id: <DG76TBNR8UF0.ZM8O50QCNONE@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tan Kai Zhe" <kaizhetan@yahoo.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary blank lines
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260205151229.240586-1-kaizhetan.ref@yahoo.com>
 <20260205151229.240586-1-kaizhetan@yahoo.com>
In-Reply-To: <20260205151229.240586-1-kaizhetan@yahoo.com>

On Thu Feb 5, 2026 at 9:12 AM CST, Tan Kai Zhe wrote:
> Adhere to Linux kernel coding style.
>
> Reported by checkpatch:
>
> CHECK: Blank lines aren't necessary before a close brace '}'
>
> Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>

These blank lines have already been removed in staging-next. Please use
staging-next when creating patches for staging. Thanks.

ET
