Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2600BA21
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 02:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtPkLHzX"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-41cb9419975so21575771cf.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Oct 2023 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698546573; x=1699151373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gWNO3l8fpnpIPgxgpu5uSSqh1fHCKLMt8L2nodlFyk=;
        b=FtPkLHzXkuCurJbofNFYWW62ea5vQfElKy/W/zrRCv1YKj+Usdk7Fx8lPRgdkUga51
         03x+qjjEdEQb8tTdju8oiE7uZ4+Nz2z59Gxtqr0Zf2qBbxDInKfZ05LghvQ1GjqmsNYD
         Ve4ifEaf93Pt+WQYyr12z0fD0/Tz8W2P5lT+5J94o4tqbyO6Z+FpqC2lyplGrkQAnXz6
         BZIjmGOhlT1/Nlh2kUdapFTORZr7VlebYzJgmnKSf/9wgOJ57UV/P8MZWw7C9HF3MEFU
         Ok3SJbBSvwhWJXpejyyRl4PFXSJepATH8jZvhCSrGWg1dr3YDiApAF+XJTNUL/IlMVxK
         3Wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698546573; x=1699151373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gWNO3l8fpnpIPgxgpu5uSSqh1fHCKLMt8L2nodlFyk=;
        b=rpaq1sb/fGeyLqe3sh0Pz7Xw/pyApZd3CJyWfFvzOix2eAHyXfVLL2qmHNJyu91DqH
         DvuZTYCxffJpY7nkh74shEX4h8Munp6N8yMmS4jwa5HF3KxML1K9aM+mxNtZtXy1xwiF
         dp26zbqkGprux0f6N+SD1CD0ldp9fpyRJRYrd874iNmjEbHYH4nJcghMSM+HCM8lAAhG
         GjRacg3ICH9ahSnFV06tHI8zMV0PfcGHUq+XuwPHqgCMxlMEEo2igkJoxL8ECmCy/DE8
         pTpa2klqrEnosH4oS6KV2Dv2RDnPUWuYIx5edrmAt+TS6yYCAloGdrdhw9YZFxa8572J
         O4NQ==
X-Gm-Message-State: AOJu0YxJLz92ChOQUcTSI9vQmiSzqX3zlmJ82AcwFJ7dgPZPN9s7i6vV
	u9cG6u3B5xZHL1C4QbIvFuM=
X-Google-Smtp-Source: AGHT+IErpMIDGlNs7xe4F7SkYsIWBgQIXur/8MlOHteENWqs1PiDVQ5rzCKOA9AAhWycHof+33p9rA==
X-Received: by 2002:ac8:5c96:0:b0:41b:806e:81c7 with SMTP id r22-20020ac85c96000000b0041b806e81c7mr7553608qta.32.1698546572867;
        Sat, 28 Oct 2023 19:29:32 -0700 (PDT)
Received: from google.com ([205.220.129.30])
        by smtp.gmail.com with ESMTPSA id d5-20020a056a0010c500b006bfb903599esm3549848pfu.139.2023.10.28.19.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 19:29:31 -0700 (PDT)
Date: Sun, 29 Oct 2023 02:29:02 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
	ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v13 33/56] touchscreen: sur40: Stop direct calls to queue
 num_buffers field
Message-ID: <ZT3DbkmurIzBp7_p@google.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
 <20231019125222.21370-34-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019125222.21370-34-benjamin.gaignard@collabora.com>

On Thu, Oct 19, 2023 at 02:51:59PM +0200, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> CC: Henrik Rydberg <rydberg@bitmath.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry
