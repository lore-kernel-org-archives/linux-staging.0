Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259323183F
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416679; cv=none; b=OrKZRnCv8MNcixb8eX4Y5VrI7Mh38RBddpOWENfW34nMmjmU4ZVrq8d4343wrMTU1KGZw1BfswIh+crtbB0sv4dXPrns7EshS6WI8jWhVudj/B+jcUAe5IzcEF0zcNm2dVjvYRxDLlazA4ye96glZky+dqUphz1N0KfPr4EVHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416679; c=relaxed/simple;
	bh=B7W31wq8HfZCWc4YmuaF4eDDzN+/+bJTENUndj4DZmY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kZmDOpcZIm0LEfu3ieBZ3PpMXkPIOEyvfeY0g8NLoGiYxU3BJS4ZwWyJ/9sdmBbHrvBuw3bddBW/sFPG9WQaqaL85LBVmea7YFzuOYzCwJGLEK6sLSbIMGcvF9+GfJYrpguOpl4cIvIJCVf3VXf7ZeXo3hjovjC5ID6oGH0hWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGjrZA0h; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGjrZA0h"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d45d37f8e4so1215161a34.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 14:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770416678; x=1771021478; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7W31wq8HfZCWc4YmuaF4eDDzN+/+bJTENUndj4DZmY=;
        b=aGjrZA0hjzJv9gTmmL8JpLpE3G54gxWnPawezUGuJM2TLhjKESbUQZmHXRcAEE8tnz
         I5OYelQU289AM+bZl8J5RMTXcMw4lLUpgVo4P9rHKWE9yNdmnEVrFYD2z7Zh0kI1MLJb
         Dd+cKmlMJGmCr/fbeOLo+CHzh2raFR7pyMwkNQPkuQjWwJIhdt97yCdsMmzaY13nUx4p
         X6tHSRetm0aIVbLwMshohKAEYiNaHTQWEs/6JSv4P24XPM/rBn5peEZrJ1B01xzPXjfA
         hvFnXz4MMIRAMpsFqVsdYGx8H4ZcYXSfmpR4hYa6F3tO4mfcQhBcNdhnRqLkOIkTvikH
         ePtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770416678; x=1771021478;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7W31wq8HfZCWc4YmuaF4eDDzN+/+bJTENUndj4DZmY=;
        b=xIzoWP4QPG9CtMRE4MuqjsZl82Y4OE8dihLPjLa4QOsI9cxYTMW3XgGt6YP0cK6KGk
         acWLTzgMghwD8/ifOXZg6KO+/l+9zQhqWzbQcu7IOIVydYaWNVDmN4pQxDNQlLHXKEiA
         DR8KuHObv+lWUtk6cf0BLjVMIJWg2ZzbkPNX4pJ0vOrqqx/1qeXvlcK3KFgXzhQfufEl
         D6+FFV9r+8rvRRSiy8yqeQ+Gt9YvvHhEIcJtoZ0cV7BW+NCrjPQRV6g5pfxQQwltz4MN
         eVIs5twhskRREUFszMZ1OZQgKhPBtWZTVkI1QeegAsf71GNj/9Yv192LqJmpHfEYoXwJ
         NZlQ==
X-Gm-Message-State: AOJu0YyjTyooV550RHv+rIY5rakP33UcXVdg4RVoBkNEVpG46UMFGJmB
	6etNjLimIEo45kWpg0GTejKQZu8T3YpRss9YnqpMpglgsyQ3cT/h7FS+
X-Gm-Gg: AZuq6aKb1vkP8dDRQBOWblVkYdrQuLk0eNmfS0Fiqbotw0LdoCmOJ6B/bhKAg5iCLhU
	6rCIofgx6LiTrtmkhRIaJim0OBQlCv6GyD6yWaBcSiMBAjGyUB2JQRH9iYT1ewYQuVQpthA9VXe
	zv2JXsCYPGQqlBu/ap3PaSIloQCJmgMjJ69FoUonI8c1PStW6Ej6KOlFWRUOj0igFkobfoNsBAP
	xfNMvtLlDQKFJfKZlyyBuVMVebcOD6x2SdwSSsw20Wp5w9XH3Nn3daXEcEqD2Wb8Hdrfrkf1qLt
	iNpKb8tubUdHOr9++9ABIyaiEmt4uO1S/p0IbOLtC7hpLypWhxMvIcZL31kQaaRCCh2DNDUrryh
	pshQD5p7F5/tZYqtOx3tWrXxjdCgp2KgzHCi9cm9sh9GhGzJxIvpUilv20C06UcjXQSrJExSLf4
	eP0zZYVt/MIJj9SNYmMjmONy2H8ubKZDezJSrlGOrcnAsz1/rrY9J3zPIZPqW1FFTmeqPprlk/k
	LsQqN9ZCdxK9shs5BDfx5rWDyIs7Vsp3BqsApUd4bPnsXWHvcLLMKkfdQ==
X-Received: by 2002:a05:6830:6f47:b0:7cf:d1b7:c5c6 with SMTP id 46e09a7af769-7d4643ef07emr1998121a34.7.1770416678426;
        Fri, 06 Feb 2026 14:24:38 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:9158:7fb2:d7be:c2a2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d464785f68sm2318977a34.16.2026.02.06.14.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 14:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 16:24:36 -0600
Message-Id: <DG88C1C1NAAG.17E1L82JA0IM4@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging:rtl8723bs: Replace camel case
 rtw_btcoex_MediaStatusNotify with sneak case
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Pavan Bobba" <pavanbobba@camkruthrim.com>,
 <gregkh@linuxfoundation.org>, <trohan2000@gmail.com>,
 <davidzalman.101@gmail.com>, <bqn9090@gmail.com>, <hansg@kernel.org>,
 <straube.linux@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260204084445.7752-1-pavanbobba@camkruthrim.com>
In-Reply-To: <20260204084445.7752-1-pavanbobba@camkruthrim.com>

On Wed Feb 4, 2026 at 2:44 AM CST, Pavan Bobba wrote:
> Replace rtw_btcoex_MediaStatusNotify with rtw_btcoex_media_status_notify
> as reported by checkpatch.pl
>
> Signed-off-by: Pavan Bobba <pavanbobba@camkruthrim.com>

There are a few issues with your header. A space is required between
staging: and rtl8723bs, "camel case" should be written as "CamelCase" and
"sneak case" should be "snake_case".

So that'd be "staging: rtl8723bs: Replace CamelCase
rtw_btcoex_MediaStatusNotify with snake_case"

Thanks,

Ethan
