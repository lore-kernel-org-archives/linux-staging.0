Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F62C82
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 22:08:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqsL3-1n2wMr0nOT-00mrzO for <linux-staging@lists.linux.dev>; Sat, 30 Oct
 2021 00:08:32 +0200
Received: by mail-wr1-f50.google.com with SMTP id d27so884181wrb.6
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 15:08:32 -0700 (PDT)
X-Gm-Message-State: AOAM531QLFJJt3h2wYUX3EyrtB0WCUFOyol5exIxlGB+rhYBMc1IO/lZ
	pAJ4UyJi5E1MXrKnOBIAp82m/yWExBw8rHvpzxI=
X-Google-Smtp-Source: ABdhPJwDOca8ffBixEPllikPdfg5ONXLu8oOt6PFxJsramgRAu0zcyYo2Y06yib1kHBUHoxS+NxxOADS3pvm86qnK1A=
X-Received: by 2002:a05:600c:4f42:: with SMTP id m2mr22891965wmq.82.1635545311718;
 Fri, 29 Oct 2021 15:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211029214244.17341-1-julianbraha@gmail.com>
In-Reply-To: <20211029214244.17341-1-julianbraha@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Oct 2021 00:08:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0dOMOzP6GF-T4eR38=pG2OBNh20LOVZhvuSZ6EGVH0Sg@mail.gmail.com>
Message-ID: <CAK8P3a0dOMOzP6GF-T4eR38=pG2OBNh20LOVZhvuSZ6EGVH0Sg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix unmet dependency on CRYPTO for CRYPTO_LIB_ARC4
To: Julian Braha <julianbraha@gmail.com>
Cc: gregkh <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, fazilyildiran@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IzLgmtxhPCMDcr1GMCOb/NlUZc400JmeNarOqVDIpDf4+Xn6bYi
 OP8GdeOJAr44wkmyCtYGPoSTfBhgkuCLzFXPxV4ttGkS4ojeCynkBDXtBsDS2zWTQOZTUVo
 3ylMzwsF8Qe7BRvwB+bszxrNSA9VGIpICxy7wYRhp600iaf7WbFzFycmb2uQ/04WaHY16Vb
 ZNbA/9MnsQUQjZz402veQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oneRjDq7oDE=:8MS56ME7GIgjfRTFtZvA2i
 /aZx/539LYdQHChTWcYaZvEzMoSaIgax8eq2XiYFm0xtLhbzcD0i96gIV1IrkLTDiMKj69qq6
 CVhOYgCOisyq4SJ6mwGEswdweeTnEWSXy7SoRo1U64gtBQciK0BTb2zK35VK2s376ODgGvKDc
 f02Au7prXK687DyzuhTGriW3K+7x8uNjYN0I1W77srMOVlWkejmVjFN8jVuGeuUcxBtxarW3w
 jNjM1T9BuP1nCnhTXxhxbSx15i6/gE9l4PJ1qi4yAfNMlk3ocZF2/B3Vl/h+r6q6oZUxuoDLM
 J18rmeBrnSMdge4g1JKTCceYO/18CV4+0IWk6qmmnxag8fijQJRzKUQ4/r8zd665ffTOKXhsN
 LVPcrdUbI7D+A1wAXndjRBb3dQNQcNpZ7PMGjLofuqdtS6AjA5WQhv5k00Fu1o5P0O5yfgdrD
 lSXSvo7PRulVhAc2RxEFsO1zMPBG3jMzrpBHyuec+64WI3yypC2Gh3shgjgC2H6cbGbgZBzmw
 Xt6MtoMsolyMn4TvPSh9nwIKsRGcppSsUBBX5JE+Sd/tVhKYV6ujg2LoGO6kK5As2oiE/cvqQ
 qvYLaAbLJrrxaZs+vNaGBYhf05ZNyNO5/ouGXj3aw+fwULV+8RP/DCCdOoWWu6Xx1/ir4RW+c
 TrTfCN9PAyQmQoMELOXySND1Yarr0iGmMiLAM6V9931nfI98O/8K1O3KADPfc01nH6KCRIl+5
 2UsKykuLiJzZyhU5rDfdGbDm0oshOFDUGx/Eg7ipokiM2cnG/OLtNUmkesCEkXJqP0doBc2gW
 D4ULDYsNE4Zp30SW1ILi1VCFVo/0oZEifrOxmG9X18NtPSPJ8A=

On Fri, Oct 29, 2021 at 11:42 PM Julian Braha <julianbraha@gmail.com> wrote:
>
> When RTL8723BS is selected, and CRYPTO is not selected,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for CRYPTO_LIB_ARC4
>   Depends on [n]: CRYPTO [=n]
>   Selected by [m]:
>   - RTL8723BS [=m] && STAGING [=y] && WLAN [=y] && MMC [=y] && CFG80211 [=y] && m && MODULES [=y]
>   - RTLLIB_CRYPTO_WEP [=m] && STAGING [=y] && RTLLIB [=m]
>
> This is because RTL8723BS selects CRYPTO_LIB_ARC4
> without selecting CRYPTO, despite CRYPTO_LIB_ARC4
> depending on CRYPTO.
>
> This unmet dependency bug was detected by Kismet,
> a static analysis tool for Kconfig. Please advise
> if this is not the appropriate solution.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
