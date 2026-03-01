Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971028C87C
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772390377; cv=none; b=IdVtO7eqiUZwFNwhNPpiLTr1uI9Kjpau66ifdbDwykMmljrP5AtA7rTJ397gzg2pyK4Gn0LfygH2T5P+cgYDVsiTYvqIk/FG6Nx3HnrfVRI0IbsFEfwJz7wNWCFKV+A4hedavKjzk3bXmdZn1H9uvUivChfe7UC+dcJa5AN17BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772390377; c=relaxed/simple;
	bh=t9jt++0PcoPuo3XTtezsl22tbZdI0zAS7+qGBA/xnKQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cP86dJk8tRYtIEFnWW2C9UUR1diimZZhgprSJ1qC15M3znd9ObveqFJNCqOz5FtcvCO1/mSwxqxZkTEb+ry8mQng6vXEikJJfFF/IX9MKVC3udA8bXo8R2dmayHGbFa5BdUBjR1y3p4JCmrdXp3bMdkAzf1DzUhwbT1x0+82PZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfUnVkbx; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfUnVkbx"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c9f7576d4so2596582d50.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 10:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772390375; x=1772995175; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9jt++0PcoPuo3XTtezsl22tbZdI0zAS7+qGBA/xnKQ=;
        b=YfUnVkbxonMIfVhDU1oCDNnsUNgV7g9HxaJn3xKISGUbf8mjJXrvNx94iFyjoNjbmw
         kS7UDT8gMRHD/+4OgmnzV7VFItKZf2xwD3mswq4zBsW8faLYKyX8v+/1yqGuM9BdqQiF
         aVNPAk71GDcARc0+dwv4RqrtP7PhfiKCK70g1zhSt/IHWku+JZJDGDaNKxQNRejRAN0+
         wRVHDDkfB87SIX7gtbVqT8oIVyexFzeYmM/7U5QvmLS6P7dG/egJ3E65hABItXNuWv06
         yxg7kf7iVG0dloyFUtfoR2Vau6UK2f1f+QUq/aTE+GgX2L4h0O0+CVSi9J4ShTDPeEIH
         7SzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772390375; x=1772995175;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9jt++0PcoPuo3XTtezsl22tbZdI0zAS7+qGBA/xnKQ=;
        b=j+Lgkx5p346YHV65nF9pHtzO6oPz5SAWJL0HTJCBdxHGMQcbwsQMS5jwa/T47HjPzV
         oq6td+LksFtm7KQQBINeoJbpgJ7hsqshUOc9k+xrhrVsM6QVDqLl4R2GNiBfWyI/szCI
         tTGNBD067FgmLtFVtU2cDhaoJtqNKmD8dicbM+d+Pema+p7wIKDqmwdTImgtngFo1M/4
         JmJBK1H/U4/qJKCDY5TrpyU17SxZ/g3Ed2+oSZThKWA9Yzh3sIOl0oPAsqaLWETjI7YG
         /9brxZEXhZnXD+FUS9fawvh7ouSqRx04VO/nBoRSmu6KXvLLxhl42A5dwBjwYl8ZoVHx
         DxOA==
X-Gm-Message-State: AOJu0YwgjKOreFxkwTh1ZH7rOrN2sHeNHHITlXTXsJOci2t+2WfN/goA
	pCnBB0tag+QteOgBeC7VWIfWbnWhXtpQFnlrKPC4pHMEXSaWjxPsYqkz
X-Gm-Gg: ATEYQzxZ4VpbD9GQgKhU+we0nIh3J8QhKsX+oureTz82ggb3hATkXvCD6aRUNieOrvF
	P3zMBzRuJDhXQsapuF3eiM+SfnYvX7VvxpnxaQFUzpaa77POj4fxJhS8+4XR1brYYbMqdYgWGWb
	utneJxGCgEQ+0OeZ70FRGETCCvfMbvl+2iVILcQO9vNvHA/lljbsQgERPZcZzFWfBCqklWLJ+jx
	rnYmr+uw2gE71yoMfc7RYvJ+TGpnp7hJ7Q8NtQnhq/y5ar5nCP7XZK386K7gcN26y3i6jYEYJgr
	coMv+D3iofd2CSNFVlArwW7Jaoo6jZdPNfkFKPw1kacGmz+OKCXkFlMk/MXoC3b3iG0MoiKtIN+
	4rZB6yYhHwGdbU5KSu81Lc3beE01ZmM8RaEbUoEZ98A7PSDlB+dBmEgmQdFM2hFdIjrk++sG8ul
	PgFxtlbCe77dKEPwPUbgulhV19R+TU3nKNgzinhptyEqtBdbOpBlSBtv6SYq4ysJuxLJ6evRWT/
	hEql6N+SqtnJLUPjNRnd1A14M+eKvdg
X-Received: by 2002:a53:c04d:0:10b0:64c:b35c:aae6 with SMTP id 956f58d0204a3-64cc2077432mr6674262d50.13.1772390375518;
        Sun, 01 Mar 2026 10:39:35 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7627181sm4901072d50.14.2026.03.01.10.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 12:39:17 -0600
Message-Id: <DGRNY1T40JK7.3H4QL6BCQOXFT@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Josh
 Law" <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: minimize lock duration in write
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Josh Law" <hlcj1234567@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301005836.2513391-1-objecting@objecting.org>
In-Reply-To: <20260301005836.2513391-1-objecting@objecting.org>

On Sat Feb 28, 2026 at 6:58 PM CST, Josh Law wrote:
> Memory allocation and copy from user space with vmemdup_user() is relativ=
ely slow and can sleep. Move it outside the lock to minimize the time the m=
utex is held, reducing contention for concurrent accesses.
>
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---

Hi,

It looks like you've sent a few patches editing the same file with 3?
chained together but the rest just own their own. This is a little
confusing trying to review. Typically you'd make a cover letter and then
chain them all together using git send-email.

Also, keep commit body lines under 75 chars. You should use this script
to catch things like this:

"$ ./scripts/checkpatch.pl --strict <patch>"

Thanks,

ET
