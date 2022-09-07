Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0015CA6
	for <linux-staging@lists.linux.dev>; Wed,  7 Sep 2022 15:52:05 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 134so7289261vkz.11
        for <linux-staging@lists.linux.dev>; Wed, 07 Sep 2022 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rlj8wXX4bHHmlV8PhT3KahWVgaociEsUj2maBTk0IPM=;
        b=FLlZ5ccaZOZANSbDvegqY650l55o64BjUMRIvbSPQk5/jUE6ZoLfLEAq8htplvomRQ
         u97Ru0YMN7AezFQv3xXtaWZDFzxvssYPhc+vEBmMxvrWfriUc4z8Q0TKPeHK5czgbfM6
         2+3SaNoXwT+brtYs5gbhKfjVfFmy60oJCXOzrXkgEjGnBysLOqP4i5AKdzSeNs6+1tPf
         53Sv0h6bCde/bopl1mcvNfH+H66zfyf9AjeHAUsM095Fre8YNoNJkiEJTao5qKPfoP+T
         2ANjRlgohBhNy41UCtB0F+jc8wUXXC0lPUEgAWDyJkxauOX+bPpXx+6GwU2H812R7A0y
         dNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rlj8wXX4bHHmlV8PhT3KahWVgaociEsUj2maBTk0IPM=;
        b=mnSiZyfErqAYkHf95F4aZlp14MOfsjq1bK1Kll5ozrOzD8M/fStL8fbpHIRMxjlEu/
         lGiFt5gKjCWSgWZvDkzMBSRxtBPWRs9gM5dA8CWAAAM1LvoxwTrnJTpsaDdVDvZJXfeQ
         x+Cn28628BLcHwhMD0n8qFv+TThscQf9DQPCf9rslkRDeLsD7bMufODFUo/qUKvrLzwb
         ZRG0ztEoUlbP2B5wSO5/XUEmCNuJQjErQrT+jrm9N4cvVh2L/TW5y0mpIUkGe7PQ0bcz
         CY/IhFzGaIpGLW3JYoTvOkCY1daqwGiYsBb4txnM4DrDVWvzk6Lfxdw8h8gaDeyclzVZ
         5wDg==
X-Gm-Message-State: ACgBeo3Keo9nH+VjJ/D8j0LXaD9yEbLIm94D0JHyiDhR6LKPCl40J9P5
	S3/S67fTuea/6g7z5ULjSkR6oJsY0eQExHjAguXgRu1W+H2oyQ==
X-Google-Smtp-Source: AA6agR7MxpToNdcK5r+fsWcDWbcYUou35BIrj5y872jfQNyJcZFWJBXObd3B0B2vs+/MhiYLOO7ElFqw+wwdBPjlLA4=
X-Received: by 2002:a1f:9bd5:0:b0:39e:9cd4:511e with SMTP id
 d204-20020a1f9bd5000000b0039e9cd4511emr1411474vke.41.1662565924255; Wed, 07
 Sep 2022 08:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220905125946.10400-1-guozihua@huawei.com> <CA+_b7DKU+v_dX+kxdHKeEWZJaAh1aFte=dMMSjETHZpjCB5_fQ@mail.gmail.com>
 <CA+_b7DKssU6SjwBvfwHSeOAnZ9PeSW2Nz7wJp8tu-BzwGwHdGQ@mail.gmail.com>
In-Reply-To: <CA+_b7DKssU6SjwBvfwHSeOAnZ9PeSW2Nz7wJp8tu-BzwGwHdGQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 7 Sep 2022 08:51:27 -0700
Message-ID: <CABCJKucksm27cqF50+MMWtXKGnGEeZshKCSADtFD0EcQUUBMNw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: r8188eu: Fix return type for implementation
 of ndo_start_xmit
To: Dan Carpenter <error27@gmail.com>
Cc: GUO Zihua <guozihua@huawei.com>, Nathan Chancellor <nathan@kernel.org>, Larry.Finger@lwfinger.net, 
	phil@philpotter.co.uk, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, paskripkin@gmail.com, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 4:09 AM Dan Carpenter <error27@gmail.com> wrote:
>
> Here is the list of bugs that Smatch found.  I had to modify the check a bit.

Great, thanks for doing this, Dan! I filed a bug with the list, so
this won't get lost:

https://github.com/ClangBuiltLinux/linux/issues/1703

Sami
