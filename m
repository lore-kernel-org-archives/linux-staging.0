Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0463FCD
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1630503988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oEJ7+xDrfegvHPd4H20eNZprosFZd2jsqVEjo8Jcnxw=;
	b=SGQQH3JoawGmnDpJaGDzks0mY5k1M8wQpgw/7cX+ROHj7mozjqffOYC6xWJsRQnpWX7BZg
	GMJrdMiin97makl/RLVMA2PZmqAKKl/lWA8e49L3G0hMH0wM212CK2/UQG+dvCVFvJIf9e
	yt3B15i4X9C+FZ6oC+oSQr1bZZrAmcs=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9cc8cbcb (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linux-staging@lists.linux.dev>;
	Wed, 1 Sep 2021 13:46:28 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id e133so5337595ybh.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 06:46:27 -0700 (PDT)
X-Gm-Message-State: AOAM531p2yZ6pIo1nXMcN6pdieOzUnDZo7JXYuAF6a0MgiWfDghGaCN3
	ccHRVMyhIuq48jM49y2sqTH9STROmd6tCmA22zI=
X-Google-Smtp-Source: ABdhPJwCJ3tyALmcXHVYLaH4zERaZiv00OI4bgNOKTp76A4CtFuSANq5jEv5HqsEZEgVmgxOCHnx97wU3xfV52xZ2Jw=
X-Received: by 2002:a25:4589:: with SMTP id s131mr1779731yba.279.1630503985074;
 Wed, 01 Sep 2021 06:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org> <20210818060533.3569517-8-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-8-keescook@chromium.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Sep 2021 15:46:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9pmXsfgiavSrv6+Eh8C0qrfuYRoQoLvT5EQZz4OdZj=Ww@mail.gmail.com>
Message-ID: <CAHmME9pmXsfgiavSrv6+Eh8C0qrfuYRoQoLvT5EQZz4OdZj=Ww@mail.gmail.com>
Subject: Re: [PATCH v2 07/63] skbuff: Switch structure bounds to struct_group()
To: Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Alexander Lobakin <alobakin@pm.me>, Jakub Sitnicki <jakub@cloudflare.com>, Marco Elver <elver@google.com>, 
	Willem de Bruijn <willemb@google.com>, WireGuard mailing list <wireguard@lists.zx2c4.com>, 
	Netdev <netdev@vger.kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev, 
	linux-block@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For the drivers/net/wireguard part,

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
