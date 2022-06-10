Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D72119
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 16:39:22 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id c14so25229765pgu.13
        for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=256cAUtVkFagDS/yqIZzb58j3dk1nOGs4ItV0B+B3cI=;
        b=D3zV7Y1IWSVTJVokfED/63D/2j42lBd46GeSwVKGFKBdfoXZEHxL3cr6zYs0RngV7D
         I47cqKiMrBoDtuOweVBbjjvTV2UimiCGImI6tAQad8Zac33GT/Umx8ULdOgXDKsfcL24
         cfi5tdK4vzvNmxLc5iiyEZjVNjGk7pOSqAi9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=256cAUtVkFagDS/yqIZzb58j3dk1nOGs4ItV0B+B3cI=;
        b=hkiashmcicLz9+aLHw1sGoJ/94IPmPmhPjluUKsnQHfhskY3SbFz30iUI2WgamvZap
         TUjZE0cDe4dJsp0UzY/Y3dXi2lXVOfIhtmshR3rGJT2/E3Aqmf9GORShycIwl/GIWNz8
         WP78JNR/ss011y/Wpo/16HGHPf5ZuyU8sNbNoI8PSGHm033ve6mXhEpZ7scIqucq2eNT
         Sx8fXhbROS/4LWOZFOmxDBEv5fN3FGvUWKiDsbpF3+feBKOvsvBR9Y78483aLb5QeXJz
         I8i99hpa4rN5bcEFFs0A9i+fvQV4eL9TdgoO8DD4I4gXnpg0wOB+ZbL9Vpms5OVMa07D
         1t9Q==
X-Gm-Message-State: AOAM531Z5NfiVykOAIuyCYs7arlgv2FXh1UJB0nzPx3KGpdQF2hZ9pct
	ky9fIxLcY1NO+dnYxTax1EH34A==
X-Google-Smtp-Source: ABdhPJwxtPN3zU9xrzQM+6wrSyNRdmKkl7p2ded9MNwUAam/BDGtr4NWYxTixwxl9D0Td1pz01r6/g==
X-Received: by 2002:a05:6a00:b41:b0:50d:35fa:476d with SMTP id p1-20020a056a000b4100b0050d35fa476dmr47102208pfo.33.1654879162018;
        Fri, 10 Jun 2022 09:39:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b40f:db8c:1759:e71b])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090a70c200b001e2a36fb4aasm1943824pjm.43.2022.06.10.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 09:39:21 -0700 (PDT)
Date: Fri, 10 Jun 2022 09:39:19 -0700
From: Brian Norris <briannorris@chromium.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] media: rkvdec: Disable H.264 error detection
Message-ID: <YqNzt9T9BaYu8tgb@google.com>
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
 <20220610125215.240539-2-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610125215.240539-2-nicolas.dufresne@collabora.com>

On Fri, Jun 10, 2022 at 08:52:11AM -0400, Nicolas Dufresne wrote:
> Quite often, the HW get stuck in error condition if a stream error
> was detected. As documented, the HW should stop immediately and self
> reset. There is likely a problem or a miss-understanding of the self
> self reset mechanism, as unless we make a long pause, the next command
> will then report an error even if there is no error in it.
> 
> Disabling error detection fixes the issue, and let the decoder continue
> after an error. This patch is safe for backport into older kernels.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This is effectively how ChromeOS previously was using this hardware for
years. When moving to the upstream/staging driver, this started giving
us problems. This fix is helpful; we'd rather sacrifice error detection
for now, to avoid hanging the hardware in error cases ;)

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>
