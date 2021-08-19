Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F592F80
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 03:14:20 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id d11so9554584eja.8
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 20:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Al99W6tKyxYHjbJ2Qjp5kd15/Fm62/1U7Do8PSyEWXg=;
        b=EO2bvA+kQXMWrCqWzca5o/U+vXXRSESK+ih0tu4JNs2dn3wf0+N+mNdrzYw3KEQUYf
         a8jY988/KdWqnHhpi/BVgsn3FazvDXe4ylOo++mPGrc9XA9XHDLIM8bZDiBZrLBQH55I
         6HfacOnxvuM0tfRHdC5dGQ/hqOhSrW2Ymoj9R7bDT5W/frf5Gls55bbDbCdIIgcDkc0k
         2iwfUKX0SN2arIFJjA7Av0CzamYqNTSjYUZYZK8J1j/LFL6sQoc5yfj2kMnQDwM8FAYS
         arrbw295YuvpxVaUuXNXJMB5G1SP0ynvsr3Rcj6XuFFfO9FzACJcqH9bLt98hF/KrPLg
         rDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Al99W6tKyxYHjbJ2Qjp5kd15/Fm62/1U7Do8PSyEWXg=;
        b=f9IHQtHistyaDRaNzUp+JRsGJ0JhkkNPWYoQlmp/p5dn86Q7irKCaDMMsX7cebCvvB
         x33S0nveQVs0UFj6oyoae+J7+mHMfoimoypsBxT97KuXt5dSkWJsBRi5zeXfUzdoOvYI
         151FbVfrbyKpleDprrOd/ZSYR823z1G2sq76a5bvxs+9lfGAoYNZhR4LKvFeICy88bJi
         mBqO1FKrEK1i8Zek6guKYcX9Q4HutlcjquGAIXnIGXpks4d0rQHoYS4gI/BWT+lpRnKm
         J7u2+9KfAzj+4uA1MPY5129hM29pPEmd0x4fTya1yjWbwOTYYEabZai5srTqMi8MNSE9
         fKKg==
X-Gm-Message-State: AOAM531fTh8V6ZXyMMZYaaWrBXXgRP5XssgYzW9H0CellgUF2bjiExDE
	CzzstPsv6ERnZz4A2xCcKqQ=
X-Google-Smtp-Source: ABdhPJz495JBMb4ph6mVEuwYysnbQqtbSvnEwWe2aT/rYtAmQiyFG3mVOol2uLUwSb0536EHwwiHMw==
X-Received: by 2002:a17:906:eb53:: with SMTP id mc19mr13270707ejb.22.1629342859257;
        Wed, 18 Aug 2021 20:14:19 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id g10sm630356ejj.44.2021.08.18.20.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 20:14:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH 6/6] staging: r8188eu: remove free_xmit_priv field from struct hal_ops
Date: Thu, 19 Aug 2021 05:14:17 +0200
Message-ID: <3280989.scCUJ3VkD9@localhost.localdomain>
In-Reply-To: <20210818234253.208271-7-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk> <20210818234253.208271-7-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 1:42:53 AM CEST Phillip Potter wrote:
> Remove free_xmit_priv function pointer field from struct hal_ops definition
> in include/hal_intf.h, as it is now no longer used anywhere in the driver.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/include/hal_intf.h | 1 -
>  1 file changed, 1 deletion(-)

This entry could have been removed in patch 4/6 or 5/6, but I guess 
it's okay to do that here as well. Perhaps the three patches from 4/6 
to 6/6 could have been merged into one (because since 4/6 was 
immediately clear that this operation has no use at all).

Aside from the above considerations, it looks good. So...

Acked by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio




