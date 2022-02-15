Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A11842
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 18:17:42 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id n19-20020a17090ade9300b001b9892a7bf9so3832916pjv.5
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
        b=BbY3zUMbpsKVLuD6QiFaFpnxej58wpxQPVVGisDcf+K+2coTsFmZNXGoWqBeKoLb1x
         3ZptFg7el6LpqeSuHR1QjwuSCHfpkEX/T+XcjAHpaQzkvx2kHT7d0+kYGoaayuMfQhPV
         CAs5kcpK7DDzn/NDlTFukbq1xe316LjUYcWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
        b=IWXgQ9BBP5QiGnPFgP4zVkXqHUXx7uMVNt6qxkXjgmdx3pIgiGpz3iE53AvT3JbwQ1
         tCpoaNPexZ7YbhRqkvVHAV/wR9HfQrwEOeB69EOg1pzICGwqD8307sKBnE25Z29kVhfX
         u12nooRZGvxrIQ64oMVQDNpfGoJcJHviM3YbL0BtMBd8Mk3CcLHcp043v13E1QXwbb1O
         nQcUYajFKk68NdRRwpbFcimyYlO23zJBI4CGz4mx3EKlvE4XLLL9J9Flnv14GiS/bQoU
         zgYptwGiZn2Sl/fzs7F4JThpFIgGcw+igudFcMOWahpEibzdLXOk12qy3CoYtzbAVrKe
         sMoQ==
X-Gm-Message-State: AOAM532saq4qoFgpd8Kdh8mgH0zWTtPoEYLaXHnX2GKOfSBNJ115pIxD
	eoKyVnpyHDnUKKTM/ThDTyptZw==
X-Google-Smtp-Source: ABdhPJwjJJkj0fC2gO+FdGjnaisWCk9FKkCf0qazg7PUuY4rrjoW+egyeLOWB+yCEr/MI5qa+9+dbA==
X-Received: by 2002:a17:902:eb8f:: with SMTP id q15mr235036plg.67.1644949062021;
        Tue, 15 Feb 2022 10:17:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a186sm3157627pgc.70.2022.02.15.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 10:17:41 -0800 (PST)
Date: Tue, 15 Feb 2022 10:17:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	sparmaintainer@unisys.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-ext4@vger.kernel.org,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <202202151016.C0471D6E@keescook>
References: <20220215174743.GA878920@embeddedor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215174743.GA878920@embeddedor>

On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use “flexible array members”[1] for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].
> 
> This code was transformed with the help of Coccinelle:
> (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> 
> @@
> identifier S, member, array;
> type T1, T2;
> @@
> 
> struct S {
>   ...
>   T1 member;
>   T2 array[
> - 0
>   ];
> };

These all look trivially correct to me. Only two didn't have the end of
the struct visible in the patch, and checking those showed them to be
trailing members as well, so:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
