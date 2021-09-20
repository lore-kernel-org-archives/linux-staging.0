Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1343FC5
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 13:03:54 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id h17so61230471edj.6
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ng9FHOie7WdRgx/Fd8/L0yfaAAf2x8mdXRfauIbEc68=;
        b=GAMg1xsI0vIDAne8KEypmhzhu5SferfXL5La8pyowp7JgjngY3zkPTA6TtXXbw4uO3
         lSqrgYuGzf1VrkY0TRZWWXz5VZdSL8A547A6M5ZlUpmgabVzud0ZG1UgRuLCknFx9LzT
         nz5y5W/s5t0zWKU1HCsb6dcoi+6uToFbKExgeI/GMM70fDfqccnydWvTTUPiIMWZcEha
         AEt319vRjVFmwoHWUiFK6h+5EZ9HaCQAbPZwpJU8Z4rr6UXUcSmvb8oqdP8u92134g6Y
         DHFYe+tzKZW60OcUeleomsdoHJTRsVI/i3p3TX0gmBiSQKdZTXrgvlmNBtAxD6WzKH8N
         kNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ng9FHOie7WdRgx/Fd8/L0yfaAAf2x8mdXRfauIbEc68=;
        b=U8FL/DwkfIbKvmL0xYOileZufBcrko2jNx2U9IwjB/iJAoTF7F9Zzjzvdr3zZEtGnx
         poD/tz/FZRC89FZZSBLNyjIOXiubuQX5XcTbflBMs0L6neicGtbKpZBbKsAAYfQJKIBK
         dRuDOiyp5SyREQdeWYU7J5QHsC7EgXKcQl0Oi/tMbT5WBxf8VDeVY+oxxdMKiYaHJU3k
         Bn4xbUtoqQiMXY+DWXWJmK0W0MBjEbe4YJZ0Hi7RLCyRR+6sah6TqSEFsqqjnOp9CLzX
         1J76Ad2k4yUt8IupCel7gfSBFaEHRw8ZTgrY3P2bqwIPwiqhRADRF+fMfKiDq6ysm4B/
         z1zA==
X-Gm-Message-State: AOAM532omv6wlkkCJtp2muErWhFZlwzCvze4eLkmcL7c0gglFJbyNS6+
	uQ8AdBB4m+Bh3lHxLGEWX18=
X-Google-Smtp-Source: ABdhPJwL2KTcPT9Q9yKOXPQUiBoKdwYoeXYUp+3RkFn3b64YOy6owGegbB816MRRasy6SomDoP6YKw==
X-Received: by 2002:aa7:c81a:: with SMTP id a26mr29254195edt.323.1632143025942;
        Mon, 20 Sep 2021 06:03:45 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id o7sm6936553edt.68.2021.09.20.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 06:03:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 15/19] staging: r8188eu: change the type of a variable in rtw_read16()
Date: Mon, 20 Sep 2021 15:03:44 +0200
Message-ID: <48009934.f5uHuSIIb1@localhost.localdomain>
In-Reply-To: <20210920115647.GR2116@kadam>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com> <20210919235356.4151-16-fmdefrancesco@gmail.com> <20210920115647.GR2116@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 20, 2021 1:56:47 PM CEST Dan Carpenter wrote:
> On Mon, Sep 20, 2021 at 01:53:52AM +0200, Fabio M. De Francesco wrote:
> > Change the type of "data" from __le32 to __le16.
> > 
> 
> You should note in the commit message that:
> 
> The last two bytes of "data" are not initialized so the le32_to_cpu(data)
> technically reads uninitialized data.  This can likely be detected by
> the KASan checker as reading uninitialized data.  But because the bytes
> are discarded in the end so this will not affect runtime.
> 
> regards,
> dan carpenter
> 

Dear Dan,

Thanks for your suggestion about this specific topic. 

We thought that, since "data" is in bitwise AND with 0xffff before being 
passed to the callee, it was enough to have reviewers know why we're doing 
that change of type with no further explanations. Actually it seems to be not 
enough to motivate that change.

We will surely use the note you provided. 

However, since I'm not used to blindly follow suggestions (even if I trust 
your words with no doubts at all) without complete understanding of what I'm 
doing, I will need to understand what KASan is before copy-paste your note.

Thank you very much,

Fabio


