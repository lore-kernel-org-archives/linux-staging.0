Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E02FB6
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 21:46:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b26so26563450edt.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 14:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DOP/Ae5E9+UV8DIgGaqmjsByOHA/I7bBHXk1O5MJK8E=;
        b=QBHbAdymDlS/J9zNuaqHQjn/TgKrA8fLv0aRI/pjpv/THNI3Wrbrrpk8Hg5og3Ly2f
         dRpiPxuymihaOMPOkI/88ZNe61IQEDCiqW4s73pabQveX4Th0GP6UICfQNReRoVLY3YB
         QZSeM/rs0XK7+vE2Cf0yF1guQbXxUNcIuTyADUjKW4Od4Jfmg+k2OPM1ag495oZyvRa+
         E2sBLgkv8+s/mVWTnLacm1vSUsKfHHkZVF/GnXdsWWmDbpKaTjtmkEax9Bn2SVbR5c7t
         fB78k/eVri9T7OQUXmte4LJR+Kvt14OccdqaC8E3ujCnKBw4LEliHERec+6CIfcDKM20
         QHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DOP/Ae5E9+UV8DIgGaqmjsByOHA/I7bBHXk1O5MJK8E=;
        b=L3Ywa0lCpuMCbjq8osxbcnetJOHidZx0mF+54Q54ZoNYmYR0E0NGOtZrGyWzZmD/d0
         8x3YRkXD4ltMOgMeRr/e9hk8+CZ1IxAux3ruKnqhRs7FoXth770PmqxLRyWHDCT98yvo
         0DfRZEWZZGeLdGKCwFWhI0Nkp9+NSx4JhGcoXxGhD1mnIbNKFx6IshCc+qVbkNDZ/rfH
         9JHu0WMcNRYZ8P9u5wKPu0aMhyUFwlG9xBWn/gq28gyGye1LtflvEMAy0j44thz/pOey
         Fwveln1Q/qOsuxxhhRxLDORxb28XM9FP0jwA39R4YPIG+38xVDFRDkSP5FoM8XWR7ke6
         FdKw==
X-Gm-Message-State: AOAM530Pvo0cG78wDsDRJF04AKpf2Pak94Lgn34KMoSzboHKhmd4mfno
	OSweS5mIFOgQIXX2tIoVAns=
X-Google-Smtp-Source: ABdhPJygP6DFsyKuuwHTabv/EZBjElcQwMgRmriFU8y/gd2CT+BaPatgKynSn4QtQojsSmX2pk3zSA==
X-Received: by 2002:a17:906:1b54:: with SMTP id p20mr178229ejg.133.1632779187626;
        Mon, 27 Sep 2021 14:46:27 -0700 (PDT)
Received: from tom-desktop (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id h13sm11325045edr.4.2021.09.27.14.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 14:46:26 -0700 (PDT)
Date: Mon, 27 Sep 2021 23:46:24 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] staging: vt6655: fix camelcase in ldBmThreshold
Message-ID: <20210927214624.GB6953@tom-desktop>
References: <20210926162527.21462-1-tomm.merciai@gmail.com>
 <20210926162527.21462-3-tomm.merciai@gmail.com>
 <YVHirHixyOIgvqKB@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVHirHixyOIgvqKB@kroah.com>

On Mon, Sep 27, 2021 at 05:26:36PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Sep 26, 2021 at 06:25:19PM +0200, Tommaso Merciai wrote:
> > Replace camel case variable ldBmThreshold with snake case
> > variable ld_bm_threshold.
> 
> Same here, what exactly does this name mean and why did you pick it?
>
  You are right the same here. What do you think about "bm_threshold"?

  Thanks,
  Tommaso

> thanks,
> 
> greg k-h
