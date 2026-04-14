Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613B78F2E
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152349; cv=pass; b=JjEZRySy/q1TH4U4CobT2c0y6gyV6RsT96BqQIdGvug5AYd4T08/bmtnaQtAL0B28xLhdgfMDxNybJ5+R50x6HCDsBoVcAMPxT2BgZfbBQJAEjvGTII6vxoqQXhHKfX9kdBryYIkdpkkJZJOOOyehrSF/+uO7hyUbJmlY6mpiIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152349; c=relaxed/simple;
	bh=t7r3lxTrEjetZaLsluHhiOnddMgxjkv84nKScY6aTCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbkKNPA227jSJvhwJ12nJ995b/gk4hyvZNwj9we78p9qMbtVFBLbmwPMll4Pa6/ziZGQ3EbjHV0TLg0d7B/2djWRZDEri3Bd9iDVHUohpTPWjbQBVWrCUm2obeXLjsFP8DS9HKSK9ce9lRWDFybNSpqSuWiblojWlazq54n7B8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZBqBPqf; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZBqBPqf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ad135063so50212365e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 00:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776152347; cv=none;
        d=google.com; s=arc-20240605;
        b=Fw6LZn9yTgqSsG4ESwNaxvDY5GHP273IZdqNV0FAxBEz0atrZ61hMYqNLLMwHRafrF
         nVItYXu3NP+iKTyKBKKrHlc2NkwrmIFqJvBnUpS3Uzb6W3W7dbVsc1pDxMjMXcMQsKjw
         KBpGzJrXe/vCpI3IKYc/Bd26EJ3vxW5tr7muMrHm9t74f+3OA2hzp/XZNZRuVJnM4kAR
         vgtTcJTCjFsG5+yIR90omFVlpI4VqdoOo49eotHHBcgWtGvpYa3rd9sHngiwOV0ZuAxL
         SW0kISD8jMNW/wtkIBEFzJ66aDILBKnmeNQC/zmS01NzN3Bo0pjYH1Y6VGp9ZONNMAho
         l0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IpvNRivftfD5pqJMlnLsY4bcCb88Mo52CYzLp25CDVg=;
        fh=+V/sojoy1x/FNjAWLwkEGaMPZSUtjCwvgFl2qV9jw4A=;
        b=LMwuLKZgUVJ3yrgIVHCdIeps+rfoJ/wFmSWBpQ+tLt2W+x7XzIszc6Wattsm74LgEH
         o2sKp/6LBjofLK/FToNKmUxKgVMLb66b8pqXadRKLH51VfNjBPVQGrryi5d7vWl4s5U/
         UMZNUHX8IfzrS5JzfUQW94URN4qKbjGbaDS+S7QpbNLXEyCaGaECfYLxV5Q/V390sQlV
         S69PR4poBMey2QO5hJ/X0JK2YRnMgdDpWE2K1FIhX0pjFONr4zqh1BogtNmjiQBG1uvr
         tkW+uFRYkkVJbuQXYa7lt2NPM4YoeUYIZmKjaLtvdKRhzLnqLZE6aTiPnIBU2OjIeyRr
         crwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776152347; x=1776757147; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpvNRivftfD5pqJMlnLsY4bcCb88Mo52CYzLp25CDVg=;
        b=jZBqBPqfgcM5H598Gj6RLkl0RkWWJRJnBWag51WqX2UQyz8m/xKJoz7wxJLGO4KvAe
         r8PcqsoqQfp+wRhsWv4zy181h64HX44L/++FVcjhsLaoNScqhot13liyV4LAEeyHgUk9
         x4eVJcT3wtk06k9xxaNc+P8JYfLmJTS2Dnm+02X458xC3coSWb2tOZXw/8CYs1zlmg0P
         MY4WFYwdy2Itdyt5nVKcItilhiD360gU2cmIXlO4kQGRwWN4/6mS8QUJ8pmDQke0aCmg
         lFudlEGwtynOo9z0F7Zg7aK7wwlRbx+L4rgI9C5EsbykQRMGjRX0h7moSHCeix7pCjq1
         G28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776152347; x=1776757147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpvNRivftfD5pqJMlnLsY4bcCb88Mo52CYzLp25CDVg=;
        b=dAZcfCDG0B2Obt9GHvmYMG35pdgImJ7xOXth0ox71qOuZQNNxiQCprgsGPu4xiAfA5
         tqk6aOho0wMtlZohFykheG8/OBdsTezPZxvPaz/yU85yWUUsuEE6yWfXW6lfbFlsInlY
         9C5fXtG9KoqlczeyQ32Ng1h/DNqn3kXWBhJw3Lq7fugqSevfwchBqIw2C2WC6m37GkXp
         M0yj6rvG9tfjn7cy3lGp3vhjh7PBjuIN9AnGtdBwCCQlN6mbDVoHaRziPEwjTs+VhrlZ
         o0LEJK4sqzJmtE3DieUKruAHWyeQqkUwJmIXE1ISI1S83r+4Q1H607LGTJVs4GyFgd0p
         dxgw==
X-Forwarded-Encrypted: i=1; AFNElJ+1n4HU+kMqIbfAGgcIIPwJlA2GSfyV8qg1UiR0TURem8k4aqKR1lkzLl0JWEsBQtRTVwbu0t46OlDtkEeE@lists.linux.dev
X-Gm-Message-State: AOJu0YyskcEp84Xco8nzWLfQ3W/8U31Bfop930m6OyR+0hET3jySydXu
	iTVyqyRjikhiNOfiIelwVCSESiTLjW9jC7yasRSrHBG2ybuX5UfclfXh3EtpLCxDP7HtWU0st/F
	eWOPEx0NLQ/b0UBxXvZ+jd0utZLxKjik=
X-Gm-Gg: AeBDietgvWnPBN8RKQBlMOOHOxHfg0rkThEE6nOntB/hLpFIqVLyYKuimjUNHpdjsZu
	hf/k1CW5qWCLAOpJEshR/5tqKvsoS+yngblQOiTVspa97jJ+lFQIkcANdHtzbRZJc8y+zxdD0zn
	PUNg6D94nWaNR3yweQvVuKYLSK7+ycmeY8hoLVC35pVe+tbd/RpnK4Wvh9qhCE0t6RrC7og1o9y
	QomnKLKAiw5XDGj/2iho9tE54/NiRExFd+1LPTznJy46YHOtmiq5XgFaeHtnPImLq+o/3LYtRsT
	GIk19WOGQER4Gbnus2PkttE2nVKMIK/TmJPGr2MJycOCzWSoidALkkgDXZwRVuBwqtxRUZsElFP
	F87rWSM5lAnFGe1vlyLhOT5QSW5wGnjPNFN44usX50CKxi583JUobiVHfVtMj8RxQ8SrFPTYMRs
	2UGx3tmlQ9ciP+9SH9
X-Received: by 2002:a05:600c:8904:b0:487:1c2:6a56 with SMTP id
 5b1f17b1804b1-488d67ec89amr167247895e9.3.1776152346459; Tue, 14 Apr 2026
 00:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
 <20260411085848.75381-3-joshua.crofts1@gmail.com> <adokoNfP-Ueg4yQ7@stanley.mountain>
 <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com> <ad3sckiwifI5ZQYU@ashevche-desk.local>
In-Reply-To: <ad3sckiwifI5ZQYU@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 14 Apr 2026 09:39:04 +0200
X-Gm-Features: AQROBzD91QkOqfIH_K3yZOcqgHtnyov5bibGxBE20z9q65h8n-2DYJYMO6uQGxw
Message-ID: <CALoEA-y4Uf+LbM8w+bMA7DdW0Pcpv7AVcbdOD9GknVu5R7TKUw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise math
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org, gregkh@linuxfoundation.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 09:27, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Yes, please slow down as you also missed a tag.

Yes, I've realized that it was stupid not to wait. What is the proper
etiquette here if the
v3 patch doesn't have the reviewed-by tag? Should I do a RESEND PATCH or a v4?
I've attached the tag in a reply to the v3 cover letter but not sure
if that will do something.

Thanks for your response.

-- 
Kind regards

CJD
