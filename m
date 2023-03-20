Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136E10E5;
	Mon, 20 Mar 2023 05:39:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id w11so5598548wmo.2;
        Sun, 19 Mar 2023 22:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679290794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Lj6TKm1siAlVTYsFucnGuumrrgiwekYs8gSqZFYaV8=;
        b=fZI2qVAzQGYMO6G0NASDX9+1KvajA3fFlO1ariJDasW5tyS+HLPZAoC4bRjACtsWY7
         nqXKXiWpPmuFp0deXotDzlBoeCaHFfcljWkr17blXd1MORE3TM2JKfsz6Bg/r4ycdIcM
         k30uEL6UKHc9I23PWLu6ykFzkcKWOpKvcJ1kRUOhKII2fNDyIOX4+tfFLoFzoTXUa8IS
         napxa67A1NZtgg8e25KPR3c/Is+rIYdPd8ycocY36DGF5kSojkxw2V1gWC4+Hv1/EXVK
         5EZ71lZbytf5lQ0kzLxmL5d7oPOzWGIBmrs9KgRUhtzEVScDhiPx4RqlE3lVTJBJJADB
         8wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679290794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Lj6TKm1siAlVTYsFucnGuumrrgiwekYs8gSqZFYaV8=;
        b=J3v7V+QCrFUV5jl/AiuK4MzsXUWsqa3Xg5PINnDFMNQ1BM2mZTcBkB/hHOMx25ysLy
         CDhOMCkyGcYGdlTtOMLQVb8zI43Dm6vh8VKKKVei2tZJvyNx8wJ/6uuVtCabdbeGyFFn
         zLBhYovz21N/Oy8EmjZ1N5XUjQ/KlHpAzf9lNkBHBaL4uuWysxkgbMmT9eoRvIw2CI8m
         4IbgWmrcsaPhjPqPC1qqyAqduLFqJDhod3ndDOMw2f3Q9ZCd3gcFjnHleafilCY6DPaE
         L1/XPoDraqMVEpoECOWPTxNbTdEn38f3AJPTUsgODbgBJxyWvRiDM3wbBJg4fqUpdtu5
         IeUg==
X-Gm-Message-State: AO0yUKUBYdLtGTsqseNYO8VuIq++Wfhz0R/GVuS/i1po8Ex79vnt0Bsb
	oYppS4l8ayOQJpwC9YFoazQ=
X-Google-Smtp-Source: AK7set9N8yJewWvbi35ASjy42fSpc8tcEcxT987snWMSBAZsoGxAAeI0352w3LhXWRv1177Y/Ij+Gg==
X-Received: by 2002:a1c:7c01:0:b0:3e5:4fb9:ea60 with SMTP id x1-20020a1c7c01000000b003e54fb9ea60mr8568452wmc.9.1679290793862;
        Sun, 19 Mar 2023 22:39:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k16-20020a7bc310000000b003ed2433aa4asm9314376wmj.41.2023.03.19.22.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 22:39:53 -0700 (PDT)
Date: Mon, 20 Mar 2023 08:39:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] Staging: nvec: Convert to_nvec_led from a macro to an
 inline function
Message-ID: <417e944c-4653-43ef-b492-c82c536e4d87@kili.mountain>
References: <20230318175250.GA49618@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318175250.GA49618@sumitra.com>

On Sat, Mar 18, 2023 at 10:52:50AM -0700, Sumitra Sharma wrote:
> Convert to_nvec_led from a macro to a static inline function, to make the
> relevant types apparent in the definition and to benefit from the type
> checking performed by the compiler at call sites.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---

You need to compile test your changes.

regards,
dan carpenter

