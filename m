Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F249E173
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 07:55:47 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id m2so16381642pgk.7
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7xvaoK29cQI4qjauQSst3YfwzuyBu/bNqlntJ7vGyMM=;
        b=dOF8BXmAduwGnx+rnd8It1JnF/E30uDMvrhVptvtPu/hHFO0nm9gq8bw/JGlqgjlQY
         FmxOthJYrZrwm4jYOauo9SK+ixz0RWz3/laRzD/t5SFZXdCWK3UutNeIM+WuRepRZLiR
         uSuLF8Cjm6RCzSw7bElgGwtt0MtkPz0D459BV9MHEK8nsQ7Yoc9vmth62h/8eNy9ItkV
         gXYvwop9w7o0ztoV5THkhCZzojkVhtKfqWED/KDXll1nK5JVzsnwN7du4xoLKJ3S5tcd
         RsimQs1zLIXJUcJsloOxyc84qB4nsEUZ+rhf2Y8yv6qTOC1cGzFwzjpTz9+ZGVCC7TcN
         +4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7xvaoK29cQI4qjauQSst3YfwzuyBu/bNqlntJ7vGyMM=;
        b=QovNfXapk/syu6aKesquo5HckzhzbROFV0YM8z3XIVOYptw+qPVx3I/uyFTIOZdODO
         G3rQ1I5KRyVkhjcFCibphWFCL1LADLfie836TWycCIIuX8nyGsu/UA4cDEq3q19bTa7n
         rwhykgYX0DgrKlZ2HS5HUtNpIuGj1y+x2auP5Nui2n8djt6hLgSW/mz0NugI58T1+gwr
         UOli8fQeJl0woqE8njm8Qlu23r47ozpyHDvumzt5SqcYME/OxWPqNJNKYzb/jvPSZeLJ
         iJ8t+5mXcVNs1M4/W0cllCM1pzs8rs0ZKaGF6tlaNyt/KSMiIdzxhX6iBpi42VUnj70K
         ZNfg==
X-Gm-Message-State: AOAM5313oarzyv0RAA63Rxr9jn+FzCJJbQNas84JQsM13pYB9O1MGDqu
	L+1eH2boNMVOas3iNpe1dv8=
X-Google-Smtp-Source: ABdhPJxI1SgB52smWHu7aInkBaStnGfwhvOES28tfLR6ZE/vi5kagHD7lmuAgAZ+JKvN6K9xMqANrw==
X-Received: by 2002:a63:65c5:: with SMTP id z188mr2607540pgb.174.1624348547535;
        Tue, 22 Jun 2021 00:55:47 -0700 (PDT)
Received: from d3 ([2405:6580:97e0:3100:ae94:2ee7:59a:4846])
        by smtp.gmail.com with ESMTPSA id c6sm9510959pfb.39.2021.06.22.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 00:55:47 -0700 (PDT)
Date: Tue, 22 Jun 2021 16:55:42 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 04/19] staging: qlge: add qlge_* prefix to avoid namespace
 clashes
Message-ID: <YNGXfu/wGcKTuJYA@d3>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-5-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621134902.83587-5-coiby.xu@gmail.com>

On 2021-06-21 21:48 +0800, Coiby Xu wrote:
> This patch extends commit f8c047be540197ec69cde33e00e82d23961459ea
> ("staging: qlge: use qlge_* prefix to avoid namespace clashes with other qlogic drivers")
> to add qlge_ prefix to rx_ring and tx_ring related structures.

There are still many struct, defines and enums in qlge.h which don't
have a prefix or mix ql_ and qlge_, some of which conflict with other
instances elsewhere in the kernel.
ex: QL_ADAPTER_UP

I think they should all be changed, not just the ones have a conflict
today.
