Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507413D512
	for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686766; cv=none; b=S1lP029ZeXcbg8RuB9iCYfFCRPeRJ6mx27d4smKt0S2iSVkijGXsMiCZ4jd4S/gj1kKQkC+w69qsDDR/kl/qyActvrhCMSr6LLoJGmnAlhvz18FfOiyR3eW1NbS3hwlBQD5POORSoPqQbjKB+pLPzPd4WicFolMWPtmrtYdfjDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686766; c=relaxed/simple;
	bh=3Me8tP3A/Dq4n2o7fv0IO64KsodsWLaH93wYg8ejh9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FS+K6svoTVWIGK05E4LoEdJct+S/30h4uhiaGneWhorEB8ga2YlGQyzarL4iTSb/mdeWtfR0WhP4TjqEtec6h94QSUolfwY8cuaohfmdQlk1DVwh5raOEEGgtOPq5fBwH4kCRMBDBESFl/pWIDzGycKjWCOjyZ4WE+UzpEAaS5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WaZcr62b; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WaZcr62b"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4746fd4793so2667600a12.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755686764; x=1756291564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Me8tP3A/Dq4n2o7fv0IO64KsodsWLaH93wYg8ejh9A=;
        b=WaZcr62b43vTpcHCJsXuNTlaVFMA30JkRArAUbNloPT23y1E/SlAFv/OD4YvniG3dl
         cvZjw3sfb5/7d6Yq9rpIkd7cP31sTvuGKVr5Sulypv2YZGcdb7n4f20FzBGDLa7LNR8W
         h3cQRfpmmwjJufRRxS1bs36Ix7uXVYcbo/ITei7xmiGRLletjn1Nq4YtJOP5AVMFWm89
         PwqjHgFJ0dpIrKus7xvGGVDTNDC41MHe831ySeisVgWH8qWnUx7Yvd185zsl3hBu2Wwn
         RElk2LdUJShrN6EZFSTTQ9fanMv8LIG6TggEqkikljThzbLJGtW+d+LLGmuKXarwKHHc
         SzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686764; x=1756291564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Me8tP3A/Dq4n2o7fv0IO64KsodsWLaH93wYg8ejh9A=;
        b=jeFLfvlGXdBxmCm6XN2/H7zUQNgDsMgmXXwzdwdjqbf3hn6l9xEwYnJQtX+Mgt7+/v
         ZsxZ7Yjbv6C12SZqgCw0y/9OpqHCt3xP2C//1C27b7wCLI4tOn0+U4G0aXAAx6q/TNm9
         7AZZS+jg6lMSn1euJ7ebWEMYwuPGNmql5bTy0bjWdKGTmX/TuaBMIsHvrCHRfJUYaTcG
         IyBMaK1v7aKgaIrw/rfWWNhlmUywQYc0bbNZojCMsDRlzPNKE4VHJF4E1dj7C5ZnbLgl
         jLkPHPpaJw1U5q6/GOgiZlX7v6/MJD04icXKfIcZ9mlSQn1YmtKIg2A7FZdFJ/ejZZ99
         yJzg==
X-Forwarded-Encrypted: i=1; AJvYcCWlmKRcxpSLfVKXEAH2+LLwwanEdyxHt1vKkdHjp2mHEUR1ib2qSc7b6QyN7GV70l0/4tpmnoSQQPtZtus0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk3xqdWAR2sp55SNGrtRTLt0H/RLl8DsOJrkwykswNkaTmy5fu
	5b0+9tWNLn7+qCLRRpvbUVZMCf5gNiACmH93S9vgffSGGJinou/8PCDfPyruRYQK2VR8tACsPiL
	F3ybN5Zw69fJ8gsIraXGzNyK2hesHQeBgqv7Cxvrj
X-Gm-Gg: ASbGnct/BNwsAlg0c3awfzXjBUUmsBRfRZF0tvxmZb4D3/lHJjH2dF94a0Hpchq5UUR
	/9WyKdeUrvMHGOx5AKB6IAuY9qWaYbV8L0hvQW72KYZpA9hSSNACu/tzukYXD2pRfbadArmueHm
	yU8nTb2vXuOagB++mNEZlRftLpbthkZ7XLsthYuQDrv5iaLbIGpft9swAdos4duivDDB676DIji
	z7UJ6HNBYI8OQvL6L7OKLxm6h260m6SnrVp1MSnPX/mTzLwP991WtY=
X-Google-Smtp-Source: AGHT+IEKtl2lrK5/2y4ZHW8BdiMqTimWqMJrLgdgwZdhWnnQOIhxftCfwBi0pC/VAlu+Wj78IDSFaxfyMArkbO0q10c=
X-Received: by 2002:a17:902:cecc:b0:23f:e2e0:f89b with SMTP id
 d9443c01a7336-245ef0bf919mr29929205ad.3.1755686763672; Wed, 20 Aug 2025
 03:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250818154032.3173645-1-sdf@fomichev.me> <68a49b30.050a0220.e29e5.00c8.GAE@google.com>
 <20250819175842.7edaf8a5@kernel.org>
In-Reply-To: <20250819175842.7edaf8a5@kernel.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 20 Aug 2025 12:45:52 +0200
X-Gm-Features: Ac12FXzOW9XPurRHcsWYD8YIbcfeKfyX5uwi588A3HEp9L6p1uEzyk061ngsuoE
Message-ID: <CANp29Y4g6kzpsjis4=rUjhfg=BPMiR9Jk68z=NT0MeDyJS7CaQ@mail.gmail.com>
Subject: Re: [syzbot ci] Re: net: Convert to skb_dstref_steal and skb_dstref_restore
To: Jakub Kicinski <kuba@kernel.org>
Cc: syzbot ci <syzbot+ci77a5caa9fce14315@syzkaller.appspotmail.com>, 
	abhishektamboli9@gmail.com, andrew@lunn.ch, ayush.sawal@chelsio.com, 
	coreteam@netfilter.org, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, fw@strlen.de, gregkh@linuxfoundation.org, 
	herbert@gondor.apana.org.au, horms@kernel.org, kadlec@netfilter.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, mhal@rbox.co, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pabeni@redhat.com, 
	pablo@netfilter.org, sdf@fomichev.me, steffen.klassert@secunet.com, 
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

Thanks for the heads-up!
I didn't even think that this tag could pose problems for other
automatic tools :)

On Wed, Aug 20, 2025 at 2:58=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 19 Aug 2025 08:41:36 -0700 syzbot ci wrote:
> > syzbot ci has tested the following series
> >
> > [v2] net: Convert to skb_dstref_steal and skb_dstref_restore
> > https://lore.kernel.org/all/20250818154032.3173645-1-sdf@fomichev.me
> > * [PATCH net-next v2 1/7] net: Add skb_dstref_steal and skb_dstref_rest=
ore
> > * [PATCH net-next v2 2/7] xfrm: Switch to skb_dstref_steal to clear dst=
_entry
> > * [PATCH net-next v2 3/7] netfilter: Switch to skb_dstref_steal to clea=
r dst_entry
> > * [PATCH net-next v2 4/7] net: Switch to skb_dstref_steal/skb_dstref_re=
store for ip_route_input callers
> > * [PATCH net-next v2 5/7] staging: octeon: Convert to skb_dst_drop
> > * [PATCH net-next v2 6/7] chtls: Convert to skb_dst_reset
> > * [PATCH net-next v2 7/7] net: Add skb_dst_check_unset
>
> > ***
> >
> > If these findings have caused you to resend the series or submit a
> > separate fix, please add the following tag to your commit message:
> > Tested-by: syzbot@syzkaller.appspotmail.com
>
> Hi Aleksandr!
>
> Could we do something about this Tested-by: tag?
> Since the syzbot CI reports are sent in reply to a series patchwork and
> other tooling will think that syzbot is sending it's Tested-by tag for
> this series.
>
> In some cases we know that the issues found are unrelated, or rather
> expect them to be fixed separately.

FWIW if you notice the reported issues that are completely unrelated,
please let me know.

>
> Could we perhaps indent the tag with a couple of spaces? Not 100% sure
> but I _think_ most tools will match the tags only from start of line.

Sure, that sounds like a very simple solution.
I've adjusted the email template - now there are several leading
whitespaces on the tag line. I hope it will help (otherwise we'll see
what else can be done).

--=20
Aleksandr
