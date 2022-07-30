Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B911FB1
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 03:33:24 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3246910dac3so15301627b3.12
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 20:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=z7ruzMhRmh2YgpYMQNik2P2JjiDQ9hsKGh9nOYZ9DAM=;
        b=B3EmRh5qL/jgn/76GduSFcql8ABQv1rTAzqqT1T9oe5c/nHAnI/jMYvZX2uhnG2DEi
         r1c0ce8tjx4f1jb6mw7oPROUmRmJooHT95UPkV2HhqcNKe/0E89CsKk2ZKQje7iDAZB0
         aua7sgkaatxXCo7QUgBkCMuUGZPgNgPHbqniUia+65kAlYaZcLwHstGuzpS+VH7Zwx/o
         miQdhMMzgtyRxF5Sjb9x7InHlB90KpRd10AvJoXNgjzt6bGT7MsAPysPpZiQLUtSl1Wv
         S2LKY0ytm3DX4YDTjlbRqiZD/5cowPeXC8JTX3GzNZ1ZHo07vg33b638XU2EZg+uoY21
         4lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=z7ruzMhRmh2YgpYMQNik2P2JjiDQ9hsKGh9nOYZ9DAM=;
        b=M+61U00xYxxszY6tva10cDun+TzwVGlFkFZW3/XvJuLfbMKF8QR0L5knBIV+T3OZDW
         OFAQo6SbJ+5VeBgLaZGDGb+wTPHkUOCmz+IFGEIEs3hWihYR7UR4eAHzkbrSU92M3nqE
         gomIFB8IU2Zn5hTLHxwbek5Vc5mCzb2uhjnA7HaxHp8Urrd8W8yAve96JJO7E/XuXazK
         Gv6/4sBiO79TbRxuwa84l0dv5j6q9tS79/KkS+655C4wSKmqaLgylbe+JgIBGtKDQk1R
         oFcaKZR0MyBkoZTliIijkpPp8rCPJyp4aa9WMH06cYLjb9wk4jJtlPGACJXHAgDAwl9O
         /wRw==
X-Gm-Message-State: ACgBeo3g3zIvulry9hEJfFPpiPVYHQehsHffgg3QivtlEDOhx1Duk4AF
	9PejXd54hRWvVtwyv7Kxp1//7Cf7jcTuwGmhClw=
X-Google-Smtp-Source: AA6agR5jqXwkf+sodICjizbPOhaMY5XJ3r1zxT/JVi2kE+M6V4nzcMeGRanApNOS+9wjpil8ZM+9nOscib+mZrGHS7M=
X-Received: by 2002:a81:5e42:0:b0:31b:6254:1c2b with SMTP id
 s63-20020a815e42000000b0031b62541c2bmr5796260ywb.35.1659152002918; Fri, 29
 Jul 2022 20:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuDdHMaB6jWARQzA@kroah.com> <20220729035230.226172-1-ztong0001@gmail.com>
 <20220729035230.226172-4-ztong0001@gmail.com> <YuOLybUZ8cBWntY/@kroah.com>
In-Reply-To: <YuOLybUZ8cBWntY/@kroah.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Fri, 29 Jul 2022 20:33:12 -0700
Message-ID: <CAA5qM4B3eHt9BkPzvOuEA0_E5QanCWMzrqLJMaRDAnfAR4bw7A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] staging: rtl8192u: fix rmmod warn when device is renamed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jakub Kicinski <kuba@kernel.org>, 
	Saurav Girepunje <saurav.girepunje@gmail.com>, Colin Ian King <colin.king@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Johan Hovold <johan@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Zheyu Ma <zheyuma97@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 12:27 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 28, 2022 at 08:52:20PM -0700, Tong Zhang wrote:
> > @@ -164,11 +164,19 @@ void rtl8192_debugfs_init_one(struct net_device *dev)
> >
> >  void rtl8192_debugfs_exit_one(struct net_device *dev)
> >  {
> > -     struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
> > +     struct r8192_priv *priv = ieee80211_priv(dev);
>
> This change is not relevant for this patch :(
>
Oh sorry sorry, my bad, I will move them to a separate commit.
