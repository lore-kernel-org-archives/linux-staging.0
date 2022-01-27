Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BAB168
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 15:25:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id l24-20020a17090aec1800b001b55738f633so5323326pjy.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 07:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hl5Rk2h8NJCWW0VFl+C3irZs+qSV5wYi8KmhJScU8tk=;
        b=c8lMEUYM+dRiUYpbdqKO1Q//jt0JNcNlD2yPeDJIaH9uQkBAuzR7Bmz0kXdTDpkoCN
         ArvbZCD2lAsJBPvTHIF6OSUydkSW+gItlLd7exlgij1vLS+DDgZqXH8sbHdHDPqoESvC
         kA7/LIDJsBOaPHWyNLvFHlgZngDu4eJqXvGBQhp9vdAwLeqChxIwa8JyBMNXwEyXSOAK
         +3guYmwWsxTtGt277nSzcYejLHWhcDmQv1UNqDFcXNLmMa+rhQtwLEnts4fNGYdOZChb
         Ir9lhQOpEfGvcQ31RLDi0eocjB5WXhtnKOcpuh0DpWWJeDSf/lRSNOXWxYyFQopB+CU6
         gF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hl5Rk2h8NJCWW0VFl+C3irZs+qSV5wYi8KmhJScU8tk=;
        b=DmTFXZfUU6jIzvRrELDlmfUffUdfQDHHDZXiTaTb4nSqMAT/0Bed1mAGkggBgTDlxT
         kO1+O0a47ZBBMgmegOUD6aqvwD/cGjH37FEKRjm//9xaBPUycMR9JfCd5107NZAQ8/ee
         XUC7nFhg0dK/v4CaBPIzw2ciexTVMqA2oqMd5IlA+7qZ35HqhzKYM4iSydpkavU3Fhy5
         lj2u8xt//HjWAfTotNFO0oFZNVdobywAK9mntjmRFHpakFrHIzHog6SVB9k3XAdL6eBz
         H+fPTIOy+8+JFObkLUQd8G0xlaNL1Mgq0K7FfdvIp/Hphx2HHGSa6VZxHw30SaRpmVr0
         JOZA==
X-Gm-Message-State: AOAM533RVT7uepfYXHzjsfA2Tj64fmgwsnypIHdHUvGwmsQMLGtbAhip
	jSKQmJuNPkPLeODeUZ2p2ww=
X-Google-Smtp-Source: ABdhPJxW8qeKfu0/CnjPVqAOxEPwR+OnwxVn7KG8VndsZdI5dYrES/h9MkjpcRZzHNHXA0QmMbTj/Q==
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr4683596pjd.61.1643297151307;
        Thu, 27 Jan 2022 07:25:51 -0800 (PST)
Received: from nlap2 ([171.78.146.184])
        by smtp.gmail.com with ESMTPSA id l2sm6073915pfc.183.2022.01.27.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 07:25:50 -0800 (PST)
Date: Thu, 27 Jan 2022 20:55:43 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] staging: r8188eu: remove unneeded ret variables
Message-ID: <20220127152543.ttvp7gj5bzpuvr3p@nlap2>
References: <cover.1641551261.git.abdun.nihaal@gmail.com>
 <c9c24c13d2823ccaadbbce33613d1242531dbe86.1641551261.git.abdun.nihaal@gmail.com>
 <YfATARBq6FJ2e3HE@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfATARBq6FJ2e3HE@kroah.com>

Hello Greg,

On Tue, Jan 25, 2022 at 04:10:57PM +0100, Greg KH wrote:
> Many, if not most, of these functions should either be having their
> return value checked, or be void functions as no one checks their return
> value and they can not fail.  Please split this up and look at each
> function to determine which is is and how to fix it up properly.  Just
> returning 0 all the time is not the correct thing to do all the time.
> 
> One example would be rtw_p2p_get_status()  It can not fail, so why does
> it return anything?

Thanks for reviewing the patches.

I had split the changes in a way that the first patch removes the
unneeded return variables and the second patch converts the functions
(changed by the first patch) whose return values are not used, to return
void.

But yes, I now think, it is better to just convert the functions
whose return values are not used, directly to return void instead of
first removing the unneeded return variable and then converting
to return void.

I'll resend this as a single patch.

Thanks,
Abdun Nihaal
