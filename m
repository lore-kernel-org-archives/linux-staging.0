Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD19249F5
	for <linux-staging@lists.linux.dev>; Thu,  4 Jan 2024 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U10lBYyd"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bbd6e377ceso443378b6e.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Jan 2024 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704383827; x=1704988627; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eFr/AUs9sMgt0FzIO0npkBkWStq2Hc0oZ+hoal1cfyw=;
        b=U10lBYyd1YJwqbIOdiheT7bGA/5ZPzqnO+X/47HKjIcIxKCOtTNOXO9pNLBHb5ECIr
         jq0kcpMPawTS7tecTMbZmmMcBk0rDhB0tiT1njC8g/qJ/NpDdfDXwIG7IO9qZ5rwjzD1
         gwBq01FcLzEQKz79Km26DndlwmSztM+YIsHBXqK5lUHX2gL/zcFaSmPq+HUbXpCM2Vmt
         2t2M8QU70OnQlQA6H5/jntkc+Zg8AaguV0NZFEFOB0l/qUAZETbQTvF3IgAaDxyTwm/i
         xg0mxxLyXfhcw0lZaDdupTNxE8Wx8p4+a0iyJDlxl5WRIipYAGUWS9jl/01aJncpll3F
         qdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383827; x=1704988627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFr/AUs9sMgt0FzIO0npkBkWStq2Hc0oZ+hoal1cfyw=;
        b=iCeSj2fiXnqjwBMbScNYH4AaPJtkqvCjoM1R8qh3o3+grwcrIKbhdENYnIvykPbaOo
         ImJ+E/q5foBCDDysuhTkhBrmQYFkvKgj9n//Ky4DfjMrgkzATnh2ws8el4dPBSo5II/t
         YbwhrhoTlWHVidihYDMiAlY68NbihjezalbA5Of/FiElH7G/RjxLRHIqQwLTg+a2ovK2
         lqr8TPl6M9K0EcRnzB9MrfY6Bg/V+YN9LZNIi0avRO+190L/qPiNMCXp8MndhTctoSTH
         qKBqRn0hMfWHmhgnIBcdiO9vKsigpF/i8jdU77rEeZDxs4vaYpzTX+1QlK7aImQ85KHt
         Pgvg==
X-Gm-Message-State: AOJu0YwhwlsFHgMpZ1Y5paE3vitPJKo9/2SWEVj9oxi0DY92sBClV7jE
	RHENypOJm+IFL1lEJT4qQf2drhz5QdmIE8pUCzY=
X-Google-Smtp-Source: AGHT+IGRhDpFjiBKMa4aosjcsebCWIy3gsTL34wBY2Uuf2U7aCIMdsa0cOJL4F+VOCzuOfGVrM5UC3tRtb6uPfX3hXM=
X-Received: by 2002:a05:6808:1693:b0:3bb:d656:b95 with SMTP id
 bb19-20020a056808169300b003bbd6560b95mr826254oib.84.1704383827456; Thu, 04
 Jan 2024 07:57:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226110459.6816-1-phanirajkiran.a@gmail.com>
 <2024010401-deputize-occupant-cb6f@gregkh> <CAJEOW9YiuBSLUrP0BkRGQRmJWOKpB4Y=DhTGUnDDumhuzmcH1A@mail.gmail.com>
 <2024010418-navy-grandpa-dc0e@gregkh>
In-Reply-To: <2024010418-navy-grandpa-dc0e@gregkh>
From: Phanirajkiran <phanirajkiran.a@gmail.com>
Date: Thu, 4 Jan 2024 21:26:56 +0530
Message-ID: <CAJEOW9Zk-+ajEO12sDgyLawF+Z6fbDw-FdPoSCBaGFSx3WZjSA@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: fixes alignment should match open parenthesis
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Prathu Baronia <prathubaronia2011@gmail.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Yangtao Li <frank.li@vivo.com>, Khadija Kamran <kamrankhadijadj@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sure.
Regards,
phanirajkiran
