Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139684423
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFDpCyHa"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-307d58b3efbso4425197f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Oct 2023 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696877651; x=1697482451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFPc0uDXo5Wb2b6XuvLtE8BhMkgpBeAovPcZyNFbQqI=;
        b=WFDpCyHalzB3SPOD4M84QHogtbeJ+kUojIEdrl9OzxUyWRop7U+ESXW+tt0FkSKUO4
         jSKo7xN2e/iO11+dwsQFLb+nkhLSw21WAMuPAUMPdp8A9OFr5X+2P3DC1gVVNPemUJ5q
         jgecHEoajdNWuBHCVoFX3Sqp21k3ae0FednDqihiuURPFKG4CTtaFun1g8j9aQL3jKn5
         bYuM/LqI+rMhc57ZwpRyoqIwu9fXtIupk61q/l6bTirdNV0YXzqYLYn5DQ5MPmwu72/e
         53uImRgr16vL07Mri2oQSW33KILIP74BT4xlYTKLYKE1kpqn6D0xKxBjqifSWHvdoy+d
         xmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696877651; x=1697482451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFPc0uDXo5Wb2b6XuvLtE8BhMkgpBeAovPcZyNFbQqI=;
        b=GlneK3IR6UcGGdX7mafPdJnQ59CRnFQ7ctAFUMhetnP0KREKTGEdYWC2pvhGzaR7ni
         01jiygGcm13YFEXzduG0B6GjEaIYl8ZR4LMAxki6DpdqJ54YnukmGveD6qZGB7yLYKtM
         gbmZtmrZdtqww3SjJD8DYN76FAVk2KNi0o0WEopj7RzKKXBAqN9qllFFwFl8BxeyxPM9
         WZJsaYasjiNxq5WyoqK5OWjt9ZOWmLwmCrErWcYyXWq8e/uGZUMQ1CIelvhAM8cn/kUv
         ZubDk30idpRqkru321jifzMSn18N0kqjghNecSeSkT8/zsMWCzBuz/D4TRhWWmr4Pylj
         n8TA==
X-Gm-Message-State: AOJu0YzLiBjXtqlzXpRk5Xq0gU5l97uc7YsYQhPeXzt+v5jQQ9iRO+l9
	nOT0cOeGG3zC+SrMWuQ/nCk=
X-Google-Smtp-Source: AGHT+IHUvUjkgwvvBP8mDLjDZze4cyt0X5T9Jyj1BK5Iqzj3ttrBpuuN+DlmHRw/gGROplZOUaGwGw==
X-Received: by 2002:a5d:4d12:0:b0:323:16c0:9531 with SMTP id z18-20020a5d4d12000000b0032316c09531mr13946871wrt.13.1696877650868;
        Mon, 09 Oct 2023 11:54:10 -0700 (PDT)
Received: from babbage ([2001:818:e906:400:b2bc:40c:b83d:9c16])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d4a8e000000b003197b85bad2sm10439348wrq.79.2023.10.09.11.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:54:10 -0700 (PDT)
Date: Mon, 9 Oct 2023 19:53:30 +0100
From: Ricardo Lopes <ricardoapl.dev@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	justinstitt@google.com, linux-hardening@vger.kernel.org,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: qlge: Replace strncpy with strscpy
Message-ID: <ZSRMKoL1ljRM01Hq@babbage>
References: <20231006161240.28048-1-ricardoapl.dev@gmail.com>
 <202310090921.622A22FF8@keescook>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202310090921.622A22FF8@keescook>

On Mon, Oct 09, 2023 at 09:44:37AM -0700, Kees Cook wrote:
> Thanks for working on this! Doing these replacements needs analysis of
> several issues that should be described in the commit log:
> 
> - is the destination an %NUL-terminated string? (strncpy can produce
>   non-%NUL-terminated strings and sometimes this is intentional.)
> 
> - is the source %NUL-terminated? (Sometimes strncpy is used when memcpy,
>   kmemdup_nul, or other things should be used.)
> 
> - does the destination need to be %NUL padded? (strncpy does this
>   padding, but it isn't always obvious if it's needed.) When padding is
>   needed, strscpy_pad() should be used.

Thank you for the feedback Kees, I really appreciate it

Regards,

Ricardo Lopes

