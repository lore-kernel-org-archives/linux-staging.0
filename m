Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AB2E62D9
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848526; cv=none; b=Z12DmsBwnChKFGqSFWc7iaHBcqtr/ZvcmeEjl57JNGaM/c813Gpl7GrIsxIp06Jp+dbfPifxnvVTNeTk17B+p4nypuzRRV+8BDzHrenT7vXQFisDGKL7muxg8CDZ4V3eMye0oh+GyvWHfr2INTkUhGF5xKFhB/ytSqkRqY/d2Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848526; c=relaxed/simple;
	bh=e5xzHBdFbmW0XwOUR4XN/Edk4I4Zj1jSK1DHU7z74us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaClU7oCsBG9QxEUawj8UUbtYKI6ILzPYPCVraQHKMR9qv7L5CyBdI26NlCvh+thwPR62XWzAAetTjhVNAbEm9k5XlqfdaS3zrKWburthGaIQsZZCg5vJt8wawf3I3GRzSKalFnAL/67YSN80wyimFghdJMynG6PFpIJvfDw6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q9EC3Z8N; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q9EC3Z8N"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b67684e2904so2432745a12.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762848523; x=1763453323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
        b=Q9EC3Z8NEHHbX+FTBygBAJSGHxCm8GHWOO5W1GCOojGLYOT8kgZby/Wntrwbabnu6c
         sn1IM4FNDWmoQDEIQoiuEeMhfMcWn9tWIeNn0rfiKtsBXd7pkdl62bEZtR18DsT9FLH1
         ZFufpFBI7UX3td6k8J9oOKqpwkGyZN7t8iMOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848523; x=1763453323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
        b=NoDgScCy+R80f+4xCAF9VK5vtXSsz6Tf9LmHDaIiqn7lJA7ofyYZEwo2ux41U2YStV
         QDGE24BXfU5UIgy5DXBxCkEX/ty0Pc9+FtighKF18UFoTW9r7thEnlf0bLJoItqDb+F5
         SODQ3EZqURxv8zqA/wMGsypZW6zEB4rv8vkr7j9CIjuvents53a+WGRiafSFJnodpjNt
         ODBJT+5gigmeGJiKwnaxXwlN4T9441YQYFIJt+8VVT7TsjvdeNoNAF1zPOOSw7N2Tr4q
         K76AmUsLWtABJQAxMchI3py3ivgyOgKeEEx2bBWHUmzb0FPyi137nWYLFhOVRtBABsQA
         yd3w==
X-Forwarded-Encrypted: i=1; AJvYcCWBoWcRXccCX+LT+iPlt4HDOYzWt64kYx3jDsFqy7JPVOvDFy90Y2B3P4BZw4+4v+fS9u+ZP91LnZXxNFw/@lists.linux.dev
X-Gm-Message-State: AOJu0YwqPAii77rcaBstnguWMWI+DHVpwNvipuybF4RvTIFeHaPzV+S2
	NDV5saC1krtuic64GgAFd5yYw8o2xR6rERZYU9N4zc4JUiZkHZ8BxU7OHKHTojur4w==
X-Gm-Gg: ASbGncug2Dzq3g122bgmX7CGajU/lM1fPvcDwGFwwenB/O+Hwu97/Edyo+W4eOY3PTF
	1Nuue/u+rd0hpFZj5VKXq3pqH+EiB/1SeerphFQpjIs9TujXIXWgeqAAi5gZhVy2KT14WdF8Oun
	Wo5e08IEPOxiFdi+O6buvY9ZKQtukCCvYriEUX2Ly+5yYH5Ac4BVrCl6TxnhMJ4ATv/AOMuBLCD
	meCxMbjUZXVjYiEED6wwjPKATJ6suXTz1n9JRXZ/+RyKJ17sxhcFS1ke/fTMnf3qzLf86QhReID
	iReJ9D0U8uB4e1ksyQnNFBP3zafEcVNuH+aEaZC++3bqCzaHXf/1Drrjqyw+Sp2JYq139qv+3QQ
	W7r4w9ZIADYsE1FlQ2webFavdv+bVOt9L+9Jz1cFGyT4Gx7WgXy0wJeyFl/MnSiW+owu1+R3ORw
	9KxpGB
X-Google-Smtp-Source: AGHT+IHC6xuDhDXvZKC9hTiDPjxDoSsReKjYtkLbxL1ziXkP+RR6tEjoFAFy33iKv0lQXU9dzXWwTw==
X-Received: by 2002:a17:903:2c06:b0:295:62d:503c with SMTP id d9443c01a7336-297e5627aecmr142808835ad.16.1762848523256;
        Tue, 11 Nov 2025 00:08:43 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:4557:54b2:676a:c304])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca4262sm173807695ad.86.2025.11.11.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 00:08:42 -0800 (PST)
Date: Tue, 11 Nov 2025 17:08:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Matthew Brost <matthew.brost@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Vitaly Lifshits <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, 
	Sagi Maimon <maimon.sagi@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Karan Tilak Kumar <kartilak@cisco.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rodolfo Giometti <giometti@enneenne.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Richard Cochran <richardcochran@gmail.com>, 
	Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>, 
	Sesidhar Baddela <sebaddel@cisco.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>

On (25/11/10 19:40), Andy Shevchenko wrote:
[..]
> +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);

Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
or %lld.%6.6ld but I don't know if that's of any importance.

