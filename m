Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5517427F01E
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776696396; cv=pass; b=DbQOf9EISf2Cpin/67gML9rZfe7LbJewfVR/D24BC8/nPU2g+LrmTBtTGlI4jAyeTeZcKLHfQX0QVU6ejq4slG0MNILnaEfKUp/QmYwnLU0+4iA72978uPtBWbk8AbcdVJzHfhBEnPbxAoiTW93KHCjPyeJxS9BkoHJzHCocARk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776696396; c=relaxed/simple;
	bh=cPQhcvSXT6egN+N1e3u7wYQObezpFHmNxgtDrTs1hBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u65oF0OpF61jUNECbTyYvuJjgUBbTG0QOp+K+ds/00/YnVJW1SaBfyzi5QmusL8PRiNPPXwi6gsE64eMhMFDgiCkStjbG6bY+QttF5xqc6e5DSj3CzbULmj/siVNy1fjZI8oiyhbs/mfr1c4RWGmLRXPyHdgNGmfY2MA4r6xvzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPOG6a7l; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPOG6a7l"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-797ab169454so42283707b3.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776696394; cv=none;
        d=google.com; s=arc-20240605;
        b=J06Ih1IrE7qMz8LobnQ/4Oiitous3cSkM15V0QG92VmhwYoGI9CkwcN22HkI5efmkz
         Yh0ntUt9dcq3l2//x2pQuuuSe5xxK8wwuKPf0Y0o4pBco+wBttWzBvlVz6doxDhoTcuD
         1+t8rVUy/InRPl6Z/yLHrPieCRvJYk5lI6ESx6mIPgvUhPKDxW703V3eoj2Th85cM259
         /PMTknnptn0pnJQ9YZgUGSlokJnqhlX6gax9pmaGPtuJltmwR6lxqYAhGtRH6NJUlpiq
         /FwicQqjtvRYDfmzk/6RWz/4uw10n3poknBeVCqnpI4zJ3K0kiCtRA1GmC7WMF+nDame
         pcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPQhcvSXT6egN+N1e3u7wYQObezpFHmNxgtDrTs1hBM=;
        fh=ie8YNH3KMOLF3Mmo8ERXA1qvIKMVzKTQLZz7PWCn7EA=;
        b=JdU1YyT5C1w41KpdE8t7+Mg1WlHzOAWF7Rc4aZvm+WqxycE3O3gOZjBWpa8ld/BgEY
         XCLEgZhgeDrvK+pXmqo1Fe7+F2Q7KVDXvZUfewtuYU/rKYXsE5NRRnnzQu44HcR6YxWJ
         oG7mxWRh9Y2rO6z56Cmug82uDO0wp2nGO0S7F1j/5eX5Im9szM+cfWdCEC0o0MH2G3K7
         0DlLVJ/Yb1Pi9TaZYk+QqdTfYaUYY6PGpPxiN3yddvnYOF4+T7ntK/JgOP9rVYYEXVza
         5HHRSC9uWOhzI1k6+idqHbT/dkdvpa8XwHOjYp+9EiN5JmMWbL/t3FhHdbKvp/GQL9iJ
         wdig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776696394; x=1777301194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPQhcvSXT6egN+N1e3u7wYQObezpFHmNxgtDrTs1hBM=;
        b=oPOG6a7lso3na65v/qA0we0wN/X7cGbsPOxa78Ocm/jf6jFOWyOky0GhxZ/3vX0d33
         6KdyYBWmBgnnBsJ7BYIGbdPG86Sx+cRHuNAlo9Aj4Fca0kW+ICsZwhVwD6dzs5B6FQ1k
         2DSsYb5hbksMLxhTJZdZesJ801dnpRKTDXcVd0z7AOyBETjRAM//XfAfm8lnNu0++fO3
         l9kWTNiNHgPrLEPx50eNIReOHQvE4oboGaIKd7+HJr2ClIqo2HMzaNXT4/WIcpx9walo
         /zieiDDlnr2vt/FEJdg4CqNSidA4hVSu8qCNvHm0qOyZI1OkED4rDt8tFIULXjbwZQq1
         5Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776696394; x=1777301194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPQhcvSXT6egN+N1e3u7wYQObezpFHmNxgtDrTs1hBM=;
        b=FYJAmOsfkhy+qtT2egHjaU0jVfKi4mUUGChXn0AP2PQyD2VyaPU3YdEU2Zctr5/gjl
         Yd5DZS04kixWG1YlvXTleO4nGh6yo6ICWeUzJkT9kG3H48kqm9ty51roKPBD3GEmG8vD
         /hpd7k5L5AY5UM7EOhTa6ZBJpBiggJmhCDKkgcH9HWQvtuy/Z4SIZ9WXyWaRmVemTb9l
         I3AYRgPnm15Z+q16zgfX4Pr7rrB0vn+jRIFg7Jqyxn7SB6tRp+bMuippMs9eLEwpp6n4
         mzx/vHRgqkJC8Rbc6lNAACA/Wxzr35jiLdWh9VRXl1MIMT49dTKotICvv6JEZWfJeNQg
         HkpQ==
X-Forwarded-Encrypted: i=1; AFNElJ80d16KsMUYfa+ojAzHEMRRCHjSlOjldBA5fk462jaRhxKYXQFeb+DMuBFcXUu/PcVV9o/5RIIikWzuw398@lists.linux.dev
X-Gm-Message-State: AOJu0YxFL6mLDRsws6i5OL/5zNHHyp1VgPbTB7r3AB4AbCpEMgNS+cjs
	6+2JssfbJ4/Z9+ecX1/1JHfYWOcxjvyYnhelr25MXDtoKCCGawrja5m9XjSDU0IgK4YSS22nbja
	wFmpba7HcVSdEKXudRWv+QVAjbuXbaHo=
X-Gm-Gg: AeBDieuB97GSNLzgiHdJjB7HcalvNEix738CNX409k3tePFf4ye/zZyDYx8tUkXGxgk
	+QgNGjsJ74ABnu5Ta5Bv1QXgFryPHjjv+1IKzUb9WDUgf/8QcRIaRXjUGD9zE2e7pnBe1YOj7xY
	ZBkygSrn0cm0+QvHXS6dTe4LlS8HDT2bBQusLZaypUMoymENrcV9sWvA2mKQE6C0lzJld3cs7cY
	EGUU3N7APRfLwHIIkAVyQo/5SV1gj/SytGhR54rbPoJOTguYMTRTSBgtsVzGC8OURghWYOVVR4p
	1wD+VHcvwtoqTifR3QPn
X-Received: by 2002:a05:690c:60c3:b0:7a2:1f26:3d6a with SMTP id
 00721157ae682-7b9ed00a78dmr144373707b3.45.1776696394202; Mon, 20 Apr 2026
 07:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260419010537.116002-1-m32285159@gmail.com> <aeYwHbngIdVRLqpQ@stanley.mountain>
In-Reply-To: <aeYwHbngIdVRLqpQ@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 20 Apr 2026 09:46:23 -0500
X-Gm-Features: AQROBzA0xJkbWZmvpOGZIWGSTMw19a221ansEaiCLBs9MzdY2pEQUIoezdA9dBU
Message-ID: <CAKqfh0HoDHex6-ngXkEY+cm0JJ_XoBUFEC7BD55nuwCwA8wfNQ@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: adc: ad7816: replace sprintf with sysfs_emit
To: Dan Carpenter <error27@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 8:54=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> This says that changing to sysfs_emit() will increase the stability of
> the driver, but actually that's not true.

Sorry. Like I've said in previous emails to you, I'm still figuring it
all out. When I made this patch, I was under the impression that since
sysfs_emit() improved security by preventing overflow errors, that it
would inherently improve stability as well. Thanks for pointing out my
error.
