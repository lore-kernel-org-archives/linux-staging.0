Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAE2F30
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 13:48:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso5144418wme.5
        for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 05:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=exT2ZQLPAoL8Phw+t6FICqCJGLGtwOOjmtYci6xC2LY=;
        b=A1XarG81kWg5nTxjgA5WIYiv4myKkso5jzrI4CRayZl6pCAKrqVWy5qG7+4LhJ1mdj
         eiWYWyeIegz6UJan0h5W+kbJAIxvDI3oH/vOzlNoSfhS7p290fnavonWxqKiMSHk9Glr
         lxdp3j8AyWNbSGYhh2eaEhILBN+Hc+ACixMBcCCBdQlHdrI7v+bS8X5Jt2m7eQ+HqGeH
         uvo5nHaXMObIvRuy/1SrDfaknlCZH5gYV+gVFOt7Eg98PjLNvAwOq0E2zG43BXRkqv4R
         C44LyDAXD3z0uJT9x3Yuuom9PIa9iHojvkJuhh2zMspvy71qcRfx0T2A9bHeExAf5nIK
         tSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exT2ZQLPAoL8Phw+t6FICqCJGLGtwOOjmtYci6xC2LY=;
        b=38EtlU5wfNT6zIROpDCHnMmvK4lcR4YubNhr21mTGd5c5OUT2fvERmlqBaVSHATspr
         STHa1Lu3QH2mpDQz2knQ9zzSaeqiGwFPigIFdp5PZhHaC290S//dwphsqRjdzUASIVBf
         NBLuiU0nxHpJMKIUwkwIztoADqlTbkDdAVumF36Mm84oyld0AOMczP8omLKuKAhhxcCj
         2l7uA84eDxG+K1U89TU14yaCuprMJNFGqAeuYx+jAUIyqMzvx1wX5lUTayc1y26Ng5RW
         +6L+/A1AalEIU9RqaP4sVJlOTK4GKKGN+rRNYBOpK7FjZ8/rZtj9AVvdjjcqKhHjB7I+
         cZzw==
X-Gm-Message-State: ANoB5plZyBTKOhQWx8cnENY15EezO0H5iI/5o20YWTgiCgWJ5gGJOf5y
	pHv148pMR6Np0a8I6v5r85o=
X-Google-Smtp-Source: AA0mqf70KaB7xiqLNOLXa+qscg+ayWkZsC462X0+3cZu1xEpprjF5WH4/oF4DF2trfuZapP8FFKKdg==
X-Received: by 2002:a05:600c:3503:b0:3cf:f0a8:d04e with SMTP id h3-20020a05600c350300b003cff0a8d04emr5413810wmq.45.1668692932796;
        Thu, 17 Nov 2022 05:48:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a1c750b000000b003cfe1dcd354sm1242507wmc.27.2022.11.17.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:48:52 -0800 (PST)
Date: Thu, 17 Nov 2022 16:48:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/2] staging: vc04_services: mmal-common: Do not use bool
 in structures
Message-ID: <Y3Y7vCk3gwDH/TpK@kadam>
References: <20221117125953.88441-1-umang.jain@ideasonboard.com>
 <20221117125953.88441-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117125953.88441-3-umang.jain@ideasonboard.com>

On Thu, Nov 17, 2022 at 06:29:53PM +0530, Umang Jain wrote:
> Do not use bool in structures, it already gets flagged by checkpatch:
> 
> "Avoid using bool structure members because of possible alignment issues"
> 

This checkpatch warning was removed almost 4 years ago.

regards,
dan carpenter
