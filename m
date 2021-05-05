Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7C70
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 09:43:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id c3so1665909lfs.7
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6c3Xgmn5T37TIiY6YlqNonCt6qbYnwH+SLVXsWNUIl0=;
        b=tlTyUi3kNACJZhVQLNA0q8gUswN+/IMa21mbaLzlaLXmWzl7Wu/8y3gc7AI4RJ7gp5
         hkz1WvvJr4s16xg4aIGzXIiaFq++4fidadR9bsQtZVGviOdXVS5+sCckZ/S8tZB7OF7i
         mN+OyC3oW7V0DgYb7z4XiON9PrXOB6FqDvFbeZVyOpSGqydB78TCyIk1nYnrCmMy4YCr
         Tpu3gWJsG36gx1d3SQi6bArBRjmJQBi16tJQ0dBTJOjxi+dR/7zn/s30V9BovD0g2HbN
         13nAhm0Wmx65jEDp0PeKMWOU+RWpsh834jaNzxv91k/ORKN5U0m/BcIlQfSqyPOYO4FQ
         kg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6c3Xgmn5T37TIiY6YlqNonCt6qbYnwH+SLVXsWNUIl0=;
        b=mmH8KVxBxZxKgeAujrzdf8yjrrUj8/O7EoultHzpkaH82L7ueDIr+iB7XAwolMBN3o
         L9LkCYcxODPq4+o69IIJ3dsrFNwrNOJTBUGo0uHeh/hj6ayyDFS+WJrx2JFUs61DnSWb
         DCS4yGT/iMy49sxQ4L3GhK7Rlz5DwbdQD5yzw6B4qwOcQtb3qYuSb8XIp5IN5zAxj5ev
         qOeVAWjRqH3aN2J8dGTQr1QFeIbodt/9VThtNskHmsOZ/lGsh8uEvT0U1nhVLIJwU93F
         BCKOG0KSFvJuz992uhUWplv72Yw2GJklQMBt+QcMjctmOje6Bmf9Mu8JwzRW/JfCd4V8
         shfA==
X-Gm-Message-State: AOAM530JW1uh7EDJPDbLHU2IcmFt4kHILcjT+WvhJ3uzmocX3n7PLN1b
	mehpjkbPY6ioj9eopSFNY9kp7zGbdRUcpSD18/s=
X-Google-Smtp-Source: ABdhPJw6OWZKpcheUIXN4U6xqnJjupiMHWXCfxCTfUuc3HFjNvUcQ9YcgrDewl5kohtJyeEZNwEigc4i9Z3u2NQfWlY=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr1737771lfm.527.1620207812971;
 Wed, 05 May 2021 02:43:32 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210429062130.29403-1-dqfext@gmail.com> <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch> <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch> <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
 <YIwxpYD1jnFMPQz+@lunn.ch> <fc962daf8b7babc22b043b2b0878a206780b55f3.camel@mediatek.com>
In-Reply-To: <fc962daf8b7babc22b043b2b0878a206780b55f3.camel@mediatek.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 5 May 2021 17:43:21 +0800
Message-ID: <CALW65ja5mRPoNM2EZsONMh8Kda5OgQg79R=Xp71CaQcp4cprnQ@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
To: Landen Chao <landen.chao@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <frank-w@public-files.de>, 
	David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Russell King - ARM Linux admin <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	=?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 5:31 PM Landen Chao <landen.chao@mediatek.com> wrote:
> How about using mediatek-ge.ko. 'ge' is the abbreviation of gigabit
> Ethernet. Most mediatek products use the same gigabit Ethernet phy.

Well, MT7620's PHY is FE..

>
> Landen
