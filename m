Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11973D966
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 23:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666898; cv=none; b=eV4KnxlVqdmU6DC4WRtqeHl+ZE/BdOjbKxuojhVYkuTyXU4R+vicHSFOoaBF1rQHhFBh1C8E9IpSa3EHaShJr574cUA09QjXyNyeLp9phFRFJv/Vm3gl+zvYjL1roJkSQwcQYGyqTwKUQLFBczE9OegxGob83frSYv7bPrmLQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666898; c=relaxed/simple;
	bh=TKsivGU+pbBggUpaqWi4+K2eNDTC87QeNNtNFbqc9rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfJKO6FEuM7X4KaID+E+Uxttoqq0Gq1bhLj+RhSRsWfowyxJLZLfwCqe814HdyHrRzJE7SHyT/t1qM9aP4NZeTDSTqOWLZ/URG/HH6HJ6wMgIOBXk+N9vI5fdko3gkvzQFp38mlx1K+y82BMoO057l2BY5ZX1xrw1ODFzrgyTsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IOGGxR3K; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IOGGxR3K"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so2250049a12.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 16:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711666895; x=1712271695; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oA17YR4InWjyg8TEVheIC338xk5MwmSEpPeuNx4GZW0=;
        b=IOGGxR3KURkaVLhZkOZNqD9PzVwsWRyGvDWBWBcxFCPgFq/3ySFRGENMsaffmb6ULH
         CXD9VZOp+2npubRyM4GRZLnrrXsxppXkR+pVmRP8ewgMdqX52Eab6klNsWH5R+DcxecR
         AwdEzbP2pAvxjLMVOzjwpCABwqhhdz4m42hGmOkPRp2e3Qlmc/Zes4KwtTV7JAjNkz+l
         oM5O1G2J/1VEN+M3A2g9BRG9EfXQH/cvmd8CXajF+x4/TjfI+IMvQEN81JxKfJtuTUZ5
         8ENNRC3dHv3oqVmBiNP4vj+L9ktxe+ZjqCjOOxa8bQCc4xwM01qG1mZyFxBBHc3RFgY2
         goZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711666895; x=1712271695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oA17YR4InWjyg8TEVheIC338xk5MwmSEpPeuNx4GZW0=;
        b=BFkkxMp1lSpACf9YVO+aouLn5bPU2lOTqpRJpHFTYqV09IFMhCJEjiYsupZnMfNRe7
         UsgHpNIBNUO3c/kJ16hRH+2SnhIN87br954Vrf1qbuY6YDLsITElArtCBa2QkKjbZ6oe
         up+nJhgr1UGoQgbFMkZD7NG5cZ0Cb/Rah0A/l6SkWng6fUs4l8+2ylgo4cdRWVaFlATq
         b4jZsSEwm0kAAwRYAeXTDNtOVumMjeKz3Y1fRB8gHVb6jee5BwPNukRe8vAl2/EUDKH+
         gxxgCuH/lCu292dn8XesiTie8NNg30iAQ6AmwchkSSBgeUSKlsGrUCitA0lAJPmXVyfl
         KnCg==
X-Forwarded-Encrypted: i=1; AJvYcCUm8uOANuyRd52X5GKT2/6yMuROT48vgd/ZPpuCjoSNaHNPCeKBbipp6E2QEimR7c/LTfDDGV/SjJfniXXkDwoQ2N8QnYFByXZDpw+ONA==
X-Gm-Message-State: AOJu0YyCQ6rpvbL5MAQHsNsd/Xsg8QWO6McQraoI2hT+XGTmvff9AeH6
	ewWRi873H9z3BhQjlbrKENonjwxJs86q5d/hEHYgOWq79N0P8M9O2UEv8YnV5P4ThCDmWEIlPGE
	GdiCbYiBqvQNvZ9vA/1e7waoSzB39g+N9mhYe
X-Google-Smtp-Source: AGHT+IHSDimwfZi+Mu8w7ftuh2TFjJ1pdwWklM9rbYXTjg5wTtqltWADADutdRuEB4qRyX7gMEY0XftN4jstinrasFQ=
X-Received: by 2002:a05:6402:51cd:b0:56a:2b6b:42cd with SMTP id
 r13-20020a05640251cd00b0056a2b6b42cdmr433486edd.3.1711666895187; Thu, 28 Mar
 2024 16:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328140512.4148825-1-arnd@kernel.org> <20240328140512.4148825-10-arnd@kernel.org>
In-Reply-To: <20240328140512.4148825-10-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 16:01:23 -0700
Message-ID: <CAFhGd8oHht+uMBouT7_AXZt4DMRJi=A7_=fyhZ2Hf_ne+8xE8w@mail.gmail.com>
Subject: Re: [PATCH 09/11] staging: rtl8723bs: convert strncpy to strscpy
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Franziska Naepelt <franziska.naepelt@googlemail.com>, 
	Johannes Berg <johannes.berg@intel.com>, Yang Yingliang <yangyingliang@huawei.com>, 
	Erick Archer <erick.archer@gmx.com>, linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 28, 2024 at 7:07=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc-9 complains about a possibly unterminated string in the strncpy() des=
tination:
>
> In function 'rtw_cfg80211_add_monitor_if',
>     inlined from 'cfg80211_rtw_add_virtual_intf' at drivers/staging/rtl87=
23bs/os_dep/ioctl_cfg80211.c:2209:9:
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2146:2: error: 'strncpy=
' specified bound 16 equals destination size [-Werror=3Dstringop-truncation=
]
>  2146 |  strncpy(mon_ndev->name, name, IFNAMSIZ);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This one is a false-positive because of the explicit termination in the f=
ollowing
> line, and recent versions of clang and gcc no longer warn about this.
>
> Interestingly, the other strncpy() in this file is missing a termination =
but
> does not produce a warning, possibly because of the type confusion and th=
e
> cast between u8 and char.
>
> Change both strncpy() instances to strscpy(), which avoids the warning as=
 well
> as the possibly missing termination. No additional padding is needed here=
.

Could you also clean up the strncpy present in
drivers/staging/rtl8723bs/os_dep/os_intfs.c so all these are cleaned
up at once?

Maybe we could use the new 2-argument version of strscpy() introduced
in Commit e6584c3964f2f ("string: Allow 2-argument strscpy()") for all
3 of these too.

It looks like:
    strscpy(dest, src);





>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/=
staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 65a450fcdce7..98bc5520e77d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -884,7 +884,7 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, =
struct net_device *ndev,
>                 goto addkey_end;
>         }
>
> -       strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME=
_LEN);
> +       strscpy(param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
>
>         if (!mac_addr || is_broadcast_ether_addr(mac_addr))
>                 param->u.crypt.set_tx =3D 0; /* for wpa/wpa2 group key */
> @@ -2143,8 +2143,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapt=
er *padapter, char *name, str
>         }
>
>         mon_ndev->type =3D ARPHRD_IEEE80211_RADIOTAP;
> -       strncpy(mon_ndev->name, name, IFNAMSIZ);
> -       mon_ndev->name[IFNAMSIZ - 1] =3D 0;
> +       strscpy(mon_ndev->name, name, IFNAMSIZ);
>         mon_ndev->needs_free_netdev =3D true;
>         mon_ndev->priv_destructor =3D rtw_ndev_destructor;
>
> --
> 2.39.2
>

Thanks
Justin
