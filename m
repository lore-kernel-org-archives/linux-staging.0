Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264CDF5A;
	Wed,  2 Aug 2023 16:33:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bf91956cdso3425566b.3;
        Wed, 02 Aug 2023 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690993987; x=1691598787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtBbHYKIwkHKZ0Zqrmo9idEAZ2kRQFP6iegoxSJ/xF8=;
        b=nyKb9bMVISBZ7dNpJYOkoCiXyxEmOCI9gZRLuQogkdq9215mCzlXRBzkCCLsuZOA2e
         EmEUljnteW80VvFZIUl05EDL01fGauesFCtKZXwjG47J7RD9G8NArlHzMciU97wDz4cA
         MZ2t+MLFuWx8EomRcKxmGgOMgqOmbZ1y6c1rKzreyDzbgFxDSJBBN+lpMj61Q7zN/VuY
         Y9O49L0SQ7ttMCde5GtGrK01jMjR4KRe+4HC3AYePi7qS9JVRoySeXebfHTJtasdWHOv
         o4AD9/COfYu9fqtPyjCCwYftPAcsKVzUSmNGQr3BllIQ8Xozos4/jieOBYdngbBeONYa
         wlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690993987; x=1691598787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtBbHYKIwkHKZ0Zqrmo9idEAZ2kRQFP6iegoxSJ/xF8=;
        b=EHBwtTjSYIrlFL6XuSvrHsX6TDgPq6xnghf5fmLbc3DMiI2oQerVD75an1Nnj6vw+Y
         gidxQ8MuhYPTNFRmifUmTr58CG6UOv+GUtsU2Uhlj+rEVitZYLvqAgDhdhBAn9wqMlkR
         WLpsXjIx4iVxoVGLJCzUiuUpivETJZPF+U8wKhZDX8yuvwuIrVDLyQF1cPVBCbEFLnqz
         S2iOKV7QnV0MhuvKDm/e/bwfDeL47GhOVlDi6nFCgUEmYuPsTMUpoG7PrAp3ahSVwZIv
         mDqBLhdnS9mhlYs4NoBCTawspCmm2cC+pKfLYGF2LfT3i1fH5JHEuM8Iv4ZjOUSzqVyP
         xBTg==
X-Gm-Message-State: ABy/qLZeV9mFIvC1rLPnJZ7b/QLl0FHFK5AvCic+mLKp/fMyCuT4dM5s
	/pdtTfWRtOSm8RE5Nhlu2K0=
X-Google-Smtp-Source: APBJJlHQReYwlAsIjiFCxJRjnmCI02hfYaU/Kv4cKkDPIqq0vR9s54cFdIccOvObl8ufn9sL9uRiGA==
X-Received: by 2002:a17:906:7787:b0:99b:f8e5:710c with SMTP id s7-20020a170906778700b0099bf8e5710cmr4974203ejm.51.1690993987284;
        Wed, 02 Aug 2023 09:33:07 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id sb9-20020a170906edc900b009920f18a5f0sm9241481ejb.185.2023.08.02.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 09:33:06 -0700 (PDT)
Date: Wed, 2 Aug 2023 18:33:05 +0200
From: Nam Cao <namcaov@gmail.com>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: replace camel case by small case
Message-ID: <ZMqFQbqMCx7Oc7gO@nam-dell>
References: <ZMpZixfZ4WQgpzF1@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMpZixfZ4WQgpzF1@ubuntu.myguest.virtualbox.org>

On Wed, Aug 02, 2023 at 06:56:35PM +0530, Pavan Bobba wrote:
> Replace array name of camel case by small case. Issue found
> by checkpatch
> 
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>

Not too important, but this style is usually called "snake case", not
"small case".

Best regards,
Nam
