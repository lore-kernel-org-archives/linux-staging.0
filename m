Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51660175A8F
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772408963; cv=none; b=U09AP4m9AZf1HJsiCILnpnVuOuO8CXOBVVnyFId1OWCxawfeoJNir2LaFxGUmkPRQMwm99eZhJP/zoFx84D6H0Fh8gcWglUCLfbhYym/Bm9WCPAzNgZ2UNa1fQ4bdudD1B1LLBcveBYszwKpr/RyK2tEYSbu/fFxPfGYnl/UMgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772408963; c=relaxed/simple;
	bh=jG3rd0bXNcvYSiMIXk2RnyhKd7OJ4EDPeMlypq8FY0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sb+N6Ff+aycsej/yp3c57SWz9MUtxOJ8GMBr+++asJP/vk9gJcuPLGBq5lKcZ71pDSNdhX5+ieUf8El8svBWcQyPL/QvKcRVG0IES56FV4dzobVHKu7V2PYosNazpC2199awgpSoyru0bvetYpH8F/xGDiZg3M6oEwQG2FJCeqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhvXuAA9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhvXuAA9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8274843810cso1882087b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 15:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772408962; x=1773013762; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jG3rd0bXNcvYSiMIXk2RnyhKd7OJ4EDPeMlypq8FY0A=;
        b=RhvXuAA9Zca/Y7V2sa56rTccNWFloq4LagMx619JoHxQ6qjAHZ5rXG035J2wW839WC
         +7KRRIYHbNgHKEXapc1tvucE52rdtxNk/sXA8xJZTreB9jyDRni/+amvOx6JNwJR0EGb
         g8IgyqqxzbUo3eq/WPiQJ90saKgVbOqFQHBMLjNbpzuAZdc2lB1qkJi+29tUdLzh8Kfe
         ta7yA6dA9TTop9NSaqK/hx8gW0+B6qKV1Tc5lG6covR2fu8CiEnaq8AvDlOguEA69ag8
         QX0piJAWwgT4NmTslM1zX88vVEZkykTk5WcQpALwhnGbGI8CElwY3ku0LWRp3AzTA2bZ
         vbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772408962; x=1773013762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jG3rd0bXNcvYSiMIXk2RnyhKd7OJ4EDPeMlypq8FY0A=;
        b=StdQXpVDDWlgwDpc6VT1Z8egpIuuEEvTbLZisNw/4x+uZYN54uxuYBAxcttAnnRMXK
         5FHOz0yJ5i68oRlBNXXQLFzRm4RmaqqoB7naOwOF2Z0xY5wk4SkRa7QZBo+VZZmYDsr/
         SwWeewdCjayTO2QugUldj28zyKnDE6uFh6gDs2H2ihzgSkQOMaqTVDnXN/Y/uAyMFVcU
         j7jkZ4/XouDzoqFIT2Sko78RY5W0OiN4qT9xdR8XbcMsxVYEiYAP/31dvudG4fdMZWwO
         ZkfRx7LPNNTN77amn7cfc7Wofj+pPYUDRmZq/lpsZTCFmn436haCyfXxru4A8G/RCpHP
         BZYA==
X-Forwarded-Encrypted: i=1; AJvYcCXn4HqYxoH/sBzgQnwf8ME+NHm2dyktjzDVmy8X68wb8D80K1mHALhxIRbyOCr4W9kRWgN718TeiMK4actX@lists.linux.dev
X-Gm-Message-State: AOJu0YwcFzAlVU+PDyLaGX/6NK+dkXiJPIfYeGt3Ju1ccru3xOZDl+AP
	dqf+67Z5Gt+oEe+SZYX4kw7hyw1SXCBHSEifpJRAGkMubunhffm+h87KbJarHUYf
X-Gm-Gg: ATEYQzyHttDrudfclVv6+QUh5j8gQjc/5zSAkLkGlMDUYzANKXD4IpZeHo/9WBfPFSM
	kkM2PMpe7ZQq7vtHDTSK6ml0gToDu1f6QPydp2YYo6TRlfW6sK5F/ynPDW76Xhg5vemAyjYtGrN
	+uB9nX1PGSoswM4PbLLebw+LfY9l/dLQv6Wo6AGclceQ2q1oZNZ5ipf/VkNQ34NOVv2zUR8XTEA
	0YWITmRF+9Wp2gPEUrRr8SSpgHGZ56tXACFff8/e4t99aSNlmXbknAVasEDHWXqC4siucSUl8O2
	D/1tKt2P5UzT6cN2MyDQKIKbzLrG58s4w+1vCWpJcfi/Cxf+gz9DB59Iq/DgsfMLnWAFDzgCbyn
	g9h3z8k7fRT/oTTv80wclPPyweD3vCwDLyjvt1ZFviQOSezZkzWHzR1mRrS1sagVfVGU6F/Iu5f
	gS8k4idHgLd6K8aNrnNlo=
X-Received: by 2002:a05:6a00:94ed:b0:827:2b3f:f9c5 with SMTP id d2e1a72fcca58-8274da2992dmr9939197b3a.60.1772408961536;
        Sun, 01 Mar 2026 15:49:21 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739dabd43sm13051952b3a.25.2026.03.01.15.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:49:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C369A4206929; Mon, 02 Mar 2026 06:49:17 +0700 (WIB)
Date: Mon, 2 Mar 2026 06:49:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Josh Law <hlcj1234567@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 1/4] staging: axis-fifo: fix grammar in Kconfig help text
Message-ID: <aaTQfRkLXIBl_IoA@archie.me>
References: <20260301155318.2596519-1-objecting@objecting.org>
 <DGRO3C3JVCRK.N84RA9RCVOXS@gmail.com>
 <08a72969-af76-4515-87d5-f792516dc5b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <08a72969-af76-4515-87d5-f792516dc5b5@gmail.com>

On Sun, Mar 01, 2026 at 06:54:47PM +0000, Josh Law wrote:
> Hello, are you still going to merge my patch? I am new to this, and I hat=
e using my Gmail to merge stuff like this (bit unprofessional lol), I am so=
rry for the inconvenience, because my objecting.org email can't send emails
>=20

Have you ever tried sending patches to your objecting.org address and apply=
ing
them?

--=20
An old man doll... just what I always wanted! - Clara
