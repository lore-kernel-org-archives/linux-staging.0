Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376B72
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:48:30 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id h9so28729082ljq.8
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzlvgX+vzoKG9kFQ3t7nTob1GcVIUZUb5mhb/Lw1pbk=;
        b=A4/F8buHBcpAMd5F4iRPkUCMj5lF37ejNIIT+yn1E2XV1N92gAotdFTTptGAFxYGIV
         IWf8vgijoSuvHrmNjtKunvk97CgbinIZhUcnlhVZyoB7+FWcw0QKx8TvPfXxmNM8y5Xu
         /NUOlCNPCWuyR09XWEC89V1xqu2hFhzDbhJ4EWfA+Eb1Tee10/zfpBACkWfMVsayoc8p
         CZsx8AYSoQZYrnJ6Yfb3O2w41+newOQ5jnXj5sSWMHdgJL0wJzhuarI1c43pmWydhGbL
         2yB0iw4sk3S5lejQnTD4RSF4wrI5rFIbiwxsAfNAWw9f/59IrtYspzvx7gJFyHT+WBr0
         J82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzlvgX+vzoKG9kFQ3t7nTob1GcVIUZUb5mhb/Lw1pbk=;
        b=ogI6b7UAAp5Mk1il5ONGQM031hfxZMJjpPU1E8gkgu0VjdMZ1/bcXXdlrzoSNrYsVP
         fTaxfQGQtwvRWXia8KKtiIEkb7UE61hZQlX6HrkYQyDbumck2QAxHnSUz4eVRlfewgaf
         koYiuGywxtJlE6NkHyZf0R+T3NWtTkEua5lNqrOM8z06mH4Lz2t0s+81y++p2ls5ott2
         LNQDMELanCVWGSEv5Rz3vsRcxjm4mSrshcg6pp0gdONpm4UU7lYWuWeFqlSz8N6UOwNg
         OVA6YSlGNqigMrqcwyB6D4Dx3pJehn5sZR2bDMjV1xeASZvwMk4r/rp/4yMmVGNRU9eX
         87yA==
X-Gm-Message-State: AOAM531HZtO19FV3oU6985uSUlydEIvqFibXJh0MVauT3xW9U50475Up
	a3TJmYBD2NbIrNkA1/n2LYgp312MCNOxwFwDA/+jBw==
X-Google-Smtp-Source: ABdhPJxnVC840kww9UQlPEhQnmFzybH+lt9007MbD+7AZA3tYzu/scfjY98h/lPTrkTltW+7PJzVtTgg8vK+vq+jrxY=
X-Received: by 2002:a2e:8109:: with SMTP id d9mr37188ljg.495.1629139708138;
 Mon, 16 Aug 2021 11:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210814235625.1780033-1-nathan@kernel.org>
In-Reply-To: <20210814235625.1780033-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Aug 2021 11:48:16 -0700
Message-ID: <CAKwvOdkVP42MeA7j=ppjJD4-jgC0pcTo6xbPhsOT5mT2DBPW3w@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8192u: Fix bitwise vs logical operator in TranslateRxSignalStuff819xUsb()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 14, 2021 at 4:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> clang warns:
>
> drivers/staging/rtl8192u/r8192U_core.c:4268:20: warning: bitwise and of
> boolean expressions; did you mean logical and? [-Wbool-operation-and]
>         bpacket_toself =  bpacket_match_bssid &
>                           ^~~~~~~~~~~~~~~~~~~~~
>                                               &&
> 1 warning generated.
>
> Replace the bitwise AND with a logical one to clear up the warning, as
> that is clearly what was intended.
>
> Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index db26edeccea6..b6698656fc01 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -4265,7 +4265,7 @@ static void TranslateRxSignalStuff819xUsb(struct sk_buff *skb,
>         bpacket_match_bssid = (type != IEEE80211_FTYPE_CTL) &&
>                                (ether_addr_equal(priv->ieee80211->current_network.bssid,  (fc & IEEE80211_FCTL_TODS) ? hdr->addr1 : (fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 : hdr->addr3))
>                                && (!pstats->bHwError) && (!pstats->bCRC) && (!pstats->bICV);
> -       bpacket_toself =  bpacket_match_bssid &
> +       bpacket_toself =  bpacket_match_bssid &&
>                           (ether_addr_equal(praddr, priv->ieee80211->dev->dev_addr));
>
>         if (WLAN_FC_GET_FRAMETYPE(fc) == IEEE80211_STYPE_BEACON)
>
> base-commit: 0bd35146642bdc56f1b87d75f047b1c92bd2bd39
> --
> 2.33.0.rc2
>


-- 
Thanks,
~Nick Desaulniers
