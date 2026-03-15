Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4091A9FAB
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773596092; cv=none; b=GfzPro53R8ZIJFiKbzXdURig+i2MF56LdzPZbxk9J6sr9Gz94XiQHvvhx6ZijD6Vls3FLmKUoVSU2ZJN7DwXAMCc1MEQY8guREexyNaVZbvy50//x7TNcGP/sIjnf93yoBZHlD2GC+TUdWaex/Sq2/xFAjkviTGAQ8q/dFZhmBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773596092; c=relaxed/simple;
	bh=8RZANigyonfvFOk+Zpq/HtGTGMZWofHGxTOK+6JyQyM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=K9WB8+9zP8J1COlK08UEYCyzToZUbjSO1BPm3QpZ5s1OBdK3hJHv2KOXQVJD6ocPS9xvafPI/3aIy7N2tCVn+NG4jpeMRtdS5S90B+Ll78duYu5HrhYFlvkJO120Qbfl9+s6GzI61KiuaRHAsELSHU0nLO4jPQ0TeNTNH9hF0uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+VZZZbR; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+VZZZbR"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-793fdbb8d3aso37001207b3.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773596090; x=1774200890; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RZANigyonfvFOk+Zpq/HtGTGMZWofHGxTOK+6JyQyM=;
        b=U+VZZZbRIS9pd/iuyRa8Jf4L4osCEV2Qh6T9zfWLV9SWMpT5SKLBnP4mGt3AWNroZf
         jT6a3kt5B2WWsDCZzpcwJLyGeN0U9JxMuit3RqiibsPjQjBM6yQyngw+7uo12dV98G+9
         OXso7nSvMpneFM8qCtR9Fge+bOhx25TyvKjhIut4tA155nREdMmnIvVMh04hfos+9Nrm
         K5nI5IjTbrVsGPb7XinSKj6OmIw4UyPpB3tjc5lA/nHEZlys4mIkl3zkWnw6JqZXB6mE
         iZ6sTOmmGNY8dDw/rJ7hQE5jOaE1XzZXcFsIUamWA5IBQOl3svRBU5VKjs/+INDfwNVS
         XXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773596090; x=1774200890;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RZANigyonfvFOk+Zpq/HtGTGMZWofHGxTOK+6JyQyM=;
        b=ZKFbN+A4C8S/AyRrj/ehC0fZ+Oyjup+0ydRCxGxglfuTpCIkgz4hKEfUFu4zPrfSjV
         hjoO89au9M3Nu4IfIC3+KIWV3Pbn1ug3oqtJjT1dn/2HLjzP+pXs6rFjm+BqrJUT1sBx
         LnOpTL98H0NpPRx2gwvtHjPaCuIcg/Y1P7GIOcSqqj1JJgzAjqNvEE2J6tfGWT7WUdWv
         Cl85n02pceMwtq+QOXms8yasAk736ORiT9JC9KabbTSk8rjcQ8mu4J2EH1yY2rvVLR+A
         1QKrrOORbQOG+ZqtcwGGy1QYNBk9kkWQubXuUhsb4De/dacBMnguodDCM/ptw9aSe7OB
         9K3Q==
X-Gm-Message-State: AOJu0YzqBXNM8nebbZYvUjykonfOuHulwPAGDYpT+JQFTPaVhnvjA9b+
	nsfuHY6LOaIOFC4hvR9XPOtKph/QAOTKNt0nYwh4/oN9RqVMHga61O9E
X-Gm-Gg: ATEYQzy1UvTUKp3wukTlW0hFxJ7lb/zfrJYRsTi6gm6Uj/6hOVuUcV5tnGUedJAdPZc
	sSlqU3JGij+4XnmAQN6mbWpC4WHHHN1FvC+aEHl6zOSNzE6htKY2ztBJPKguLgL0ZiR9ouTnWqv
	Ofl2KwcB+DYN7VqaQw2qwPDTvZ/WPR/yqJWFIleE0H89KvDrqH9JhiXWFPwPq3GZE4aI1Lq8omp
	b/AghIpcJxigoppoAyBbbAbdKZDPFs7gT+vLSVtvRvXPwIG40zBZ8fDoPa/EDFivzak52sGHAZ4
	uiwIJjfPCZYFA5Q8/WhoQgxAuYFd6WoAz0lNKvvwyC4ohIaKWJ2u88Hu5AujcgUKf52Pjt03OTe
	bCldfWymQf/7EIj4HaK3we9biLoP0cuJfC/XHvHnZwicojTWL+VW5/AL7I26pkx2cJ6R1IppaBH
	d7XE4LhVZ1wV9lMhksU779FVgIk1BAvMNkJCYsfytxypMQof2J+Od2D21Aw4NoVbjC/smlNJ6IV
	REALih2pWN7QZESYfrFW1vrX2QhoBo9
X-Received: by 2002:a05:690c:397:b0:79a:349e:9548 with SMTP id 00721157ae682-79a349ea9ccmr42065507b3.3.1773596090115;
        Sun, 15 Mar 2026 10:34:50 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a1fb76793sm37917347b3.38.2026.03.15.10.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 10:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 12:34:29 -0500
Message-Id: <DH3JC2D71X1Z.O5DGZVUH99G2@gmail.com>
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: Replace msleep() with
 fsleep()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315020949.50149-1-marcosandrade95963@gmail.com>
 <20260315020949.50149-3-marcosandrade95963@gmail.com>
In-Reply-To: <20260315020949.50149-3-marcosandrade95963@gmail.com>

On Sat Mar 14, 2026 at 9:09 PM CDT, Marcos Andrade wrote:
> Replace msleep(10) with fsleep(10 * USEC_PER_MSEC) in _rtw_init_xmit_priv=
().
> fsleep() is the new standard API for delays, as it automatically chooses
> the best sleep method based on the duration.
>
> Suggested-by: Ethan Tidmore <ethantidmore06@gmail.com>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---

$ ./scripts/checkpatch.pl --strict -g HEAD
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit desc=
ription?)
#6:
Replace msleep(10) with fsleep(10 * USEC_PER_MSEC) in _rtw_init_xmit_priv()=
.

Remember to always run "./scripts/checkpatch.pl --strict <patch>" before
sending a patch off to catch things like this.

Thanks,

ET
