Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446612F43
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 13:31:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z11so9260012ede.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLOZbnoCDNRNOtYQJDtOvwaLMzxcbt+wzlYkwFe3eSg=;
        b=q4yhNTBM2D/nrFmVHF2B5oWAV/zZiLDlBbI+DmhZ2jQZTScnZNpnzF0u9Al8xFeH+L
         WXrxf2v25M5EIfPyGDV8CLzrRqs8vGbaSnNuEachvI4wIKh//dTjzBAsFGkFQbgASNeM
         zN12OQy065vNJfbDDv3C+N6eON9l/Jo098I6e62WutcOIv4VGCGIEZdoxehFQcGDRV2R
         wmkaYxfFIha+4xj1HREzRJqQ4ysujvFBNCvL4MumIspMuaK+dIHuSfs5LHgdlWdK8Ayc
         sQgx9hseHHA/PIRX7rZdIfsMvHahLehmJsXbFChE+Nr/4am6QSHEZNJqcUcsqqARiSqR
         +fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLOZbnoCDNRNOtYQJDtOvwaLMzxcbt+wzlYkwFe3eSg=;
        b=xos82eRlKP6DjwTYTXXcyDLyJrMmTN5pVhpXyekhXTdeQ51c+2eXNcTIkJXrqDZY7d
         RvUvnvS+bHPn/s4elDEofG5NOYxvWko2SbunAKsdeydSii46oFKlOn+m1m3HLiZ2Bcgg
         Qi2vAro2zNWfaOkeTBI7o8b1+Z3Nqal1nTMKhTLiYphB2UgbbtasRU/qBjaHEDR4toJH
         rF5+5+IE3qgxIeRBcgvfip3qYkjZaWviPM/8c2CiMxa+Z7Q1rjNxX0i6hNHlOZoEKgb3
         B/HyTNuiL1n2906smgSh8cN7kiZKkBKg14PwKclFgFw1qcBsASwqjddjt90y+mbkZZTm
         xdnA==
X-Gm-Message-State: AO0yUKXZ9+IqV+lu/6yHjphYvvO17Hfdg3vB7H4ByNWGbNlo3Wd+8aQB
	DsssRot6LvCo+bbXaNe81QQ=
X-Google-Smtp-Source: AK7set+uE+I8Jb1ciCZYk7NWwCvJRLpwU24mwlZSACXV2JOxIHioDO9SXhbb7ma7xVSDoEAqBICHLQ==
X-Received: by 2002:a05:6402:1f06:b0:4a2:358e:e734 with SMTP id b6-20020a0564021f0600b004a2358ee734mr16174976edb.7.1675603861484;
        Sun, 05 Feb 2023 05:31:01 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7cb92000000b004954c90c94bsm3820584edt.6.2023.02.05.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 05:31:01 -0800 (PST)
Date: Sun, 5 Feb 2023 14:30:59 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y9+vkwYfQzYTbIIo@combine-ThinkPad-S1-Yoga>
References: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
 <Y9+sFw0rviTAJNMf@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9+sFw0rviTAJNMf@kroah.com>

On Sun, Feb 05, 2023 at 02:16:07PM +0100, Greg Kroah-Hartman wrote:
> On Sun, Feb 05, 2023 at 02:08:02PM +0100, Guru Mehar Rachaputi wrote:
> > This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> > as '(iobase)' to avoid precedence issues"
> > 
> > ---
> > Changes in v3:
> > 	- Whitespace error from checkpatch fixed
> > 
> > Changes in v2:
> > 	- Macros with one statement that is to call 'iowrite8' function changed
> > 	to inline function as reviewed by gregkh@linuxfoundation.org.
> > 	In relation to this, names of the callers of macro are also modified
> > 	to call this function.
> > 
> > Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> 
> Try to take this patch and apply it to a tree, and see that everything
> below the --- line is thrown away, including your signed-off-by: line :(
> 
Sorry, should not a patch contain signed-off-by: line?
I did not understand.

-- 
Thanks & Regards,
Guru
