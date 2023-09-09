Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97C1FAB
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 10:01:20 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso46629331fa.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694253678; x=1694858478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oP3Ad7tpf4jZq5Asm4UcDHA1fh15q5/8MbXPXoqPnzE=;
        b=skHTaE50HLJgIbKXQCMIrP15+WUx9Bp8cRmQldpe4/PE9rkhwMaTZtw+vUteP7hLkg
         xPzqj1o5jnQdyzSRciovnRLfeSsl65zJ0INDNoYYAQ2hu3VgvsPHYf8Cp0MLbJR8++mW
         bxeoXqIpomfZAoQ65ajX/GCh8+FgUZRvmNHJjCc47jBcCwmVKTXH5TM7sbUDK3uE2BLC
         ChKJBJ83It12bZm6aNXww3YcIYrBSOYcZn14ZRJSFItUoGkxiStsVkx0XapPHvapo12M
         goF9Vnzj6gh4QlImOpL/DVAMIkz8r1Pb8HN2KMYsLj6nao6z7g/KHW8bWIEnJzHf1xNX
         uEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694253678; x=1694858478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP3Ad7tpf4jZq5Asm4UcDHA1fh15q5/8MbXPXoqPnzE=;
        b=FHfVWfynBk/NP8HuY3VJ5hIFGKvyoMe4BDaZASuLrqCZqfRcLpYWWDg9eG2HD6SKIz
         Ks/6gyxzAHthtBEoH0OD5w1nNFvGFMAcJ3UCxPDXQCCLFmB7IEphFBp5JZXjxngKJ+Qu
         +8Vluzfh8RSJuKAm9SDjzZfXR5x7gHUhlEYWfZemUzmrpa7JEkhPfCIuZbchdibVUS8d
         Qv8AFbWX59q8bslnTErwmUjee/TpL1TFgbVdGTVBIDQESTqOjt5R4QY6oYyGVpJlPj/0
         xDfrexJnmxEolJ5nbpW0Wmy60KDDac16cqzkRUiNLNMEzQDRYBuNslhJQtjLH84tcHi6
         FJLw==
X-Gm-Message-State: AOJu0Yyyc1+5Y2Ty8PLdyTQ+2JhhL0tCwYtuNkYiyJ02s+H0hvmKHEZb
	V4CXM+t2eV7PB52UklGq3zk=
X-Google-Smtp-Source: AGHT+IG+ak0urT0LkXjEl/AFuu5XF+f2hYsvtZqQOgwc/PJ9LemWW+ubSRznDLamHiePAqay7dS0nw==
X-Received: by 2002:a2e:9b4c:0:b0:2b6:a5df:c7fb with SMTP id o12-20020a2e9b4c000000b002b6a5dfc7fbmr3881018ljj.26.1694253677892;
        Sat, 09 Sep 2023 03:01:17 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id gf13-20020a170906e20d00b009928b4e3b9fsm2161642ejb.114.2023.09.09.03.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 03:01:17 -0700 (PDT)
Date: Sat, 9 Sep 2023 12:01:15 +0200
From: Nam Cao <namcaov@gmail.com>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Type encoding info dropped from
 array name "byVT3253B0_"
Message-ID: <ZPxCa/UOd7T2phqX@nam-dell>
References: <ZPnLw+njcL/D391S@ubuntu.myguest.virtualbox.org>
 <2023090724-trial-ipod-93d2@gregkh>
 <ZPwwHY1TDOBEljxr@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPwwHY1TDOBEljxr@ubuntu.myguest.virtualbox.org>

On Sat, Sep 09, 2023 at 02:13:09PM +0530, Pavan Bobba wrote:
> On Thu, Sep 07, 2023 at 03:43:53PM +0100, Greg KH wrote:
> > On Thu, Sep 07, 2023 at 06:40:27PM +0530, Pavan Bobba wrote:
> > > Below array names updated as per coding guidelines:
> > > 
> > >    1.byVT3253B0_AGC4_RFMD2959
> > >    2.byVT3253B0_AIROHA2230
> > >    3.byVT3253B0_UW2451
> > >    4.byVT3253B0_AGC
> > > 
> > >    Conversions performed:
> > >    a.type encoding info dropped from names
> > >    b.names replaced by snakecase
> > > 
> > >    Issue found by checkpatch
> > > 
> > > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > > ---
> > >  v1 -> v2: Name of the tool added in the body of explanation,
> > >            which found this issue
> > > 
> > >  v2 -> v3: subject modified to more specific detail
> > 
> > Any specific reason you are not sending this to the maintainer that can
> > take it?
> i used scripts/get_maintainer.pl to get maintainers names and i am
> adding all those people to the mail. kindly let me know the maintainer id
> and the correct way to know the mainter of a file

    ./scripts/get_maintainer.pl ~/Downloads/PATCH-v3-staging-vt6655-Type-encoding-info-dropped-from-array-name-byVT3253B0_.txt
Forest Bond <forest@alittletooquiet.net> (odd fixer:STAGING - VIA VT665X DRIVERS)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:STAGING SUBSYSTEM,commit_signer:2/2=100%)
Michael Straube <straube.linux@gmail.com> (commit_signer:2/2=100%,authored:2/2=100%,removed_lines:44/44=100%)
linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

Greg shows up as one of the maintainers for me.

Either a bug with get_maintainer.pl (unlikely), or you did something incorrectly.

Best regards,
Nam
