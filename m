Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6923B9
	for <linux-staging@lists.linux.dev>; Sat,  3 Dec 2022 08:37:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so6162758wms.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Dec 2022 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQS61NX1Em5a//DyKuM2uuh+62pP/e6si2f0EakzPms=;
        b=Yv/Sj45myY9Eit4EqdZPMgKDWHOuN0KlxU948jv96xEj9zWcgJeYTHwSdELzVIiYJ4
         sThn21T727f7KcV6LBlVOYDaakFD/CCqNIxPnkWMLd7ph63rkkoH1SDm5trhTPoSZjpo
         zclEvVban/0BEU3LcqOUlITBwJ1j/Z0OhVbRfXlZGQyQqhMSO6XWoK6Pm5vl323A9S65
         fXmXZSPjThLu1Gu7v2P+rPyW00mb2jwkmWSRg41mRRw5kBp45XErVzOMfiE3JHS07dUx
         /kXcvqpVej2TrPqNcsHh2xoqWy6dHqLfJCsFOmlp2pkvO0P8zxiZ63MM7A16zIPn5p3T
         ZNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQS61NX1Em5a//DyKuM2uuh+62pP/e6si2f0EakzPms=;
        b=qR5KmEc7l4Od4ixwnWc/twx6vxapGf19U9J2j3aAHPuGsCRJJ2Gswq3YHVpCyocGrw
         2zTUC0K1Z6nUsIBTuTqVWVveNp7YYWQq7/ty6Em79yYscIvT3I2/K3A+9dikHd6A501e
         Ty2CqNNJb3m7mpjExo1ykhfXQWLIN5tRJvv5TrdJy6ShI2rQgUHR5E82JcIbkKkH07un
         +e+BptY1DiTVThrx0sW4klLH6hbQM0iAmK77s7uiO3pC3Qi7AMu29ER8XduzDatdVKSD
         qzvpw7vnHiz2ZqC7OHdZ2fgbZFbExeyyiQz8E2tPzL0BfdUHqgGeX4REm6RKu2wOpj56
         y76g==
X-Gm-Message-State: ANoB5pktY16lRi6sXJ4IQlYNio9K3m/JwK8ML5negHYU9ZnMe4u7a0c6
	kbA1TKugRI8/mbHn6cb8fvk=
X-Google-Smtp-Source: AA0mqf6Y6TXvMtIrlRMjQMb5ja6ZOaIAq0Y8Q1pUS5ChZzfJvtfPL4kPWzRUeoHPLRP8hm28zT4zfQ==
X-Received: by 2002:a05:600c:538d:b0:3d0:47c:b2ac with SMTP id hg13-20020a05600c538d00b003d0047cb2acmr41051027wmb.52.1670056637511;
        Sat, 03 Dec 2022 00:37:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bs4-20020a056000070400b0023677081f3asm9022986wrb.42.2022.12.03.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 00:37:17 -0800 (PST)
Date: Sat, 3 Dec 2022 11:37:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joe Peterson <jwp.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: board: Remove control flow from macro
Message-ID: <Y4sKulRutmI+ESrB@kadam>
References: <20221203030544.11543-1-jwp.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203030544.11543-1-jwp.linux@gmail.com>

On Fri, Dec 02, 2022 at 09:05:44PM -0600, Joe Peterson wrote:
> Adhere to Linux coding style
> 
> Reported by checkpatch:
> 
> WARNING: Macros with flow control statements should be avoided
> 
> There is only one return value possible. Remove the checkpatch warning
> without effecting functionality.
> 
> Signed-off-by: Joe Peterson <jwp.linux@gmail.com>
> ---

Does this break the build?

Anyway, checkpatch is wrong here.  Just ignore checkpatch if it says
silly stuff.

regards,
dan carpenter

