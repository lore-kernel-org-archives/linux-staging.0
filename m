Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAADA92;
	Fri, 10 Mar 2023 18:57:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l1so5951174wry.12;
        Fri, 10 Mar 2023 10:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678474622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xugmdf/oZmpN9857V6uOJEN0w+i6nHXgW1nzaaohj7I=;
        b=KyRYnDgaE7ug7RfVbN4Sj+G9HlPufbymI80TX3dqIdZsia4zR2YWVryAF3/vJLIoo+
         MzaL+LEdcmw4ln2AVcA9xi2P9M4me+T9UdrljPcS2jY1CUVhxvz0PHCkn+Oghiy7BzIK
         WqB+u6fc+Wg8qsdn8ol5Hm8m09K0sDlS3j959Iz8T8Ao3l+bkjh7g0KiiCNuc66jQ7j/
         9+p0BAZ2RRtw2LUtFOU+T1KDL7Geua7mJE8Zaknn1qYkHAETE8G6nfGOK9NjOdoGMlzo
         JUvn1xReRp8ZK62n/uZwHJfywPn+28tem70XFb6JTrq0Ep5a3WeBw5dLN6czj6Xy8dUH
         zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678474622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xugmdf/oZmpN9857V6uOJEN0w+i6nHXgW1nzaaohj7I=;
        b=Xx9+gXYn48Y67ZqnT4RqiJvM0GsrrlGZVw68CupeZHiYcvcWvn3sKIC4w4JIim7517
         cjym21mOiS+2mdX7g+ih3qXKaO13zZjaLPjWQTyekomCOUTJgAyCWZha8ksr8CrdrB4h
         Z2RjZD/KHGtMa3y3+jE7toRyczyrrXlDvOhZZM0ATcjBNI5pwez0p8ZbPIUg5WRo2IeQ
         42QL59m4JsyYNgeFGrOS00r8NBzbCIJstCFCx+kCiZumtgWT3fytTtgYF2+Of27O7drF
         x6KgICxV3lO0KDWxCtKUMJoda7j5QDnk3GD48ydpwAVxgOpoffSVtiwlw9bQbmvRD8E5
         eQ0g==
X-Gm-Message-State: AO0yUKXi00KXsvFQ2U6YieI4f7JIoAhPuY3ZZXiQDqpd2JV5vPXw0T+q
	R6SqZpNG+5+zPFYnH8uWvQ4=
X-Google-Smtp-Source: AK7set8ItTkGY1zTJ3K89fvGwJVi7Zn5bez9za14NnHtH9BdEacxpSzMlFz7gL1XJA3+5OUaYlq9Zg==
X-Received: by 2002:a05:6000:1d2:b0:2c5:48ed:d258 with SMTP id t18-20020a05600001d200b002c548edd258mr17299800wrx.35.1678474621784;
        Fri, 10 Mar 2023 10:57:01 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b002c559626a50sm492153wrq.13.2023.03.10.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:57:01 -0800 (PST)
Date: Fri, 10 Mar 2023 23:56:59 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix exceeds line length
Message-ID: <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>

On Sat, Mar 11, 2023 at 12:05:54AM +0530, Deepak R Varma wrote:
> On Fri, Mar 10, 2023 at 10:09:47PM +0500, Khadija Kamran wrote:
> > Length of line 182 exceeds 100 columns in file
> > drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> > line.
> 
> Hi Khadija,
> I think if you also include merging the if condition and the call to
> spin_unlock...() on single lines, it should make the code more human. 
Hi Deepak! Sorry I am unable to understand how to merge the if condition
and spin_unlock...() together. Can you please elaborate. 
Thank you
