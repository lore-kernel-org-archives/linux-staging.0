Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED81383;
	Mon, 20 Mar 2023 08:58:22 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id o7so9548001wrg.5;
        Mon, 20 Mar 2023 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679302701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzJeoTbKWKmIBwgQA0Y6y/DCv+ZaiOaeERybU2fweUE=;
        b=QDRO/di0+W4wO0US7hLYQPt0JtqrXuz+l1/4iXt4x4pSqH1+Up7aPBXLgzauOOdr4t
         R4aV7r0anl4+aiGVdthztkDvMh13STej0atvbniaW+ZYi1AuLxQT5WD3x3pVlG7yVf4e
         dL9R2uq6DQsa2EfgQZg4XciDUjCT9prIVtNyNDpH16tFUnnVVIxox7ieHMFD1iRNu159
         wcjrALUHtCKlnPBrU5mZrtSyc1sfF5Jb+rXHsJDZYnytWbso+d/DnRzzr7cZ5I/dLNCk
         00u8YFwtqnSwRObn4iDBzgVlb/VBTi5k99cT2a4XC7oGphqujkc1lFpZ37nqP/ubyIgi
         MxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679302701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzJeoTbKWKmIBwgQA0Y6y/DCv+ZaiOaeERybU2fweUE=;
        b=njgrfCPQcvhNNXeJeO6+F2V3ZzzwD9tQNH4Ki0+/5ZilObB9Wcm82vMFkaE633UfTA
         CUCmmXWZQx55SD+WnJMpHaATdh1x4OmUbqmToXzqcWpv4WgpMyPV1H4wFTP29TizAVE1
         zGhRoznmEAHHt1O2QmthtKZxm8Fw1/Lzd45CfN/PPB2JHCGkl+fkTAQduXSH1zTkLuLf
         YB/yJL5pSvwGL3yBjDMnrCKX3ao7vWtFdsbGeWjMXBRbFYy6W7QB4+uVg0aEYaK/nNRS
         JPx3EAoBbFAsbDolWl5gF640Qd/W1hmTR6WBNBrIXKzAVbcMTj23yNyqoR+j6Rom8gTz
         AWmQ==
X-Gm-Message-State: AO0yUKVzFf7ZQcUPPGx3fcj+PLIQo9fk7jxs6sUzOrnpAkTOCJfaBhgU
	xVdqbV/8U0tTcu/2H551rbV58RnESF4=
X-Google-Smtp-Source: AK7set+KLxobAAO+fehPbXx6zZ9HiCLEkSn44tcxAykkKqp8FeNPy5vK22tOMa9HFICZsPo+2mWv2A==
X-Received: by 2002:a5d:6512:0:b0:2ce:9c6b:4fc5 with SMTP id x18-20020a5d6512000000b002ce9c6b4fc5mr8838497wru.16.1679302700800;
        Mon, 20 Mar 2023 01:58:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000181700b002c5694aef92sm8312838wrh.21.2023.03.20.01.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 01:58:20 -0700 (PDT)
Date: Mon, 20 Mar 2023 11:58:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] Staging: nvec: Convert to_nvec_led from a macro to an
 inline function
Message-ID: <256ee298-e34e-4ff4-94ba-e4a0102ef2ac@kili.mountain>
References: <20230318175250.GA49618@sumitra.com>
 <417e944c-4653-43ef-b492-c82c536e4d87@kili.mountain>
 <20230320084422.GA126429@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320084422.GA126429@sumitra.com>

On Mon, Mar 20, 2023 at 01:44:22AM -0700, Sumitra Sharma wrote:
> On Mon, Mar 20, 2023 at 08:39:49AM +0300, Dan Carpenter wrote:
> > On Sat, Mar 18, 2023 at 10:52:50AM -0700, Sumitra Sharma wrote:
> > > Convert to_nvec_led from a macro to a static inline function, to make the
> > > relevant types apparent in the definition and to benefit from the type
> > > checking performed by the compiler at call sites.
> > > 
> > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > ---
> > 
> > You need to compile test your changes.
> >
> 
> Hi dan,
> 
> I am facing problems in creating modules and in compiling them.
> 
> Any help in this would be appreciated. Here is the link to the thread
> https://lore.kernel.org/outreachy/alpine.DEB.2.22.394.2303191336090.2867@hadrien/T/#t

If you're editing a .h file then you need to compile all the stuff which
includes it.  It's slightly complicated.  But if you're just editing a
.c file like here then what I do is I have use my Smatch script to try
compile it.

In Debian run:
apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
Or in Fedora run:
yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny

git clone https://github.com/error27/smatch.git
cd smatch
make

cd /path/to/kernel_src/
~/smatch/smatch_scripts/kchecker drivers/staging/nvec/nvec_paz00.c

Also I run Sparse on the file.
~/smatch/smatch_scripts/kchecker --sparse drivers/staging/nvec/nvec_paz00.c

When I'm patching a file, then I like to look at any other issues I
might want to fix and deal with that as well.

regards,
dan carpenter
