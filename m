Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC6472
	for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 13:26:13 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id k1so10191961ilo.7
        for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 05:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NVtatVnUtIQuaxAdvVXoWtPzUOnjrmYeLdCdrCx+BWs=;
        b=UmwQkDK3NFf9vdFe7nVvf76QPvFkCIcKW9Ei1stPj5jRm9aogGAw7ahAGBpxsG7pwM
         Rm1iAnh72VMdrGoNoXQww/vdIAIGcB1xFvmdzL19od3HukF4rd8i8pH9t+N32BobkFDm
         eI0nASsc4S/09mjeKiobS4DOu0bU3BjCGYiSj7MpCxai5AD4YtBsXtolZvHObaQ8s0Bt
         3+OGPdbz8eTlROEfp1Jp5GvLB3xKlLDRrwSsidyd3hCkbfepCJhywAY3gpVHcLmrUD5h
         HXKfDe5iGdv17FGf3GNwk16Y2ihSShZ0dJdjROVWQhiFWpTgDulat/HAWc3xJkzSvaAG
         Kyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NVtatVnUtIQuaxAdvVXoWtPzUOnjrmYeLdCdrCx+BWs=;
        b=tmgLHdHhFfitSYyn1GxJOOzsu/1xle6WYzBun6rkuVDLMtJo7Hrh284bV5YkLIe02A
         57Ndg01q4c+ffmw4wd7uVCQaQA3MzG8uQUIiuiBVY92n179J/xZ7xFD94CkODCNyaFr2
         8XEcpQDmVYhl/e1zaIiQel0Qy6lFrA1RGFrfYCZEsFJ4kEPAsP/X3JRxNHC2Syj79wgk
         jzzOpUm4XegmtHSKbHcl9dBfFePvaf2H7ek7I/uTLyoUNP6YDtDDAvVb6jvVYCNz7/6p
         mDT9TvYdyubD136tsJzPZisQxt37rMd19BQIpfKSZkrx8gAgccQO+CfKbV35QCy6H8un
         Q6yw==
X-Gm-Message-State: AOAM533nA7Fzzd6c35dyTajDAMVnOxTJ3JaL4uHa0ntXTd7yhuxh2BWD
	SB8VdGV6yqJWs9kcLIMv8RUr/luqbQidt+Ka1CM=
X-Google-Smtp-Source: ABdhPJxzspQCdZc9rjroeu/PTtC+Ofz1pZIXDvBUEkmN381QirjB7qSHvcspD2OQ2qIiYwvC1Kzu4pedYGby1wI5cHo=
X-Received: by 2002:a05:6e02:194f:: with SMTP id x15mr4651944ilu.41.1637328373053;
 Fri, 19 Nov 2021 05:26:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABtXzjQ=8KcNM2uMRnd7dTxGvMKscdc_cbEnTuuqrcnfuh_dUA@mail.gmail.com>
 <2fef704b-abc1-9ab6-bd65-ca7b410bdd7b@lwfinger.net>
In-Reply-To: <2fef704b-abc1-9ab6-bd65-ca7b410bdd7b@lwfinger.net>
From: Zameer Manji <zmanji@gmail.com>
Date: Fri, 19 Nov 2021 08:25:46 -0500
Message-ID: <CABtXzjSKzaVsSQiRVpCdPv2yCahc7Ehd5MFX+_0+5pm7at3aRA@mail.gmail.com>
Subject: Re: r8188eu and cfg80211
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Martin Kaiser <martin@kaiser.cx>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 2:39 PM Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> I have been working on doing the exact migration that you want; however, it is
> not trivial. I am not sure when I will finish.

Is there anything others can do to help? Or is there anything
others should not do to make the eventual merge into staging easier?


-- 
Zameer Manji
