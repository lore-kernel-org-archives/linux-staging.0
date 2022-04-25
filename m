Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5857C
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 01:19:49 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id s14so23585634plk.8
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 18:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UC3UUz3+3Li+KSXitsNBzOD/5C0DEIQhctDbkXoSxco=;
        b=Z7rboODG/yWX8bCEnoh6B7AguUHh2w+BdLUv1l6MHxHitsLsTr1vaekb/aXKsHftt+
         g5rnbjq1gN5Z2noUFol5RLkEVQRutGiXnKaQFunhyxa2JgGt6WPZoF5/msdQJianTXVv
         nRcAoXcZf+Xy3/UTBNOpy2fjVR7mxgv51/51R6IJJBhrdmKAoOCmhRwH3lPsKUlZcQia
         rreoDsZXbuQrOYPTymAdqR6E/shpOMIPKpr0E6u1+cvU9D0JV4Qkt5xjRrkpKzGBChFU
         kxdr4I3Mc5fKYd2JQ7HUg74A0+T7jeJYHNYuDd0HQo4HUZ/sR60he1eICFQl1ZnqGWqn
         zKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UC3UUz3+3Li+KSXitsNBzOD/5C0DEIQhctDbkXoSxco=;
        b=L4CEgkn/egdbc2FllVEFOkrX7D0e33dJaiBmrycmf4tcObmfA4uUuRtY7ZcWDHfee8
         XuiW2OhEL+8L7Hl4RBa37f8umaZAYRV2FJDsInFLBOvfuL2v7dV4FEDtTPIaTSeC9mjJ
         9SODbzXzEHnCFL6Rw539JG3RoMz4WwhCEHpEdZ13AEXX59KK942vE9fcnTda3FEtqeTt
         pfVivwZzRCue6P8XdvwLaavdR2Cr0zGl7C3rfPxOAx97n1uc4ajlX3a1qBgtOBHROfic
         v9XqkVFunjPVqZ0vXKIUJiRDg7lEAzes2yquA1cOW0vTRXWN8kuAYRavBx8mJldbXzZe
         cU4g==
X-Gm-Message-State: AOAM532a6jM6XsJzlcFCs2fL5LsGYCy7gatlaz2XYnUcvHaam0UGNpnV
	hJXWM3AcDgQXp8Q/MdXnZYw=
X-Google-Smtp-Source: ABdhPJwu0pHVzic4N9d0cQf/8eWFhfTH4BXxnUjj0DLOSheOLv6NcJlGfGcXfNZUfAvWCSoBUMEPgA==
X-Received: by 2002:a17:903:32c5:b0:158:f6bb:fae0 with SMTP id i5-20020a17090332c500b00158f6bbfae0mr15689329plr.62.1650849589122;
        Sun, 24 Apr 2022 18:19:49 -0700 (PDT)
Received: from ArchDesktop ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id q9-20020a056a00088900b004fe1a045e97sm9483399pfj.118.2022.04.24.18.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 18:19:48 -0700 (PDT)
Date: Mon, 25 Apr 2022 09:19:45 +0800
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH] Revert "staging: r8188eu: use in-kernel ieee channel"
Message-ID: <YmX3MYF2dAaARwFc@ArchDesktop>
References: <20220425002735.112666-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425002735.112666-1-wjsota@gmail.com>

On Mon, Apr 25, 2022 at 08:27:36AM +0800, Solomon Tan wrote:
> rtw_ieee80211_channel to ieee802_channel causes a memcpy bug as reported

Apologies for the spelling error. It should be ieee80211_channel instead
of ieee802_channel. I will amend the commit message and send it as v2.
